part of 'products_bloc.dart';

@immutable
abstract class ProductsState extends Equatable {
  const ProductsState();
  @override
  List<Object?> get props => [];
}

class ProductsInitial extends ProductsState {
  const ProductsInitial();
}

class ProductsLoaded extends ProductsState {
  final List<Product> products;

  const ProductsLoaded({required this.products});

  @override
  List<Object?> get props => [products];
}
