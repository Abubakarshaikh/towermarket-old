part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class CartLoad extends CartEvent {
  const CartLoad();
}

// class AddToCart extends CartEvent {
//   final Product product;
//   const AddToCart({required this.product});

//   @override
//   List<Object> get props => [product];
// }

// class RemoveFromCart extends CartEvent {
//   final Product product;
//   const RemoveFromCart({required this.product});

//   @override
//   List<Object> get props => [RemoveFromCart];
// }
