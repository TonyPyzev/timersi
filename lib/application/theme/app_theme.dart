import 'package:flutter/material.dart';
import 'package:timersi/application/constants/app_colors.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: AppColors.kBackgroundBlack,
      colorScheme: const ColorScheme.dark().copyWith(
        background: AppColors.kBackgroundBlack,
        onBackground: AppColors.kSoftWhite,
        surface: AppColors.kSoftBlack,
        onSurface: AppColors.kSoftWhite,
        primary: AppColors.kSoftBlack,
        onPrimary: AppColors.kSoftWhite,
      ),
    );
  }
}
