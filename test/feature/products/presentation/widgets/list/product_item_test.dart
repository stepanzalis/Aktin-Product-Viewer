import 'dart:io';

import 'package:aktin_product_viewer/feature/products/domain/product_entity.dart';
import 'package:aktin_product_viewer/feature/products/presentation/extensions/price_extension.dart';
import 'package:aktin_product_viewer/feature/products/presentation/widgets/list/product_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:patrol/patrol.dart';

import '../../../../../helpers/helpers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late ProductEntity product;
  late MockCallback mockCallback;

  setUpAll(() {
    HttpOverrides.global = null;

    product = ProductEntity.mock();
    mockCallback = MockCallback();
  });

  Widget prepareWidget() => MaterialApp(
        home: Scaffold(
          body: ProductItemCard(
            product: product,
            onTap: mockCallback.call,
          ),
        ),
      );

  group('ProductItemCard', () {
    patrolWidgetTest(
      'displays the correct product details',
      ($) async {
        // arrange
        await $.pumpWidget(prepareWidget());

        // act

        // assert
        expect($(product.title), findsOneWidget);
        expect($(product.description), findsOneWidget);
        expect($(product.price.formatCurrency()), findsOneWidget);
        expect($(CachedNetworkImage), findsOneWidget);
      },
    );

    patrolWidgetTest(
      'triggers onTap callback when tapped',
      ($) async {
        // arrange
        await $.pumpWidget(prepareWidget());

        // act
        await $(product.title).tap();
        await $.pumpAndSettle();

        // assert
        verify(() => mockCallback()).called(1);
      },
    );
  });
}
