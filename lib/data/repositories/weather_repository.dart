import 'package:dio/dio.dart';
import 'package:flutter_stack/core/network/api_response_handler.dart';
import 'package:flutter_stack/data/repositories/base_repository.dart';
import 'package:flutter_stack/domain/models/weather/weather_model.dart';

class WeatherRepository extends BaseRepository {
  WeatherRepository(super.apiClientProvider);

  // OpenWeatherMap API key - In a real app, this would be securely stored
  final String _apiKey = '11111222223333344444555556666677'; // This is a placeholder - replace with actual API key
  final String _baseUrl = 'https://api.openweathermap.org/data/2.5';

  /// Get current weather for a city
  Future<ApiResult<Weather>> getWeatherByCity(String city) async {
    return safeApiCall(() async {
      final response = await Dio().get(
        '$_baseUrl/weather',
        queryParameters: {
          'q': city,
          'appid': _apiKey,
        },
      );

      if (response.statusCode == 200) {
        return Weather.fromJson(response.data);
      } else {
        throw ApiException(
          'Failed to get weather data: ${response.statusMessage}',
          statusCode: response.statusCode,
        );
      }
    });
  }

  /// Get current weather by geographic coordinates
  Future<ApiResult<Weather>> getWeatherByCoordinates(
    double latitude,
    double longitude,
  ) async {
    return safeApiCall(() async {
      final response = await Dio().get(
        '$_baseUrl/weather',
        queryParameters: {
          'lat': latitude,
          'lon': longitude,
          'appid': _apiKey,
        },
      );

      if (response.statusCode == 200) {
        return Weather.fromJson(response.data);
      } else {
        throw ApiException(
          'Failed to get weather data: ${response.statusMessage}',
          statusCode: response.statusCode,
        );
      }
    });
  }

  /// Get a 5-day weather forecast
  Future<ApiResult<List<Weather>>> getForecast(String city) async {
    return safeApiCall(() async {
      final response = await Dio().get(
        '$_baseUrl/forecast',
        queryParameters: {
          'q': city,
          'appid': _apiKey,
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> list = response.data['list'];
        final forecasts = list.map((item) => Weather.fromJson({
          ...item,
          'name': response.data['city']['name'],
        })).toList();
        
        return forecasts;
      } else {
        throw ApiException(
          'Failed to get forecast data: ${response.statusMessage}',
          statusCode: response.statusCode,
        );
      }
    });
  }
}
