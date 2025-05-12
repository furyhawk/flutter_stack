import 'dart:async';

import 'package:api_client/api_client.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_stack/core/network/api_client_provider.dart';
import 'package:flutter_stack/core/network/api_response_handler.dart';
import 'package:flutter_stack/domain/usecases/auth_usecases.dart';

enum AuthStatus {
  unknown,
  authenticated,
  unauthenticated,
}

class AuthService extends ChangeNotifier {
  final LoginUseCase _loginUseCase;
  final RegisterUseCase _registerUseCase;
  final GetCurrentUserUseCase _getCurrentUserUseCase;
  final ApiClientProvider _apiClientProvider;
  
  AuthStatus _status = AuthStatus.unknown;
  UserPublic? _currentUser;
  String? _token;
  
  AuthService({
    required LoginUseCase loginUseCase,
    required RegisterUseCase registerUseCase,
    required GetCurrentUserUseCase getCurrentUserUseCase,
    required ApiClientProvider apiClientProvider,
  }) 
    : _loginUseCase = loginUseCase,
      _registerUseCase = registerUseCase,
      _getCurrentUserUseCase = getCurrentUserUseCase,
      _apiClientProvider = apiClientProvider;
  
  AuthStatus get status => _status;
  UserPublic? get currentUser => _currentUser;
  bool get isAuthenticated => _status == AuthStatus.authenticated;
  
  /// Initialize auth state, checking if user is already logged in
  Future<void> init() async {
    // Check for existing token (implement secure storage in a real app)
    // For this example, we'll just initialize as unauthenticated
    _status = AuthStatus.unauthenticated;
    notifyListeners();
  }
  
  /// Login with username and password
  Future<ApiResult<Token>> login(String username, String password) async {
    final result = await _loginUseCase.execute(
      username: username,
      password: password,
    );
    
    if (result.isSuccess && result.data != null) {
      _token = result.data!.accessToken;
      _updateAuthHeaders(_token!);
      
      // Fetch current user details
      await _fetchCurrentUser();
    }
    
    return result;
  }
  
  /// Register new user
  Future<ApiResult<UserPublic>> register({
    required String email,
    required String password,
    required String fullName,
  }) async {
    return _registerUseCase.execute(
      email: email,
      password: password,
      fullName: fullName,
    );
  }
  
  /// Logout current user
  Future<void> logout() async {
    _token = null;
    _currentUser = null;
    _status = AuthStatus.unauthenticated;
    notifyListeners();
  }
  
  /// Update API client with authentication token
  void _updateAuthHeaders(String token) {
    _apiClientProvider.apiClient.setBearerAuth('', token);
  }
  
  /// Fetch current user details
  Future<void> _fetchCurrentUser() async {
    if (_token == null) {
      _status = AuthStatus.unauthenticated;
      notifyListeners();
      return;
    }
    
    final result = await _getCurrentUserUseCase.execute();
    
    if (result.isSuccess && result.data != null) {
      _currentUser = result.data;
      _status = AuthStatus.authenticated;
    } else {
      _token = null;
      _status = AuthStatus.unauthenticated;
    }
    
    notifyListeners();
  }
}
