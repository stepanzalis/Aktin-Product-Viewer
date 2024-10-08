import 'package:aktin_product_viewer/feature/core/infrastructure/local_sources/app_database.dart';
import 'package:drift/drift.dart';

part 'products_dao.g.dart';

@DriftAccessor(tables: [ProductEntry])
class ProductsDao extends DatabaseAccessor<AppDatabase> with _$ProductsDaoMixin {
  ProductsDao(super.db);

  /// Upsert a list of products
  Future<void> upsertProducts(List<ProductEntryData> products) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(productEntry, products);
    });
  }

  /// Stream of all products [ProductEntryData]
  ///
  /// This stream will automatically emit new items whenever the products table changes
  Stream<List<ProductEntryData>> products() {
    return select(productEntry).watch();
  }
}
