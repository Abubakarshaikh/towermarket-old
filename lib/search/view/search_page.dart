import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  static Route<SearchPage> route() {
    return MaterialPageRoute(builder: (_) => const SearchPage());
  }

  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
      ),
    );
  }
}
