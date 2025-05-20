import 'package:flutter/material.dart';
import 'package:flutter_stack/domain/services/weather_service.dart';
import 'package:provider/provider.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedCity = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _searchCity() {
    final city = _searchController.text.trim();
    if (city.isNotEmpty) {
      setState(() {
        _selectedCity = city;
      });
      context.read<WeatherService>().getFullWeatherData(city);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
        elevation: 0,
      ),
      body: Consumer<WeatherService>(
        builder: (context, weatherService, child) {
          return Column(
            children: [
              _buildSearchBar(context),
              _buildQuickCities(context, weatherService),
              Expanded(
                child: _buildWeatherContent(context, weatherService),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Enter city name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                prefixIcon: const Icon(Icons.search),
                contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
              ),
              onSubmitted: (_) => _searchCity(),
            ),
          ),
          const SizedBox(width: 8.0),
          ElevatedButton(
            onPressed: _searchCity,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 16.0),
            ),
            child: const Text('Search'),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickCities(BuildContext context, WeatherService weatherService) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Quick Search',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          const SizedBox(height: 8.0),
          SizedBox(
            height: 40.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                for (final city in weatherService.defaultCities)
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ActionChip(
                      label: Text(city),
                      onPressed: () {
                        _searchController.text = city;
                        setState(() {
                          _selectedCity = city;
                        });
                        weatherService.getFullWeatherData(city);
                      },
                    ),
                  ),
              ],
            ),
          ),
          if (weatherService.recentCities.isNotEmpty) ...[
            const SizedBox(height: 16.0),
            const Text(
              'Recent Searches',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 8.0),
            SizedBox(
              height: 40.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  for (final city in weatherService.recentCities)
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ActionChip(
                        avatar: const Icon(Icons.history, size: 16.0),
                        label: Text(city),
                        onPressed: () {
                          _searchController.text = city;
                          setState(() {
                            _selectedCity = city;
                          });
                          weatherService.getFullWeatherData(city);
                        },
                      ),
                    ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildWeatherContent(BuildContext context, WeatherService weatherService) {
    switch (weatherService.status) {
      case WeatherServiceStatus.initial:
        return const Center(
          child: Text(
            'Search for a city to see the weather',
            style: TextStyle(fontSize: 18.0),
          ),
        );
      case WeatherServiceStatus.loading:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case WeatherServiceStatus.error:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 48.0,
              ),
              const SizedBox(height: 16.0),
              Text(
                weatherService.error ?? 'An error occurred',
                style: const TextStyle(fontSize: 18.0),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_selectedCity.isNotEmpty) {
                    weatherService.getFullWeatherData(_selectedCity);
                  }
                },
                child: const Text('Try Again'),
              ),
            ],
          ),
        );
      case WeatherServiceStatus.loaded:
        if (weatherService.currentWeather == null) {
          return const Center(
            child: Text(
              'No weather data available',
              style: TextStyle(fontSize: 18.0),
            ),
          );
        }
        return _buildWeatherDetails(context, weatherService);
    }
  }

  Widget _buildWeatherDetails(BuildContext context, WeatherService weatherService) {
    final weather = weatherService.currentWeather!;
    final forecast = weatherService.forecast;
    
    return RefreshIndicator(
      onRefresh: () async {
        if (_selectedCity.isNotEmpty) {
          await weatherService.getFullWeatherData(_selectedCity);
        }
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Current weather card
            Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              weather.cityName,
                              style: const TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              'Updated: ${_formatDate(weather.timestamp)}',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          weather.weatherIcon,
                          style: const TextStyle(fontSize: 48.0),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              weather.formattedTemperatureCelsius,
                              style: const TextStyle(
                                fontSize: 36.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              'Feels like: ${_formatTemperature(weather.feelsLike)}',
                              style: const TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              weather.description.isNotEmpty
                                  ? weather.description[0].toUpperCase() +
                                      weather.description.substring(1)
                                  : 'Unknown',
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              'Humidity: ${weather.humidity}%',
                              style: const TextStyle(fontSize: 14.0),
                            ),
                            const SizedBox(height: 2.0),
                            Text(
                              'Wind: ${weather.windSpeed.toStringAsFixed(1)} m/s',
                              style: const TextStyle(fontSize: 14.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            
            // Forecast section (if available)
            if (forecast != null && forecast.isNotEmpty) ...[
              const SizedBox(height: 24.0),
              const Text(
                'Forecast',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                height: 180.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: forecast.length.clamp(0, 5),
                  itemBuilder: (context, index) {
                    final forecastItem = forecast[index];
                    return Card(
                      elevation: 2.0,
                      margin: const EdgeInsets.only(right: 12.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Container(
                        width: 120.0,
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _formatDayOfWeek(forecastItem.timestamp),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              forecastItem.weatherIcon,
                              style: const TextStyle(fontSize: 32.0),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              forecastItem.formattedTemperatureCelsius,
                              style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              forecastItem.description.isNotEmpty
                                  ? forecastItem.description[0].toUpperCase() +
                                      forecastItem.description.substring(1)
                                  : 'Unknown',
                              style: const TextStyle(
                                fontSize: 12.0,
                                color: Colors.grey,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  String _formatTemperature(double kelvin) {
    final celsius = kelvin - 273.15;
    return '${celsius.toStringAsFixed(1)}°C';
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    if (date.day == now.day && date.month == now.month && date.year == now.year) {
      return '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
    }
    return '${date.day}/${date.month}';
  }

  String _formatDayOfWeek(DateTime date) {
    final weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return weekdays[date.weekday - 1];
  }
}
