import 'package:flutter/material.dart';
import '../../models/product.dart';

class ProductThumbnail extends StatelessWidget {
  final Product product;
  const ProductThumbnail({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: Image(image: AssetImage(product.photo))),
        const SizedBox(height: 18),
        const Text("Dairy Milk"),
        const SizedBox(height: 18),
        const Text("Rs. 100 /box"),
      ],
    );
  }
}
