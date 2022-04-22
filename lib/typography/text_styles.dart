import 'package:flutter/widgets.dart';
import '../colors/colors.dart';
import 'font_weights.dart';

class TowerMarketTextStyle {
  static TextStyle get title1 {
    return _baseTextStyle.copyWith(
      fontSize: 16,
      fontWeight: TowerMarketFontWeight.regular,
    );
  }

  static TextStyle get title2 {
    return _baseTextStyle.copyWith(
      fontSize: 14.5,
      fontWeight: TowerMarketFontWeight.regular,
    );
  }

  static TextStyle get title3 {
    return _baseTextStyle.copyWith(
      fontSize: 12,
      height: 1.4,
      fontWeight: TowerMarketFontWeight.regular,
    );
  }

  static TextStyle get title4 {
    return _baseTextStyle.copyWith(
      fontSize: 10,
      fontWeight: TowerMarketFontWeight.regular,
    );
  }

  static TextStyle get headline1 {
    return _baseTextStyle.copyWith(
      fontSize: 74,
      fontWeight: TowerMarketFontWeight.bold,
    );
  }

  static TextStyle get headline2 {
    return _baseTextStyle.copyWith(
      fontSize: 54,
      height: 1.1,
      fontWeight: TowerMarketFontWeight.bold,
    );
  }

  static TextStyle get headline3 {
    return _baseTextStyle.copyWith(
      fontSize: 34,
      height: 1.12,
      fontWeight: TowerMarketFontWeight.bold,
    );
  }

  static TextStyle get headline3Soft {
    return _baseTextStyle.copyWith(
      fontSize: 34,
      height: 1.17,
      fontWeight: TowerMarketFontWeight.regular,
    );
  }

  static TextStyle get headline4 {
    return _baseTextStyle.copyWith(
      fontSize: 24,
      height: 1.15,
      fontWeight: TowerMarketFontWeight.bold,
    );
  }

  static TextStyle get headline4Soft {
    return _baseTextStyle.copyWith(
      fontSize: 24,
      height: 1.15,
      fontWeight: TowerMarketFontWeight.regular,
    );
  }

  static TextStyle get headline5 {
    return _baseTextStyle.copyWith(
      fontSize: 16,
      height: 1.25,
      fontWeight: TowerMarketFontWeight.bold,
    );
  }

  static TextStyle get bodyLargeBold {
    return _baseTextStyle.copyWith(
      fontSize: 46,
      height: 1.17,
      fontWeight: TowerMarketFontWeight.bold,
    );
  }

  static TextStyle get bodyLarge {
    return _baseTextStyle.copyWith(
      fontSize: 46,
      height: 1.17,
      fontWeight: TowerMarketFontWeight.regular,
    );
  }

  // static TextStyle get body {
  //   return _bodyTextStyle.copyWith(
  //     fontSize: 24,
  //     height: 1.33,
  //     fontWeight: TowerMarketFontWeight.regular,
  //   );
  // }

  // static TextStyle get bodySmall {
  //   return _bodyTextStyle.copyWith(
  //     fontSize: 18,
  //     height: 1.22,
  //     fontWeight: TowerMarketFontWeight.regular,
  //   );
  // }

  // static TextStyle get bodyXSmall {
  //   return _bodyTextStyle.copyWith(
  //     fontSize: 14,
  //     height: 1.27,
  //     fontWeight: TowerMarketFontWeight.regular,
  //   );
  // }

  static TextStyle get label {
    return _baseTextStyle.copyWith(
      fontSize: 12,
      // height: 1.27,
      fontWeight: TowerMarketFontWeight.semiBold,
    );
  }

  static TextStyle get countdownTime {
    return _baseTextStyle.copyWith(
      fontSize: 300,
      height: 1,
      fontWeight: TowerMarketFontWeight.bold,
    );
  }

  static const _baseTextStyle = TextStyle(
    fontFamily: 'GoogleSans',
    color: TowerMarketColors.black,
    fontWeight: TowerMarketFontWeight.regular,
  );

  // static final _bodyTextStyle = GoogleFonts.roboto(
  //   color: TowerMarketColors.black,
  //   fontWeight: TowerMarketFontWeight.regular,
  // );
}
