import 'package:flutter/material.dart';
import 'package:towermarket/colors/colors.dart';
import 'package:towermarket/models/product.dart';
import 'package:towermarket/typography/text_styles.dart';

class ProductThumbnail extends StatelessWidget {
  final Product product;
  const ProductThumbnail({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Image.asset(product.image)),
          Text(
            product.title,
            style: TowerMarketTextStyle.title2.copyWith(
              height: 1.4,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          const SizedBox(height: 8),
          Text("${product.quantity} ${product.unit}",
              style: TowerMarketTextStyle.title2
                  .copyWith(color: TowerMarketColors.grey)),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("₹${product.price}", style: TowerMarketTextStyle.title2),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  decoration: BoxDecoration(
                    color: TowerMarketColors.white,
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  child: Text("Add",
                      style: TowerMarketTextStyle.title2
                          .copyWith(color: TowerMarketColors.green)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
