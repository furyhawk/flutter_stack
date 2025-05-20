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

  /// Get demo weather data (for testing when API key isn't available)
  Future<ApiResult<Weather>> getDemoWeather(String city) async {
    return safeApiCall(() async {
      // Simulate network delay
      await Future.delayed(const Duration(seconds: 1));
      
      // Create a mock Weather object
      final weather = Weather(
        cityName: city,
        temperature: 293.15, // 20°C in Kelvin
        feelsLike: 291.15,   // 18°C in Kelvin
        humidity: 65,
        windSpeed: 5.2,
        condition: WeatherCondition.cloudy,
        description: 'Partly cloudy',
        iconCode: '03d',
        timestamp: DateTime.now(),
      );
      
      return weather;
    });
  }
  
  /// Get demo forecast data (for testing when API key isn't available)
  Future<ApiResult<List<Weather>>> getDemoForecast(String city) async {
    return safeApiCall(() async {
      // Simulate network delay
      await Future.delayed(const Duration(seconds: 1));
      
      // Create mock forecast data for 5 days
      final now = DateTime.now();
      final forecast = List.generate(5, (index) {
        final date = now.add(Duration(days: index + 1));
        
        // Generate different weather conditions based on index
        final WeatherCondition condition;
        final String description;
        
        switch (index % 5) {
          case 0:
            condition = WeatherCondition.cloudy;
            description = 'Partly cloudy';
            break;
          case 1:
            condition = WeatherCondition.rainy;
            description = 'Light rain';
            break;
          case 2:
            condition = WeatherCondition.clear;
            description = 'Sunny';
            break;
          case 3:
            condition = WeatherCondition.stormy;
            description = 'Thunderstorms';
            break;
          case 4:
            condition = WeatherCondition.foggy;
            description = 'Foggy morning';
            break;
          default:
            condition = WeatherCondition.unknown;
            description = 'Unknown';
        }
        
        // Generate a temperature with some variation
        final baseTemp = 293.15; // 20°C in Kelvin
        final variation = (index - 2) * 3.0; // -6°C to +6°C variation
        
        return Weather(
          cityName: city,
          temperature: baseTemp + variation,
          feelsLike: baseTemp + variation - 2,
          humidity: 60 + index * 5,
          windSpeed: 4.0 + index * 0.8,
          condition: condition,
          description: description,
          iconCode: '0${index + 1}d',
          timestamp: date,
        );
      });
      
      return forecast;
    });
  }
}
