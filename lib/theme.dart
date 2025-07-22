import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LightModeColors {
  // Tutoring Platform Colors - Trust Blue Primary
  static const lightPrimary = Color(0xFF4A90E2);
  static const lightOnPrimary = Color(0xFFFFFFFF);
  static const lightPrimaryContainer = Color(0xFFE3F2FD);
  static const lightOnPrimaryContainer = Color(0xFF1565C0);
  // Success Green Secondary
  static const lightSecondary = Color(0xFF7ED321);
  static const lightOnSecondary = Color(0xFFFFFFFF);
  // Warm Orange Accent
  static const lightTertiary = Color(0xFFF5A623);
  static const lightOnTertiary = Color(0xFFFFFFFF);
  static const lightError = Color(0xFFD0021B);
  static const lightOnError = Color(0xFFFFFFFF);
  static const lightErrorContainer = Color(0xFFFFDAD6);
  static const lightOnErrorContainer = Color(0xFF410002);
  static const lightInversePrimary = Color(0xFF90CAF9);
  static const lightShadow = Color(0xFF000000);
  static const lightSurface = Color(0xFFF8F9FA);
  static const lightOnSurface = Color(0xFF2C3E50);
  static const lightOnSurfaceVariant = Color(0xFF7F8C8D);
  static const lightAppBarBackground = Color(0xFFE3F2FD);
}

class DarkModeColors {
  // Dark mode variants of tutoring platform colors
  static const darkPrimary = Color(0xFF90CAF9);
  static const darkOnPrimary = Color(0xFF1565C0);
  static const darkPrimaryContainer = Color(0xFF1976D2);
  static const darkOnPrimaryContainer = Color(0xFFE3F2FD);
  static const darkSecondary = Color(0xFFA5D162);
  static const darkOnSecondary = Color(0xFF2E7D0D);
  static const darkTertiary = Color(0xFFFFC062);
  static const darkOnTertiary = Color(0xFF8B4513);
  static const darkError = Color(0xFFFFB4AB);
  static const darkOnError = Color(0xFF690005);
  static const darkErrorContainer = Color(0xFF93000A);
  static const darkOnErrorContainer = Color(0xFFFFDAD6);
  static const darkInversePrimary = Color(0xFF4A90E2);
  static const darkShadow = Color(0xFF000000);
  static const darkSurface = Color(0xFF121212);
  static const darkOnSurface = Color(0xFFE0E0E0);
  static const darkOnSurfaceVariant = Color(0xFFBDBDBD);
  static const darkAppBarBackground = Color(0xFF1976D2);
}

class FontSizes {
  // Tutoring Platform Typography Scale
  static const double displayLarge = 57.0;
  static const double displayMedium = 45.0;
  static const double displaySmall = 36.0;
  static const double headlineLarge = 28.0; // H1
  static const double headlineMedium = 24.0; // H2
  static const double headlineSmall = 20.0; // H3
  static const double titleLarge = 22.0;
  static const double titleMedium = 18.0;
  static const double titleSmall = 16.0;
  static const double labelLarge = 16.0;
  static const double labelMedium = 14.0;
  static const double labelSmall = 12.0;
  static const double bodyLarge = 16.0; // Body1
  static const double bodyMedium = 14.0; // Body2
  static const double bodySmall = 12.0; // Caption
}

