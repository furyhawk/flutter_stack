import 'package:flutter/material.dart';
import 'package:flutter_stack/domain/services/services.dart';
import 'package:flutter_stack/presentation/utils/weather_icons.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController _searchController = TextEditingController(text: 'London');
  String _selectedCity = 'London';

  @override
  void initState() {
    super.initState();
    // Load weather data for London by default when screen opens
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<WeatherService>().getFullWeatherData(_selectedCity);
    });
  }

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
  
  void _toggleTemperatureUnit() {
    final preferencesService = context.read<PreferencesService>();
    preferencesService.setUseCelsius(!preferencesService.useCelsius);
  }
  
  // Helper method to create weather data items with consistent style
  Widget _weatherDataItem(IconData icon, String label, String value) {
    return Column(
      children: [
        Icon(icon, size: 24.0),
        const SizedBox(height: 4.0),
        Text(
          label,
          style: TextStyle(
            fontSize: 12.0,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 4.0),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
        actions: [
          // Get current location button
          IconButton(
            icon: const Icon(Icons.my_location),
            tooltip: 'Get weather for current location',
            onPressed: () {
              context.read<WeatherService>().getWeatherForCurrentLocation();
            },
          ),
          // Temperature unit toggle
          Consumer<PreferencesService>(
            builder: (context, preferencesService, child) {
              return IconButton(
                icon: Icon(preferencesService.useCelsius 
                    ? Icons.ac_unit 
                    : Icons.local_fire_department),
                tooltip: preferencesService.useCelsius 
                    ? 'Switch to Fahrenheit' 
                    : 'Switch to Celsius',
                onPressed: _toggleTemperatureUnit,
              );
            }
          ),
        ],
      ),
      body: Consumer<WeatherService>(
        builder: (context, weatherService, child) {
          // Build the search bar
          Widget searchBar = Padding(
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
                    ),
                    onSubmitted: (_) => _searchCity(),
                  ),
                ),
                const SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: _searchCity,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                  ),
                  child: const Text('Search'),
                ),
              ],
            ),
          );

          // Build quick cities
          Widget quickCities = Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Default cities
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
                            avatar: const Icon(Icons.location_city, size: 16),
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
                
                // Recent searches
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
                              avatar: const Icon(Icons.history, size: 16),
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

          // Weather content based on status
          Widget weatherContent;
          
          switch (weatherService.status) {
            case WeatherServiceStatus.initial:
              weatherContent = const Center(
                child: Text('Search for a city to see the weather data'),
              );
              break;
            case WeatherServiceStatus.loading:
              weatherContent = Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(),
                    const SizedBox(height: 16),
                    Text(
                      'Loading weather for $_selectedCity...',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              );
              break;
            case WeatherServiceStatus.error:
              weatherContent = Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error_outline, size: 64, color: Colors.red[300]),
                    const SizedBox(height: 16),
                    Text(
                      weatherService.error ?? 'An error occurred',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        weatherService.getFullWeatherData(_selectedCity);
                      },
                      child: const Text('Try Again'),
                    ),
                  ],
                ),
              );
              break;
            case WeatherServiceStatus.loaded:
              if (weatherService.currentWeather == null) {
                weatherContent = const Center(
                  child: Text('No weather data available'),
                );
              } else {
                final weather = weatherService.currentWeather!;
                final forecast = weatherService.forecast;
                
                weatherContent = SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Current weather card
                        Card(
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          color: Theme.of(context).colorScheme.surface,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      weather.cityName,
                                      style: Theme.of(context).textTheme.headlineSmall,
                                    ),
                                    Text(
                                      DateFormat('EEE, MMM d').format(weather.timestamp),
                                      style: Theme.of(context).textTheme.bodyMedium,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Consumer<PreferencesService>(
                                          builder: (context, preferencesService, child) {
                                            return Text(
                                              preferencesService.useCelsius
                                                  ? weather.formattedTemperatureCelsius
                                                  : weather.formattedTemperatureFahrenheit,
                                              style: Theme.of(context).textTheme.displaySmall,
                                            );
                                          },
                                        ),
                                        Consumer<PreferencesService>(
                                          builder: (context, preferencesService, child) {
                                            return Text(
                                              'Feels like: ${preferencesService.useCelsius 
                                                  ? '${(weather.feelsLike - 273.15).toStringAsFixed(1)}°C'
                                                  : '${((weather.feelsLike - 273.15) * 9 / 5 + 32).toStringAsFixed(1)}°F'}',
                                              style: Theme.of(context).textTheme.bodyMedium,
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        WeatherIcons.getIconWidget(
                                          weather.condition, 
                                          size: 64.0,
                                          color: Theme.of(context).colorScheme.primary,
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          weather.description,
                                          style: Theme.of(context).textTheme.bodyMedium,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16.0),
                                const Divider(),
                                const SizedBox(height: 8.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    _weatherDataItem(
                                      Icons.water_drop,
                                      'Humidity',
                                      '${weather.humidity}%',
                                    ),
                                    _weatherDataItem(
                                      Icons.air,
                                      'Wind',
                                      '${weather.windSpeed.toStringAsFixed(1)} m/s',
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        
                        // Forecast section
                        if (forecast != null && forecast.isNotEmpty) ...[
                          const SizedBox(height: 24.0),
                          Text(
                            'Forecast',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(height: 8.0),
                          SizedBox(
                            height: 160,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: forecast.length,
                              itemBuilder: (context, index) {
                                final day = forecast[index];
                                return Card(
                                  margin: const EdgeInsets.only(right: 12.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          DateFormat('E, MMM d').format(day.timestamp),
                                          style: Theme.of(context).textTheme.bodyMedium,
                                        ),
                                        const SizedBox(height: 8.0),
                                        WeatherIcons.getIconWidget(
                                          day.condition,
                                          size: 32.0,
                                          color: Theme.of(context).colorScheme.primary,
                                        ),
                                        const SizedBox(height: 8.0),
                                        Consumer<PreferencesService>(
                                          builder: (context, preferencesService, child) {
                                            return Text(
                                              preferencesService.useCelsius
                                                  ? day.formattedTemperatureCelsius
                                                  : day.formattedTemperatureFahrenheit,
                                              style: Theme.of(context).textTheme.bodyLarge,
                                            );
                                          },
                                        ),
                                        const SizedBox(height: 4.0),
                                        Text(
                                          day.description,
                                          style: Theme.of(context).textTheme.bodySmall,
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
              break;
          }

          return Column(
            children: [
              searchBar,
              quickCities,
              Expanded(child: weatherContent),
            ],
          );
        },
      ),
    );
  }
}
