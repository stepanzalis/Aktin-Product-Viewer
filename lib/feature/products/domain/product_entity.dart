import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  const ProductEntity({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.imageUrl,
    required this.ratingCount,
    required this.ratingValue,
  });

  factory ProductEntity.mock() => const ProductEntity(
        id: 1,
        category: '',
        title: 'Title',
        price: 1,
        description: '',
        imageUrl: '',
        ratingCount: 1,
        ratingValue: 1,
      );

  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String imageUrl;
  final int ratingCount;
  final double ratingValue;

  @override
  List<Object?> get props => [
        id,
        title,
        price,
        description,
        category,
        imageUrl,
        ratingCount,
        ratingValue,
      ];
}
