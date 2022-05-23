import 'package:flutter/material.dart';
import 'package:towermarket/customer/search/view/search_page.dart';
import 'package:towermarket_ui/towermarket_ui.dart';

import '../../product/product.dart';

class FilterPage extends StatelessWidget {
  static Route<FilterPage> route() {
    return MaterialPageRoute(builder: (_) => const FilterPage());
  }

  const FilterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Filter products"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(SearchPage.route());
            },
            icon: const Icon(Icons.search_sharp),
          ),
        ],
      ),
      body: Row(
        children: [
          Expanded(
            child: Container(
              color: TowerMarketColors.lightgrey,
              child: Column(
                children: [
                  TextButton(onPressed: () {}, child: const Text("Sort By")),
                  TextButton(onPressed: () {}, child: const Text("Brand")),
                  TextButton(onPressed: () {}, child: const Text("Type")),
                  TextButton(onPressed: () {}, child: const Text("Pack Size")),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(),
          ),
        ],
      ),
    );
  }
}
