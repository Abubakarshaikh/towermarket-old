import 'package:flutter/material.dart';
import 'package:towermarket/models/product.dart';

class ProductThumbnail extends StatelessWidget {
  final Product product;
  const ProductThumbnail({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          right: BorderSide(
            color: Colors.black,
            width: 0.1,
          ),
          bottom: BorderSide(
            color: Colors.black,
            width: 0.1,
          ),
        ),
      ),
      child: const Icon(Icons.bookmark),
    );
  }
}
