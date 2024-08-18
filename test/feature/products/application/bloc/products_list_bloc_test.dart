import 'package:aktin_product_viewer/feature/products/application/bloc/products_list_bloc.dart';
import 'package:aktin_product_viewer/feature/products/domain/product_entity.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/helpers.dart';

void main() {
  late MockProductsRepository mockProductsRepository;

  setUp(() {
    mockProductsRepository = MockProductsRepository();
  });

  blocTest<ProductsListBloc, ProductsListState>(
    'initial state is [ProductsListInitialState]',
    build: () => ProductsListBloc(productsRepository: mockProductsRepository),
    verify: (cubit) {
      expect(cubit.state, ProductsListInitialState());
    },
  );

  blocTest<ProductsListBloc, ProductsListState>(
    'emits [ProductsListProgressState, ProductsListFailureState] when an error occurs while loading products',
    setUp: () {
      when(() => mockProductsRepository.saveProducts()).thenThrow(Exception('Failed to load products'));
      when(() => mockProductsRepository.watchProducts()).thenAnswer(
        (_) => const Stream<List<ProductEntity>>.empty(),
      );
    },
    build: () => ProductsListBloc(productsRepository: mockProductsRepository),
    act: (bloc) => bloc.add(ProductsListLoadEvent()),
    expect: () => [
      ProductsListProgressState(),
      ProductsListFailureState('Exception: Failed to load products'),
    ],
  );

  blocTest<ProductsListBloc, ProductsListState>(
    'emits [ProductsListProgressState, ProductsListLoadedState] when products are loaded successfully',
    setUp: () {
      when(() => mockProductsRepository.saveProducts()).thenAnswer((_) async => {});
      when(() => mockProductsRepository.watchProducts()).thenAnswer(
        (_) => Stream.value([ProductEntity.mock()]),
      );
    },
    build: () => ProductsListBloc(productsRepository: mockProductsRepository),
    act: (bloc) => bloc.add(ProductsListLoadEvent()),
    expect: () => [
      ProductsListProgressState(),
      ProductsListLoadedState([ProductEntity.mock()]),
    ],
  );

  blocTest<ProductsListBloc, ProductsListState>(
    'emits [ProductsListProgressState, ProductsListLoadedState] with an empty list when no products are available',
    setUp: () {
      when(() => mockProductsRepository.saveProducts()).thenAnswer((_) async => {});
      when(() => mockProductsRepository.watchProducts()).thenAnswer(
        (_) => Stream.value([]),
      );
    },
    build: () => ProductsListBloc(productsRepository: mockProductsRepository),
    act: (bloc) => bloc.add(ProductsListLoadEvent()),
    expect: () => [
      ProductsListProgressState(),
      ProductsListLoadedState(const []),
    ],
  );
}
