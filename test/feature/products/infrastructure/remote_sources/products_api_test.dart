import 'package:aktin_product_viewer/feature/products/infrastructure/dto/product_dto.dart';
import 'package:aktin_product_viewer/feature/products/infrastructure/remote_sources/products_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/helpers.dart';
import '../../../../helpers/mocks.dart';

void main() {
  late MockDio mockDio;
  late ProductsApi productsApi;

  setUp(() {
    mockDio = MockDio();
    productsApi = ProductsApi(mockDio);
  });

  group('ProductsApi', () {
    test('fetchProducts returns a list of ProductDto on success', () async {
      // arrange
      final mockResponseData = [
        {
          'id': 1,
          'title': 'Product 1',
          'price': 10.0,
          'description': 'Description of Product 1',
          'category': 'Category 1',
          'image': 'https://example.com/image1.jpg',
          'rating': {'rate': 4.5, 'count': 100},
        },
        {
          'id': 2,
          'title': 'Product 2',
          'price': 20.0,
          'description': 'Description of Product 2',
          'category': 'Category 2',
          'image': 'https://example.com/image2.jpg',
          'rating': {'rate': 4.0, 'count': 50},
        },
      ];

      final mockResponse = mockSuccessResponse(data: mockResponseData);

      when(
        () => mockDio.get(
          any(),
          cancelToken: any(named: 'cancelToken'),
        ),
      ).thenAnswer((_) async => mockResponse);

      // act
      final products = await productsApi.fetchProducts();

      // assert
      expect(products, isA<List<ProductDto>>());
      expect(products.length, 2);
      expect(products[0].id, 1);
      expect(products[0].title, 'Product 1');
      expect(products[1].id, 2);
      expect(products[1].title, 'Product 2');
    });

    test('fetchProducts throws DioException on failure', () async {
      // arrange
      when(
        () => mockDio.get(
          any(),
          cancelToken: any(named: 'cancelToken'),
        ),
      ).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: '/products'),
          type: DioExceptionType.badResponse,
        ),
      );

      // act
      final response = productsApi.fetchProducts();

      // assert
      expect(
        response,
        throwsA(isA<DioException>()),
      );
    });
  });
}
