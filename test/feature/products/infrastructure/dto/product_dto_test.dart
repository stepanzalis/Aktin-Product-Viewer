import 'package:aktin_product_viewer/feature/products/infrastructure/dto/product_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ProductDto', () {
    test('fromJson creates a valid ProductDto object', () {
      // arrange
      final json = {
        'id': 1,
        'title': 'Sample Product',
        'price': 99,
        'description': 'This is a sample product description.',
        'category': 'Electronics',
        'image': 'https://example.com/image.jpg',
        'rating': {'rate': 4, 'count': 100},
      };

      // act
      final product = ProductDto.fromJson(json);

      // assert
      expect(product.id, 1);
      expect(product.title, 'Sample Product');
      expect(product.price, 99.0);
      expect(product.description, 'This is a sample product description.');
      expect(product.category, 'Electronics');
      expect(product.image, 'https://example.com/image.jpg');
      expect(product.rating.rate, 4.0);
      expect(product.rating.count, 100);
    });

    test('fromJson correctly handles double price and rate', () {
      // arrange
      final json = {
        'id': 2,
        'title': 'Another Product',
        'price': 149.99,
        'description': 'Another sample product description.',
        'category': 'Books',
        'image': 'https://example.com/another_image.jpg',
        'rating': {
          'rate': 4.5,
          'count': 50,
        },
      };

      // act
      final product = ProductDto.fromJson(json);

      // assert
      expect(product.id, 2);
      expect(product.title, 'Another Product');
      expect(product.price, 149.99);
      expect(product.description, 'Another sample product description.');
      expect(product.category, 'Books');
      expect(product.image, 'https://example.com/another_image.jpg');
      expect(product.rating.rate, 4.5);
      expect(product.rating.count, 50);
    });
  });

  group('RatingDto', () {
    test('fromJson creates a valid RatingDto object', () {
      // arrange
      final json = {
        'rate': 3.5,
        'count': 200,
      };

      // act
      final rating = RatingDto.fromJson(json);

      // assert
      expect(rating.rate, 3.5);
      expect(rating.count, 200);
    });

    test('fromJson converts int rate to double', () {
      // arrange
      final json = {
        'rate': 4,
        'count': 150,
      };

      // act
      final rating = RatingDto.fromJson(json);

      // assert
      expect(rating.rate, 4.0);
      expect(rating.count, 150);
    });
  });
}
