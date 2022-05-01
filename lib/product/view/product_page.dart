import 'package:flutter/material.dart';
import 'package:towermarket/search/view/search_page.dart';

import '../widgets/widgets.dart';

class ProductPage extends StatelessWidget {
  static Route<ProductPage> route() {
    return MaterialPageRoute(builder: (_) => const ProductPage());
  }

  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cold drinks & juices"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(SearchPage.route());
            },
            icon: const Icon(Icons.search_sharp),
          ),
          const SizedBox(width: 6),
        ],
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          CategoriesList(),
          ProductsList(),
        ],
      ),
    );
  }
}
