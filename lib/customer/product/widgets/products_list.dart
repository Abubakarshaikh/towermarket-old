import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:towermarket/customer/product/product.dart';
import 'package:towermarket_ui/towermarket_ui.dart';

import '../../filter/filter.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductBloc, ProductState>(
      listener: (context, listner) {},
      builder: (context, state) {
        switch (state.status) {
          case ProductStatus.initial:
          case ProductStatus.success:
            return Expanded(
              flex: 4,
              child: Stack(
                children: [
                  Positioned(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            decoration: DecorationStyle.borderLine,
                            padding: const EdgeInsets.symmetric(
                                vertical: 18, horizontal: 12),
                            child: Text("${state.products.length}  products",
                                style: TowerMarketTextStyle.title2
                                    .copyWith(color: TowerMarketColors.grey)),
                          ),
                          LayoutBuilder(
                            builder: (context, constraints) {
                              return Wrap(
                                children: state.products.map(
                                  (product) {
                                    return SizedBox(
                                      width: constraints.maxWidth / 2,
                                      height: constraints.maxWidth / 1.2,
                                      child: ProductCard(product: product),
                                    );
                                  },
                                ).toList(),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 0,
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.5),
                          bottomLeft: Radius.circular(8.5),
                        ),
                        color: TowerMarketColors.white,
                        boxShadow: [
                          BoxShadow(
                            color: TowerMarketColors.grey,
                            spreadRadius: -0.9,
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).push(FilterPage.route());
                        },
                        icon: const Icon(Icons.filter_alt_outlined,
                            color: TowerMarketColors.black),
                      ),
                    ),
                  ),
                ],
              ),
            );
          default:
            return const Text("Something went wrong");
        }
      },
    );
  }
}
