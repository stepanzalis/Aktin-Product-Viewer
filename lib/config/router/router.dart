import 'package:aktin_product_viewer/feature/core/config/router/core_router.dart';
import 'package:aktin_product_viewer/feature/products/config/router/products_router.dart';
import 'package:aktin_product_viewer/feature/products/presentation/products_list_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../feature/core/presentation/pages/error_page.dart';
import '../constants/constants.dart';

part 'router.extra.dart';
part 'router.observer.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  observers: navigationObservers,
  routes: [
    ...coreRouter,
    ...productsRouter,
  ],
  initialLocation: ProductsListPage.routePath,
  debugLogDiagnostics: kDebugMode,
  restorationScopeId: kRestorationScopeIdMain,
  errorBuilder: (context, state) {
    return ErrorPage(key: state.pageKey);
  },
);
