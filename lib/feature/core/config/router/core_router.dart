import 'package:aktin_product_viewer/feature/core/presentation/pages/error_page.dart';
import 'package:go_router/go_router.dart';

List<GoRoute> coreRouter = [
  GoRoute(
    path: ErrorPage.routePath,
    name: ErrorPage.routeName,
    builder: (context, state) => ErrorPage(key: state.pageKey),
  ),
];
