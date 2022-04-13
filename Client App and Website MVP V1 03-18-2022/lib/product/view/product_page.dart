import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:towermarket/product/bloc/category_bloc.dart';
import 'package:towermarket/product/bloc/product_bloc.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Row(
          children: const [
            _CategoriesList(),
            _ProductsList(),
          ],
        ),
      ),
    );
  }
}

class _ProductsList extends StatelessWidget {
  const _ProductsList({
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
              child: GridView.builder(
                itemCount: state.products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Container(
                      color: Colors.red, child: const Icon(Icons.bookmark));
                },
              ),
            );
          default:
            return const Text("Something went wrong");
        }
      },
    );
  }
}

class _CategoriesList extends StatelessWidget {
  const _CategoriesList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryBloc, CategoryState>(
      listener: (context, listner) {},
      builder: (context, state) {
        switch (state.status) {
          case CategoryStatus.initial:
          case CategoryStatus.success:
            return Expanded(
              child: GridView.builder(
                itemCount: state.categories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 1.5,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.yellow,
                    child: const Icon(Icons.person),
                  );
                },
              ),
            );
          default:
            return const Text("Something went wrong");
        }
      },
    );
  }
}
