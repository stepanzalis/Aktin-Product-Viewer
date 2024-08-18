// coverage:ignore-file
import 'package:aktin_product_viewer/config/router/router.dart';
import 'package:aktin_product_viewer/feature/products/presentation/products_detail_page.dart';
import 'package:aktin_product_viewer/feature/products/presentation/products_list_page.dart';
import 'package:go_router/go_router.dart';

List<GoRoute> productsRouter = [
  GoRoute(
    path: ProductsListPage.routePath,
    name: ProductsListPage.routeName,
    builder: (context, state) => ProductsListPage(key: state.pageKey),
    routes: [
      GoRoute(
        path: ProductsDetailPage.routePath,
        name: ProductsDetailPage.routeName,
        builder: (context, state) {
          return ProductsDetailPage(
            extra: state.cachedExtra<ProductDetailPageExtra>(),
            key: state.pageKey,
          );
        },
      ),
    ],
  ),
];
