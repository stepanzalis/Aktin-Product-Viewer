import 'package:aktin_product_viewer/config/di/injectable_feature.dart';
import 'package:get_it/get_it.dart';

import '../../config/feature.dart';
import 'config/di/products_injection.dart';

class ProductsFeature extends Feature {
  const ProductsFeature();

  @override
  InjectableFeature getInjectable(GetIt locator) => ProductsInjection(locator);
}
