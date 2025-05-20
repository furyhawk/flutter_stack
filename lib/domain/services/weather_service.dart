import 'package:flutter/foundation.dart';
import 'package:flutter_stack/domain/models/weather/weather_model.dart';
import 'package:flutter_stack/domain/usecases/weather_usecases.dart';

enum WeatherServiceStatus {
  initial,
  loading,
  loaded,
  error,
}

class WeatherService extends ChangeNotifier {
  final GetWeatherByCityUseCase _getWeatherByCityUseCase;
  final GetWeatherByCoordinatesUseCase _getWeatherByCoordinatesUseCase;
  final GetWeatherForecastUseCase _getWeatherForecastUseCase;

  WeatherService({
    required GetWeatherByCityUseCase getWeatherByCityUseCase,
    required GetWeatherByCoordinatesUseCase getWeatherByCoordinatesUseCase,
    required GetWeatherForecastUseCase getWeatherForecastUseCase,
  })  : _getWeatherByCityUseCase = getWeatherByCityUseCase,
        _getWeatherByCoordinatesUseCase = getWeatherByCoordinatesUseCase,
        _getWeatherForecastUseCase = getWeatherForecastUseCase;

  WeatherServiceStatus _status = WeatherServiceStatus.initial;
  WeatherServiceStatus get status => _status;

  Weather? _currentWeather;
  Weather? get currentWeather => _currentWeather;

  List<Weather>? _forecast;
  List<Weather>? get forecast => _forecast;

  String? _error;
  String? get error => _error;

  /// Recent searched cities
  final List<String> _recentCities = [];
  List<String> get recentCities => List.unmodifiable(_recentCities);

  /// Default cities for quick search
  final List<String> defaultCities = [
    'London',
    'New York',
    'Tokyo',
    'Paris',
    'Sydney',
  ];

  /// Get weather for a city
  Future<void> getWeatherForCity(String city) async {
    _setLoading();
    
    final result = await _getWeatherByCityUseCase.execute(city);
    
    if (result.isSuccess && result.data != null) {
      _currentWeather = result.data;
      _addToRecentCities(city);
      _setLoaded();
    } else {
      _setError(result.message ?? 'Failed to get weather data');
    }
  }

  /// Get weather by coordinates
  Future<void> getWeatherByCoordinates(double latitude, double longitude) async {
    _setLoading();
    
    final result = await _getWeatherByCoordinatesUseCase.execute(latitude, longitude);
    
    if (result.isSuccess && result.data != null) {
      _currentWeather = result.data;
      _addToRecentCities(result.data!.cityName);
      _setLoaded();
    } else {
      _setError(result.message ?? 'Failed to get weather data');
    }
  }

  /// Get 5-day forecast for a city
  Future<void> getForecast(String city) async {
    _setLoading();
    
    final result = await _getWeatherForecastUseCase.execute(city);
    
    if (result.isSuccess && result.data != null) {
      _forecast = result.data;
      _addToRecentCities(city);
      _setLoaded();
    } else {
      _setError(result.message ?? 'Failed to get forecast data');
    }
  }

  /// Get both current weather and forecast for a location
  Future<void> getFullWeatherData(String city) async {
    _setLoading();
    
    // Get current weather
    final weatherResult = await _getWeatherByCityUseCase.execute(city);
    
    if (weatherResult.isSuccess && weatherResult.data != null) {
      _currentWeather = weatherResult.data;
      
      // Get forecast
      final forecastResult = await _getWeatherForecastUseCase.execute(city);
      
      if (forecastResult.isSuccess && forecastResult.data != null) {
        _forecast = forecastResult.data;
        _addToRecentCities(city);
        _setLoaded();
      } else {
        _setError(forecastResult.message ?? 'Failed to get forecast data');
      }
    } else {
      _setError(weatherResult.message ?? 'Failed to get weather data');
    }
  }

  /// Clear current data
  void clearWeatherData() {
    _currentWeather = null;
    _forecast = null;
    _error = null;
    _status = WeatherServiceStatus.initial;
    notifyListeners();
  }

  // Helper methods
  void _setLoading() {
    _status = WeatherServiceStatus.loading;
    _error = null;
    notifyListeners();
  }

  void _setLoaded() {
    _status = WeatherServiceStatus.loaded;
    notifyListeners();
  }

  void _setError(String message) {
    _status = WeatherServiceStatus.error;
    _error = message;
    notifyListeners();
  }

  void _addToRecentCities(String city) {
    // Remove if already exists to avoid duplicates
    _recentCities.remove(city);
    
    // Add to the beginning of the list
    _recentCities.insert(0, city);
    
    // Keep only the 5 most recent cities
    if (_recentCities.length > 5) {
      _recentCities.removeLast();
    }
  }
}
