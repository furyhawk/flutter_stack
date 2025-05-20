import 'package:flutter_stack/core/network/api_response_handler.dart';
import 'package:flutter_stack/data/repositories/weather_repository.dart';
import 'package:flutter_stack/domain/models/weather/weather_model.dart';

class GetWeatherByCityUseCase {
  final WeatherRepository _repository;
  
  GetWeatherByCityUseCase(this._repository);
  
  Future<ApiResult<Weather>> execute(String city) async {
    return _repository.getWeatherByCity(city);
  }
}

class GetWeatherByCoordinatesUseCase {
  final WeatherRepository _repository;
  
  GetWeatherByCoordinatesUseCase(this._repository);
  
  Future<ApiResult<Weather>> execute(double latitude, double longitude) async {
    return _repository.getWeatherByCoordinates(latitude, longitude);
  }
}

class GetWeatherForecastUseCase {
  final WeatherRepository _repository;
  
  GetWeatherForecastUseCase(this._repository);
  
  Future<ApiResult<List<Weather>>> execute(String city) async {
    return _repository.getForecast(city);
  }
}
