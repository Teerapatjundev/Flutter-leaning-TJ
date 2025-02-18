import 'package:dio/dio.dart';

class DioErrorHandler {
  /// ✅ จัดการ Error จาก Dio และคืนค่าเป็น `List<AssetModel>` ว่าง
  static List<T> handleError<T>(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
        print("⏳ Connection Timeout: Please check your internet connection.");
        break;
      case DioExceptionType.badResponse:
        print("🚨 Server Error (${e.response?.statusCode}): ${e.response?.data}");
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
}
