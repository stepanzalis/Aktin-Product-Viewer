import 'package:aktin_product_viewer/feature/products/application/bloc/products_list_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ProductsListState', () {
    test('should be a subclass of Equatable', () {
      // assert
      expect(ProductsListInitialState(), isA<Equatable>());
      expect(ProductsListProgressState(), isA<Equatable>());
      expect(ProductsListLoadedState(const []), isA<Equatable>());
      expect(ProductsListFailureState(''), isA<Equatable>());
    });

    test(
      'props should return correct for ProductsListLoadedState',
      () {
        // arrange
        final state = ProductsListLoadedState(const []);

        // act

        // assert
        expect(state.props, [state.products]);
      },
    );
  });
}
