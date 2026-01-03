import 'package:flutter/material.dart';
import '../constants/app_design_system.dart';

class AppTheme {
  AppTheme._();

  static final light = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      onPrimary: AppColors.textOnPrimary,
      secondary: AppColors.primaryLight,
      error: AppColors.error,
      surface: AppColors.surface,
      onSurface: AppColors.textPrimary,
    ),
    scaffoldBackgroundColor: AppColors.background,
    
    // Input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.grey50,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.md,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
        borderSide: BorderSide(color: AppColors.grey300),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
        borderSide: BorderSide(color: AppColors.grey300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
        borderSide: const BorderSide(color: AppColors.primary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
        borderSide: BorderSide(color: AppColors.error),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
        borderSide: BorderSide(color: AppColors.error, width: 2),
      ),
    ),

    // Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textOnPrimary,
        elevation: AppElevation.none,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
        textStyle: const TextStyle(
          fontSize: AppTypography.fontSizeMd,
          fontWeight: AppTypography.bold,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
      ),
    ),

    // Text Button Theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primary,
        textStyle: const TextStyle(
          fontWeight: AppTypography.semiBold,
        ),
      ),
    ),

    // Icon Theme
    iconTheme: const IconThemeData(
      color: AppColors.grey500,
    ),

    // Text Theme
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: AppTypography.fontSize4xl,
        fontWeight: AppTypography.bold,
        color: AppColors.textPrimary,
        letterSpacing: AppTypography.letterSpacingTight,
      ),
      headlineLarge: TextStyle(
        fontSize: AppTypography.fontSize3xl,
        fontWeight: AppTypography.bold,
        color: AppColors.textPrimary,
        letterSpacing: AppTypography.letterSpacingTight,
      ),
      titleLarge: TextStyle(
        fontSize: AppTypography.fontSize2xl,
        fontWeight: AppTypography.semiBold,
        color: AppColors.textPrimary,
      ),
      bodyLarge: TextStyle(
        fontSize: AppTypography.fontSizeMd,
        color: AppColors.textPrimary,
        height: AppTypography.lineHeightNormal,
      ),
      bodyMedium: TextStyle(
        fontSize: AppTypography.fontSizeSm,
        color: AppColors.textSecondary,
        height: AppTypography.lineHeightNormal,
      ),
    ),
  );

  static final dark = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.dark(
      primary: AppColors.primary,
      onPrimary: AppColors.textOnPrimary,
      secondary: AppColors.primaryLight,
      error: AppColors.error,
      surface: AppColors.grey900,
      onSurface: AppColors.white,
    ),
    scaffoldBackgroundColor: AppColors.grey900,
    // Add dark theme customizations here
  );
}
