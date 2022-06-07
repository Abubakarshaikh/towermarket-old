import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      floatHeaderSlivers: true,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(48),
              child: Text("Hello"),
            ),
          ),
          SliverAppBar(
            title: Container(
              height: 45,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            floating: true,
            pinned: true,
            forceElevated: innerBoxIsScrolled,
          ),
        ];
      },
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: 60,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 50,
            child: Center(child: Text('Item $index')),
          );
        },
      ),
    );
  }
}
