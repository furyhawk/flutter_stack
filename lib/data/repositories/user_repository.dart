import 'package:api_client/api_client.dart';
import 'package:flutter_stack/core/network/api_client_provider.dart';
import 'package:flutter_stack/core/network/api_response_handler.dart';
import 'package:flutter_stack/data/repositories/base_repository.dart';

class UserRepository extends BaseRepository {
  UserRepository(ApiClientProvider apiClientProvider) : super(apiClientProvider);
  
  /// Get all users
  Future<ApiResult<UsersPublic>> getUsers() async {
    return safeApiCall(() => apiClientProvider.usersApi.readUsers());
  }
  
  /// Get user by ID
  Future<ApiResult<UserPublic>> getUser(String id) async {
    return safeApiCall(() => apiClientProvider.usersApi.readUser(id));
  }
  
  /// Create user
  Future<ApiResult<UserPublic>> createUser(UserCreate user) async {
    return safeApiCall(() => apiClientProvider.usersApi.createUser(
      userCreate: user,
    ));
  }
  
  /// Update user
  Future<ApiResult<UserPublic>> updateUser(String id, UserUpdate user) async {
    return safeApiCall(() => apiClientProvider.usersApi.updateUser(
      id: id,
      userUpdate: user,
    ));
  }
  
  /// Login user
  Future<ApiResult<Token>> login(String username, String password) async {
    final formData = {
      'username': username,
      'password': password,
    };
    
    return safeApiCall(() => apiClientProvider.loginApi.loginAccessToken(
      username: username,
      password: password,
    ));
  }
  
  /// Register user
  Future<ApiResult<UserPublic>> register(UserRegister userRegister) async {
    return safeApiCall(() => apiClientProvider.privateApi.registerNewUser(
      userRegister: userRegister,
    ));
  }
  
  /// Get current user
  Future<ApiResult<UserPublic>> getCurrentUser() async {
    return safeApiCall(() => apiClientProvider.usersApi.readUserMe());
  }
  
  /// Update current user
  Future<ApiResult<UserPublic>> updateCurrentUser(UserUpdateMe user) async {
    return safeApiCall(() => apiClientProvider.usersApi.updateUserMe(
      userUpdateMe: user,
    ));
  }
}
