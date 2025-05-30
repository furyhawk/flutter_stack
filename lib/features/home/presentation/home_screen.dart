import 'package:api_client/api_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stack/core/utils/service_locator.dart';
import 'package:flutter_stack/features/auth/domain/auth_provider.dart';
import 'package:flutter_stack/features/auth/presentation/login_screen.dart';
import 'package:flutter_stack/features/items/presentation/items_screen.dart';
import 'package:flutter_stack/features/profile/presentation/profile_screen.dart';
import 'package:flutter_stack/features/weather/data/weather_repository.dart';
import 'package:flutter_stack/features/weather/presentation/weather_screen.dart';
import 'package:provider/provider.dart';
import 'package:weather_icons/weather_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final WeatherRepository _weatherRepository = ServiceLocator.weatherRepository;
  
  bool _isLoadingWeather = false;
  String? _weatherErrorMessage;
  WeatherResponse? _weatherData;
  
  @override
  void initState() {
    super.initState();
    _loadWeatherData();
  }
  
  Future<void> _loadWeatherData() async {
    setState(() {
      _isLoadingWeather = true;
      _weatherErrorMessage = null;
    });
    
    try {
      final weatherData = await _weatherRepository.getWeatherData();
      
      setState(() {
        _weatherData = weatherData;
      });
    } catch (e) {
      setState(() {
        _weatherErrorMessage = e.toString();
      });
    } finally {
      setState(() {
        _isLoadingWeather = false;
      });
    }
  }

  List<Map<String, dynamic>>? _getWeatherItems() {
    if (_weatherData?.data == null) return null;
    
    final itemsJson = _weatherData!.data!['items'];
    if (itemsJson == null) return null;
    
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

  String _getDisplayValue(dynamic value) {
    if (value == null) return 'N/A';
    return value.toString();
  }

  String _formatTimestamp(String timestamp) {
    try {
      return timestamp.replaceAll('T', ' ').substring(0, timestamp.length > 16 ? 16 : timestamp.length);
    } catch (e) {
      return timestamp;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: const Text('Weather Hub'),
        elevation: 0,
        backgroundColor: colorScheme.surface,
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const ProfileScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await context.read<AuthProvider>().logout();
              if (mounted) {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                  (route) => false,
                );
              }
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _loadWeatherData,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome Section
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      colorScheme.primaryContainer,
                      colorScheme.secondaryContainer,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(
                      WeatherIcons.day_sunny,
                      size: 50,
                      color: colorScheme.onPrimaryContainer,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome to Weather Hub',
                            style: theme.textTheme.headlineSmall?.copyWith(
                              color: colorScheme.onPrimaryContainer,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Stay updated with Singapore\'s weather',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: colorScheme.onPrimaryContainer.withOpacity(0.8),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Quick Weather Overview
              _buildWeatherOverviewCard(),

              // Quick Actions Section
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Quick Actions',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: _buildActionCard(
                            title: 'Full Weather',
                            subtitle: 'Detailed forecast',
                            icon: WeatherIcons.day_cloudy,
                            color: colorScheme.primary,
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (_) => const WeatherScreen()),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildActionCard(
                            title: 'My Items',
                            subtitle: 'Manage items',
                            icon: Icons.inventory_2,
                            color: colorScheme.secondary,
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (_) => const ItemsScreen()),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Weather Categories Section
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Weather Services',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 1.2,
                      children: [
                        _buildWeatherServiceCard(
                          title: '2-Hour Forecast',
                          icon: WeatherIcons.time_2,
                          color: Colors.blue,
                          onTap: () async {
                            _showWeatherDialog('2-Hour Forecast', () async {
                              return await _weatherRepository.getTwoHourForecast();
                            });
                          },
                        ),
                        _buildWeatherServiceCard(
                          title: '24-Hour Forecast',
                          icon: WeatherIcons.time_12,
                          color: Colors.green,
                          onTap: () async {
                            _showWeatherDialog('24-Hour Forecast', () async {
                              return await _weatherRepository.getTwentyFourHourForecast();
                            });
                          },
                        ),
                        _buildWeatherServiceCard(
                          title: '4-Day Outlook',
                          icon: WeatherIcons.day_sunny_overcast,
                          color: Colors.orange,
                          onTap: () async {
                            _showWeatherDialog('4-Day Outlook', () async {
                              return await _weatherRepository.getFourDayOutlook();
                            });
                          },
                        ),
                        _buildWeatherServiceCard(
                          title: 'Temperature',
                          icon: WeatherIcons.thermometer,
                          color: Colors.red,
                          onTap: () async {
                            _showWeatherDialog('Air Temperature', () async {
                              return await _weatherRepository.getAirTemperature();
                            });
                          },
                        ),
                        _buildWeatherServiceCard(
                          title: 'Lightning',
                          icon: WeatherIcons.lightning,
                          color: Colors.purple,
                          onTap: () async {
                            _showWeatherDialog('Lightning Data', () async {
                              return await _weatherRepository.getLightning();
                            });
                          },
                        ),
                        _buildWeatherServiceCard(
                          title: 'Wind Direction',
                          icon: WeatherIcons.strong_wind,
                          color: Colors.teal,
                          onTap: () async {
                            _showWeatherDialog('Wind Direction', () async {
                              return await _weatherRepository.getWindDirection();
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWeatherOverviewCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.primary.withOpacity(0.8),
              ],
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    WeatherIcons.day_cloudy,
                    color: Colors.white,
                    size: 30,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Current Weather',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              if (_isLoadingWeather)
                const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
              else if (_weatherErrorMessage != null)
                Column(
                  children: [
                    Text(
                      'Unable to load weather data',
                      style: TextStyle(color: Colors.white.withOpacity(0.9)),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: _loadWeatherData,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white.withOpacity(0.2),
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Retry'),
                    ),
                  ],
                )
              else if (_weatherData != null)
                _buildWeatherSummary()
              else
                Text(
                  'No weather data available',
                  style: TextStyle(color: Colors.white.withOpacity(0.9)),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWeatherSummary() {
    final weatherItems = _getWeatherItems();
    if (weatherItems == null || weatherItems.isEmpty) {
      return Text(
        'No current weather data available',
        style: TextStyle(color: Colors.white.withOpacity(0.9)),
      );
    }

    final firstItem = weatherItems.first;
    final updateTimestamp = _getDisplayValue(firstItem['update_timestamp']);
    final forecasts = firstItem['forecasts'] as List<dynamic>?;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Last updated: ${_formatTimestamp(updateTimestamp)}',
          style: TextStyle(
            color: Colors.white.withOpacity(0.8),
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 12),
        if (forecasts != null && forecasts.isNotEmpty) ...[
          Text(
            'Areas with weather updates: ${forecasts.length}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 45,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: forecasts.length > 5 ? 5 : forecasts.length,
              itemBuilder: (context, index) {
                final forecast = forecasts[index] as Map<String, dynamic>?;
                if (forecast == null) return const SizedBox.shrink();
                
                final area = _getDisplayValue(forecast['area']);
                final forecastText = _getDisplayValue(forecast['forecast']);
                
                return Container(
                  margin: const EdgeInsets.only(right: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        area,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        forecastText,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const WeatherScreen()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white.withOpacity(0.2),
            foregroundColor: Colors.white,
          ),
          child: const Text('View Full Weather Report'),
        ),
      ],
    );
  }

  Widget _buildActionCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icon,
                color: color,
                size: 32,
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).textTheme.bodySmall?.color?.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWeatherServiceCard({
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: color,
                size: 36,
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showWeatherDialog(String title, Future<dynamic> Function() fetchData) {
    showDialog(
      context: context,
      builder: (context) => WeatherDataDialog(
        title: title,
        fetchData: fetchData,
      ),
    );
  }
}

class WeatherDataDialog extends StatefulWidget {
  final String title;
  final Future<dynamic> Function() fetchData;

  const WeatherDataDialog({
    super.key,
    required this.title,
    required this.fetchData,
  });

  @override
  State<WeatherDataDialog> createState() => _WeatherDataDialogState();
}

class _WeatherDataDialogState extends State<WeatherDataDialog> {
  bool _isLoading = true;
  String? _errorMessage;
  dynamic _data;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final data = await widget.fetchData();
      setState(() {
        _data = data;
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
    return AlertDialog(
      title: Text(widget.title),
      content: SizedBox(
        width: double.maxFinite,
        height: 300,
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : _errorMessage != null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Error: $_errorMessage'),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _loadData,
                        child: const Text('Retry'),
                      ),
                    ],
                  )
                : _data != null
                    ? SingleChildScrollView(
                        child: Text(
                          _data.toString(),
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      )
                    : const Text('No data available'),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Close'),
        ),
      ],
    );
  }
}
