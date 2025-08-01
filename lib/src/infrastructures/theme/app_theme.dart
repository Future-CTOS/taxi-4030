import 'package:flutter/material.dart';
import 'colors.dart';
import 'typography.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor.shade600,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    textTheme: TextTheme(
      titleLarge: AppTypography.headline,
      bodyLarge: AppTypography.bodyLarge,
      bodyMedium: AppTypography.body,
      bodySmall: AppTypography.caption,
    ),
    colorScheme: ColorScheme.light(
      primary: AppColors.primaryColor.shade600,
      surfaceContainer: AppColors.primaryColor.shade100,
      secondary: AppColors.secondaryColor.shade300,
      onSecondary: AppColors.secondaryColor.shade500,
      onPrimary: AppColors.textColor,
      error: AppColors.errorColor,
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
