import 'package:flutter/material.dart';
import 'package:towermarket/models/product.dart';
import 'product_details.dart';
import 'product_thumbnail.dart';
import 'product_edit_buttons_tile.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  const ProductTile({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        height: 174,
        child: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Expanded(child: ProductThumbnail(image: product.photo)),
                  const SizedBox(width: 12),
                  Expanded(child: ProductDetails(product: product)),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: const [
                Expanded(child: ProductEditButtonsTile()),
                SizedBox(width: 12),
                Expanded(child: Opacity(opacity: 0)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
