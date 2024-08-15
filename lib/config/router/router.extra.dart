part of 'router.dart';

Map<Type, dynamic> _internalExtra = {};

class ExtraCacheObserver extends NavigatorObserver {
  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    _internalExtra.clear();
  }
}

extension GoRouterStateExtra on GoRouterState {
  /// Caching the extra data that is passed to the route.
  T cachedExtra<T extends Object>() {
    if (extra case final T parsedExtra) {
      _internalExtra[T] = parsedExtra;
      return parsedExtra;
    }
    return _internalExtra[T] as T;
  }

  T? maybeCachedExtra<T extends Object>() {
    if (extra == null && _internalExtra[T] != null) {
      return null;
    }
    return cachedExtra();
  }
}
