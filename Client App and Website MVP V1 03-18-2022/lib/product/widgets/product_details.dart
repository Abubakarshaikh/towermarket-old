import 'package:flutter/material.dart';
import 'package:towermarket/models/product.dart';

class ProductDetails extends StatelessWidget {
  final Product product;
  const ProductDetails({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(product.brand, style: theme.labelLarge),
        Text(product.title, style: theme.titleMedium),
        Text("\$${product.price}", style: theme.titleMedium),
      ],
    );
  }
}
