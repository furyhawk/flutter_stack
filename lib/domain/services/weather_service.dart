import 'package:api_client/api_client.dart'; // Added for WeatherResponse
import 'package:flutter/foundation.dart';
// import 'package:flutter_stack/domain/models/weather/weather_model.dart'; // Commented out: Weather model might need replacement or adaptation
import 'package:flutter_stack/domain/services/location_service.dart';
import 'package:flutter_stack/domain/usecases/weather_usecases.dart';

enum WeatherServiceStatus {
  initial,
  loading,
  loaded,
  error,
}

class WeatherService extends ChangeNotifier {
  // final GetWeatherByCityUseCase _getWeatherByCityUseCase; // Commented out
  // final GetWeatherByCoordinatesUseCase _getWeatherByCoordinatesUseCase; // Commented out
  // final GetWeatherForecastUseCase _getWeatherForecastUseCase; // Commented out
  final GetSgTwoHourForecastUseCase _getSgTwoHourForecastUseCase;
  final LocationService _locationService; // Keep if current location logic is still desired for other purposes or future SG weather features

  WeatherService({
    // required GetWeatherByCityUseCase getWeatherByCityUseCase, // Commented out
    // required GetWeatherByCoordinatesUseCase getWeatherByCoordinatesUseCase, // Commented out
    // required GetWeatherForecastUseCase getWeatherForecastUseCase, // Commented out
    required GetSgTwoHourForecastUseCase getSgTwoHourForecastUseCase,
    required LocationService locationService,
  })  : // _getWeatherByCityUseCase = getWeatherByCityUseCase, // Commented out
        // _getWeatherByCoordinatesUseCase = getWeatherByCoordinatesUseCase, // Commented out
        // _getWeatherForecastUseCase = getWeatherForecastUseCase, // Commented out
        _getSgTwoHourForecastUseCase = getSgTwoHourForecastUseCase,
        _locationService = locationService;

  WeatherServiceStatus _status = WeatherServiceStatus.initial;
  WeatherServiceStatus get status => _status;

  // Weather? _currentWeather; // Commented out: Replace with WeatherResponse or adapted model
  // Weather? get currentWeather => _currentWeather; // Commented out
  WeatherResponse? _sgTwoHourForecast; // New state for Singapore forecast
  WeatherResponse? get sgTwoHourForecast => _sgTwoHourForecast;

  // List<Weather>? _forecast; // Commented out: Replace or remove if 5-day forecast is no longer supported
  // List<Weather>? get forecast => _forecast; // Commented out

  String? _error;
  String? get error => _error;

  // Recent searched cities might not be relevant for SG specific forecast
  // final List<String> _recentCities = []; 
  // List<String> get recentCities => List.unmodifiable(_recentCities);

  // Default cities might not be relevant
  // final List<String> defaultCities = [ 
  //   'Singapore', // Example, might still be useful if other SG locations are supported
  // ];

  /// Get Singapore Two Hour Weather Forecast
  Future<void> getSgTwoHourWeatherForecast({String? date, String? paginationToken}) async {
    _setLoading();
    final result = await _getSgTwoHourForecastUseCase.execute(
      date: date,
      paginationToken: paginationToken,
    );
    if (result.isSuccess) {
      _sgTwoHourForecast = result.asSuccess.value;
      _setLoaded();
    } else {
      _setError(result.asFailure.error.message ?? 'Failed to load Singapore two-hour forecast');
    }
  }

  /*
  // Commenting out old methods that are no longer compatible

  /// Get weather for a city
  Future<void> getWeatherForCity(String city) async {
    _setLoading();
    // final result = await _getWeatherByCityUseCase.execute(city);
    // result.when(
    //   success: (data) {
    //     _currentWeather = data;
    //     _addToRecentCities(city);
    //     _setLoaded();
    //   },
    //   failure: (error) {
    //     _setError(error.message ?? 'Failed to load weather for $city');
    //   },
    // );
    _setError('Fetching weather by city is no longer supported with the current API.');
    notifyListeners(); // Ensure UI updates with the error
  }

  /// Get weather by coordinates
  Future<void> getWeatherByCoordinates(double latitude, double longitude) async {
    _setLoading();
    // final result = await _getWeatherByCoordinatesUseCase.execute(latitude, longitude);
    // result.when(
    //   success: (data) {
    //     _currentWeather = data;
    //     _setLoaded();
    //   },
    //   failure: (error) {
    //     _setError(error.message ?? 'Failed to load weather for coordinates');
    //   },
    // );
    _setError('Fetching weather by coordinates is no longer supported with the current API.');
    notifyListeners();
  }

  /// Get 5-day forecast for a city
  Future<void> getForecast(String city) async {
    _setLoading();
    // final result = await _getWeatherForecastUseCase.execute(city);
    // result.when(
    //   success: (data) {
    //     _forecast = data;
    //     _setLoaded(); // Potentially a different status for forecast loaded?
    //   },
    //   failure: (error) {
    //     _setError(error.message ?? 'Failed to load forecast for $city');
    //   },
    // );
    _setError('Fetching 5-day forecast is no longer supported with the current API.');
    notifyListeners();
  }

  /// Get both current weather and forecast for a location
  Future<void> getFullWeatherData(String city) async {
    _setLoading();
    // await getWeatherForCity(city); // This will set error now
    // if (_status == WeatherServiceStatus.loaded) { // Check if first call was successful
    //   await getForecast(city); // This will also set error now
    // }
    // If either failed, _status will be error and _error will be set.
    // If both were somehow successful (which they won't be), status would be loaded.
    // This method needs complete rethinking based on available SG API data.
    _setError('Fetching full weather data is no longer supported with the current API.');
    notifyListeners();
  }
  */

  /// Clear current data
  void clearWeatherData() {
    _sgTwoHourForecast = null;
    // _currentWeather = null; // Commented out
    // _forecast = null; // Commented out
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
    // _currentWeather = null; // Commented out
    // _forecast = null; // Commented out
    _sgTwoHourForecast = null;
    notifyListeners();
  }

  // _addToRecentCities might not be needed anymore
  // void _addToRecentCities(String city) { ... }
  
  // getWeatherForCurrentLocation needs to be re-evaluated.
  // If it's to get SG forecast for current location, it might need to resolve coordinates to an area supported by the SG API.
  // For now, commenting out its direct dependency on old use cases.
  /*
  Future<void> getWeatherForCurrentLocation() async {
    _setLoading();
    try {
      final position = await _locationService.getCurrentPosition();
      if (position != null) {
        // await getWeatherByCoordinates(position.latitude, position.longitude); // This will set error now
        // If successful, and if we still want a city name, we might need reverse geocoding here.
        // For now, this function is not compatible.
        _setError('Fetching weather by current location is not fully supported with the current API.');
        notifyListeners();
      } else {
        _setError('Could not determine current location.');
      }
    } catch (e) {
      _setError('Failed to get current location: ${e.toString()}');
    }
  }
  */
}
