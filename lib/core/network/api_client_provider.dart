import 'package:api_client/api_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter_stack/core/config/app_config.dart';

class ApiClientProvider {
  ApiClient? _apiClient;

  ApiClient get apiClient {
    _apiClient ??= _createApiClient();
    return _apiClient!;
  }

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
        final token = _getAuthToken();
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
    );
  }

  String? _getAuthToken() {
    // Implement secure token storage and retrieval
    // This is just a placeholder
    return null;
  }

  // API service getters
  ItemsApi get itemsApi => apiClient.getItemsApi();
  UsersApi get usersApi => apiClient.getUsersApi();
  LoginApi get loginApi => apiClient.getLoginApi();
  PrivateApi get privateApi => apiClient.getPrivateApi();
  UtilsApi get utilsApi => apiClient.getUtilsApi();
}
