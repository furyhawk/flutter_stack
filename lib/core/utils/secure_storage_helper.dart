import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_stack/core/api/config.dart';

/// A helper class for secure storage operations
class SecureStorageHelper {
  static const FlutterSecureStorage _storage = FlutterSecureStorage();
  
  /// Save authentication token
  static Future<void> saveToken(String token) async {
    await _storage.write(key: AppConfig.authTokenKey, value: token);
  }
  
  /// Get saved authentication token
  static Future<String?> getToken() async {
    return await _storage.read(key: AppConfig.authTokenKey);
  }
  
  /// Delete authentication token
  static Future<void> deleteToken() async {
    await _storage.delete(key: AppConfig.authTokenKey);
  }
  
  /// Save user data
  static Future<void> saveUserData(String userData) async {
    await _storage.write(key: AppConfig.userDataKey, value: userData);
  }
  
  /// Get saved user data
  static Future<String?> getUserData() async {
    return await _storage.read(key: AppConfig.userDataKey);
  }
  
  /// Delete user data
  static Future<void> deleteUserData() async {
    await _storage.delete(key: AppConfig.userDataKey);
  }
  
  /// Delete all stored data
  static Future<void> deleteAll() async {
    await _storage.deleteAll();
  }
}
