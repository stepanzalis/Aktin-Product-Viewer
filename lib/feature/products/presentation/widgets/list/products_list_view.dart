import 'package:aktin_product_viewer/feature/core/domain/exception/failure.dart';
import 'package:aktin_product_viewer/feature/products/application/bloc/products_list_bloc.dart';
import 'package:aktin_product_viewer/feature/products/presentation/widgets/list/product_items_listview.dart';
import 'package:aktin_product_viewer/feature/products/presentation/widgets/list/product_list_error_view.dart';
import 'package:aktin_product_viewer/feature/products/presentation/widgets/list/product_list_loading_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A wrapper for the products list view
///
/// This widget displays the products list view based on the state of the [ProductsListBloc]
class ProductsListView extends StatelessWidget {
  const ProductsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsListBloc, ProductsListState>(
      listener: (_, state) {
        if (state case final ProductsListFailureState state when state.failure is NoInternetFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.orange,
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(state.failure.title),
                  Text(state.failure.message),
                ],
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        return switch (state) {
          ProductsListInitialState() || ProductsListProgressState() => const ProductListLoadingView(),
          ProductsListLoadedState() => ProductItemsListView(products: state.products),
          ProductsListFailureState() when state.failure is DatabaseFailure => ProductListErrorView(
              title: state.failure.title,
              message: state.failure.message,
            ),
          _ => const SizedBox(),
        };
      },
    );
  }
}
