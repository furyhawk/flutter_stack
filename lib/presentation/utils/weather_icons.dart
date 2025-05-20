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
      default:
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
      default:
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
