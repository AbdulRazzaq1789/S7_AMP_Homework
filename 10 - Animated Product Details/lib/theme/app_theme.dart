import 'package:flutter/material.dart';

abstract final class AppTheme {
  static ThemeData light() {
    const seed = Color(0xFF6350BE);
    final scheme = ColorScheme.fromSeed(seedColor: seed);
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: const Color(0xFFF7F6FB),
      appBarTheme: const AppBarTheme(backgroundColor: Color(0xFFF7F6FB)),
      cardTheme: const CardThemeData(elevation: 0, margin: EdgeInsets.zero),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(minimumSize: const Size(0, 54)),
      ),
    );
  }
}
