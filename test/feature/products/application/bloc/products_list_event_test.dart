import 'package:aktin_product_viewer/feature/products/application/bloc/products_list_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ProductsListEvent', () {
    test('[ProductsListLoadEvent] should be a subclass of Equatable', () {
      // assert
      expect(ProductsListLoadEvent(), isA<Equatable>());
      expect(ListenToProductsEvent(), isA<Equatable>());
    });
  });
}
