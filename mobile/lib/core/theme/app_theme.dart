import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color _primaryColor = Color(0xFF1A73E8);
  static const Color _secondaryColor = Color(0xFF34A853);
  static const Color _errorColor = Color(0xFFEA4335);
  static const Color _surfaceColor = Color(0xFFF8F9FA);
  static const Color _backgroundWhite = Color(0xFFFFFFFF);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.light(
        primary: _primaryColor,
        secondary: _secondaryColor,
        error: _errorColor,
        surface: _surfaceColor,
      ),
      scaffoldBackgroundColor: _backgroundWhite,
      fontFamily: 'Kanit',
      appBarTheme: const AppBarTheme(
        backgroundColor: _backgroundWhite,
        foregroundColor: Color(0xFF202124),
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontFamily: 'Kanit',
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Color(0xFF202124),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _primaryColor,
          foregroundColor: Colors.white,
          minimumSize: const Size.fromHeight(52),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(
            fontFamily: 'Kanit',
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: _primaryColor,
          minimumSize: const Size.fromHeight(52),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          side: const BorderSide(color: _primaryColor),
          textStyle: const TextStyle(
            fontFamily: 'Kanit',
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      cardTheme: CardTheme(
        color: _backgroundWhite,
        elevation: 2,
        shadowColor: Colors.black.withOpacity(0.08),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: _surfaceColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFDADCE0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFDADCE0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: _primaryColor, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: _errorColor),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontFamily: 'Kanit',
          fontSize: 32,
          fontWeight: FontWeight.w700,
          color: Color(0xFF202124),
        ),
        displayMedium: TextStyle(
          fontFamily: 'Kanit',
          fontSize: 28,
          fontWeight: FontWeight.w600,
          color: Color(0xFF202124),
        ),
        titleLarge: TextStyle(
          fontFamily: 'Kanit',
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: Color(0xFF202124),
        ),
        titleMedium: TextStyle(
          fontFamily: 'Kanit',
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Color(0xFF202124),
        ),
        bodyLarge: TextStyle(
          fontFamily: 'Kanit',
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Color(0xFF202124),
        ),
        bodyMedium: TextStyle(
          fontFamily: 'Kanit',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Color(0xFF5F6368),
        ),
        labelLarge: TextStyle(
          fontFamily: 'Kanit',
          fontSize: 14,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.1,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: _backgroundWhite,
        selectedItemColor: _primaryColor,
        unselectedItemColor: Color(0xFF9AA0A6),
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
    );
  }
}
