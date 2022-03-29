import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:towermarket/models/product.dart';
import 'package:towermarket/repository/products_repository.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsRepository _productsRepository;
  ProductsBloc(this._productsRepository) : super(const ProductsInitial()) {
    on<ProductsLoad>(_onProductsLoad);
  }

  Future<void> _onProductsLoad(
      ProductsLoad event, Emitter<ProductsState> emit) async {
    final List<Product> fromRepo = await _productsRepository.getAllProducts();
    emit(ProductsLoaded(products: fromRepo));
  }
}
