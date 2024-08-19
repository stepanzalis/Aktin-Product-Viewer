import 'package:flutter/material.dart';

/// Error view for the products list
class ProductListErrorView extends StatelessWidget {
  const ProductListErrorView({required this.title, this.message, super.key});

  /// The title to display
  final String title;

  /// The error message to display
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title),
          const SizedBox(height: 16),
          Text(message ?? ""),
        ],
      ),
    );
  }
}
