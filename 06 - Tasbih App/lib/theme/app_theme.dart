import 'package:flutter/material.dart';

abstract final class AppPalette {
  static const pine = Color(0xFF0B5448);
  static const deepPine = Color(0xFF103D36);
  static const jade = Color(0xFF1A8A70);
  static const mint = Color(0xFFDEF2E8);
  static const ivory = Color(0xFFF6F7F1);
  static const ink = Color(0xFF1D342E);
  static const muted = Color(0xFF71847B);
  static const gold = Color(0xFFE6B95B);
  static const outline = Color(0xFFE1E8DF);
}

abstract final class AppTheme {
  static ThemeData get light {
    final scheme = ColorScheme.fromSeed(
      seedColor: AppPalette.jade,
      brightness: Brightness.light,
      primary: AppPalette.pine,
      secondary: AppPalette.gold,
      surface: Colors.white,
    );
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppPalette.ivory,
      colorScheme: scheme,
      appBarTheme: const AppBarTheme(
        centerTitle: false,
        backgroundColor: AppPalette.ivory,
        surfaceTintColor: Colors.transparent,
        foregroundColor: AppPalette.ink,
        elevation: 0,
      ),
      textTheme: const TextTheme(
        headlineMedium: TextStyle(fontSize: 30, fontWeight: FontWeight.w800, height: 1.12, color: AppPalette.ink),
        headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: AppPalette.ink),
        titleLarge: TextStyle(fontSize: 19, fontWeight: FontWeight.w800, color: AppPalette.ink),
        titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: AppPalette.ink),
        bodyMedium: TextStyle(fontSize: 14, height: 1.4, color: AppPalette.ink),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppPalette.pine,
          foregroundColor: Colors.white,
          minimumSize: const Size(0, 52),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),
      snackBarTheme: const SnackBarThemeData(behavior: SnackBarBehavior.floating),
    );
  }
}
