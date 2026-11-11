import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Centralized, consistent light/dark design tokens and typography.
abstract final class AppTheme {
  static const Color indigo = Color(0xFF5146C7);
  static const Color darkIndigo = Color(0xFFA9A3FF);
  static const Color mint = Color(0xFF1EA889);

  static ThemeData light({bool useCustomFont = true}) =>
      _build(Brightness.light, useCustomFont: useCustomFont);

  static ThemeData dark({bool useCustomFont = true}) =>
      _build(Brightness.dark, useCustomFont: useCustomFont);

  static ThemeData _build(
    Brightness brightness, {
    required bool useCustomFont,
  }) {
    final isDark = brightness == Brightness.dark;
    final scheme = ColorScheme.fromSeed(
      seedColor: indigo,
      brightness: brightness,
    ).copyWith(
      primary: isDark ? darkIndigo : indigo,
      secondary: isDark ? const Color(0xFF78DBC0) : mint,
      surface: isDark ? const Color(0xFF17202E) : Colors.white,
      onSurface: isDark ? const Color(0xFFEAF0FA) : const Color(0xFF20283B),
    );

    final base = ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor:
          isDark ? const Color(0xFF0F1724) : const Color(0xFFF5F7FB),
    );
    // Manrope is loaded and registered by google_fonts on the first launch.
    final type = useCustomFont
        ? GoogleFonts.manropeTextTheme(base.textTheme)
        : base.textTheme;

    return base.copyWith(
      textTheme: type.apply(
        displayColor: scheme.onSurface,
        bodyColor: scheme.onSurface,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: base.scaffoldBackgroundColor,
        foregroundColor: scheme.onSurface,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        margin: EdgeInsets.zero,
        color: scheme.surface,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
          side: BorderSide(
            color: scheme.outlineVariant.withValues(alpha: isDark ? 0.35 : 0.48),
          ),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size(0, 46),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(0, 44),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
      dividerTheme: DividerThemeData(
        color: scheme.outlineVariant.withValues(alpha: 0.55),
        thickness: 1,
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: scheme.primary,
        linearTrackColor: scheme.primary.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}
