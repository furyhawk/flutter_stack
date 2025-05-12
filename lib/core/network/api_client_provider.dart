import 'package:api_client/api_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter_stack/core/config/app_config.dart';

class ApiClientProvider {
  ApiClient? _apiClient;
  String? _authToken;

  ApiClient get apiClient {
    _apiClient ??= _createApiClient();
    return _apiClient!;
  }

  // Setter for the auth token
  set authToken(String? token) {
    _authToken = token;
    // Update bearer auth when token changes
    if (_apiClient != null && token != null) {
      _apiClient!.setBearerAuth('', token);
    }
  }

  // Getter for the auth token
  String? get authToken => _authToken;

  ApiClient _createApiClient() {
    final dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.instance.apiBaseUrl,
        connectTimeout: const Duration(milliseconds: 30000),
        receiveTimeout: const Duration(milliseconds: 30000),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    // Add logging interceptor in development
    if (AppConfig.instance.isDevelopment) {
      dio.interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: true,
      ));
    }

    // Add authentication interceptor if needed
    dio.interceptors.add(_createAuthInterceptor());

    return ApiClient(
      dio: dio,
      basePathOverride: AppConfig.instance.apiBaseUrl,
    );
  }

  Interceptor _createAuthInterceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) {
        // Add auth token if available
        if (_authToken != null) {
          options.headers['Authorization'] = 'Bearer $_authToken';
        }
        return handler.next(options);
      },
    );
  }

  // API service getters
  ItemsApi get itemsApi => ItemsApi(apiClient.dio, apiClient.serializers);
  UsersApi get usersApi => UsersApi(apiClient.dio, apiClient.serializers);
  LoginApi get loginApi => LoginApi(apiClient.dio, apiClient.serializers);
  PrivateApi get privateApi => PrivateApi(apiClient.dio, apiClient.serializers);
  UtilsApi get utilsApi => UtilsApi(apiClient.dio, apiClient.serializers);
}
