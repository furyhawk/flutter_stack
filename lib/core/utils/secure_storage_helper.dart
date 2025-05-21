import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_stack/core/api/config.dart';

/// A helper class for secure storage operations
class SecureStorageHelper {
  static const _secureStorageOptions = AndroidOptions(
    encryptedSharedPreferences: true,
  );
  
  static final FlutterSecureStorage _storage = FlutterSecureStorage(
    aOptions: _secureStorageOptions,
  );
  
  /// Save authentication token
  static Future<void> saveToken(String token) async {
    try {
      await _storage.write(key: AppConfig.authTokenKey, value: token);
    } catch (e) {
      // Handle or rethrow with more context if needed
      throw Exception('Failed to save token: ${e.toString()}');
    }
  }
  
  /// Get saved authentication token
  static Future<String?> getToken() async {
    try {
      return await _storage.read(key: AppConfig.authTokenKey);
    } catch (e) {
      // Handle or rethrow with more context if needed
      throw Exception('Failed to read token: ${e.toString()}');
    }
  }
  
  /// Delete authentication token
  static Future<void> deleteToken() async {
    try {
      await _storage.delete(key: AppConfig.authTokenKey);
    } catch (e) {
      // Handle or rethrow with more context if needed
      throw Exception('Failed to delete token: ${e.toString()}');
    }
  }
  
  /// Save user data
  static Future<void> saveUserData(String userData) async {
    try {
      await _storage.write(key: AppConfig.userDataKey, value: userData);
    } catch (e) {
      throw Exception('Failed to save user data: ${e.toString()}');
    }
  }
  
  /// Get saved user data
  static Future<String?> getUserData() async {
    try {
      return await _storage.read(key: AppConfig.userDataKey);
    } catch (e) {
      throw Exception('Failed to read user data: ${e.toString()}');
    }
  }
  
  /// Delete user data
  static Future<void> deleteUserData() async {
    try {
      await _storage.delete(key: AppConfig.userDataKey);
    } catch (e) {
      throw Exception('Failed to delete user data: ${e.toString()}');
    }
  }
  
  /// Delete all stored data
  static Future<void> deleteAll() async {
    try {
      await _storage.deleteAll();
    } catch (e) {
      throw Exception('Failed to delete all stored data: ${e.toString()}');
    }
  }
}
