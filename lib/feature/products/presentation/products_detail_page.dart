import 'package:flutter/material.dart';

/// Detail page for the products list feature
class ProductsDetailPage extends StatelessWidget {
  const ProductsDetailPage({super.key});

  static const String routeName = 'ProductsDetailPage';
  static const String routePath = 'products_detail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products Detail'),
        automaticallyImplyLeading: true,
      ),
      body: const Placeholder(),
    );
  }
}
