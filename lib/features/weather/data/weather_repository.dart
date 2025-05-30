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

  /// Get two-hour weather forecast
  Future<WeatherResponse> getTwoHourForecast({String? date, String? paginationToken}) async {
    try {
      final response = await _apiService.weatherApi.weatherGetTwoHourForecast(
        date: date,
        paginationToken: paginationToken,
      );
      return response.data!;
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw Exception('Failed to fetch two-hour forecast: ${e.toString()}');
    }
  }

  /// Get 24-hour weather forecast
  Future<TwentyFourHourForecastResponse> getTwentyFourHourForecast({String? date, String? paginationToken}) async {
    try {
      final response = await _apiService.weatherApi.weatherGetTwentyFourHourForecast(
        date: date,
        paginationToken: paginationToken,
      );
      return response.data!;
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw Exception('Failed to fetch 24-hour forecast: ${e.toString()}');
    }
  }

  /// Get 4-day weather outlook
  Future<FourDayForecastResponse> getFourDayOutlook({String? date, String? paginationToken}) async {
    try {
      final response = await _apiService.weatherApi.weatherGetFourDayOutlook(
        date: date,
        paginationToken: paginationToken,
      );
      return response.data!;
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw Exception('Failed to fetch four-day outlook: ${e.toString()}');
    }
  }

  /// Get air temperature readings across Singapore
  Future<AirTemperatureResponse> getAirTemperature({String? date, String? paginationToken}) async {
    try {
      final response = await _apiService.weatherApi.weatherGetAirTemperature(
        date: date,
        paginationToken: paginationToken,
      );
      return response.data!;
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw Exception('Failed to fetch air temperature: ${e.toString()}');
    }
  }

  /// Get lightning observation data
  Future<LightningResponse> getLightning({String? date, String? paginationToken}) async {
    try {
      final response = await _apiService.weatherApi.weatherGetLightning(
        date: date,
        paginationToken: paginationToken,
      );
      return response.data!;
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw Exception('Failed to fetch lightning data: ${e.toString()}');
    }
  }

  /// Get WBGT (Wet Bulb Globe Temperature) data for heat stress assessment
  Future<WBGTResponse> getWbgt({String? date, String? paginationToken}) async {
    try {
      final response = await _apiService.weatherApi.weatherGetWbgt(
        date: date,
        paginationToken: paginationToken,
      );
      return response.data!;
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw Exception('Failed to fetch WBGT data: ${e.toString()}');
    }
  }

  /// Get wind direction readings across Singapore
  Future<WindDirectionResponse> getWindDirection({String? date, String? paginationToken}) async {
    try {
      final response = await _apiService.weatherApi.weatherGetWindDirection(
        date: date,
        paginationToken: paginationToken,
      );
      return response.data!;
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw Exception('Failed to fetch wind direction: ${e.toString()}');
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