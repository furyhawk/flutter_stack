import 'package:api_client/api_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// Service class to manage API client instances
class ApiService {
  final String baseUrl;
  late final Dio _dio;
  late final LoginApi _loginApi;
  late final UsersApi _usersApi;
  late final ItemsApi _itemsApi;
  late final WeatherApi _weatherApi;
  
  String? _token;
  
  ApiService({required this.baseUrl}) {
    _initApiClient();
  }

  void _initApiClient() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {'Content-Type': 'application/json'},
    ));
    
    // Add logging interceptor in debug mode
    if (kDebugMode) {
      _dio.interceptors.add(LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
      ));
    }
    
    // Add auth interceptor
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        if (_token != null) {
          options.headers['Authorization'] = 'Bearer $_token';
        }
        return handler.next(options);
      },
    ));
    
    // Initialize API instances
    final serializers = standardSerializers;
    _loginApi = LoginApi(_dio, serializers);
    _usersApi = UsersApi(_dio, serializers);
    _itemsApi = ItemsApi(_dio, serializers);
    _weatherApi = WeatherApi(_dio, serializers);
  }
  
  /// Set the authentication token
  void setToken(String token) {
    _token = token;
  }
  
  /// Clear the authentication token
  void clearToken() {
    _token = null;
  }
  
  /// Get login API
  LoginApi get loginApi => _loginApi;
  
  /// Get users API
  UsersApi get usersApi => _usersApi;
  
  /// Get items API
  ItemsApi get itemsApi => _itemsApi;
  
  /// Get weather API
  WeatherApi get weatherApi => _weatherApi;
}
