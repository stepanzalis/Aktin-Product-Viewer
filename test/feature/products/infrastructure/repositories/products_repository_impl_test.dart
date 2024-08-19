import 'package:aktin_product_viewer/feature/core/infrastructure/local_sources/app_database.dart';
import 'package:aktin_product_viewer/feature/products/domain/product_entity.dart';
import 'package:aktin_product_viewer/feature/products/infrastructure/dto/product_dto.dart';
import 'package:aktin_product_viewer/feature/products/infrastructure/repositories/products_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/helpers.dart';

void main() {
  late ProductsRepositoryImpl repository;
  late MockProductsApi mockProductsApi;
  late MockProductsDao mockProductsDao;

  setUp(() {
    mockProductsApi = MockProductsApi();
    mockProductsDao = MockProductsDao();
    repository = ProductsRepositoryImpl(
      productsApi: mockProductsApi,
      productsDao: mockProductsDao,
    );

    registerFallbackValue(const ProductEntryData(
      id: 1,
      title: 'Test Product',
      price: 99.99,
      description: 'A test product',
      category: 'test category',
      image: 'http://example.com/image.jpg',
      rate: 4.5,
      rateCount: 100,
    ));
  });

  group('saveProducts', () {
    test('should fetch products from the API and save them in the local cache', () async {
      // arrange
      final productDtos = [
        ProductDto(
          id: 1,
          title: 'Test Product',
          price: 99.99,
          description: 'A test product',
          category: 'test category',
          image: 'http://example.com/image.jpg',
          rating: RatingDto(rate: 4.5, count: 100),
        ),
      ];

      when(() => mockProductsApi.fetchProducts()).thenAnswer((_) async => productDtos);
      when(() => mockProductsDao.upsertProducts(any())).thenAnswer((_) async => {});

      // act
      await repository.saveProducts();

      // assert
      verify(() => mockProductsApi.fetchProducts()).called(1);
      verify(() => mockProductsDao.upsertProducts(any())).called(1);
    });

    group('watchProducts', () {
      test('should return a stream of product entities from the DAO', () {
        // arrange
        final productEntryDataList = [
          const ProductEntryData(
            id: 1,
            title: 'Test Product',
            price: 99.99,
            description: 'A test product',
            category: 'test category',
            image: 'http://example.com/image.jpg',
            rate: 4.5,
            rateCount: 100,
          ),
        ];

        when(() => mockProductsDao.products()).thenAnswer((_) => Stream.value(productEntryDataList));

        // act
        final result = repository.watchProducts();

        // assert
        expectLater(
          result,
          emits([
            isA<ProductEntity>().having((p) => p.id, 'id', 1),
          ]),
        );
      });
    });
  });
}
