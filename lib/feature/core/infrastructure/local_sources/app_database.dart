import 'package:aktin_product_viewer/feature/products/infrastructure/local_sources/products_dao.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [ProductEntry], daos: [ProductsDao])
class AppDatabase extends _$AppDatabase {
  static const kDatabaseName = 'product_db';

  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: kDatabaseName);
  }
}

/// Table for storing products
class ProductEntry extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  RealColumn get price => real()();
  TextColumn get description => text()();
  TextColumn get category => text()();
  TextColumn get image => text()();
  RealColumn get rate => real()();
  IntColumn get rateCount => integer()();
}
