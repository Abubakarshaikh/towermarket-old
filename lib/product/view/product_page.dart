import 'package:flutter/material.dart';
import 'package:towermarket/typography/font_weights.dart';
import 'package:towermarket/typography/text_styles.dart';

import '../widgets/custom_search_delegate.dart';
import '../widgets/widgets.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_rounded),
        title: Text(
          "Cold drinks & juices",
          style: TowerMarketTextStyle.title1.copyWith(
            fontWeight: TowerMarketFontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
            icon: const Icon(Icons.search_sharp),
          ),
          const SizedBox(width: 6),
        ],
      ),
      body: Row(
        children: const [
          CategoriesList(),
          ProductsList(),
        ],
      ),
    );
  }
}
