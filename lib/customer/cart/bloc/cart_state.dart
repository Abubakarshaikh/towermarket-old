part of 'cart_bloc.dart';

enum CartStatus { initial, loading, success, failure }

class CartState extends Equatable {
  final CartStatus status;
  final List<Product> products;
  const CartState({this.status = CartStatus.initial, this.products = const []});

  @override
  List<Object> get props => [status, products];
}
