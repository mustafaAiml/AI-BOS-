import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Primary Color: Royal Blue (#2563EB)
  static const Color primaryColor = Color(0xff2563eb);
  static const Color backgroundColor = Colors.white;
  static const Color cardColor = Color(0xfff3f4f6);
  static const Color textColor = Color(0xff1f2937);
  static const Color textSecondaryColor = Color(0xff6b7280);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: backgroundColor,
      colorScheme: const ColorScheme.light(
        primary: primaryColor,
        onPrimary: Colors.white,
        surface: backgroundColor,
        onSurface: textColor,
        secondary: Color(0xff3b82f6),
      ),
      textTheme: GoogleFonts.poppinsTextTheme(
        ThemeData.light().textTheme.copyWith(
          displayLarge: const TextStyle(fontWeight: FontWeight.bold, color: textColor),
          displayMedium: const TextStyle(fontWeight: FontWeight.bold, color: textColor),
          titleLarge: const TextStyle(fontWeight: FontWeight.w600, color: textColor),
          titleMedium: const TextStyle(fontWeight: FontWeight.w500, color: textColor),
          bodyLarge: const TextStyle(fontWeight: FontWeight.normal, color: textColor),
          bodyMedium: const TextStyle(fontWeight: FontWeight.normal, color: textSecondaryColor),
        ),
      ),
      cardTheme: CardThemeData(
        color: cardColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xffe5e7eb)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xffe5e7eb)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: primaryColor, width: 2),
        ),
        hintStyle: const TextStyle(color: textSecondaryColor, fontSize: 14),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: primaryColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primaryColor,
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    // For Version 1, we focus on light theme.
    // We keep darkTheme as a fallback matching light theme properties.
    return lightTheme;
  }
}
