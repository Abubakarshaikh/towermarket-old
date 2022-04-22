part of 'product_bloc.dart';

enum ProductStatus { initial, loading, success, failure }

class ProductState extends Equatable {
  final ProductStatus status;
  final List<Product> products;
  const ProductState(
      {this.products = const [], this.status = ProductStatus.initial});
  @override
  List<Object?> get props => [status, products];
}
