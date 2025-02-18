import 'package:dio/dio.dart';
import 'package:my_flutter_app/core/models/products.dart';
import 'package:my_flutter_app/core/services/dio_error_handler.dart';
import 'package:my_flutter_app/core/services/dio_service.dart';

class ProductService {
  final Dio _dio = DioService().dio;
  final String apiUrl =
      '/api/product-asset/product-asset/e3c7728a-9364-4bad-a363-58f5f6dfde1f';

  Future<List<AssetModel>> fetchProductAssetCms() async {
    try {
      final response = await _dio.get(apiUrl);
      if (response.statusCode == 200) {
        if (response.data is Map<String, dynamic>) {
          final data = response.data["Data"]?["data"];

          if (data == null || data is! List) {
            return [];
          }

          return data
              .map((json) => AssetModel.fromMap(json as Map<String, dynamic>))
              .toList();
        } else {
          print(
            "❌ API Error: Unexpected response format: ${response.data.runtimeType}",
          );
          return [];
        }
      } else {
        print("⚠️ API Error: ${response.statusCode}");
        return [];
      }
    } on DioException catch (e) {
      return DioErrorHandler.handleError<AssetModel>(e);
    } catch (e) {
      print("❌ Unexpected Error: $e");
      return [];
    }
  }
}
