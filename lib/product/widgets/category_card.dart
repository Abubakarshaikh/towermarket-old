import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:towermarket/product/bloc/category_bloc.dart';
import 'package:towermarket/product/bloc/product_bloc.dart';
import 'package:towermarket_api_client/towermarket_api_client.dart';
import 'package:towermarket_ui/towermarket_ui.dart';

class CategoryCard extends StatelessWidget {
  final Category category;

  const CategoryCard({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: GestureDetector(
          onTap: () {
            context
                .read<CategoryBloc>()
                .add(CategorySelect(category: category));
            context
                .read<ProductBloc>()
                .add(ProductLoad(categoryId: category.id));
          },
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          AnimatedPositioned(
                            duration: const Duration(milliseconds: 400),
                            right: 12,
                            left: 12,
                            top: 6,
                            bottom: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                color: category.isSelected
                                    ? TowerMarketColors.lightyellow
                                    : TowerMarketColors.lightgrey,
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          AnimatedPositioned(
                            duration: const Duration(milliseconds: 400),
                            top: category.isSelected ? 0 : 14,
                            left: 12,
                            right: 12,
                            bottom: category.isSelected ? -14 : -28,
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Image.asset(category.image),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          category.title,
                          style: category.isSelected
                              ? TowerMarketTextStyle.title3.copyWith(
                                  color: TowerMarketColors.black,
                                  fontWeight: FontWeight.bold)
                              : TowerMarketTextStyle.title3,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 4,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: category.isSelected
                      ? TowerMarketColors.black
                      : TowerMarketColors.transparent,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4),
                    bottomLeft: Radius.circular(4),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
