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
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      headers: {'Content-Type': 'application/json'},
      validateStatus: (status) {
        return status != null && status < 500; // Accept all status codes less than 500
      },
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
    
    // Add retry interceptor for network issues
    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (DioException error, ErrorInterceptorHandler handler) async {
          if (error.type == DioExceptionType.connectionTimeout ||
              error.type == DioExceptionType.sendTimeout ||
              error.type == DioExceptionType.receiveTimeout ||
              error.type == DioExceptionType.unknown) {
            try {
              // Retry the request up to 3 times
              return handler.resolve(await _retry(error.requestOptions, 3));
            } catch (e) {
              return handler.next(error);
            }
          }
          return handler.next(error);
        },
      ),
    );
    
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
  
  /// Retry a request a specified number of times
  Future<Response<dynamic>> _retry(RequestOptions requestOptions, int retries) async {
    int attempt = 0;
    while (attempt < retries) {
      try {
        return await _dio.request(
          requestOptions.path,
          cancelToken: requestOptions.cancelToken,
          data: requestOptions.data,
          onReceiveProgress: requestOptions.onReceiveProgress,
          onSendProgress: requestOptions.onSendProgress,
          queryParameters: requestOptions.queryParameters,
          options: Options(
            method: requestOptions.method,
            headers: requestOptions.headers,
            responseType: requestOptions.responseType,
            contentType: requestOptions.contentType,
            validateStatus: requestOptions.validateStatus,
            receiveTimeout: requestOptions.receiveTimeout,
            sendTimeout: requestOptions.sendTimeout,
            extra: requestOptions.extra,
          ),
        );
      } catch (_) {
        attempt++;
        if (attempt >= retries) rethrow;
        // Exponential backoff: wait 1s, 2s, 4s, etc.
        await Future.delayed(Duration(seconds: attempt));
      }
    }
    throw DioException(
      requestOptions: requestOptions,
      error: 'Failed after $retries retries',
      type: DioExceptionType.unknown,
    );
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
