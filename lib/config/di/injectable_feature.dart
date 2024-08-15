import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

abstract class InjectableFeature extends InjectableFeatureBase {
  InjectableFeature(super.locator);
}

/// Base definition of GetIt InjectableFeature
/// defines dependency on locator [GetIt]
@protected
abstract class InjectableFeatureBase {
  InjectableFeatureBase(this.locator);
  GetIt locator;

  /// PreRegistration
  /// Useful when you need to register a dependency before the main registration ([register])
  Future<void> preRegister() {
    return Future.value();
  }

  /// Standard dependency registration
  void register() {}

  /// Trigger directly after registration of [InjectableFeature] when [register] processed
  void postRegister() {}

  /// Unregister original classes and replace with another instance
  void dependencyOverride() {}
}
