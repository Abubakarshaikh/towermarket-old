import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Row(
          children: const [
            CategoriesList(),
            ProductsList(),
          ],
        ),
      ),
    );
  }
}
