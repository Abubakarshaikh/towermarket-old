import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:towermarket/category/bloc/category_bloc.dart';
import 'package:towermarket/category/widgets/category_card.dart';
import 'package:towermarket_ui/towermarket_ui.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryBloc, CategoryState>(
      listener: (context, listner) {},
      builder: (context, state) {
        switch (state.status) {
          case CategoryStatus.initial:
          case CategoryStatus.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );

          case CategoryStatus.success:
            return Padding(
              padding: const EdgeInsets.only(top: 24, left: 12, right: 12),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("All Categories",
                            style: TowerMarketTextStyle.headline4),
                        Text(
                          "Curated with the best range of products",
                          style: TowerMarketTextStyle.title1.copyWith(
                              color: TowerMarketColors.grey, height: 2),
                        ),
                      ],
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 18,
                    ),
                  ),
                  SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: 0.7,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 4,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return CategoryCard(
                          category: state.categories[index],
                        );
                      },
                      childCount: state.categories.length,
                    ),
                  )
                ],
              ),
            );
          default:
            return const Center(
              child: Text("Somethig went wrong"),
            );
        }
      },
    );
  }
}
