import 'package:api_client/api_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_stack/core/utils/service_locator.dart';
import 'package:flutter_stack/features/weather/data/weather_repository.dart';
import 'package:latlong2/latlong.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherMapScreen extends StatefulWidget {
  const WeatherMapScreen({super.key});

  @override
  State<WeatherMapScreen> createState() => _WeatherMapScreenState();
}

class _WeatherMapScreenState extends State<WeatherMapScreen> {
  final WeatherRepository _weatherRepository = ServiceLocator.weatherRepository;
  final MapController _mapController = MapController();
  
  bool _isLoading = false;
  String? _errorMessage;
  WeatherResponse? _weatherData;
  AirTemperatureResponse? _temperatureData;
  List<Marker> _markers = [];
  List<Map<String, dynamic>>? _areaMetadata;
  
  // Singapore bounds for better map experience
  static const LatLng singaporeCenter = LatLng(1.3521, 103.8198);
  static const double initialZoom = 11.0;
  
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
      // Load multiple weather data sources
      final futures = await Future.wait([
        _weatherRepository.getWeatherData(),
        _weatherRepository.getAirTemperature(),
      ]);
      
      final weatherData = futures[0] as WeatherResponse;
      final temperatureData = futures[1] as AirTemperatureResponse;
      
      setState(() {
        _weatherData = weatherData;
        _temperatureData = temperatureData;
        _buildMarkers();
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
  
  void _buildMarkers() {
    final markers = <Marker>[];
    
    // Add weather area markers from forecast data
    if (_weatherData?.data != null) {
      final weatherItems = _getWeatherItems();
      final areaMetadata = _getAreaMetadata();
      
      if (weatherItems != null && weatherItems.isNotEmpty && areaMetadata != null) {
        final forecasts = weatherItems.first['forecasts'] as List<dynamic>?;
        
        if (forecasts != null) {
          for (final forecast in forecasts) {
            final forecastMap = forecast as Map<String, dynamic>;
            final areaName = forecastMap['area']?.toString();
            final forecastText = forecastMap['forecast']?.toString();
            
            // Find matching area metadata
            final metadata = areaMetadata.where((area) => 
              area['name']?.toString() == areaName
            ).firstOrNull;
            
            if (metadata != null) {
              final labelLocation = metadata['label_location'] as Map<String, dynamic>?;
              if (labelLocation != null) {
                final lat = labelLocation['latitude'] as num?;
                final lng = labelLocation['longitude'] as num?;
                
                if (lat != null && lng != null) {
                  markers.add(_createWeatherMarker(
                    LatLng(lat.toDouble(), lng.toDouble()),
                    areaName ?? 'Unknown',
                    forecastText ?? 'No forecast',
                    _getWeatherIcon(forecastText),
                  ));
                }
              }
            }
          }
        }
      }
    }
    
    // Add temperature station markers
    if (_temperatureData?.data != null) {
      final stations = _temperatureData!.data!.stations;
      final readings = _temperatureData!.data!.readings;
      
      for (final station in stations) {
        final location = station.location;
        final lat = location['latitude'] as num?;
        final lng = location['longitude'] as num?;
        
        if (lat != null && lng != null) {
          // Find latest reading for this station
          String temperature = 'N/A';
          for (final reading in readings) {
            for (final dataPoint in reading.data) {
              if (dataPoint.stationId == station.id) {
                temperature = '${dataPoint.value.toStringAsFixed(1)}°C';
                break;
              }
            }
          }
          
          markers.add(_createTemperatureMarker(
            LatLng(lat.toDouble(), lng.toDouble()),
            station.name,
            temperature,
          ));
        }
      }
    }
    
    setState(() {
      _markers = markers;
    });
  }
  
  Marker _createWeatherMarker(LatLng position, String areaName, String forecast, IconData icon) {
    return Marker(
      point: position,
      width: 120,
      height: 80,
      child: GestureDetector(
        onTap: () => _showWeatherInfo(areaName, forecast),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.9),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 24,
              ),
            ),
            const SizedBox(height: 2),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                areaName,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Marker _createTemperatureMarker(LatLng position, String stationName, String temperature) {
    return Marker(
      point: position,
      width: 80,
      height: 60,
      child: GestureDetector(
        onTap: () => _showTemperatureInfo(stationName, temperature),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.9),
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Icon(
                WeatherIcons.thermometer,
                color: Colors.white,
                size: 16,
              ),
            ),
            const SizedBox(height: 2),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 1),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(3),
              ),
              child: Text(
                temperature,
                style: const TextStyle(
                  fontSize: 8,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  IconData _getWeatherIcon(String? forecast) {
    if (forecast == null) return WeatherIcons.day_sunny;
    
    final lowerForecast = forecast.toLowerCase();
    if (lowerForecast.contains('rain') || lowerForecast.contains('shower')) {
      return WeatherIcons.rain;
    } else if (lowerForecast.contains('cloudy')) {
      return WeatherIcons.cloudy;
    } else if (lowerForecast.contains('thunderstorm')) {
      return WeatherIcons.thunderstorm;
    } else if (lowerForecast.contains('clear') || lowerForecast.contains('sunny')) {
      return WeatherIcons.day_sunny;
    } else if (lowerForecast.contains('partly')) {
      return WeatherIcons.day_cloudy;
    }
    return WeatherIcons.day_sunny;
  }
  
  void _showWeatherInfo(String areaName, String forecast) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(areaName),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              _getWeatherIcon(forecast),
              size: 48,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(height: 16),
            Text(
              forecast,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
  
  void _showTemperatureInfo(String stationName, String temperature) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(stationName),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              WeatherIcons.thermometer,
              size: 48,
              color: Colors.red,
            ),
            const SizedBox(height: 16),
            Text(
              temperature,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
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
  
  List<Map<String, dynamic>>? _getAreaMetadata() {
    if (_weatherData?.data == null) return null;
    
    final areaMetadataJson = _weatherData!.data!['area_metadata'];
    if (areaMetadataJson == null) return null;
    
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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Map'),
        elevation: 0,
        backgroundColor: colorScheme.surface,
        actions: [
          if (!_isLoading)
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: _loadWeatherData,
            ),
        ],
      ),
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: singaporeCenter,
              initialZoom: initialZoom,
              minZoom: 9.0,
              maxZoom: 16.0,
              // Keep map focused on Singapore
              cameraConstraint: CameraConstraint.contain(
                bounds: LatLngBounds(
                  const LatLng(1.16, 103.6),
                  const LatLng(1.48, 104.1),
                ),
              ),
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.flutter_stack',
                maxZoom: 19,
              ),
              MarkerLayer(
                markers: _markers,
              ),
            ],
          ),
          
          // Loading overlay
          if (_isLoading)
            Container(
              color: Colors.black.withOpacity(0.3),
              child: const Center(
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 16),
                        Text('Loading weather data...'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          
          // Error message
          if (_errorMessage != null && !_isLoading)
            Positioned(
              top: 16,
              left: 16,
              right: 16,
              child: Card(
                color: Colors.red.withOpacity(0.9),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      const Icon(Icons.error, color: Colors.white),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Error: $_errorMessage',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close, color: Colors.white),
                        onPressed: () => setState(() => _errorMessage = null),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          
          // Legend
          Positioned(
            bottom: 16,
            left: 16,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Legend',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Icon(
                            WeatherIcons.day_sunny,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text('Weather Areas'),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.red.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Icon(
                            WeatherIcons.thermometer,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text('Temperature Stations'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _mapController.move(singaporeCenter, initialZoom);
        },
        tooltip: 'Center on Singapore',
        child: const Icon(Icons.my_location),
      ),
    );
  }
}
