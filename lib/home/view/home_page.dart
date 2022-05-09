import 'package:flutter/material.dart';
import 'package:towermarket_ui/towermarket_ui.dart';

import '../../account/view/account_page.dart';
import '../../category/view/category_page.dart';
import '../../offer/view/offer_page.dart';
import '../../search/view/search_page.dart';
import '../widgets/my_bottom_navigation_bar.dart';
import 'home_view.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final ValueNotifier<int> _valueNotifier = ValueNotifier(0);

  final List<Widget> _screens = const [
    HomeView(),
    CategoryPage(),
    SearchPage(),
    OfferPage(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _valueNotifier,
      builder: (context, int newValue, widgets) {
        return Container(
          color: TowerMarketColors.white,
          child: SafeArea(
            child: Scaffold(
              body: _screens[newValue],
              bottomNavigationBar: MyBottomNavigationBar(
                onDestinationSelected: (newIndex) {
                  _valueNotifier.value = newIndex;
                },
                currentIndex: newValue,
              ),
            ),
          ),
        );
      },
    );
  }
}
