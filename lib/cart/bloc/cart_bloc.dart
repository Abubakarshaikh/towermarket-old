import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:towermarket/models/product.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState()) {
    on<CartLoad>(_onCartLoad);
  }

  void _onCartLoad(CartLoad event, Emitter<CartState> emit) {
    emit(const CartState(status: CartStatus.success));
  }


}
