import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:towermarket_ui/towermarket_ui.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar(
      {Key? key,
      required this.onDestinationSelected,
      required this.currentIndex})
      : super(key: key);
  final Function(int) onDestinationSelected;
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 12.0,
      color: TowerMarketColors.white,
      child: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: onDestinationSelected,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_rounded),
            label: 'home',
            selectedIcon:
                Icon(Icons.home_rounded, color: TowerMarketColors.black),
          ),
          NavigationDestination(
            icon: Icon(CupertinoIcons.square_grid_2x2),
            label: 'categories',
            selectedIcon: Icon(CupertinoIcons.square_grid_2x2,
                color: TowerMarketColors.black),
          ),
          NavigationDestination(
              icon: Icon(CupertinoIcons.search),
              selectedIcon:
                  Icon(CupertinoIcons.search, color: TowerMarketColors.black),
              label: 'search'),
          NavigationDestination(
              icon: Icon(Icons.local_offer_outlined),
              selectedIcon: Icon(Icons.local_offer_outlined,
                  color: TowerMarketColors.black),
              label: 'offers'),
          NavigationDestination(
              icon: Icon(Icons.person_outline_rounded),
              selectedIcon: Icon(Icons.person_outline_rounded,
                  color: TowerMarketColors.black),
              label: 'account'),
        ],
      ),
    );
  }
}
