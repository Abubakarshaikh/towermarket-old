import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:towermarket/customer/product/bloc/product_bloc.dart';
import 'package:towermarket_api_client/towermarket_api_client.dart';
import 'package:towermarket_ui/towermarket_ui.dart';

import 'add_to_cart_buttons.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12, bottom: 12, right: 12),
      decoration: DecorationStyle.borderLine,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Image.asset(product.image),
          ),
          Text(
            product.title,
            style: TowerMarketTextStyle.title2.copyWith(
              height: 1.4,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          const SizedBox(height: 8),
          Text("${product.volume} ${product.unit}",
              style: TowerMarketTextStyle.title2
                  .copyWith(color: TowerMarketColors.grey)),
          const SizedBox(height: 8),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Text("₹${product.price}",
                        style: TowerMarketTextStyle.title2,
                        textAlign: TextAlign.left)),
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 3.5),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: product.quantity < 1
                          ? TowerMarketColors.white
                          : TowerMarketColors.gold,
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    child: product.quantity < 1
                        ? GestureDetector(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Add",
                                    style: TowerMarketTextStyle.title2.copyWith(
                                        color: TowerMarketColors.green)),
                              ],
                            ),
                            onTap: () {
                              context
                                  .read<ProductBloc>()
                                  .add(Increment(product: product));
                            },
                          )
                        : AddToCartButtons(product: product),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
