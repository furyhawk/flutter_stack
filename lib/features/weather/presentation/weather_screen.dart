import 'package:api_client/api_client.dart';
import 'package:built_collection/built_collection.dart';
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
              : _weatherData == null || _weatherData!.data == null || _weatherData!.data!.items.isEmpty
                  ? const Center(child: Text('No weather data available'))
                  : RefreshIndicator(
                      onRefresh: _loadWeatherData,
                      child: ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: _weatherData!.data!.items.length,
                        itemBuilder: (context, index) {
                          final weatherItem = _weatherData!.data!.items[index];
                          return WeatherCard(
                            weatherItem: weatherItem,
                            areaMetadata: _weatherData!.data!.areaMetadata,
                          );
                        },
                      ),
                    ),
    );
  }
}

class WeatherCard extends StatelessWidget {
  final WeatherItem weatherItem;
  final BuiltList<AreaMetadata> areaMetadata;
  
  const WeatherCard({
    super.key,
    required this.weatherItem,
    required this.areaMetadata,
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
              'Weather updated: ${weatherItem.updateTimestamp}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'Valid period: ${weatherItem.validPeriod.start} - ${weatherItem.validPeriod.end}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            if (weatherItem.forecasts.isNotEmpty)
              _buildForecastList(context, weatherItem.forecasts),
          ],
        ),
      ),
    );
  }
  
  Widget _buildForecastList(BuildContext context, BuiltList<Forecast> forecasts) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Forecasts',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        ...forecasts.map((forecast) => _buildForecastItem(context, forecast)).toList(),
      ],
    );
  }
  
  Widget _buildForecastItem(BuildContext context, Forecast forecast) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Area: ${forecast.area}',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            'Forecast: ${forecast.forecast}',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
