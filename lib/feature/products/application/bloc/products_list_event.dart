part of 'products_list_bloc.dart';

abstract class ProductsListEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class ProductsListLoadEvent extends ProductsListEvent {}
