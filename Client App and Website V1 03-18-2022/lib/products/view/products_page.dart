import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:towermarket/products/bloc/products_bloc.dart';

import '../widgets/widgets.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsBloc, ProductsState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is ProductsInitial) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProductsLoaded) {
          return Scaffold(
            appBar: AppBar(),
            body: GridView.builder(
              // padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
              itemCount: state.products.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 150,
              ),
              itemBuilder: (context, index) {
                return ProductThumbnail(product: state.products[index]);
              },
            ),
          );
        }
        return const Center(child: Text("Something went wrong"));
      },
    );
  }
}

// itemCount: state.products.length,
// itemBuilder: (context, index) {
//   return ProductThumbnail(product: state.products[index]);
// },
