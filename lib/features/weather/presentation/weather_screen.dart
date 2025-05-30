import 'package:api_client/api_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stack/core/utils/service_locator.dart';
import 'package:flutter_stack/features/weather/data/weather_repository.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherIconHelper {
  static IconData getWeatherIcon(String forecast) {
    final lowerForecast = forecast.toLowerCase();
    
    if (lowerForecast.contains('rain') || lowerForecast.contains('shower')) {
      return WeatherIcons.rain;
    } else if (lowerForecast.contains('thunder') || lowerForecast.contains('storm')) {
      return WeatherIcons.thunderstorm;
    } else if (lowerForecast.contains('cloud')) {
      return WeatherIcons.cloudy;
    } else if (lowerForecast.contains('sun') || lowerForecast.contains('clear') || lowerForecast.contains('fair')) {
      return WeatherIcons.day_sunny;
    } else if (lowerForecast.contains('fog') || lowerForecast.contains('haze')) {
      return WeatherIcons.fog;
    } else if (lowerForecast.contains('windy') || lowerForecast.contains('wind')) {
      return WeatherIcons.strong_wind;
    } else if (lowerForecast.contains('partly')) {
      return WeatherIcons.day_cloudy;
    } else {
      return WeatherIcons.na; // Default icon
    }
  }
  
  static Color getWeatherColor(String forecast, [ColorScheme? colorScheme]) {
    final lowerForecast = forecast.toLowerCase();
    
    // Use theme colors when available, fallback to hardcoded colors
    final primaryColor = colorScheme?.primary ?? Colors.blue.shade600;
    final errorColor = colorScheme?.error ?? Colors.red.shade600;
    
    if (lowerForecast.contains('rain') || lowerForecast.contains('shower')) {
      return primaryColor;
    } else if (lowerForecast.contains('thunder') || lowerForecast.contains('storm')) {
      return errorColor;
    } else if (lowerForecast.contains('cloud')) {
      return colorScheme?.outline ?? Colors.grey.shade600;
    } else if (lowerForecast.contains('sun') || lowerForecast.contains('clear') || lowerForecast.contains('fair')) {
      return colorScheme?.secondary ?? Colors.orange.shade600;
    } else if (lowerForecast.contains('fog') || lowerForecast.contains('haze')) {
      return colorScheme?.surfaceVariant ?? Colors.grey.shade400;
    } else if (lowerForecast.contains('windy') || lowerForecast.contains('wind')) {
      return colorScheme?.tertiary ?? Colors.teal.shade600;
    } else if (lowerForecast.contains('partly')) {
      return colorScheme?.secondaryContainer ?? Colors.amber.shade600;
    } else {
      return colorScheme?.onSurfaceVariant ?? Colors.grey.shade500;
    }
  }
}

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final WeatherRepository _weatherRepository = ServiceLocator.weatherRepository;
  
  bool _isLoading = false;
  String? _errorMessage;
  WeatherResponse? _weatherData;
  
  @override
  void initState() {
    super.initState();
    _loadWeatherData();
  }
  
  Future<void> _loadWeatherData() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
    
    try {
      final weatherData = await _weatherRepository.getWeatherData();
      
      setState(() {
        _weatherData = weatherData;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
  
  List<Map<String, dynamic>>? _getWeatherItems() {
    if (_weatherData?.data == null) return null;
    
    final itemsJson = _weatherData!.data!['items'];
    if (itemsJson == null) return null;
    
    // JsonObject represents arbitrary JSON, we need to extract the value
    if (itemsJson.isList) {
      final itemsList = itemsJson.asList;
      return itemsList.map((item) {
        if (item is Map<String, dynamic>) {
          return item;
        } else if (item is Map) {
          return item.cast<String, dynamic>();
        }
        return <String, dynamic>{};
      }).toList();
    }
    
    return null;
  }
  
  List<Map<String, dynamic>>? _getAreaMetadata() {
    if (_weatherData?.data == null) return null;
    
    final areaMetadataJson = _weatherData!.data!['area_metadata'];
    if (areaMetadataJson == null) return null;
    
    // JsonObject represents arbitrary JSON, we need to extract the value
    if (areaMetadataJson.isList) {
      final areaMetadataList = areaMetadataJson.asList;
      return areaMetadataList.map((item) {
        if (item is Map<String, dynamic>) {
          return item;
        } else if (item is Map) {
          return item.cast<String, dynamic>();
        }
        return <String, dynamic>{};
      }).toList();
    }
    
    return null;
  }
  
  @override
  Widget build(BuildContext context) {
    final weatherItems = _getWeatherItems();
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: const Text('Weather Forecast'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _errorMessage != null
              ? Center(
                  child: Container(
                    margin: const EdgeInsets.all(24),
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: colorScheme.errorContainer,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: colorScheme.error.withOpacity(0.3)),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.error_outline,
                          size: 48,
                          color: colorScheme.error,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Oops! Something went wrong',
                          style: theme.textTheme.titleLarge?.copyWith(
                            color: colorScheme.onErrorContainer,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _errorMessage!,
                          style: TextStyle(color: colorScheme.onErrorContainer),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 24),
                        ElevatedButton.icon(
                          onPressed: _loadWeatherData,
                          icon: const Icon(Icons.refresh),
                          label: const Text('Try Again'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: colorScheme.error,
                            foregroundColor: colorScheme.onError,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : _weatherData == null || _weatherData!.data == null || weatherItems == null || weatherItems.isEmpty
                  ? Center(
                      child: Container(
                        margin: const EdgeInsets.all(24),
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: colorScheme.primary.withOpacity(0.3)),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              WeatherIcons.na,
                              size: 48,
                              color: colorScheme.primary,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'No weather data available',
                              style: theme.textTheme.titleLarge?.copyWith(
                                color: colorScheme.onPrimaryContainer,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Pull down to refresh',
                              style: TextStyle(color: colorScheme.onPrimaryContainer),
                            ),
                          ],
                        ),
                      ),
                    )
                  : RefreshIndicator(
                      onRefresh: _loadWeatherData,
                      color: colorScheme.primary,
                      child: ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: weatherItems.length,
                        itemBuilder: (context, index) {
                          final weatherItem = weatherItems[index];
                          final areaMetadata = _getAreaMetadata();
                          return WeatherCard(
                            weatherItem: weatherItem,
                            areaMetadata: areaMetadata,
                          );
                        },
                      ),
                    ),
    );
  }
}

class WeatherCard extends StatelessWidget {
  final Map<String, dynamic> weatherItem;
  final List<Map<String, dynamic>>? areaMetadata;
  
  const WeatherCard({
    super.key,
    required this.weatherItem,
    required this.areaMetadata,
  });

  String _getDisplayValue(dynamic value) {
    if (value == null) return 'N/A';
    return value.toString();
  }

  @override
  Widget build(BuildContext context) {
    final updateTimestamp = _getDisplayValue(weatherItem['update_timestamp']);
    final validPeriod = weatherItem['valid_period'] as Map<String, dynamic>?;
    final forecasts = weatherItem['forecasts'] as List<dynamic>?;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              colorScheme.primary,
              colorScheme.primary.withOpacity(0.8),
            ],
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
        children: [
          // Header section
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      color: colorScheme.onPrimary.withOpacity(0.9),
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Updated: ${_formatTimestamp(updateTimestamp)}',
                        style: TextStyle(
                          color: colorScheme.onPrimary.withOpacity(0.9),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                if (validPeriod != null) ...[
                  Row(
                    children: [
                      Icon(
                        Icons.date_range,
                        color: colorScheme.onPrimary.withOpacity(0.8),
                        size: 18,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Valid: ${_formatValidPeriod(validPeriod)}',
                          style: TextStyle(
                            color: colorScheme.onPrimary.withOpacity(0.8),
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
          // Forecasts section
          if (forecasts != null && forecasts.isNotEmpty)
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        WeatherIcons.day_sunny,
                        color: colorScheme.onPrimary,
                        size: 24,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Weather Forecast (${forecasts.length} areas)',
                        style: TextStyle(
                          color: colorScheme.onPrimary,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildForecastGrid(context, forecasts),
                ],
              ),
            ),
        ],
        ),
      ),
    );
  }

  String _formatTimestamp(String timestamp) {
    try {
      // Basic formatting - you might want to use intl package for better formatting
      return timestamp.replaceAll('T', ' ').substring(0, timestamp.length > 16 ? 16 : timestamp.length);
    } catch (e) {
      return timestamp;
    }
  }

  String _formatValidPeriod(Map<String, dynamic> validPeriod) {
    final start = _getDisplayValue(validPeriod['start']);
    final end = _getDisplayValue(validPeriod['end']);
    try {
      final startFormatted = start.replaceAll('T', ' ').substring(0, start.length > 16 ? 16 : start.length);
      final endFormatted = end.replaceAll('T', ' ').substring(0, end.length > 16 ? 16 : end.length);
      return '$startFormatted - $endFormatted';
    } catch (e) {
      return '$start - $end';
    }
  }
  
  Widget _buildForecastGrid(BuildContext context, List<dynamic> forecasts) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2.5,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: forecasts.length > 12 ? 12 : forecasts.length, // Limit to 12 items for better UI
      itemBuilder: (context, index) {
        return _buildForecastCard(context, forecasts[index]);
      },
    );
  }
  
  Widget _buildForecastCard(BuildContext context, dynamic forecastData) {
    final forecast = forecastData as Map<String, dynamic>?;
    if (forecast == null) return const SizedBox.shrink();

    final area = _getDisplayValue(forecast['area']);
    final forecastText = _getDisplayValue(forecast['forecast']);
    final weatherIcon = WeatherIconHelper.getWeatherIcon(forecastText);
    final colorScheme = Theme.of(context).colorScheme;
    final weatherColor = WeatherIconHelper.getWeatherColor(forecastText, colorScheme);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  weatherIcon,
                  color: weatherColor,
                  size: 20,
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    area,
                    style: TextStyle(
                      color: colorScheme.onPrimary,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            Text(
              forecastText,
              style: TextStyle(
                color: colorScheme.onPrimary.withOpacity(0.9),
                fontSize: 11,
                height: 1.2,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
