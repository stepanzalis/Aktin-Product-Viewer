import 'package:flutter/material.dart';

/// Initial page for the products list feature
class ProductsListPage extends StatelessWidget {
  const ProductsListPage({super.key});

  static const String routeName = 'ProductsListPage';
  static const String routePath = '/products_list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products List'),
      ),
      body: const Placeholder(),
    );
  }
}
