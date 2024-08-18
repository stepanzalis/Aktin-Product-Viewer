import 'package:aktin_product_viewer/feature/products/infrastructure/dto/product_dto.dart';
import 'package:dio/dio.dart';

class ProductsApi {
  final Dio _dio;

  const ProductsApi(this._dio);

  /// Get products from the API - https://fakestoreapi.com/products
  ///
  /// Returns a list of [ProductDto]
  /// Throws a [DioException] if an error occurs
  Future<List<ProductDto>> fetchProducts() async {
    try {
      final response = await _dio.get('/products');
      return List<ProductDto>.from(response.data.map((model) => ProductDto.fromJson(model)));
    } catch (error, stackTrace) {
      throw DioException(requestOptions: RequestOptions(path: '/products'), error: error, stackTrace: stackTrace);
    }
  }
}
