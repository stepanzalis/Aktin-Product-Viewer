import 'package:aktin_product_viewer/config/di/injectable_feature.dart';
import 'package:get_it/get_it.dart';

/// Base class for a feature
///
/// A feature is a collection of services, repositories, and other classes that
/// are related to a specific part of the application.
///
/// Features are used to separate the application into smaller, more manageable
/// parts. This makes it easier to understand and maintain the codebase.
///
/// Every feature should be separated and independent from other features (except for the core feature).
abstract class Feature {
  const Feature();

  InjectableFeature getInjectable(GetIt locator);

  // Note: Here could be another getters like `getFakeInjectable` for hardcoded dependencies
  // Example: InjectableFeature getFakeInjectable(GetIt locator);

  void registerLocalSourceAdapters() {}
}
