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
  
  @override
  Widget build(BuildContext context) {
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
              : _weatherData == null || _weatherData!.items?.isEmpty == true
                  ? const Center(child: Text('No weather data available'))
                  : RefreshIndicator(
                      onRefresh: _loadWeatherData,
                      child: ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: _weatherData!.items!.length,
                        itemBuilder: (context, index) {
                          final weatherItem = _weatherData!.items![index];
                          return WeatherCard(weatherItem: weatherItem);
                        },
                      ),
                    ),
    );
  }
}

class WeatherCard extends StatelessWidget {
  final WeatherItem weatherItem;
  
  const WeatherCard({
    super.key,
    required this.weatherItem,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              weatherItem.area ?? 'Unknown location',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            if (weatherItem.forecast != null && weatherItem.forecast!.forecast != null)
              _buildForecastDetails(context, weatherItem.forecast!),
            const SizedBox(height: 8),
            if (weatherItem.areaMetadata != null && weatherItem.areaMetadata!.isNotEmpty)
              _buildAreaMetadata(context, weatherItem.areaMetadata!.first),
          ],
        ),
      ),
    );
  }
  
  Widget _buildForecastDetails(BuildContext context, Forecast forecast) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Forecast: ${forecast.forecast}',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        if (forecast.relativeHumidity != null)
          Text(
            'Humidity: ${forecast.relativeHumidity!.low} - ${forecast.relativeHumidity!.high}%',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        if (forecast.temperature != null)
          Text(
            'Temperature: ${forecast.temperature!.low}°C - ${forecast.temperature!.high}°C',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
      ],
    );
  }
  
  Widget _buildAreaMetadata(BuildContext context, AreaMetadata metadata) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Area: ${metadata.name}',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        if (metadata.labelLocation != null)
          Text(
            'Coordinates: ${metadata.labelLocation!.latitude}, ${metadata.labelLocation!.longitude}',
            style: Theme.of(context).textTheme.bodySmall,
          ),
      ],
    );
  }
}
