import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

/// Bloc observer is used to log every error that occurs in cubit / bloc
class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    // TODO: Implement Crashlytics, Sentry, etc.
    super.onError(bloc, error, stackTrace);
  }
}
