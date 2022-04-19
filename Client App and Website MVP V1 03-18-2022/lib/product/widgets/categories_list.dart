import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:towermarket/colors/colors.dart';

import '../bloc/category_bloc.dart';
import 'widgets.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({
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
              child: Container(
                decoration: const BoxDecoration(
                  color: TowerMarketColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: TowerMarketColors.grey,
                      spreadRadius: -4,
                      blurRadius: 12,
                    ),
                  ],
                ),
                child: GridView.builder(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                  itemCount: state.categories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 0.8,
                    mainAxisSpacing: 12,
                  ),
                  itemBuilder: (context, index) {
                    return CategoryThumbnail(category: state.categories[index]);
                  },
                ),
              ),
            );
          default:
            return const Text("Something went wrong");
        }
      },
    );
  }
}