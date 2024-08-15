import '../../../../config/di/injectable_feature.dart';
import '../../../../config/network/api/api.dart';

class CoreInjection extends InjectableFeature {
  CoreInjection(super.locator);

  @override
  void register() {
    locator.registerLazySingleton<ApiClient>(() => ApiClient.initialize(locator.get<ApiConfig>()));
  }
}
