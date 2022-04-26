import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/product.dart';
import '../bloc/product_bloc.dart';
import 'rounded_icon_button.dart';

class AddToCartButtons extends StatelessWidget {
  const AddToCartButtons({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RoundedIconButton(
          icon: Icons.remove,
          onPressed: () {
            context.read<ProductBloc>().add(Decrement(product: product));
          },
        ),
        Text(product.quantity.toString()),
        RoundedIconButton(
          icon: Icons.add,
          onPressed: () {
            context.read<ProductBloc>().add(Increment(product: product));
          },
        ),
      ],
    );
  }
}
