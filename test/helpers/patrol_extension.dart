import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:patrol_finders/patrol_finders.dart';

import 'helpers.dart';

extension PatrolTesterExtensions on PatrolTester {
  /// Wraps widget with `MaterialApp` and does `pumpWidget`.
  Future<void> pumpApp(
    Widget widget, {
    Duration? duration,
    EnginePhase phase = EnginePhase.sendSemanticsUpdate,
    Locale? forcedLocale,
    GoRouter? mockRouter,
    ThemeMode? themeMode,
  }) async {
    await pumpWidget(
      MaterialApp(
        locale: forcedLocale,
        themeMode: themeMode,
        home: InheritedGoRouter(
          goRouter: mockRouter ?? MockGoRouter(),
          child: widget,
        ),
      ),
      duration,
      phase,
    );
  }
}
