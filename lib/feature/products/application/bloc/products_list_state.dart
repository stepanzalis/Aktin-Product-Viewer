part of 'products_list_bloc.dart';

/// Represents the state of the ProductsListState.
/// Can be one of the following:
/// - [ProductsListInitialState]: the initial state before any data is loaded.
/// - [ProductsListProgressState]: the state when data is being loaded.
/// - [ProductsListLoadedState]: the state when data has been successfully loaded.
/// - [ProductsListFailureState]: the state when an error occurs while loading data.
sealed class ProductsListState extends Equatable {
  @override
  List<Object?> get props => [];
}

/// The initial state for the [ProductsListState].
final class ProductsListInitialState extends ProductsListState {}

/// The state when data is actively being loaded.
final class ProductsListProgressState extends ProductsListState {}

/// The state when data has been successfully loaded.
final class ProductsListLoadedState extends ProductsListState {
  final List<ProductEntity> products;

  ProductsListLoadedState(this.products);

  @override
  List<Object?> get props => [products];
}

/// The state when an error occurs
final class ProductsListFailureState extends ProductsListState {
  final Failure failure;

  ProductsListFailureState(this.failure);

  @override
  List<Object?> get props => [failure];
}
