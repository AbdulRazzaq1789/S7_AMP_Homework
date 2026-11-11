import 'package:flutter/material.dart';

/// Centralized colors, corner radii, and styling for the homework project.
abstract final class AppPalette {
  static const Color canvas = Color(0xFFF5F6F2);
  static const Color ink = Color(0xFF192934);
  static const Color muted = Color(0xFF69777B);
  static const Color green = Color(0xFF168177);
  static const Color paleGreen = Color(0xFFE3F1EC);
  static const Color paleSand = Color(0xFFF4E7D5);
  static const Color border = Color(0xFFE0E8E2);
  static const Color white = Color(0xFFFFFFFF);
  static const Color danger = Color(0xFFC75543);
}

abstract final class AppSpace {
  static const double xs = 6;
  static const double sm = 12;
  static const double md = 18;
  static const double lg = 24;
  static const double xl = 32;
}

abstract final class AppRadius {
  static const double small = 13;
  static const double card = 25;
  static const double hero = 29;
}

abstract final class AppTheme {
  static ThemeData get light {
    final ColorScheme scheme = ColorScheme.fromSeed(
      seedColor: AppPalette.green,
      brightness: Brightness.light,
      primary: AppPalette.green,
      surface: AppPalette.white,
    );
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: AppPalette.canvas,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppPalette.canvas,
        foregroundColor: AppPalette.ink,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      textTheme: ThemeData.light().textTheme.apply(
        bodyColor: AppPalette.ink,
        displayColor: AppPalette.ink,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size(0, 52),
          backgroundColor: AppPalette.green,
          foregroundColor: AppPalette.white,
          padding: const EdgeInsets.symmetric(horizontal: 22),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.small),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(0, 46),
          foregroundColor: AppPalette.ink,
          side: const BorderSide(color: AppPalette.border),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.small),
          ),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppPalette.ink,
        contentTextStyle: const TextStyle(color: AppPalette.white),
        actionTextColor: const Color(0xFF9FE4C9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.small),
        ),
      ),
    );
  }
}
