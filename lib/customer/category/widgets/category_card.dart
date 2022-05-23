import 'package:flutter/material.dart';
import 'package:towermarket/customer/product/product.dart';
import 'package:towermarket_api_client/towermarket_api_client.dart';
import 'package:towermarket_ui/towermarket_ui.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  const CategoryCard({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, ProductPage.route());
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 3.5,
              borderOnForeground: true,
              shadowColor: TowerMarketColors.grey,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 6,
                    bottom: -12,
                    child: Image.asset(category.image),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                category.title,
                style: TowerMarketTextStyle.title1.copyWith(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
