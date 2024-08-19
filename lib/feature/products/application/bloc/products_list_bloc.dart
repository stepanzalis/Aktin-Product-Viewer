import 'dart:async';

import 'package:aktin_product_viewer/feature/core/application/cubit/aktin_bloc.dart';
import 'package:aktin_product_viewer/feature/core/domain/exception/failure.dart';
import 'package:aktin_product_viewer/feature/products/infrastructure/repositories/products_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/product_entity.dart';

part 'products_list_event.dart';
part 'products_list_state.dart';

/// Bloc that manages the state of the products list screen
class ProductsListBloc extends AktinBloc<ProductsListEvent, ProductsListState> {
  /// Repository to fetch products
  final ProductsRepository _productsRepository;

  /// Subscription to the products stream
  StreamSubscription<List<ProductEntity>>? _productsSubscription;

  ProductsListBloc({
    required ProductsRepository productsRepository,
  })  : _productsRepository = productsRepository,
        super(ProductsListInitialState()) {
    on<ProductsListLoadEvent>(_onLoadProducts);
    on<ListenToProductsEvent>(_listenToProducts);
  }

  Future<void> _onLoadProducts(_, Emitter<ProductsListState> emit) async {
    emit(ProductsListProgressState());

    final result = await _productsRepository.saveProducts(cancelToken: cancelToken);
    return result.ifFailure((failure) => emit(ProductsListFailureState(failure)));
  }

  Future<void> _listenToProducts(_, Emitter<ProductsListState> emit) async {
    await emit.forEach<List<ProductEntity>>(
      _productsRepository.watchProducts(),
      onData: (products) => ProductsListLoadedState(products),
      onError: (_, __) => ProductsListFailureState(const DatabaseFailure('Failed to load products')),
    );
  }

  @override
  Future<void> close() {
    _productsSubscription?.cancel();
    return super.close();
  }
}
