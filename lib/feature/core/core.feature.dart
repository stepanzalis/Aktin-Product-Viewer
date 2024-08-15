import 'package:aktin_product_viewer/config/di/injectable_feature.dart';
import 'package:get_it/get_it.dart';

import '../../config/feature.dart';
import 'config/di/core_injection.dart';

class CoreFeature extends Feature {
  const CoreFeature();

  @override
  InjectableFeature getInjectable(GetIt locator) => CoreInjection(locator);
}
