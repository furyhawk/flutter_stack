import 'package:flutter_stack/core/network/api_response_handler.dart';
import 'package:flutter_stack/core/network/api_client_provider.dart';

abstract class BaseRepository {
  final ApiClientProvider apiClientProvider;

  BaseRepository(this.apiClientProvider);

  /// Helper method to safely execute API calls
  Future<ApiResult<T>> safeApiCall<T>(Future<T> Function() apiCall) async {
    return ApiResponseHandler.handle(apiCall);
  }
}
