import 'dart:async';

import 'package:aktin_product_viewer/feature/core/application/cubit/aktin_bloc.dart';
import 'package:aktin_product_viewer/feature/products/infrastructure/repositories/products_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/product_entity.dart';

part 'products_list_event.dart';
part 'products_list_state.dart';

/// Bloc that manages the state of the products list screen
class ProductsListBloc extends AktinBloc<ProductsListEvent, ProductsListState> {
  final ProductsRepository _productsRepository;
  StreamSubscription<List<ProductEntity>>? _productsSubscription;

  ProductsListBloc({
    required ProductsRepository productsRepository,
  })  : _productsRepository = productsRepository,
        super(ProductsListInitialState()) {
    on<ProductsListLoadEvent>(_onLoadProducts);
  }

  Future<void> _onLoadProducts(ProductsListLoadEvent event, Emitter<ProductsListState> emit) async {
    emit(ProductsListProgressState());
    try {
      await _productsRepository.saveProducts();

      // Start listening to the stream after saving products
      await emit.forEach<List<ProductEntity>>(
        _productsRepository.watchProducts(),
        onData: (products) => ProductsListLoadedState(products),
        onError: (error, stackTrace) => ProductsListFailureState(error.toString()),
      );
    } catch (e) {
      emit(ProductsListFailureState(e.toString()));
    }
  }

  @override
  Future<void> close() {
    _productsSubscription?.cancel();
    return super.close();
  }
}
