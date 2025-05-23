import 'package:api_client/api_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter_stack/core/network/api_response_handler.dart';
import 'package:flutter_stack/data/repositories/base_repository.dart';

class UserRepository extends BaseRepository {
  UserRepository(super.apiClientProvider);
  
  /// Get all users
  Future<ApiResult<UsersPublic>> getUsers() async {
    return safeApiCall(() async {
      final response = await apiClientProvider.usersApi.usersReadUsers();
      if (response.data == null) {
        throw Exception('No data returned');
      }
      return response.data!;
    });
  }
  
  /// Get user by ID
  Future<ApiResult<UserPublic>> getUser(String id) async {
    return safeApiCall(() async {
      final response = await apiClientProvider.usersApi.usersReadUserById(userId: id);
      if (response.data == null) {
        throw Exception('No data returned');
      }
      return response.data!;
    });
  }
  
  /// Create user
  Future<ApiResult<UserPublic>> createUser(UserCreate user) async {
    return safeApiCall(() async {
      final response = await apiClientProvider.usersApi.usersCreateUser(
        userCreate: user,
      );
      if (response.data == null) {
        throw Exception('No data returned');
      }
      return response.data!;
    });
  }
  
  /// Update user
  Future<ApiResult<UserPublic>> updateUser(String id, UserUpdate user) async {
    return safeApiCall(() async {
      final response = await apiClientProvider.usersApi.usersUpdateUser(
        userId: id,
        userUpdate: user,
      );
      if (response.data == null) {
        throw Exception('No data returned');
      }
      return response.data!;
    });
  }
  
  /// Login user
  Future<ApiResult<Token>> login(String username, String password) async {
    return safeApiCall(() async {
      final response = await apiClientProvider.loginApi.loginLoginAccessToken(
        username: username,
        password: password,
        grantType: 'password',  // Required by the API
      );
      if (response.data == null) {
        throw Exception('No data returned');
      }
      return response.data!;
    });
  }
  
  /// Register user
  Future<ApiResult<UserPublic>> register(UserRegister userRegister) async {
    return safeApiCall(() async {
      final response = await apiClientProvider.usersApi.usersRegisterUser(
        userRegister: userRegister,
      );
      if (response.data == null) {
        throw Exception('No data returned');
      }
      return response.data!;
    });
  }
  
  /// Get current user
  Future<ApiResult<UserPublic>> getCurrentUser() async {
    return safeApiCall(() async {
      try {
        final response = await apiClientProvider.usersApi.usersReadUserMe();
        if (response.data == null) {
          throw ApiException('No data returned');
        }
        return response.data!;
      } catch (e) {
        if (e is DioException && e.type == DioExceptionType.badResponse && e.response?.statusCode == 401) {
          throw ApiException('Authentication required', statusCode: 401);
        }
        rethrow;
      }
    });
  }
  
  /// Update current user
  Future<ApiResult<UserPublic>> updateCurrentUser(UserUpdateMe user) async {
    return safeApiCall(() async {
      final response = await apiClientProvider.usersApi.usersUpdateUserMe(
        userUpdateMe: user,
      );
      if (response.data == null) {
        throw Exception('No data returned');
      }
      return response.data!;
    });
  }
}