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
      elevation: 10,
      child: NavigationBar(
        height: 68,
        selectedIndex: currentIndex,
        onDestinationSelected: onDestinationSelected,
        destinations: [
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
              icon: MyBottomNavigationBarIcon(
                  animatedIconData: AnimatedIcons.home_menu),
              selectedIcon: Icon(Icons.person_outline_rounded,
                  color: TowerMarketColors.black),
              label: 'account'),
        ],
      ),
    );
  }
}

class MyBottomNavigationBarIcon extends StatefulWidget {
  final AnimatedIconData animatedIconData;
  const MyBottomNavigationBarIcon({
    Key? key,
    required this.animatedIconData,
  }) : super(key: key);
  @override
  _MyBottomNavigationBarIconState createState() =>
      _MyBottomNavigationBarIconState();
}

class _MyBottomNavigationBarIconState extends State<MyBottomNavigationBarIcon>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _animationController.forward();
      },
      child: AnimatedIcon(
        icon: widget.animatedIconData,
        progress: _animationController,
      ),
    );
  }
}
