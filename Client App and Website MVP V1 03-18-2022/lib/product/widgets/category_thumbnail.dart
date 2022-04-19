import 'package:flutter/material.dart';
import 'package:towermarket/models/category.dart';
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
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 4,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(12),
            ),
            child: Image.asset(category.image),
          ),
        ),
        Expanded(
          child: Text(
            category.title,
            textAlign: TextAlign.center,
            style: TowerMarketTextStyle.label,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
