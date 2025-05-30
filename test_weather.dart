// Simple test to verify weather data parsing
import 'package:built_value/json_object.dart';

void main() {
  // Simulate the JSON response structure
  final jsonData = {
    'items': [
      {
        'update_timestamp': '2025-05-30T19:35:33+08:00',
        'timestamp': '2025-05-30T19:30:00+08:00',
        'valid_period': {
          'start': '2025-05-30T19:30:00+08:00',
          'end': '2025-05-30T21:30:00+08:00',
          'text': '7.30 pm to 9.30 pm'
        },
        'forecasts': [
          {'area': 'Ang Mo Kio', 'forecast': 'Partly Cloudy (Night)'},
          {'area': 'Bedok', 'forecast': 'Partly Cloudy (Night)'}
        ]
      }
    ],
    'area_metadata': [
      {
        'name': 'Ang Mo Kio',
        'label_location': {'latitude': 1.375, 'longitude': 103.839}
      }
    ]
  };

  // Test JsonObject conversion
  final itemsJsonObject = JsonObject(jsonData['items']);
  print('Items is list: ${itemsJsonObject.isList}');
  
  if (itemsJsonObject.isList) {
    final itemsList = itemsJsonObject.asList;
    print('Number of items: ${itemsList.length}');
    
    final firstItem = itemsList.first;
    if (firstItem is Map<String, dynamic>) {
      print('First item timestamp: ${firstItem['timestamp']}');
      final forecasts = firstItem['forecasts'];
      if (forecasts is List) {
        print('Number of forecasts: ${forecasts.length}');
      }
    }
  }
}
