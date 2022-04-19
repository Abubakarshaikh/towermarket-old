import 'package:flutter/material.dart';
import 'package:towermarket/colors/colors.dart';

class TowermarketTheme {
  static ThemeData get standard {
    return ThemeData(
      scaffoldBackgroundColor: TowerMarketColors.white,
      appBarTheme: _appBarTheme,
    );
  }

  static AppBarTheme get _appBarTheme {
    return const AppBarTheme(
      backgroundColor: TowerMarketColors.white,
    );
  }
}
