import 'package:aktin_product_viewer/feature/products/domain/product_entity.dart';
import 'package:aktin_product_viewer/feature/products/presentation/pages/products_detail_page.dart';
import 'package:aktin_product_viewer/feature/products/presentation/widgets/list/product_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// A list view of product items
///
/// This widget displays a list of [ProductItemCard] based on the [products] list
class ProductItemsListView extends StatelessWidget {
  const ProductItemsListView({required this.products, super.key});

  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductItemCard(
          product: product,
          onTap: () {
            context.pushNamed(
              ProductsDetailPage.routeName,
              extra: ProductDetailPageExtra(product),
            );
          },
        );
      },
    );
  }
}
