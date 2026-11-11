import 'package:flutter/material.dart';

abstract final class AppPalette {
  static const ink = Color(0xFF14253D);
  static const mutedInk = Color(0xFF65758D);
  static const navy = Color(0xFF112846);
  static const blue = Color(0xFF2764D5);
  static const aqua = Color(0xFF6ADCCF);
  static const background = Color(0xFFF3F6FB);
  static const line = Color(0xFFE0E8F2);
}

abstract final class AppTheme {
  static ThemeData get light {
    final scheme = ColorScheme.fromSeed(
      seedColor: AppPalette.blue,
      brightness: Brightness.light,
      surface: Colors.white,
    );
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: scheme,
      scaffoldBackgroundColor: AppPalette.background,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppPalette.background,
        foregroundColor: AppPalette.ink,
        centerTitle: false,
        scrolledUnderElevation: 0,
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontSize: 34, fontWeight: FontWeight.w800, height: 1.12,
          letterSpacing: -1.1, color: AppPalette.ink,
        ),
        headlineSmall: TextStyle(
          fontSize: 21, fontWeight: FontWeight.w800,
          letterSpacing: -0.4, color: AppPalette.ink,
        ),
        titleLarge: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w700,
          color: AppPalette.ink,
        ),
        bodyLarge: TextStyle(
          fontSize: 15, height: 1.7, color: AppPalette.ink,
        ),
        bodyMedium: TextStyle(
          fontSize: 14, height: 1.55, color: AppPalette.ink,
        ),
        labelMedium: TextStyle(
          fontSize: 12, fontWeight: FontWeight.w600,
          color: AppPalette.mutedInk,
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppPalette.blue,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppPalette.blue,
          padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 16),
          side: const BorderSide(color: AppPalette.line),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
      ),
    );
  }
}
