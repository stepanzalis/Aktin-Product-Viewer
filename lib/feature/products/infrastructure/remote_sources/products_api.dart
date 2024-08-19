import 'package:aktin_product_viewer/feature/products/infrastructure/dto/product_dto.dart';
import 'package:dio/dio.dart';

class ProductsApi {
  final Dio _dio;

  const ProductsApi(this._dio);

  /// Get products from the API - https://fakestoreapi.com/products
  ///
  /// Returns a list of [ProductDto]
  /// Throws a [DioException] if an error occurs
  Future<List<ProductDto>> fetchProducts([CancelToken? cancelToken]) async {
    final response = await _dio.get('/products', cancelToken: cancelToken);
    return List<ProductDto>.from(response.data.map((model) => ProductDto.fromJson(model)));
  }
}
