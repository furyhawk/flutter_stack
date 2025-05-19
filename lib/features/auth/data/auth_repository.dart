import 'package:api_client/api_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter_stack/core/api/api_service.dart';
import 'package:flutter_stack/core/utils/secure_storage_helper.dart';

/// Repository for authentication operations
class AuthRepository {
  final ApiService _apiService;
  
  AuthRepository(this._apiService);
  
  /// Login with username and password
  Future<Token> login({required String username, required String password}) async {
    try {
      final response = await _apiService.loginApi.loginLoginAccessToken(
        username: username,
        password: password,
      );
      final token = response.data!;
      
      // Store the token for future requests
      _apiService.setToken(token.accessToken);
      
      // Save token to secure storage
      await SecureStorageHelper.saveToken(token.accessToken);
      
      return token;
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw Exception('Login failed: ${e.toString()}');
    }
  }
  
  /// Register a new user
  Future<UserPublic> register({
    required String email,
    required String password,
    required String fullName,
  }) async {
    try {
      final response = await _apiService.usersApi.usersCreateUser(
        userCreate: UserCreate((b) => b
          ..email = email
          ..password = password
          ..fullName = fullName
          ..isActive = true
          ..isSuperuser = false),
      );
      
      return response.data!;
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw Exception('Registration failed: ${e.toString()}');
    }
  }
  
  /// Logout the current user
  Future<void> logout() async {
    _apiService.clearToken();
    await SecureStorageHelper.deleteToken();
    await SecureStorageHelper.deleteUserData();
  }
  
  /// Handle Dio errors and return appropriate exceptions
  Exception _handleDioError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout) {
      return Exception('Connection timeout: Server is taking too long to respond');
    } else if (e.type == DioExceptionType.sendTimeout) {
      return Exception('Send timeout: Failed to send request');
    } else if (e.type == DioExceptionType.receiveTimeout) {
      return Exception('Receive timeout: Failed to receive response');
    } else if (e.type == DioExceptionType.badCertificate) {
      return Exception('SSL certificate error: Invalid or expired certificate');
    } else if (e.type == DioExceptionType.connectionError) {
      String errorMessage = 'Connection error';
      if (e.error != null && e.error.toString().contains('Operation not permitted')) {
        errorMessage = 'Connection error: Operation not permitted. Please check your network permissions and firewall settings.';
      } else {
        errorMessage = 'Connection error: Please check your internet connection';
      }
      return Exception(errorMessage);
    } else if (e.response != null) {
      if (e.response!.statusCode == 401) {
        return Exception('Authentication failed: Invalid credentials');
      } else if (e.response!.statusCode == 403) {
        return Exception('Access denied: You do not have permission to access this resource');
      } else if (e.response!.statusCode == 400) {
        // Try to extract validation error message if available
        try {
          final data = e.response!.data;
          if (data is Map && data.containsKey('detail')) {
            return Exception('Bad request: ${data['detail']}');
          }
        } catch (_) {}
        return Exception('Bad request: Please check your inputs');
      } else if (e.response!.statusCode == 500) {
        return Exception('Server error: Please try again later');
      } else {
        return Exception('HTTP error ${e.response!.statusCode}: ${e.response!.statusMessage}');
      }
    }
    return Exception('Network error: ${e.message ?? "Unknown network error"}');
  }
}
