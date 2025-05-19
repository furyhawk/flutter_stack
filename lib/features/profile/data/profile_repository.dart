import 'package:api_client/api_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter_stack/core/api/api_service.dart';

/// Repository for user profile operations
class ProfileRepository {
  final ApiService _apiService;
  
  ProfileRepository(this._apiService);
  
  /// Get current user profile
  Future<UserPublic> getCurrentUser() async {
    try {
      final response = await _apiService.usersApi.usersIdGet(id: 'me');
      return response.data;
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw Exception('Failed to fetch user profile: ${e.toString()}');
    }
  }
  
  /// Update current user profile
  Future<UserPublic> updateProfile({
    required String fullName,
    String? email,
  }) async {
    try {
      final userUpdateMe = UserUpdateMe((b) => b
        ..fullName = fullName
        ..email = email);
      
      final response = await _apiService.usersApi.usersMePut(
        userUpdateMe: userUpdateMe,
      );
      
      return response.data;
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw Exception('Failed to update profile: ${e.toString()}');
    }
  }
  
  /// Update password
  Future<void> updatePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      final updatePassword = UpdatePassword((b) => b
        ..currentPassword = currentPassword
        ..newPassword = newPassword);
      
      await _apiService.usersApi.usersMePasswordPut(
        updatePassword: updatePassword,
      );
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw Exception('Failed to update password: ${e.toString()}');
    }
  }
  
  /// Handle Dio errors and return appropriate exceptions
  Exception _handleDioError(DioException e) {
    if (e.response != null) {
      if (e.response!.statusCode == 401) {
        return Exception('Authentication failed: Please log in again');
      } else if (e.response!.statusCode == 400) {
        return Exception('Bad request: Please check your inputs');
      } else if (e.response!.statusCode == 404) {
        return Exception('User not found');
      } else if (e.response!.statusCode == 500) {
        return Exception('Server error: Please try again later');
      }
    }
    return Exception('Network error: ${e.message}');
  }
}
