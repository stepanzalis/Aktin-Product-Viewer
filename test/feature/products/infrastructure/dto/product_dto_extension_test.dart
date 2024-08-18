import 'package:aktin_product_viewer/feature/products/domain/product_entity.dart';
import 'package:aktin_product_viewer/feature/products/infrastructure/dto/product_dto_extension.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ProductDtoExtension', () {
    test(
      'fromEntity should create a new ProductDto instance from a ProductEntity',
      () {
        // arrange
        final entity = ProductEntity.mock();

        // act
        final dto = ProductDtoExtension.fromEntity(entity);

        // assert
        expect(entity.id, dto.id);
        expect(entity.category, dto.category);
        expect(entity.title, dto.title);
        expect(entity.price, dto.price);
        expect(entity.description, dto.description);
        expect(entity.imageUrl, dto.image);
        expect(entity.ratingCount, dto.rating.count);
        expect(entity.ratingValue, dto.rating.rate);
      },
    );

    test(
      'toLocalDataSource should create a new ProductEntryData instance from a ProductDto',
      () {
        // arrange
        final dto = ProductDtoExtension.fromEntity(ProductEntity.mock());

        // act
        final localDataSource = dto.toLocalDataSource();

        // assert
        expect(localDataSource.id, dto.id);
        expect(localDataSource.category, dto.category);
        expect(localDataSource.title, dto.title);
        expect(localDataSource.price, dto.price);
        expect(localDataSource.description, dto.description);
        expect(localDataSource.image, dto.image);
        expect(localDataSource.rateCount, dto.rating.count);
        expect(localDataSource.rate, dto.rating.rate);
      },
    );

    test(
      'toEntity should create a new ProductEntity instance from a ProductDto',
      () {
        // arrange
        final dto = ProductDtoExtension.fromEntity(ProductEntity.mock());

        // act
        final entity = dto.toEntity();

        // assert
        expect(entity.id, dto.id);
        expect(entity.category, dto.category);
        expect(entity.title, dto.title);
        expect(entity.price, dto.price);
        expect(entity.description, dto.description);
        expect(entity.imageUrl, dto.image);
        expect(entity.ratingCount, dto.rating.count);
        expect(entity.ratingValue, dto.rating.rate);
      },
    );
  });
}
