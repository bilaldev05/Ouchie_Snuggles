import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  // Brand Colors
  static const Color primary = Color(0xFF2659BF);
  static const Color secondary = Color(0xFF3377FF);
  static const Color tertiary = Color(0xFF99BBFF);
  static const Color background = Color(0xFFE3EDFF);

  // Accent Brand Colors (for titles like "Ouchie Snuggles")
  static const Color brandYellowDark = Color(0xFFFBC02D); // outline
  static const Color brandYellowLight = Color(0xFFFFF59D); // fill
  static const Color brandYellow = Color(0xFFFFEB3B); // main
  static const Color accent = brandYellow;

  // Extra Palette
  static const Color pink300 = Color(0xFFF06292); // ✅ Pink-300

  // Secondary Palette
  static const Color error = Color(0xFFFF3B3B);

  // Text Colors
  static const Color textPrimary = Color(0xFF3A3A3C);
  static const Color textSecondary = Color(0xFF6B7588);
  static const Color textTertiary = Color(0xFF8F90A6);
  static const Color textDisabled = Color(0xFFC7C9D9);

  // State Colors
  static const Color success = Color(0xFF06C270);
  static const Color info = Color(0xFF0063F7);
}

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.background,

    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primary,
      onPrimary: Colors.white,
      secondary: AppColors.secondary,
      onSecondary: Colors.white,
      tertiary: AppColors.tertiary,
      error: AppColors.error,
      onError: Colors.white,
      background: AppColors.background,
      onBackground: AppColors.textPrimary,
      surface: Colors.white,
      onSurface: AppColors.textPrimary,
    ),

    textTheme: TextTheme(
      displayLarge: GoogleFonts.cherryBombOne(
        fontSize: 48,
        fontWeight: FontWeight.bold,
        color: AppColors.brandYellowLight,
        shadows: const [
          Shadow(
            blurRadius: 6,
            offset: Offset(2, 2),
            color: AppColors.brandYellowDark,
          ),
        ],
      ),
      headlineMedium: GoogleFonts.cherryBombOne(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
      ),
      titleMedium: GoogleFonts.rem(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      ),
      bodyMedium: GoogleFonts.rem(fontSize: 16, color: AppColors.textSecondary),
      bodySmall: GoogleFonts.rem(fontSize: 14, color: AppColors.textTertiary),
      labelLarge: GoogleFonts.rem(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.primary,
      ),
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: GoogleFonts.rem(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
      ),
      iconTheme: const IconThemeData(color: AppColors.textPrimary),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        textStyle: GoogleFonts.rem(fontWeight: FontWeight.w600, fontSize: 16),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.secondary,
        textStyle: GoogleFonts.rem(fontWeight: FontWeight.w600, fontSize: 14),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.textDisabled),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.info),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.error),
      ),
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.success,
      foregroundColor: Colors.white,
    ),

    dividerTheme: const DividerThemeData(
      color: AppColors.textDisabled,
      thickness: 1,
    ),
  );
}
