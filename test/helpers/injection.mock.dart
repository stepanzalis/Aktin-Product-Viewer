part of 'helpers.dart';

class MockGetIt extends Mock implements GetIt {}

class MockGoRouter extends Mock implements GoRouter {}

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class MockDio extends Mock implements Dio {}

class MockBuildContext extends Mock implements BuildContext {}

class MockCallback extends Mock {
  void call();
}

// Connectivity

class MockConnectivity extends Mock implements Connectivity {}

// Products

class MockProductsDao extends Mock implements ProductsDao {}

class MockProductsApi extends Mock implements ProductsApi {}

class MockProductsRepository extends Mock implements ProductsRepository {}

class MockProductsListBloc extends MockCubit<ProductsListState> implements ProductsListBloc {}
