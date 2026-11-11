import 'package:flutter/material.dart';

abstract final class AppPalette {
  static const background = Color(0xFF071420);
  static const surface = Color(0xFF122638);
  static const border = Color(0xFF294458);
  static const muted = Color(0xFF9CB1C0);
  static const cream = Color(0xFFF4F1E9);
  static const turquoise = Color(0xFF6EDCC7);
}

abstract final class AppTheme {
  static ThemeData get dark => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppPalette.background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppPalette.turquoise,
          brightness: Brightness.dark,
          surface: AppPalette.surface,
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(fontWeight: FontWeight.w800, letterSpacing: -1.5),
          titleLarge: TextStyle(fontWeight: FontWeight.w700, letterSpacing: -0.5),
          bodyMedium: TextStyle(height: 1.5),
        ),
        snackBarTheme: SnackBarThemeData(
          backgroundColor: AppPalette.surface,
          contentTextStyle: const TextStyle(color: AppPalette.cream),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
      );
}
