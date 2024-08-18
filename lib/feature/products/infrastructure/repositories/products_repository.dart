import 'package:aktin_product_viewer/feature/products/domain/product_entity.dart';

abstract class ProductsRepository {
  Future<void> saveProducts();
  Stream<List<ProductEntity>> watchProducts();
}
