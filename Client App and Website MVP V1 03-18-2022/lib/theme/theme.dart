import 'package:flutter/material.dart';
import 'package:towermarket/colors/colors.dart';

import '../typography/text_styles.dart';

class TowermarketTheme {
  static ThemeData get standard {
    return ThemeData(
      appBarTheme: _appBarTheme,
      textTheme: _textTheme,
    );
  }

  static AppBarTheme get _appBarTheme {
    return const AppBarTheme(
      backgroundColor: TowermarketColors.firebrick,
    );
  }

  static TextTheme get _textTheme {
    return TextTheme(
      titleMedium: Towermarket.titleMedium,
    );
  }
}
