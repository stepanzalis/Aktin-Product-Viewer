import 'package:aktin_product_viewer/feature/products/domain/product_entity.dart';
import 'package:dio/dio.dart';

import '../../../core/domain/result.dart';

abstract class ProductsRepository {
  Future<Result<void>> saveProducts({CancelToken? cancelToken});
  Stream<List<ProductEntity>> watchProducts();
}
