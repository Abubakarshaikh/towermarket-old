part of 'product_bloc.dart';

@immutable
abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object?> get props => [];
}

class ProductLoad extends ProductEvent {
  const ProductLoad();
}

class Increment extends ProductEvent {
  final Product product;
  const Increment({required this.product});
  @override
  List<Object?> get props => [product];
}

class Decrement extends ProductEvent {
  final Product product;
  const Decrement({required this.product});
  @override
  List<Object?> get props => [product];
}
