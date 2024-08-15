// coverage:ignore-file

import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/bloc/bloc_observer.dart';

/// This function is used to bootstrap the app with the provided initialization and builder functions.
///
/// The purpose of this function is to ensure that the app is properly initialized and that any errors
/// that occur during initialization are caught and handled properly.
Future<void> bootstrap(
  FutureOr<void> Function() initialization,
  FutureOr<Widget> Function() builder,
) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
    // TODO: Implement Crashlytics, Sentry, etc.
  };
  PlatformDispatcher.instance.onError = (error, stackTrace) {
    log(error.toString(), stackTrace: stackTrace);
    // TODO: Implement Crashlytics, Sentry, etc.
    return true;
  };

  /// [Equatable] will stringify objects used for in domain layer.
  EquatableConfig.stringify = true;

  /// [Bloc.observer] is used for logging all bloc transitions.
  Bloc.observer = const AppBlocObserver();

  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await initialization();

      /// Run the app with the provided builder.
      runApp(await builder());
    },
    (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      // TODO: Implement Crashlytics, Sentry, etc.
    },
  );
}
