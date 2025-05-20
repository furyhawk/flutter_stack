/// Configuration class for the app
class AppConfig {
  // Base URL for the API
  static const String apiBaseUrl = 'http://localhost:8000';
  // static const String apiBaseUrl = 'https://service.furyhawk.lol';
  
  // API endpoints
  static const String loginEndpoint = '/login';
  static const String usersEndpoint = '/users';
  static const String itemsEndpoint = '/items';
  static const String weatherEndpoint = '/weather';
  
  // Storage keys
  static const String authTokenKey = 'auth_token';
  static const String userDataKey = 'user_data';
}
