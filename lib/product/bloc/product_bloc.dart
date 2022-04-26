import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:towermarket/models/product.dart';
import 'package:towermarket/repository/product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;
  ProductBloc(this._productRepository) : super(const ProductState()) {
    on<ProductLoad>(_onProductLoad);
    on<Increment>(_onIcrement);
    on<Decrement>(_onDecrement);
  }

  Future<void> _onProductLoad(
      ProductLoad event, Emitter<ProductState> emit) async {
    try {
      final List<Product> fromRepo = await _productRepository.getAllProducts();
      emit(ProductState(products: fromRepo, status: ProductStatus.success));
    } catch (e) {
      emit(const ProductState(status: ProductStatus.failure));
    }
  }

  void _onIcrement(Increment event, Emitter<ProductState> emit) {
    final updatedState = state.products.map((product) {
      return product != event.product
          ? product
          : event.product.copyWith(quantity: product.quantity + 1);
    }).toList();

    emit(ProductState(products: updatedState, status: ProductStatus.success));
  }

    void _onDecrement(Decrement event, Emitter<ProductState> emit) {
    final updatedState = state.products.map((product) {
      return product != event.product
          ? product
          : event.product.copyWith(quantity: product.quantity - 1);
    }).toList();

    emit(ProductState(products: updatedState, status: ProductStatus.success));
  }
}
