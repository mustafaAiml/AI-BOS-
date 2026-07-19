import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/constants/colors.dart';
import '../core/constants/dimensions.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: AppColors.background,
        error: AppColors.error,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: AppColors.text,
      ),
      textTheme: GoogleFonts.outfitTextTheme(
        ThemeData.light().textTheme.copyWith(
              displayLarge: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.text),
              displayMedium: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.text),
              titleLarge: const TextStyle(fontWeight: FontWeight.w600, color: AppColors.text),
              titleMedium: const TextStyle(fontWeight: FontWeight.w500, color: AppColors.text),
              bodyLarge: const TextStyle(fontWeight: FontWeight.normal, color: AppColors.text),
              bodyMedium: const TextStyle(fontWeight: FontWeight.normal, color: AppColors.textSecondary),
            ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.card,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.backgroundDark,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primaryDark,
        secondary: AppColors.secondaryDark,
        surface: AppColors.backgroundDark,
        error: AppColors.error,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: AppColors.textDark,
      ),
      textTheme: GoogleFonts.outfitTextTheme(
        ThemeData.dark().textTheme.copyWith(
              displayLarge: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.textDark),
              displayMedium: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.textDark),
              titleLarge: const TextStyle(fontWeight: FontWeight.w600, color: AppColors.textDark),
              titleMedium: const TextStyle(fontWeight: FontWeight.w500, color: AppColors.textDark),
              bodyLarge: const TextStyle(fontWeight: FontWeight.normal, color: AppColors.textDark),
              bodyMedium: const TextStyle(fontWeight: FontWeight.normal, color: AppColors.textSecondaryDark),
            ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.cardDark,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
        ),
      ),
    );
  }
}
