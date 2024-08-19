// coverage:ignore-file

import 'package:flutter/material.dart';

import 'config/router/router.dart';

final scaffoldGlobalKey = GlobalKey<ScaffoldMessengerState>();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      scaffoldMessengerKey: scaffoldGlobalKey,
      routerConfig: router,
      onGenerateTitle: (context) => "Aktin Products App",
      debugShowCheckedModeBanner: false,
      scrollBehavior: const MaterialScrollBehavior(),
      builder: (context, child) => child ?? const SizedBox(),
    );
  }
}
