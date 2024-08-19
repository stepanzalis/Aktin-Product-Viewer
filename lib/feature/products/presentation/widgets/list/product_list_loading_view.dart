import 'package:flutter/material.dart';

/// Loading view for the products list
class ProductListLoadingView extends StatelessWidget {
  const ProductListLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
