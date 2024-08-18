//coverage:ignore-file
import 'package:aktin_product_viewer/config/network/api/api.dart';
import 'package:aktin_product_viewer/feature/products/application/bloc/products_list_bloc.dart';
import 'package:aktin_product_viewer/feature/products/infrastructure/local_sources/products_dao.dart';
import 'package:aktin_product_viewer/feature/products/infrastructure/remote_sources/products_api.dart';
import 'package:aktin_product_viewer/feature/products/infrastructure/repositories/products_repository.dart';
import 'package:aktin_product_viewer/feature/products/infrastructure/repositories/products_repository_impl.dart';

import '../../../../config/di/injectable_feature.dart';
import '../../../core/infrastructure/local_sources/app_database.dart';

class ProductsInjection extends InjectableFeature {
  ProductsInjection(super.locator);

  @override
  Future<void> preRegister() {
    locator.registerFactory<ProductsApi>(() => ProductsApi(locator.get<ApiClient>().dio));
    locator.registerSingleton<ProductsDao>(ProductsDao(locator.get<AppDatabase>()));
    return super.preRegister();
  }

  @override
  void register() {
    locator.registerFactory<ProductsRepository>(
      () => ProductsRepositoryImpl(
        productsApi: locator.get<ProductsApi>(),
        productsDao: locator.get<ProductsDao>(),
      ),
    );

    locator.registerFactory<ProductsListBloc>(
      () => ProductsListBloc(
        productsRepository: locator.get<ProductsRepository>(),
      ),
    );
  }
}
