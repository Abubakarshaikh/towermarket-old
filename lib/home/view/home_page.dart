import 'package:flutter/material.dart';
import 'package:towermarket/product/view/product_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GestureDetector(
        onTap: () {
          Navigator.of(context).push(ProductPage.route());
        },
        child: const Center(
          child: Icon(Icons.rocket, size: 200, color: Colors.pink),
        ),
      ),
    );
  }
}
