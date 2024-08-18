import 'package:aktin_product_viewer/feature/core/infrastructure/local_sources/app_database.dart';
import 'package:aktin_product_viewer/feature/products/domain/product_entity.dart';
import 'package:aktin_product_viewer/feature/products/infrastructure/dto/product_dto.dart';

extension ProductDtoExtension on ProductDto {
  ProductEntity toEntity() => ProductEntity(
        id: id,
        title: title,
        price: price,
        description: description,
        category: category,
        imageUrl: image,
        ratingCount: rating.count,
        ratingValue: rating.rate,
      );

  ProductEntryData toLocalDataSource() => ProductEntryData(
        id: id,
        title: title,
        price: price,
        description: description,
        category: category,
        image: image,
        rateCount: rating.count,
        rate: rating.rate,
      );

  static ProductDto fromEntity(ProductEntity entity) => ProductDto(
        id: entity.id,
        title: entity.title,
        price: entity.price,
        description: entity.description,
        category: entity.category,
        image: entity.imageUrl,
        rating: RatingDto(rate: entity.ratingValue, count: entity.ratingCount),
      );
}
