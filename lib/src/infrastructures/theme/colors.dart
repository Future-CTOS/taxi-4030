import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  static const _primaryColorValue = 0xffFFD600;
  static const MaterialColor primaryColor = MaterialColor(
    _secondaryPrimaryValue,
    <int, Color>{100: Color(0xffFFF6CC), 600: Color(_primaryColorValue)},
  );

  static const MaterialColor secondaryColor =
      MaterialColor(_secondaryPrimaryValue, <int, Color>{
        50: Color(0xFFF9FAFB),
        100: Color(0xFFF2F4F7),
        200: Color(0xFFE4E7EC),
        300: Color(0xFFCED2DA),
        400: Color(0xFF97A1AF),
        500: Color(0xff637083),
        600: Color(0xFF414E62),
        700: Color(0xFF344051),
        800: Color(0xFF202B37),
        900: Color(0xFF141C24),
      });
  static const int _secondaryPrimaryValue = 0xFFCED2DA;

  static const Color errorColor = Color(0xffF64C4C);

  /// light
  static const Color backgroundColor = Colors.white;
  static const Color textColor = Color(0xff191919);

  /// dark
  static const Color darkBackgroundColor = Color(0xff202B37);
  static const Color darkTextColor = Color(0xffF2FDFF);
  static const Color secondaryDarkTextColor = Color(0xffCED2DA);
}
