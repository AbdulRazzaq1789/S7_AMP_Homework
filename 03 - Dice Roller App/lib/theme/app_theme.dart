import 'package:flutter/material.dart';

abstract final class DiceTokens {
  static const double xs = 6;
  static const double sm = 12;
  static const double md = 18;
  static const double lg = 24;
  static const double xl = 32;
  static const double xxl = 44;
  static const double cardRadius = 26;
}

abstract final class AppTheme {
  static const Color accent = Color(0xFF7566EB);
  static const Color accentStrong = Color(0xFF5742DE);
  static const Color mint = Color(0xFF45D4C0);

  static ThemeData get light => _create(Brightness.light);
  static ThemeData get dark => _create(Brightness.dark);

  static ThemeData _create(Brightness brightness) {
    final dark = brightness == Brightness.dark;
    final colors = ColorScheme.fromSeed(
      seedColor: accent,
      brightness: brightness,
      surface: dark ? const Color(0xFF191B2E) : Colors.white,
    );
    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colors,
      scaffoldBackgroundColor: dark
          ? const Color(0xFF101121)
          : const Color(0xFFF5F5FC),
      appBarTheme: const AppBarTheme(centerTitle: false, elevation: 0),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
    );
  }
}
