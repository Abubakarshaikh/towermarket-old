import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:towermarket/colors/colors.dart';
import 'package:towermarket/models/category.dart';
import 'package:towermarket/product/bloc/category_bloc.dart';
import 'package:towermarket/typography/text_styles.dart';

class CategoryThumbnail extends StatelessWidget {
  final Category category;
  const CategoryThumbnail({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1 / 1,
          child: Column(
            children: [
              category.isSelected
                  ? _SelectedThumbnail(category: category)
                  : _UnSelectedThumbnail(category: category),
              Container(
                height: 12,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _UnSelectedThumbnail extends StatelessWidget {
  const _UnSelectedThumbnail({
    Key? key,
    required this.category,
  }) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          context.read<CategoryBloc>().add(
              CategorySelect(category: category));
        },
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: const EdgeInsets.only(left: 12, right: 12),
                      decoration: BoxDecoration(
                        color: TowerMarketColors.lightgrey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            top: 8, // 8
                            bottom: -24, //-12
                            child: Image.asset(category.image),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      child: Text(
                        category.title,
                        style: TowerMarketTextStyle.title3,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 3.5,
              height: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4),
                  bottomLeft: Radius.circular(4),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SelectedThumbnail extends StatelessWidget {
  const _SelectedThumbnail({
    Key? key,
    required this.category,
  }) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: const EdgeInsets.only(left: 12, right: 12),
                    decoration: BoxDecoration(
                      color: TowerMarketColors.lightyellow,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          top: -8,
                          bottom: -12,
                          child: Image.asset(category.image),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: Text(
                      category.title,
                      style: TowerMarketTextStyle.title3.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 3.5,
            height: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4),
                bottomLeft: Radius.circular(4),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
