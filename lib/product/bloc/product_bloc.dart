import 'dart:async';

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
}
