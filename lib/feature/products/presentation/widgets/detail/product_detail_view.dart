import 'package:aktin_product_viewer/feature/products/domain/product_entity.dart';
import 'package:aktin_product_viewer/feature/products/presentation/extensions/price_extension.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// Detail view for the product
///
/// This widget displays the details of a product
class ProductDetailView extends StatelessWidget {
  const ProductDetailView({required this.product, super.key});

  /// Product to display
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ProductImage(product: product),
          const SizedBox(height: 24),
          _ProductTitle(product: product),
          const SizedBox(height: 16),
          _ProductDescription(product: product),
          const SizedBox(height: 24),
          _ProductPrice(product: product),
        ],
      ),
    );
  }
}

class _ProductImage extends StatelessWidget {
  const _ProductImage({required this.product});

  final ProductEntity product;

  final _imageHeight = 250.0;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: product.imageUrl,
      width: double.infinity,
      height: _imageHeight,
      placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => const Icon(
        Icons.error,
        color: Colors.red,
        size: 50,
      ),
    );
  }
}

class _ProductTitle extends StatelessWidget {
  const _ProductTitle({required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Text(
      product.title,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class _ProductDescription extends StatelessWidget {
  const _ProductDescription({required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Text(
      product.description,
      style: const TextStyle(
        fontSize: 16,
        color: Colors.grey,
      ),
    );
  }
}

class _ProductPrice extends StatelessWidget {
  const _ProductPrice({required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Text(
      product.price.formatCurrency(),
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
