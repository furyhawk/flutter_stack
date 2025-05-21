import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

enum ResultStatus { success, error }

class ApiResult<T> {
  final ResultStatus status;
  final T? data;
  final String? message;
  final int? statusCode;

  ApiResult.success(this.data)
      : status = ResultStatus.success,
        message = null,
        statusCode = 200;

  ApiResult.error(this.message, {this.statusCode, this.data})
      : status = ResultStatus.error;

  bool get isSuccess => status == ResultStatus.success;
  bool get isError => status == ResultStatus.error;
}

class ApiException implements Exception {
  final String message;
  final int? statusCode;
  final dynamic error;

  ApiException(this.message, {this.statusCode, this.error});

  @override
  String toString() => message;
}

/// Helper class to handle API responses and errors
class ApiResponseHandler {
  /// Handles API response and converts it to an ApiResult
  static Future<ApiResult<T>> handle<T>(Future<T> Function() apiCall) async {
    try {
      final response = await apiCall();
      return ApiResult.success(response);
    } on DioException catch (e) {
      final errorMsg = _handleDioError(e);
      if (kDebugMode) {
        print('API Error: $errorMsg');
      }
      return ApiResult.error(
        errorMsg,
        statusCode: e.response?.statusCode,
        data: e.response?.data,
      );
    } on ApiException catch (e) {
      if (kDebugMode) {
        print('API Exception: ${e.message}');
      }
      return ApiResult.error(e.message, statusCode: e.statusCode, data: e.error);
    } catch (e) {
      if (kDebugMode) {
        print('Unexpected error: $e');
      }
      // Check for type casting error which often indicates deserialization issues
      if (e is TypeError) {
        final errorMessage = 'Data format error: ${e.toString()}';
        return ApiResult.error(errorMessage);
      }
      return ApiResult.error('An unexpected error occurred: $e');
    }
  }

  static String _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return 'Connection timed out';
      case DioExceptionType.sendTimeout:
        return 'Send timeout occurred';
      case DioExceptionType.receiveTimeout:
        return 'Receive timeout occurred';
      case DioExceptionType.badCertificate:
        return 'Bad certificate';
      case DioExceptionType.badResponse:
        return _handleBadResponse(error.response);
      case DioExceptionType.cancel:
        return 'Request was cancelled';
      case DioExceptionType.connectionError:
        return 'No internet connection';
      case DioExceptionType.unknown:
        if (error.error is TypeError) {
          return 'Data format error: ${error.error}';
        }
        return 'An unexpected error occurred';
    }
  }

  static String _handleBadResponse(Response? response) {
    final statusCode = response?.statusCode;
    final data = response?.data;
    
    if (data is Map && data.containsKey('message')) {
      return data['message'].toString();
    } else if (data is Map && data.containsKey('detail')) {
      final detail = data['detail'];
      if (detail is List && detail.isNotEmpty) {
        // Handle array of validation errors
        if (detail.first is Map) {
          // If the first element has a 'msg' field, use that
          if (detail.first.containsKey('msg')) {
            return detail.first['msg'];
          }
          // Otherwise return a formatted version of the first error object
          return detail.first.toString();
        }
      }
      // Fallback to toString() for other cases
      return detail.toString();
    }
    
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 401:
        return 'Unauthorized';
      case 403:
        return 'Forbidden';
      case 404:
        return 'Not found';
      case 500:
        return 'Server error';
      default:
        return 'HTTP error $statusCode';
    }
  }
}
