import 'package:flutter_stack/core/api/api_service.dart';
import 'package:flutter_stack/core/api/config.dart';
import 'package:flutter_stack/features/auth/data/auth_repository.dart';
import 'package:flutter_stack/features/items/data/items_repository.dart';
import 'package:flutter_stack/features/profile/data/profile_repository.dart';
import 'package:flutter_stack/features/weather/data/weather_repository.dart';

/// Service locator class for dependency injection
class ServiceLocator {
  // Services
  static final ApiService apiService = ApiService(
    baseUrl: AppConfig.apiBaseUrl,
  );
  
  // Repositories
  static final AuthRepository authRepository = AuthRepository(apiService);
  static final ItemsRepository itemsRepository = ItemsRepository(apiService);
  static final ProfileRepository profileRepository = ProfileRepository(apiService);
  static final WeatherRepository weatherRepository = WeatherRepository(apiService);
  
  // Initialize all dependencies
  static void init() {
    // Add any initialization logic if needed
  }
}
