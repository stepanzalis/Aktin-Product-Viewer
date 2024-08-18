import '../../../../config/di/injectable_feature.dart';
import '../../../../config/network/api/api.dart';
import '../../infrastructure/local_sources/app_database.dart';

class CoreInjection extends InjectableFeature {
  CoreInjection(super.locator);

  @override
  void register() {
    locator.registerLazySingleton<AppDatabase>(AppDatabase.new);
    locator.registerLazySingleton<ApiClient>(() => ApiClient.initialize(locator.get<ApiConfig>()));
  }
}
