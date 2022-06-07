import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:towermarket_ui/towermarket_ui.dart';

import '../bloc/sub_category_bloc.dart';
import 'widgets.dart';

class SubCategoriesList extends StatelessWidget {
  const SubCategoriesList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SubCategoryBloc, SubCategoryState>(
      listener: (context, listner) {},
      builder: (context, state) {
        switch (state.status) {
          case SubCategoryStatus.initial:
          case SubCategoryStatus.success:
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
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  itemCount: state.subCategories.length,
                  itemBuilder: (context, index) {
                    return SubCategoryCard(
                        category: state.subCategories[index]);
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
