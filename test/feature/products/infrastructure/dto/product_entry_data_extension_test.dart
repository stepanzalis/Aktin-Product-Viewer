import 'package:aktin_product_viewer/feature/core/infrastructure/local_sources/app_database.dart';
import 'package:aktin_product_viewer/feature/products/infrastructure/dto/product_entry_data_extension.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ProductEntryDataExtension', () {
    test(
      'toEntity should create a new ProductEntity instance from a ProductEntryData',
      () {
        // arrange
        const localDataSource = ProductEntryData(
          id: 1,
          title: '',
          price: 1.0,
          description: 'description',
          category: 'category',
          image: 'image',
          rate: 1.0,
          rateCount: 1,
        );

        // act
        final entity = localDataSource.toEntity();

        // assert
        expect(entity.id, localDataSource.id);
        expect(entity.category, localDataSource.category);
        expect(entity.title, localDataSource.title);
        expect(entity.price, localDataSource.price);
        expect(entity.description, localDataSource.description);
        expect(entity.imageUrl, localDataSource.image);
        expect(entity.ratingCount, localDataSource.rateCount);
        expect(entity.ratingValue, localDataSource.rate);
      },
    );
  });
}
