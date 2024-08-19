import 'dart:io';

import 'package:aktin_product_viewer/feature/products/domain/product_entity.dart';
import 'package:aktin_product_viewer/feature/products/presentation/pages/products_detail_page.dart';
import 'package:aktin_product_viewer/feature/products/presentation/widgets/detail/product_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../../../../helpers/patrol_extension.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late ProductEntity product;

  setUpAll(() {
    HttpOverrides.global = null;

    product = ProductEntity.mock();
  });

  Widget prepareWidget() => ProductsDetailPage(extra: ProductDetailPageExtra(product));

  group('ProductsDetailPage', () {
    test(
      'page props are passed correctly to a page',
      () {
        // arrange
        final product = ProductEntity.mock();

        final extra = ProductDetailPageExtra(product);

        // act

        // assert
        expect(extra.product, product);
        expect(extra.props, [product]);
      },
    );

    patrolWidgetTest(
      'has correct parts',
      ($) async {
        // arrange
        await $.pumpApp(prepareWidget());

        // act

        // assert
        expect($(AppBar), findsOne);
        expect($(ProductDetailView), findsOne);
        expect($(FloatingActionButton), findsOne);
      },
    );
  });
}
