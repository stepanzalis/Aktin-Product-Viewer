import 'package:aktin_product_viewer/feature/products/domain/product_entity.dart';
import 'package:flutter/material.dart';

/// Detail page for the products list feature
class ProductsDetailPage extends StatelessWidget {
  const ProductsDetailPage({required this.extra, super.key});

  final ProductDetailPageExtra extra;

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

final class ProductDetailPageExtra {
  final ProductEntity product;

  const ProductDetailPageExtra(this.product);
}
