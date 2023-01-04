import 'package:flutter/material.dart';
import 'package:timersi/application/constants/app_colors.dart';

class FontTheme {
  static TextStyle get header {
    return const TextStyle().copyWith(
      fontFamily: 'Poppins',
      fontSize: 36,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle get tabLabel {
    return const TextStyle(
      fontFamily: 'Lora',
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Color(0xFF8C8C8C),
    );
  }

  static TextStyle get bottomSheetHeader {
    return const TextStyle(
      fontFamily: 'Lora',
      fontSize: 36,
      fontWeight: FontWeight.w500,
      color: AppColors.kSoftBlack,
    );
  }

  static TextStyle get bottomSheetTitle {
    return const TextStyle(
      fontFamily: 'Poppins',
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: AppColors.kSoftBlack,
    );
  }

  static TextStyle get bottomSheetSubtitle {
    return const TextStyle(
      fontFamily: 'Poppins',
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.kSoftBlack,
    );
  }

  static TextStyle get bottomSheetInputHint {
    return const TextStyle(
      fontFamily: 'Poppins',
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Color(0xFF8C8C8C),
    );
  }

  static TextStyle get bottomSheetInput {
    return const TextStyle(
      fontFamily: 'Poppins',
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.kSoftBlack,
      decoration: TextDecoration.none,
    );
  }
}
