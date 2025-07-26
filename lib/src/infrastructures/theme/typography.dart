import 'package:flutter/material.dart';

import 'colors.dart';

class AppTypography {
  static final TextStyle headline = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.secondaryColor.shade900,
  );

  static final TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.secondaryColor.shade900,
  );

  static final TextStyle body = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.secondaryColor.shade900,
  );

  static final TextStyle caption = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.secondaryColor.shade700,
  );
}
