import 'package:aktin_product_viewer/config/di/injection.dart';
import 'package:aktin_product_viewer/feature/products/application/bloc/products_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/list/products_list_view.dart';

/// Initial page for the products list feature
class ProductsListPage extends StatelessWidget {
  const ProductsListPage({super.key});

  static const String routeName = 'ProductsListPage';
  static const String routePath = '/products_list';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => locator.get<ProductsListBloc>()
        ..add(ProductsListLoadEvent())
        ..add(ListenToProductsEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Products List'),
        ),
        body: const ProductsListView(),
      ),
    );
  }
}
