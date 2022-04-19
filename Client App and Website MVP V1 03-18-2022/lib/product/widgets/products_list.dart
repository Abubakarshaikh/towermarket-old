import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:towermarket/colors/colors.dart';

import '../bloc/product_bloc.dart';
import 'widgets.dart';

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                      left: 24,
                      bottom: 18,
                      top: 18,
                    ),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 0.1,
                          color: TowerMarketColors.black,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${state.products.length} products"),
                        const Icon(Icons.filter_alt_outlined)
                      ],
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                      itemCount: state.products.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return ProductThumbnail(product: state.products[index]);
                      },
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
