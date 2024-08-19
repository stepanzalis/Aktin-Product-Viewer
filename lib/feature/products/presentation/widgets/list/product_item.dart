import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../domain/product_entity.dart';

/// A card for displaying a product item
///
/// This widget displays a card with the product image, title, description, and price
class ProductItemCard extends StatelessWidget {
  const ProductItemCard({
    required this.product,
    required this.onTap,
    super.key,
  });

  /// Product entity to display
  final ProductEntity product;

  /// Callback when the card is tapped
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ProductImage(imageUrl: product.imageUrl),
              const SizedBox(width: 16),
              Expanded(child: _ProductDetails(product: product)),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProductImage extends StatelessWidget {
  const _ProductImage({required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: 80,
        height: 80,
      ),
    );
  }
}

class _ProductDetails extends StatelessWidget {
  const _ProductDetails({required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _ProductTitle(title: product.title),
        const SizedBox(height: 8),
        _ProductDescription(description: product.description),
        const SizedBox(height: 8),
        _ProductPrice(price: product.price),
      ],
    );
  }
}

class _ProductTitle extends StatelessWidget {
  const _ProductTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class _ProductDescription extends StatelessWidget {
  const _ProductDescription({required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: const TextStyle(fontSize: 14, color: Colors.grey),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class _ProductPrice extends StatelessWidget {
  const _ProductPrice({required this.price});

  final double price;

  @override
  Widget build(BuildContext context) {
    return Text(
      "\$${price.toStringAsFixed(2)}",
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
