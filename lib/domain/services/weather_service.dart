import 'package:api_client/api_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stack/core/network/api_response_handler.dart';
import 'package:flutter_stack/domain/services/location_service.dart';
import 'package:flutter_stack/domain/usecases/weather_usecases.dart';

class WeatherService extends ChangeNotifier {
  final GetSgTwoHourForecastUseCase _getSgTwoHourForecastUseCase;
  final LocationService _locationService; 

  WeatherService({
    required GetSgTwoHourForecastUseCase getSgTwoHourForecastUseCase,
    required LocationService locationService, 
  })  : _getSgTwoHourForecastUseCase = getSgTwoHourForecastUseCase,
        _locationService = locationService; 

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  WeatherResponse? _currentWeather;
  WeatherResponse? get currentWeather => _currentWeather;

  List<ForecastPeriod>? _forecast;
  List<ForecastPeriod>? get forecast => _forecast;
  
  List<String> _recentCities = [];
  List<String> get recentCities => _recentCities;

  List<String> get defaultCities => ['Singapore', 'Kuala Lumpur', 'Bangkok']; // Example

  Future<void> getSgTwoHourForecast({String? date, String? area}) async { // Changed parameter name for clarity
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    // If area is provided, it might be used as 'date' if API expects area in date field for some reason
    // Or, it might be a separate parameter if the use case/repo handles it.
    // For now, passing date (which might be an area string from UI) to the use case.
    final result = await _getSgTwoHourForecastUseCase.execute(date: date ?? area);
    
    if (result.isSuccess) {
      _currentWeather = result.asSuccess.value;
      if (_currentWeather?.items?.isNotEmpty == true && 
          _currentWeather!.items!.first.forecasts?.isNotEmpty == true) {
        _forecast = _currentWeather!.items!.first.forecasts!.toList();
      }
      _addRecentCity(_currentWeather?.areaMetadata?.first.name ?? area ?? date);
    } else if (result.isFailure) {
      _errorMessage = result.asFailure.error.message;
    }

    _isLoading = false;
    notifyListeners();
  }

  // Example: Fetch weather based on current location (simplified)
  Future<void> fetchWeatherForCurrentLocation() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    try {
      // final position = await _locationService.getCurrentPosition();
      // For SG forecast, date/area is more relevant than precise lat/lon
      // We can call with null date to get latest, or a default area if needed.
      await getSgTwoHourForecast(date: null); // Gets latest for default/all areas covered by API
    } catch (e) {
      _errorMessage = e.toString();
    }
    _isLoading = false;
    notifyListeners();
  }


  void _addRecentCity(String? cityName) {
    if (cityName == null || cityName.isEmpty) return;
    if (!_recentCities.contains(cityName)) {
      _recentCities.insert(0, cityName);
      if (_recentCities.length > 5) {
        _recentCities.removeLast();
      }
      notifyListeners(); // Notify listeners when recent cities change
    }
  }

  void clearWeather() {
    _currentWeather = null;
    _forecast = null;
    _errorMessage = null;
    notifyListeners();
  }
}
