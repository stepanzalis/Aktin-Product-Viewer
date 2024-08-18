// ignore_for_file: library_private_types_in_public_api

final class ProductDto {
  const ProductDto({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final RatingDto rating;

  factory ProductDto.fromJson(Map<String, dynamic> json) {
    return ProductDto(
      id: json['id'] as int,
      title: json['title'] as String,
      price: (json['price'] as num).toDouble(), //  fix int to double from API
      description: json['description'] as String,
      category: json['category'] as String,
      image: json['image'] as String,
      rating: RatingDto.fromJson(json['rating']),
    );
  }
}

final class RatingDto {
  double rate;
  int count;

  RatingDto({
    required this.rate,
    required this.count,
  });

  factory RatingDto.fromJson(Map<String, dynamic> json) {
    return RatingDto(
      rate: (json['rate'] as num).toDouble(), // fix int to double from API
      count: json['count'] as int,
    );
  }
}
