import 'package:flutter/material.dart';

import 'app_palette.dart';

abstract final class AppTheme {
  static ThemeData dark() {
    const scheme = ColorScheme.dark(
      primary: AppPalette.gold,
      onPrimary: AppPalette.background,
      surface: AppPalette.background,
      onSurface: AppPalette.pearl,
      secondary: AppPalette.blush,
      onSecondary: AppPalette.pearl,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: scheme,
      scaffoldBackgroundColor: AppPalette.background,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: AppPalette.background,
        foregroundColor: AppPalette.pearl,
        scrolledUnderElevation: 0,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: AppPalette.pearl,
          fontSize: 16,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.4,
        ),
      ),
    );
  }
}
