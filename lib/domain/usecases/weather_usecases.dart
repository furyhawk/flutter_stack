import 'package:api_client/api_client.dart';
import 'package:flutter_stack/core/network/api_response_handler.dart';
import 'package:flutter_stack/data/repositories/weather_repository.dart';
// import 'package:flutter_stack/domain/models/weather/weather_model.dart'; // Commented out as Weather model is not directly compatible

class GetSgTwoHourForecastUseCase {
  final WeatherRepository _repository;

  GetSgTwoHourForecastUseCase(this._repository);

  Future<ApiResult<WeatherResponse>> execute({
    String? date,
    String? paginationToken,
  }) async {
    return _repository.getSgTwoHourForecast(
      date: date,
      paginationToken: paginationToken,
    );
  }
}

/*
// Commenting out old use cases as they are not compatible with the new WeatherApi
class GetWeatherByCityUseCase {
  final WeatherRepository _repository;
  
  GetWeatherByCityUseCase(this._repository);
  
  Future<ApiResult<Weather>> execute(String city) async {
    // Use demo data for easier testing
    // return _repository.getDemoWeather(city);
    // For real API usage, uncomment the following:
    // return _repository.getWeatherByCity(city);
    throw UnimplementedError('getWeatherByCity is no longer available with the current API');
  }
}

class GetWeatherByCoordinatesUseCase {
  final WeatherRepository _repository;
  
  GetWeatherByCoordinatesUseCase(this._repository);
  
  Future<ApiResult<Weather>> execute(double latitude, double longitude) async {
    // return _repository.getWeatherByCoordinates(latitude, longitude);
    throw UnimplementedError('getWeatherByCoordinates is no longer available with the current API');
  }
}

class GetWeatherForecastUseCase {
  final WeatherRepository _repository;
  
  GetWeatherForecastUseCase(this._repository);
  
  Future<ApiResult<List<Weather>>> execute(String city) async {
    // Use demo data for easier testing
    // return _repository.getDemoForecast(city);
    // For real API usage, uncomment the following:
    // return _repository.getForecast(city);
    throw UnimplementedError('getForecast is no longer available with the current API');
  }
}
*/
