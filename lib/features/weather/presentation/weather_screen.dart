import 'package:api_client/api_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stack/core/utils/service_locator.dart';
import 'package:flutter_stack/features/weather/data/weather_repository.dart';

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
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _errorMessage != null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Error: $_errorMessage',
                        style: TextStyle(color: Theme.of(context).colorScheme.error),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _loadWeatherData,
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                )
              : _weatherData == null || _weatherData!.data == null || weatherItems == null || weatherItems.isEmpty
                  ? const Center(child: Text('No weather data available'))
                  : RefreshIndicator(
                      onRefresh: _loadWeatherData,
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
    final timestamp = _getDisplayValue(weatherItem['timestamp']);
    final validPeriod = weatherItem['valid_period'] as Map<String, dynamic>?;
    final forecasts = weatherItem['forecasts'] as List<dynamic>?;

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Weather updated: $updateTimestamp',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'Timestamp: $timestamp',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            if (validPeriod != null) ...[
              const SizedBox(height: 8),
              Text(
                'Valid period: ${_getDisplayValue(validPeriod['start'])} - ${_getDisplayValue(validPeriod['end'])}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              if (validPeriod['text'] != null)
                Text(
                  'Duration: ${_getDisplayValue(validPeriod['text'])}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
            ],
            const SizedBox(height: 16),
            if (forecasts != null && forecasts.isNotEmpty)
              _buildForecastList(context, forecasts),
          ],
        ),
      ),
    );
  }
  
  Widget _buildForecastList(BuildContext context, List<dynamic> forecasts) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Forecasts (${forecasts.length} areas)',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        // Show first 10 forecasts to avoid overwhelming the UI
        ...forecasts.take(10).map((forecast) => _buildForecastItem(context, forecast)).toList(),
        if (forecasts.length > 10)
          Text(
            '... and ${forecasts.length - 10} more areas',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontStyle: FontStyle.italic,
            ),
          ),
      ],
    );
  }
  
  Widget _buildForecastItem(BuildContext context, dynamic forecastData) {
    final forecast = forecastData as Map<String, dynamic>?;
    if (forecast == null) return const SizedBox.shrink();

    final area = _getDisplayValue(forecast['area']);
    final forecastText = _getDisplayValue(forecast['forecast']);

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              area,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 3,
            child: Text(
              forecastText,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
