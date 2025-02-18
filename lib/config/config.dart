import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  static String get cmsApiUrl => dotenv.env['CMS_API_URL'] ?? '';
  static String get cmsApiKey => dotenv.env['CMS_API_KEY'] ?? '';

  Future<void> loadConfig(String environment) async {
  
    print('Current environment: $environment');
    final String envFile =
        'lib/config/env/.env.$environment';
    print('Current directory: $envFile');

    try {
      await dotenv.load(fileName: envFile);
    } catch (e) {
      print('Error loading env file: $e');
    }
  }
}
