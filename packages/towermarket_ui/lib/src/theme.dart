import 'package:flutter/material.dart';

import '../towermarket_ui.dart';

class TowermarketTheme {
  static ThemeData get standard {
    return ThemeData(
      scaffoldBackgroundColor: TowerMarketColors.white,
      appBarTheme: _appBarTheme,
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
}
