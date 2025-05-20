/// Represents a weather condition
enum WeatherCondition {
  clear,
  cloudy,
  rainy,
  stormy,
  snowy,
  foggy,
  unknown,
}

/// Represents weather data for a location
class Weather {
  final String cityName;
  final double temperature;
  final double feelsLike;
  final int humidity;
  final double windSpeed;
  final WeatherCondition condition;
  final String description;
  final String iconCode;
  final DateTime timestamp;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.feelsLike,
    required this.humidity,
    required this.windSpeed,
    required this.condition,
    required this.description,
    required this.iconCode,
    required this.timestamp,
  });

  /// Factory constructor to create a Weather object from a Map (JSON)
  factory Weather.fromJson(Map<String, dynamic> json) {
    final main = json['main'] ?? {};
    final weather = (json['weather'] as List?)?.isNotEmpty == true
        ? json['weather'][0]
        : {};
    final wind = json['wind'] ?? {};
    
    return Weather(
      cityName: json['name'] ?? 'Unknown',
      temperature: (main['temp'] as num?)?.toDouble() ?? 0.0,
      feelsLike: (main['feels_like'] as num?)?.toDouble() ?? 0.0,
      humidity: (main['humidity'] as num?)?.toInt() ?? 0,
      windSpeed: (wind['speed'] as num?)?.toDouble() ?? 0.0,
      condition: _mapStringToWeatherCondition(weather['main'] ?? ''),
      description: weather['description'] ?? '',
      iconCode: weather['icon'] ?? '',
      timestamp: DateTime.fromMillisecondsSinceEpoch(
        ((json['dt'] as num?)?.toInt() ?? 0) * 1000,
      ),
    );
  }

  /// Converts a string weather condition to a WeatherCondition enum
  static WeatherCondition _mapStringToWeatherCondition(String input) {
    final condition = input.toLowerCase();
    if (condition.contains('clear')) {
      return WeatherCondition.clear;
    }
    if (condition.contains('cloud')) { 
      return WeatherCondition.cloudy;
    }
    if (condition.contains('rain') || condition.contains('drizzle')) {
      return WeatherCondition.rainy;
    }
    if (condition.contains('thunderstorm') || condition.contains('storm')) {
      return WeatherCondition.stormy;
    }
    if (condition.contains('snow')) {
      return WeatherCondition.snowy;
    }
    if (condition.contains('fog') || condition.contains('mist')) {
      return WeatherCondition.foggy;
    }
    return WeatherCondition.unknown;
  }

  /// Gets the appropriate icon for the weather condition
  String get weatherIcon {
    switch (condition) {
      case WeatherCondition.clear:
        return '☀️';
      case WeatherCondition.cloudy:
        return '☁️';
      case WeatherCondition.rainy:
        return '🌧️';
      case WeatherCondition.stormy:
        return '⛈️';
      case WeatherCondition.snowy:
        return '❄️';
      case WeatherCondition.foggy:
        return '🌫️';
      default:
        return '🌡️';
    }
  }

  /// Converts temperature from Kelvin to Celsius
  double get temperatureCelsius => temperature - 273.15;

  /// Converts temperature from Kelvin to Fahrenheit
  double get temperatureFahrenheit => (temperature - 273.15) * 9 / 5 + 32;

  /// Formats the temperature in Celsius
  String get formattedTemperatureCelsius => 
      '${temperatureCelsius.toStringAsFixed(1)}°C';

  /// Formats the temperature in Fahrenheit
  String get formattedTemperatureFahrenheit =>
      '${temperatureFahrenheit.toStringAsFixed(1)}°F';

  @override
  String toString() {
    return 'Weather(cityName: $cityName, temperature: $formattedTemperatureCelsius, '
        'condition: $condition, description: $description)';
  }
}
