import 'package:aktin_product_viewer/feature/products/domain/product_entity.dart';
import 'package:aktin_product_viewer/feature/products/presentation/widgets/detail/product_detail_view.dart';
import 'package:flutter/material.dart';

/// Detail page for the products list feature
class ProductsDetailPage extends StatelessWidget {
  const ProductsDetailPage({required this.extra, super.key});

  /// Extra data for the detail page
  final ProductDetailPageExtra extra;

  static const String routeName = 'ProductsDetailPage';
  static const String routePath = 'products_detail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          extra.product.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        automaticallyImplyLeading: true,
      ),
      body: ProductDetailView(product: extra.product),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.shopping_cart),
        onPressed: () {
          // Add to cart action or other relevant action
        },
      ),
    );
  }
}

/// Extra class for the products detail page
final class ProductDetailPageExtra {
  final ProductEntity product;

  const ProductDetailPageExtra(this.product);
}
