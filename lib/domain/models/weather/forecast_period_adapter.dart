import 'package:api_client/api_client.dart';

// Adapter class for ForecastPeriod to provide a more convenient interface for the UI
class ForecastPeriodAdapter {
  final ForecastPeriod _forecastPeriod;

  ForecastPeriodAdapter(this._forecastPeriod);

  String? get timePeriod {
    if (_forecastPeriod.time == null) return null;
    return '${_forecastPeriod.time!.start} - ${_forecastPeriod.time!.end}';
  }

  String? get forecast => _forecastPeriod.forecast;

  int? get temperatureLow => _forecastPeriod.temperature?.low;
  int? get temperatureHigh => _forecastPeriod.temperature?.high;

  int? get humidityLow => _forecastPeriod.relativeHumidity?.low;
  int? get humidityHigh => _forecastPeriod.relativeHumidity?.high;

  int? get windSpeedLow => _forecastPeriod.wind?.speed?.low;
  int? get windSpeedHigh => _forecastPeriod.wind?.speed?.high;
  String? get windDirection => _forecastPeriod.wind?.direction;

  // You might need a way to get a weather code if your getWeatherIcon function expects one.
  // This depends on how your API provides weather conditions (e.g., a string or a specific code).
  // For now, let's assume there isn't a direct integer code in ForecastPeriod.
  // You might need to map _forecastPeriod.forecast (String) to an int code.
  int? get weatherCode {
    // Example mapping - replace with actual logic based on your API's forecast strings
    final String? forecastString = _forecastPeriod.forecast?.toLowerCase();
    if (forecastString == null) return 0; // Default or unknown

    if (forecastString.contains('thunder')) return 200;
    if (forecastString.contains('drizzle')) return 300;
    if (forecastString.contains('rain') || forecastString.contains('showers')) return 500;
    if (forecastString.contains('snow')) return 600;
    if (forecastString.contains('mist') || forecastString.contains('fog')) return 700;
    if (forecastString.contains('clear') || forecastString.contains('sunny')) return 800;
    if (forecastString.contains('cloudy') || forecastString.contains('overcast')) return 801;
    
    return 0; // Default
  }
}
