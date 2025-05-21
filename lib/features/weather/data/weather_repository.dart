import 'package:api_client/api_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter_stack/core/api/api_service.dart';

/// Repository for weather operations
class WeatherRepository {
  final ApiService _apiService;
  
  WeatherRepository(this._apiService);
  
  /// Get weather data from the API
  Future<WeatherResponse> getWeatherData({String? date}) async {
    try {
      final response = await _apiService.weatherApi.weatherGetTwoHourForecast(
        date: date,
      );
      return response.data!;
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw Exception('Failed to fetch weather data: ${e.toString()}');
    }
  }
  
  /// Handle Dio errors and return appropriate exceptions
  Exception _handleDioError(DioException e) {
    if (e.response != null) {
      if (e.response!.statusCode == 401) {
        return Exception('Authentication failed: Please log in again');
      } else if (e.response!.statusCode == 400) {
        return Exception('Bad request: Please check your inputs');
      } else if (e.response!.statusCode == 404) {
        return Exception('Weather data not found');
      } else if (e.response!.statusCode == 500) {
        return Exception('Server error: Please try again later');
      }
    }
    return Exception('Network error: ${e.message}');
  }
}