import 'package:dio/dio.dart';
import 'package:my_flutter_app/config/config.dart';

class DioService {
  static final DioService _instance = DioService._internal();
  late Dio _dio;

  factory DioService() {
    return _instance;
  }

  DioService._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: Config.cmsApiUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "x-api-key": Config.cmsApiKey,
        },
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print("📤 API Request: ${options.method} ${options.path}");
          print("🔹 Headers: ${options.headers}");
          return handler.next(options);
        },
        onResponse: (response, handler) {
          print("✅ Response: ${response.data}");
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          print("❌ API Error: ${e.message}");
          return handler.next(e);
        },
      ),
    );
  }

  static List<T> handleError<T>(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
        print("⏳ Connection Timeout: Please check your internet connection.");
        break;
      case DioExceptionType.badResponse:
        print(
          "🚨 Server Error (${e.response?.statusCode}): ${e.response?.data}",
        );
        break;
      case DioExceptionType.cancel:
        print("⚠️ Request Cancelled");
        break;
      case DioExceptionType.unknown:
        print("❌ Unknown Error: ${e.message}");
        break;
      default:
        print("❌ Dio Error: ${e.message}");
    }
    return [];
  }

  Dio get dio => _dio;
}
