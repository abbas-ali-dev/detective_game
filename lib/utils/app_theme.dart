import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFFEA332F);
  static const Color accent = Color(0xFF2E2E2E);
  static const Color whiteColor = Colors.white;

  static ThemeData buildTheme() {
    final baseData = ThemeData.dark();
    final textTheme = baseData.textTheme.apply(fontFamily: 'SpecialElite');

    return baseData.copyWith(
      primaryColor: primary,
      // backgroundColor: accent,
      scaffoldBackgroundColor: accent,
      textTheme: textTheme,
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: accent),
    );
  }
}
