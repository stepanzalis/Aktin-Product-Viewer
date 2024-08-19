import 'dart:io';

import 'package:aktin_product_viewer/feature/core/domain/exception/failure.dart';
import 'package:aktin_product_viewer/feature/products/application/bloc/products_list_bloc.dart';
import 'package:aktin_product_viewer/feature/products/domain/product_entity.dart';
import 'package:aktin_product_viewer/feature/products/presentation/pages/products_detail_page.dart';
import 'package:aktin_product_viewer/feature/products/presentation/pages/products_list_page.dart';
import 'package:aktin_product_viewer/feature/products/presentation/widgets/list/product_item.dart';
import 'package:aktin_product_viewer/feature/products/presentation/widgets/list/product_items_listview.dart';
import 'package:aktin_product_viewer/feature/products/presentation/widgets/list/product_list_error_view.dart';
import 'package:aktin_product_viewer/feature/products/presentation/widgets/list/product_list_loading_view.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:patrol/patrol.dart';

import '../../../../helpers/helpers.dart';
import '../../../../helpers/mocks.dart';
import '../../../../helpers/patrol_extension.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockGoRouter mockGoRouter;
  group('ProductsListPage', () {
    late ProductsListBloc productsListBloc;

    setUpAll(() {
      HttpOverrides.global = null;

      // Inject
      setupMockInjection();

      // Mock
      productsListBloc = MockProductsListBloc();

      mockGoRouter = MockGoRouter();
    });

    setUp(() {
      mockInLocator<ProductsListBloc>(productsListBloc);
    });

    Widget prepareWidget() => const MaterialApp(home: Scaffold(body: ProductsListPage()));

    group('in loading state', () {
      setUp(() {
        final state = ProductsListProgressState();

        whenListen(
          productsListBloc,
          Stream.fromIterable([state]),
          initialState: state,
        );

        when(() => productsListBloc.add(ProductsListLoadEvent())).thenAnswer((_) async {
          productsListBloc.emit(state);
        });
      });

      patrolWidgetTest(
        'has loading indicator in progress state',
        ($) async {
          // arrange
          await $.pumpApp(prepareWidget());

          // act
          productsListBloc.add(ProductsListLoadEvent());

          // assert
          expect($(ProductListLoadingView), findsOne);
        },
      );
    });

    group('in success state', () {
      final products = [ProductEntity.mock(), ProductEntity.mock()];
      late ProductsListLoadedState state;

      setUpAll(() {
        state = ProductsListLoadedState(products);

        when(() => productsListBloc.add(ProductsListLoadEvent())).thenAnswer((_) async {
          productsListBloc.emit(state);
        });

        whenListen(
          productsListBloc,
          Stream.fromIterable([state]),
          initialState: state,
        );
      });

      patrolWidgetTest(
        'shows list of products with product items',
        ($) async {
          // arrange
          await $.pumpApp(prepareWidget());

          // act

          // assert
          expect($(ProductItemsListView), findsOne);
          expect($(ProductItemCard), findsExactly(products.length));
        },
      );

      patrolWidgetTest('navigates to [ProductsDetailPage]', ($) async {
        // arrange

        when(
          () => mockGoRouter.pushNamed(
            ProductsDetailPage.routeName,
            extra: any(named: 'extra'),
          ),
        ).thenAnswer(
          (_) => Future.value(null),
        );

        await $.pumpApp(
          prepareWidget(),
          mockRouter: mockGoRouter,
        );

        await $.pumpAndSettle();

        // act
        await $(ProductItemCard).tap();

        await $.pumpAndSettle();

        // assert
        verify(
          () => mockGoRouter.pushNamed(
            ProductsDetailPage.routeName,
            extra: any(named: 'extra'),
          ),
        ).called(1);

        verifyNoMoreInteractions(mockGoRouter);
      });
    });

    group('in failed state', () {
      const errorTitle = 'Error';

      setUp(() {
        final state = ProductsListFailureState(const DatabaseFailure(errorTitle));

        when(() => productsListBloc.add(ProductsListLoadEvent())).thenAnswer((_) async {
          productsListBloc.emit(state);
          return;
        });

        whenListen(
          productsListBloc,
          Stream.fromIterable([state]),
          initialState: state,
        );
      });

      patrolWidgetTest(
        'shows error widget',
        ($) async {
          // arrange
          await $.pumpApp(prepareWidget());

          // act

          // assert
          expect($(ProductListErrorView), findsOne);
          expect($(errorTitle), findsOne);
        },
      );
    });
  });
}
