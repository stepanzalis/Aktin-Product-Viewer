import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension BuildContextExtension on BuildContext {
  /// Ensures that pop is done only when it is possible.
  void safePop<T extends Object?>([T? result]) {
    if (canPop()) {
      pop(result);
    }
  }
}
