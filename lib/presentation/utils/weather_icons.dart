import 'package:flutter/material.dart';
import 'package:flutter_stack/domain/models/weather/weather_model.dart';

/// Helper class for weather icons
class WeatherIcons {
  /// Get the appropriate icon for the weather condition
  static IconData getIconForCondition(WeatherCondition condition, {bool night = false}) {
    switch (condition) {
      case WeatherCondition.clear:
        return night ? Icons.nightlight_round : Icons.wb_sunny;
      case WeatherCondition.cloudy:
        return Icons.cloud;
      case WeatherCondition.rainy:
        return Icons.grain;
      case WeatherCondition.stormy:
        return Icons.flash_on;
      case WeatherCondition.snowy:
        return Icons.ac_unit;
      case WeatherCondition.foggy:
        return Icons.cloud_queue;
      case WeatherCondition.unknown:
        return Icons.help_outline;
    }
  }

  /// Get color for the weather condition
  static Color getColorForCondition(WeatherCondition condition) {
    switch (condition) {
      case WeatherCondition.clear:
        return Colors.orange;
      case WeatherCondition.cloudy:
        return Colors.blueGrey;
      case WeatherCondition.rainy:
        return Colors.indigo;
      case WeatherCondition.stormy:
        return Colors.deepPurple;
      case WeatherCondition.snowy:
        return Colors.lightBlue;
      case WeatherCondition.foggy:
        return Colors.grey;
      case WeatherCondition.unknown:
        return Colors.grey;
    }
  }
  
  /// Get icon widget with appropriate size and color
  static Widget getIconWidget(
    WeatherCondition condition, {
    bool night = false,
    double size = 40.0,
    Color? color,
  }) {
    return Icon(
      getIconForCondition(condition, night: night),
      size: size,
      color: color ?? getColorForCondition(condition),
    );
  }
}

// Convert Weather code to icon
IconData getWeatherIcon(int code) {
  switch (code) {
    case >= 200 && < 300: // Thunderstorm
      return Icons.flash_on; // Example Icon
    case >= 300 && < 400: // Drizzle
      return Icons.grain; // Example Icon
    case >= 500 && < 600: // Rain
      return Icons.beach_access; // Example Icon
    case >= 600 && < 700: // Snow
      return Icons.ac_unit; // Example Icon
    case >= 700 && < 800: // Atmosphere
      return Icons.foggy; // Example Icon
    case == 800: // Clear
      return Icons.wb_sunny; // Example Icon
    case > 800 && < 805: // Clouds
      return Icons.wb_cloudy; // Example Icon
    default: // Default icon if no match
      return Icons.help_outline; // Or some other default
  }
}

// Convert Weather code to background image
String getWeatherBackgroundImage(int code, {bool isDay = true}) {
  String basePath = 'assets/images/backgrounds';
  switch (code) {
    case >= 200 && < 300: // Thunderstorm
      return '$basePath/thunderstorm.jpg';
    case >= 300 && < 400: // Drizzle
      return '$basePath/drizzle.jpg';
    case >= 500 && < 600: // Rain
      return '$basePath/rain.jpg';
    case >= 600 && < 700: // Snow
      return '$basePath/snow.jpg';
    case >= 700 && < 800: // Atmosphere (fog, mist, etc.)
      return '$basePath/atmosphere.jpg';
    case == 800: // Clear
      return isDay ? '$basePath/clear_day.jpg' : '$basePath/clear_night.jpg';
    case > 800 && < 805: // Clouds
      return isDay ? '$basePath/cloudy_day.jpg' : '$basePath/cloudy_night.jpg';
    default: // Default background
      return isDay ? '$basePath/clear_day.jpg' : '$basePath/clear_night.jpg';
  }
}
