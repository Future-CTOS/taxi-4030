import 'package:flutter/material.dart';
import 'colors.dart';
import 'typography.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    textTheme: TextTheme(
      titleLarge: AppTypography.headline.copyWith(color: AppColors.textColor),
      bodyMedium: AppTypography.body.copyWith(color: AppColors.textColor),
      bodySmall: AppTypography.caption.copyWith(color: AppColors.textColor),
    ),
    colorScheme: ColorScheme.light(
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
      onPrimary: AppColors.textColor,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.darkBackgroundColor,
    textTheme: TextTheme(
      titleLarge: AppTypography.headline.copyWith(
        color: AppColors.darkTextColor,
      ),
      bodyMedium: AppTypography.body.copyWith(color: AppColors.darkTextColor),
      bodySmall: AppTypography.caption.copyWith(color: AppColors.darkTextColor),
    ),
    colorScheme: ColorScheme.dark(
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
      onPrimary: AppColors.darkTextColor,
    ),
  );
}