ThemeData get lightTheme => ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.light(
    primary: LightModeColors.lightPrimary,
    onPrimary: LightModeColors.lightOnPrimary,
    primaryContainer: LightModeColors.lightPrimaryContainer,
    onPrimaryContainer: LightModeColors.lightOnPrimaryContainer,
    secondary: LightModeColors.lightSecondary,
    onSecondary: LightModeColors.lightOnSecondary,
    tertiary: LightModeColors.lightTertiary,
    onTertiary: LightModeColors.lightOnTertiary,
    error: LightModeColors.lightError,
    onError: LightModeColors.lightOnError,
    errorContainer: LightModeColors.lightErrorContainer,
    onErrorContainer: LightModeColors.lightOnErrorContainer,
    inversePrimary: LightModeColors.lightInversePrimary,
    shadow: LightModeColors.lightShadow,
    surface: LightModeColors.lightSurface,
    onSurface: LightModeColors.lightOnSurface,
    onSurfaceVariant: LightModeColors.lightOnSurfaceVariant,
  ),
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(
    backgroundColor: LightModeColors.lightAppBarBackground,
    foregroundColor: LightModeColors.lightOnPrimaryContainer,
    elevation: 0,
  ),
  textTheme: TextTheme(
    displayLarge: GoogleFonts.poppins(
      fontSize: FontSizes.displayLarge,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: GoogleFonts.poppins(
      fontSize: FontSizes.displayMedium,
      fontWeight: FontWeight.bold,
    ),
    displaySmall: GoogleFonts.poppins(
      fontSize: FontSizes.displaySmall,
      fontWeight: FontWeight.w600,
    ),
    headlineLarge: GoogleFonts.poppins(
      fontSize: FontSizes.headlineLarge,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: GoogleFonts.poppins(
      fontSize: FontSizes.headlineMedium,
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: GoogleFonts.poppins(
      fontSize: FontSizes.headlineSmall,
      fontWeight: FontWeight.w600,
    ),
    titleLarge: GoogleFonts.poppins(
      fontSize: FontSizes.titleLarge,
      fontWeight: FontWeight.w500,
    ),
    titleMedium: GoogleFonts.poppins(
      fontSize: FontSizes.titleMedium,
      fontWeight: FontWeight.w500,
    ),
    titleSmall: GoogleFonts.poppins(
      fontSize: FontSizes.titleSmall,
      fontWeight: FontWeight.w500,
    ),
    labelLarge: GoogleFonts.inter(
      fontSize: FontSizes.labelLarge,
      fontWeight: FontWeight.w500,
    ),
    labelMedium: GoogleFonts.inter(
      fontSize: FontSizes.labelMedium,
      fontWeight: FontWeight.w500,
    ),
    labelSmall: GoogleFonts.inter(
      fontSize: FontSizes.labelSmall,
      fontWeight: FontWeight.w500,
    ),
    bodyLarge: GoogleFonts.inter(
      fontSize: FontSizes.bodyLarge,
      fontWeight: FontWeight.normal,
    ),
    bodyMedium: GoogleFonts.inter(
      fontSize: FontSizes.bodyMedium,
      fontWeight: FontWeight.normal,
    ),
    bodySmall: GoogleFonts.inter(
      fontSize: FontSizes.bodySmall,
      fontWeight: FontWeight.normal,
    ),
  ),
);

ThemeData get darkTheme => ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.dark(
    primary: DarkModeColors.darkPrimary,
    onPrimary: DarkModeColors.darkOnPrimary,
    primaryContainer: DarkModeColors.darkPrimaryContainer,
    onPrimaryContainer: DarkModeColors.darkOnPrimaryContainer,
    secondary: DarkModeColors.darkSecondary,
    onSecondary: DarkModeColors.darkOnSecondary,
    tertiary: DarkModeColors.darkTertiary,
    onTertiary: DarkModeColors.darkOnTertiary,
    error: DarkModeColors.darkError,
    onError: DarkModeColors.darkOnError,
    errorContainer: DarkModeColors.darkErrorContainer,
    onErrorContainer: DarkModeColors.darkOnErrorContainer,
    inversePrimary: DarkModeColors.darkInversePrimary,
    shadow: DarkModeColors.darkShadow,
    surface: DarkModeColors.darkSurface,
    onSurface: DarkModeColors.darkOnSurface,
    onSurfaceVariant: DarkModeColors.darkOnSurfaceVariant,
  ),
  brightness: Brightness.dark,
  appBarTheme: AppBarTheme(
    backgroundColor: DarkModeColors.darkAppBarBackground,
    foregroundColor: DarkModeColors.darkOnPrimaryContainer,
    elevation: 0,
  ),
  textTheme: TextTheme(
    displayLarge: GoogleFonts.poppins(
      fontSize: FontSizes.displayLarge,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: GoogleFonts.poppins(
      fontSize: FontSizes.displayMedium,
      fontWeight: FontWeight.bold,
    ),
    displaySmall: GoogleFonts.poppins(
      fontSize: FontSizes.displaySmall,
      fontWeight: FontWeight.w600,
    ),
    headlineLarge: GoogleFonts.poppins(
      fontSize: FontSizes.headlineLarge,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: GoogleFonts.poppins(
      fontSize: FontSizes.headlineMedium,
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: GoogleFonts.poppins(
      fontSize: FontSizes.headlineSmall,
      fontWeight: FontWeight.w600,
    ),
    titleLarge: GoogleFonts.poppins(
      fontSize: FontSizes.titleLarge,
      fontWeight: FontWeight.w500,
    ),
    titleMedium: GoogleFonts.poppins(
      fontSize: FontSizes.titleMedium,
      fontWeight: FontWeight.w500,
    ),
    titleSmall: GoogleFonts.poppins(
      fontSize: FontSizes.titleSmall,
      fontWeight: FontWeight.w500,
    ),
    labelLarge: GoogleFonts.inter(
      fontSize: FontSizes.labelLarge,
      fontWeight: FontWeight.w500,
    ),
    labelMedium: GoogleFonts.inter(
      fontSize: FontSizes.labelMedium,
      fontWeight: FontWeight.w500,
    ),
    labelSmall: GoogleFonts.inter(
      fontSize: FontSizes.labelSmall,
      fontWeight: FontWeight.w500,
    ),
    bodyLarge: GoogleFonts.inter(
      fontSize: FontSizes.bodyLarge,
      fontWeight: FontWeight.normal,
    ),
    bodyMedium: GoogleFonts.inter(
      fontSize: FontSizes.bodyMedium,
      fontWeight: FontWeight.normal,
    ),
    bodySmall: GoogleFonts.inter(
      fontSize: FontSizes.bodySmall,
      fontWeight: FontWeight.normal,
    ),
  ),
);
