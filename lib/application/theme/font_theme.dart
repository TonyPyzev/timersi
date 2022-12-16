import 'package:flutter/material.dart';

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
}
