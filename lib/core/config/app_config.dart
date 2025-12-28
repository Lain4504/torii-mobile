/// Application configuration
class AppConfig {
  // API Configuration
  // Backend Gateway runs on port 8080
  static const String baseUrl = 'http://localhost:8080';
  // For Android Emulator: 'http://10.0.2.2:8080'
  // For iOS Simulator: 'http://localhost:8080'
  // For physical device: 'http://[YOUR_COMPUTER_IP]:8080'
  // For production: 'https://api.torii-nihongo.com'
  
  // API Endpoints
  static const String authRegisterEndpoint = '/auth/register';
  static const String authLoginEndpoint = '/auth/login';
  static const String authLogoutEndpoint = '/auth/logout';
  static const String authProfileEndpoint = '/auth/profile';
  
  // Timeout settings
  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
  
  // Storage keys
  static const String tokenKey = 'auth_token';
  static const String userKey = 'user_data';
  
  // App info
  static const String appName = 'Torii Nihongo';
  static const String appVersion = '1.0.0';
}

