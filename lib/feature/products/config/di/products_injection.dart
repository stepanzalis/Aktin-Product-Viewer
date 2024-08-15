import '../../../../config/di/injectable_feature.dart';

class ProductsInjection extends InjectableFeature {
  ProductsInjection(super.locator);

  @override
  void register() {
    locator.registerFactory<String>(() => "Products");
  }
}
