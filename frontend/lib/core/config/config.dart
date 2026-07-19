import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static String get appName => dotenv.get('APP_NAME', fallback: 'AI BOS');
  static String get appVersion => dotenv.get('APP_VERSION', fallback: '1.0.0');
  static String get apiBaseUrl => dotenv.get('API_BASE_URL', fallback: 'http://localhost:8000');
}
