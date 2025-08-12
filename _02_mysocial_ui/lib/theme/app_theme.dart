import 'package:flutter/material.dart';
import 'typography.dart';

class AppTheme {
  // Brand colors (seed + optional accents)
  static const Color primary = Color(0xFF2563EB);
  static const Color secondary = Color(0xFF10B981);
  static const Color error = Color(0xFFEF4444);

  // Legacy constants (dipakai untuk spacing/radius saja)
  static const BorderRadius radiusLg = BorderRadius.all(Radius.circular(16));

  // Spacing scale
  static const double sp8 = 8, sp12 = 12, sp16 = 16, sp20 = 20, sp24 = 24;

  static ThemeData _base({
    required Brightness brightness,
    required ColorScheme scheme,
  }) {
    final onSurface = scheme.onSurface; // THEME

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme,

      // ⬇️ MIGRASI: gunakan surface sebagai latar scaffold
      scaffoldBackgroundColor: scheme.surface, // THEME
      primaryColor: scheme.primary, // THEME

      appBarTheme: AppBarTheme(
        backgroundColor: scheme.surface, // THEME
        elevation: 0,
        iconTheme: IconThemeData(color: scheme.onSurface), // THEME
        titleTextStyle: AppTypography.textTheme(onSurface).titleSmall,
      ),

      textTheme: AppTypography.textTheme(onSurface), // THEME

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        // ⬇️ bisa pakai container tertinggi jika SDK kamu sudah punya properti ini.
        // kalau belum ada, biarkan pakai surface untuk kompatibilitas.
        fillColor: scheme.surface, // THEME
        border: OutlineInputBorder(
          borderRadius: radiusLg,
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 16,
        ),
      ),

      cardTheme: CardThemeData(
        color: scheme.surface, // THEME
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: radiusLg),
      ),
    );
  }

  // LIGHT
  static ThemeData get light {
    final scheme = ColorScheme.fromSeed(
      seedColor: primary,
      brightness: Brightness.light,
      // optional tweak
      error: error,
    ).copyWith(secondary: secondary);
    return _base(brightness: Brightness.light, scheme: scheme);
  }

  // DARK
  static ThemeData get dark {
    final scheme = ColorScheme.fromSeed(
      seedColor: primary,
      brightness: Brightness.dark,
      error: error,
    ).copyWith(secondary: secondary);
    return _base(brightness: Brightness.dark, scheme: scheme);
  }
}
