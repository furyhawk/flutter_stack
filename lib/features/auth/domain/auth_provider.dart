import 'package:api_client/api_client.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_stack/core/utils/secure_storage_helper.dart';
import 'package:flutter_stack/features/auth/data/auth_repository.dart';

/// Authentication state provider
class AuthProvider with ChangeNotifier {
  final AuthRepository _authRepository;
  
  bool _isLoading = false;
  bool _isAuthenticated = false;
  UserPublic? _currentUser;
  String? _errorMessage;
  
  AuthProvider(this._authRepository);
  
  /// Loading state
  bool get isLoading => _isLoading;
  
  /// Authentication state
  bool get isAuthenticated => _isAuthenticated;
  
  /// Current user information
  UserPublic? get currentUser => _currentUser;
  
  /// Error message
  String? get errorMessage => _errorMessage;
  
  /// Set the current user
  void setCurrentUser(UserPublic user) {
    _currentUser = user;
    notifyListeners();
  }
  
  /// Login with username and password
  Future<bool> login({required String username, required String password}) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    
    try {
      await _authRepository.login(
        username: username,
        password: password,
      );
      
      _isAuthenticated = true;
      _isLoading = false;
      notifyListeners();
      
      return true;
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      _isAuthenticated = false;
      notifyListeners();
      
      return false;
    }
  }
  
  /// Register a new user
  Future<bool> register({
    required String email,
    required String password,
    required String fullName,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    
    try {
      await _authRepository.register(
        email: email,
        password: password,
        fullName: fullName,
      );
      
      _isLoading = false;
      notifyListeners();
      
      return true;
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
      
      return false;
    }
  }
  
  /// Logout the current user
  Future<void> logout() async {
    _isLoading = true;
    notifyListeners();
    
    await _authRepository.logout();
    
    _isAuthenticated = false;
    _currentUser = null;
    _isLoading = false;
    notifyListeners();
  }
  
  /// Check if the user is authenticated
  Future<bool> checkAuthentication() async {
    _isLoading = true;
    notifyListeners();
    
    try {
      final token = await SecureStorageHelper.getToken();
      
      if (token != null && token.isNotEmpty) {
        _isAuthenticated = true;
      } else {
        _isAuthenticated = false;
      }
    } catch (e) {
      _errorMessage = "Authentication error: ${e.toString()}";
      _isAuthenticated = false;
    }
    
    _isLoading = false;
    notifyListeners();
    
    return _isAuthenticated;
  }
}
