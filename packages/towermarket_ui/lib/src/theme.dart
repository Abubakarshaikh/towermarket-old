import 'package:flutter/material.dart';

import '../towermarket_ui.dart';

class TowermarketTheme {
  static ThemeData get standard {
    return ThemeData(
      scaffoldBackgroundColor: TowerMarketColors.white,
      appBarTheme: _appBarTheme,
      navigationBarTheme: _navigationBarTheme,
      elevatedButtonTheme: _elevatedButtonThemeData,
      floatingActionButtonTheme: _floatingActionButtonThemeData,
    );
  }

  static AppBarTheme get _appBarTheme {
    return AppBarTheme(
      iconTheme: const IconThemeData(
        color: TowerMarketColors.black,
        size: 32.0,
      ),
      backgroundColor: TowerMarketColors.white,
      titleTextStyle: TowerMarketTextStyle.headline5,
    );
  }

  static NavigationBarThemeData get _navigationBarTheme {
    return NavigationBarThemeData(
      labelTextStyle: MaterialStateProperty.all(TowerMarketTextStyle.label),
      indicatorColor: Colors.transparent,
      backgroundColor: Colors.white,
      iconTheme: MaterialStateProperty.all(
        const IconThemeData(
          size: 30.0,
          color: TowerMarketColors.grey,
        ),
      ),
    );
  }

  static ElevatedButtonThemeData get _elevatedButtonThemeData {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(primary: TowerMarketColors.firebrick),
    );
  }

  static FloatingActionButtonThemeData get _floatingActionButtonThemeData {
    return const FloatingActionButtonThemeData(
      backgroundColor: TowerMarketColors.firebrick,
    );
  }
}
