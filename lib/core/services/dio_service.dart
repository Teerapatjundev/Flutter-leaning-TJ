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

  Dio get dio => _dio;
}
