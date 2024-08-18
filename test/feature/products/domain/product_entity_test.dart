import 'package:aktin_product_viewer/feature/products/domain/product_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ProductsEntity', () {
    test(
      'props should return correct values',
      () {
        // arrange
        final entity = ProductEntity.mock();

        // act

        // assert
        expect(entity.props, [
          entity.id,
          entity.title,
          entity.price,
          entity.description,
          entity.category,
          entity.imageUrl,
          entity.ratingCount,
          entity.ratingValue,
        ]);
      },
    );
  });
}
