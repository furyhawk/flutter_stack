/// Configuration class for the app
class AppConfig {
  static const String apiBaseUrl = 'https://api.example.com';
  
  // API endpoints
  static const String loginEndpoint = '/login';
  static const String usersEndpoint = '/users';
  static const String itemsEndpoint = '/items';
  static const String weatherEndpoint = '/weather';
  
  // Storage keys
  static const String authTokenKey = 'auth_token';
  static const String userDataKey = 'user_data';
}
