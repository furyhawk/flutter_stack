import 'package:flutter/material.dart';
import 'package:flutter_stack/domain/models/weather/forecast_period_adapter.dart'; // For ForecastPeriodAdapter
import 'package:flutter_stack/domain/services/weather_service.dart';
import 'package:flutter_stack/presentation/utils/weather_icons.dart';
import 'package:provider/provider.dart';
import 'package:api_client/api_client.dart'; // Import for WeatherResponse and ForecastPeriod

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController _cityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Optionally, fetch initial weather data, e.g., for current location or a default city
    // Provider.of<WeatherService>(context, listen: false).fetchWeatherForCurrentLocation();
  }

  Future<void> _fetchWeatherData(BuildContext context, String? searchInput) async {
    final weatherService = Provider.of<WeatherService>(context, listen: false);
    // Assuming searchInput could be a date or an area name for SG forecast
    await weatherService.getSgTwoHourForecast(date: searchInput, area: searchInput); 
    if (mounted) {
      _cityController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final weatherService = Provider.of<WeatherService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Forecast'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _cityController,
              decoration: InputDecoration(
                labelText: 'Enter Date or Area (e.g., YYYY-MM-DD or Ang Mo Kio)',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () => _fetchWeatherData(context, _cityController.text),
                ),
              ),
              onSubmitted: (value) => _fetchWeatherData(context, value),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => weatherService.fetchWeatherForCurrentLocation(),
              child: const Text('Get Current SG 2-Hour Forecast'),
            ),
            const SizedBox(height: 20),
            // Recent searches (optional, if you want to show them)
            if (weatherService.recentCities.isNotEmpty) ...[
              Text('Recent Searches:', style: Theme.of(context).textTheme.titleMedium),
              Wrap(
                spacing: 8.0,
                children: weatherService.recentCities.map((city) => ActionChip(
                  label: Text(city),
                  onPressed: () => _fetchWeatherData(context, city),
                )).toList(),
              ),
              const SizedBox(height: 20),
            ],
            Expanded(
              child: _buildWeatherDisplay(context, weatherService),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeatherDisplay(BuildContext context, WeatherService weatherService) {
    if (weatherService.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (weatherService.errorMessage != null) {
      return Center(child: Text(weatherService.errorMessage!, style: const TextStyle(color: Colors.red)));
    }
    if (weatherService.currentWeather == null) {
      return const Center(child: Text('Please enter a date or area for the SG 2-hour forecast.'));
    }

    final WeatherResponse weatherData = weatherService.currentWeather!;
    final List<ForecastPeriodAdapter> adaptedForecasts = weatherData.items
        ?.expand((item) => item.forecasts?.map((fp) => ForecastPeriodAdapter(fp)) ?? [])
        .toList() ?? [];

    String areaName = "Forecast Area";
    if (weatherData.areaMetadata != null && weatherData.areaMetadata!.isNotEmpty) {
      areaName = weatherData.areaMetadata!.first.name ?? areaName;
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(areaName, style: Theme.of(context).textTheme.headlineSmall),
          if (weatherData.items?.first.updateTimestamp != null)
            Text('Last Updated: ${weatherData.items!.first.updateTimestamp}', style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 10),
          if (adaptedForecasts.isNotEmpty) ...[
            Text('Forecasts:', style: Theme.of(context).textTheme.titleMedium),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: adaptedForecasts.length,
              itemBuilder: (context, index) {
                final forecast = adaptedForecasts[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 4.0),
                  child: ListTile(
                    leading: Icon(getWeatherIcon(forecast.weatherCode ?? 0)), // Assuming you have a way to get a code
                    title: Text(forecast.timePeriod ?? 'N/A'),
                    subtitle: Text(
                        '${forecast.forecast} - Temp: ${forecast.temperatureLow}°C to ${forecast.temperatureHigh}°C\nHumidity: ${forecast.humidityLow}% to ${forecast.humidityHigh}%\nWind: ${forecast.windSpeedLow} to ${forecast.windSpeedHigh} km/h ${forecast.windDirection}'),
                    isThreeLine: true,
                  ),
                );
              },
            ),
          ] else ...[
            const Text('No forecast data available for this period.'),
          ],
        ],
      ),
    );
  }

  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }
}
