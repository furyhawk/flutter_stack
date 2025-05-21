import 'package:flutter/foundation.dart';

enum Environment { dev, staging, prod }

class AppConfig {
  final String apiBaseUrl;
  final Environment environment;

  AppConfig({
    required this.apiBaseUrl,
    required this.environment,
  });

  static AppConfig get instance => _instance;
  static late AppConfig _instance;

  static void initialize({
    required Environment environment,
  }) {
    final apiBaseUrl = _getApiBaseUrl(environment);
    
    _instance = AppConfig(
      apiBaseUrl: apiBaseUrl,
      environment: environment,
    );
    
    if (kDebugMode) {
      print('AppConfig initialized: $environment, API: $apiBaseUrl');
    }
  }

  static String _getApiBaseUrl(Environment environment) {
    switch (environment) {
      case Environment.dev:
        return 'http://localhost:8080';
      case Environment.staging:
        return 'https://service.furyhawk.lol';
      case Environment.prod:
        return 'https://service.furyhawk.lol';
    }
  }

  bool get isDevelopment => environment == Environment.dev;
  bool get isStaging => environment == Environment.staging;
  bool get isProduction => environment == Environment.prod;
}
