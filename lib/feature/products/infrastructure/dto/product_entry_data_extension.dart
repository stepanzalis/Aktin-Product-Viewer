import 'package:aktin_product_viewer/feature/core/infrastructure/local_sources/app_database.dart';

import '../../domain/product_entity.dart';

extension ProductEntryDataExtension on ProductEntryData {
  ProductEntity toEntity() => ProductEntity(
        id: id,
        title: title,
        price: price,
        description: description,
        category: category,
        imageUrl: image,
        ratingCount: rateCount,
        ratingValue: rate,
      );
}
