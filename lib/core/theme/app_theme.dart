import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_design_system.dart';

/// Torii Mobile App Theme
/// 
/// Modern, vibrant and block-based theme for a Japanese learning platform.
/// Emphasizes engagement, clarity, and visual impact.


class AppTheme {
  AppTheme._();

  // ============================================================================
  // LIGHT THEME
  // ============================================================================
  
  static final light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: GoogleFonts.openSans().fontFamily,
    
    // Color Scheme
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      onPrimary: AppColors.textOnPrimary,
      primaryContainer: AppColors.primarySurface,
      onPrimaryContainer: AppColors.primaryDark,
      secondary: AppColors.accent,
      onSecondary: AppColors.textOnAccent,
      secondaryContainer: AppColors.accentSurface,
      onSecondaryContainer: AppColors.accentDark,
      tertiary: AppColors.detail,
      onTertiary: AppColors.white,
      error: AppColors.error,
      onError: AppColors.white,
      errorContainer: AppColors.errorLight,
      surface: AppColors.surface,
      onSurface: AppColors.textPrimary,
      surfaceContainerHighest: AppColors.surfaceVariant,
      outline: AppColors.grey300,
      outlineVariant: AppColors.grey200,
    ),
    
    scaffoldBackgroundColor: AppColors.background,
    
    // App Bar Theme - Minimal & Clean
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      titleTextStyle: TextStyle(
        fontSize: AppTypography.fontSizeLg,
        fontWeight: AppTypography.semiBold,
        color: AppColors.textPrimary,
        letterSpacing: AppTypography.letterSpacingTight,
      ),
      iconTheme: IconThemeData(
        color: AppColors.textPrimary,
        size: AppIconSize.md,
      ),
    ),
    
    // Card Theme - Minimal Glass-ish or Clean Border
    cardTheme: CardThemeData(
      color: AppColors.surface,
      elevation: 0,
      shadowColor: AppColors.textPrimary.withOpacity(0.05),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.card), // Uses the new 16.0 radius
        side: BorderSide(color: AppColors.grey200.withValues(alpha: 0.5), width: 1),
      ),
      margin: EdgeInsets.zero,
    ),

    
    // Input Decoration Theme - Sophisticated & Discrete
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.white,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: 8,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.input),
        borderSide:
            BorderSide(color: AppColors.grey200.withValues(alpha: 0.8), width: 1.2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.input),
        borderSide:
            BorderSide(color: AppColors.grey200.withValues(alpha: 0.8), width: 1.2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.input),
        borderSide: const BorderSide(color: AppColors.primary, width: 1.6),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.input),
        borderSide: const BorderSide(color: AppColors.error, width: 1.2),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.input),
        borderSide: const BorderSide(color: AppColors.error, width: 1.6),
      ),
      hintStyle: const TextStyle(
        color: AppColors.textTertiary,
        fontSize: AppTypography.fontSizeSm,
        fontWeight: AppTypography.regular,
      ),
    ),
 
    // Elevated Button Theme - Floating Premium
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textOnPrimary,
        elevation: 0,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.button),
        ),
        textStyle: const TextStyle(
          fontSize: AppTypography.fontSizeSm,
          fontWeight: AppTypography.bold,
          letterSpacing: AppTypography.letterSpacingNormal,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: 8,
        ),
        minimumSize: const Size(0, 44),
      ),
    ),

 
    // Outlined Button Theme
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primary,
        side: BorderSide(color: AppColors.primary.withValues(alpha: 0.2), width: 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.button),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: 8,
        ),
        minimumSize: const Size(0, 44),
        textStyle: const TextStyle(
          fontSize: AppTypography.fontSizeSm,
          fontWeight: AppTypography.semiBold,
        ),
      ),
    ),

 
    // Navigation Bar Theme - Premium Floating Look
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: AppColors.background.withValues(alpha: 0.94),
      elevation: 0,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      indicatorColor: AppColors.primarySurface,
      height: 80,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return const TextStyle(
            color: AppColors.primary,
            fontWeight: AppTypography.semiBold,
            fontSize: 12,
          );
        }
        return const TextStyle(
          color: AppColors.textTertiary,
          fontSize: 12,
          fontWeight: AppTypography.medium,
        );
      }),
      iconTheme: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return const IconThemeData(
            color: AppColors.primary,
            size: AppIconSize.md,
          );
        }
        return const IconThemeData(
          color: AppColors.textTertiary,
          size: AppIconSize.md,
        );
      }),
    ),
 
    // Text Theme - Clean Hierarchy
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: AppTypography.fontSize5xl,
        fontWeight: AppTypography.bold,
        color: AppColors.textPrimary,
        letterSpacing: AppTypography.letterSpacingTight,
        height: 1.1,
      ),
      displayMedium: TextStyle(
        fontSize: AppTypography.fontSize4xl,
        fontWeight: AppTypography.bold,
        color: AppColors.textPrimary,
        letterSpacing: AppTypography.letterSpacingTight,
        height: 1.1,
      ),
      headlineLarge: TextStyle(
        fontSize: AppTypography.fontSize3xl,
        fontWeight: AppTypography.extraBold,
        color: AppColors.textPrimary,
        letterSpacing: AppTypography.letterSpacingTight,
      ),
      headlineMedium: TextStyle(
        fontSize: AppTypography.fontSize2xl,
        fontWeight: AppTypography.bold,
        color: AppColors.textPrimary,
        letterSpacing: AppTypography.letterSpacingTight,
      ),
      titleLarge: TextStyle(
        fontSize: AppTypography.fontSizeXl,
        fontWeight: AppTypography.semiBold,
        color: AppColors.textPrimary,
      ),
      bodyLarge: TextStyle(
        fontSize: AppTypography.fontSizeMd,
        fontWeight: AppTypography.regular,
        color: AppColors.textPrimary,
        height: 1.6,
      ),
      bodyMedium: TextStyle(
        fontSize: AppTypography.fontSizeSm,
        fontWeight: AppTypography.regular,
        color: AppColors.textSecondary,
        height: 1.6,
      ),
    ),
  );
 
  static final dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: GoogleFonts.openSans().fontFamily,
    
    // Color Scheme
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryLight,
      onPrimary: AppColors.backgroundDark,
      primaryContainer: AppColors.primaryDark,
      onPrimaryContainer: AppColors.primaryLight,
      secondary: AppColors.accent,
      onSecondary: AppColors.backgroundDark,
      secondaryContainer: AppColors.accentDark,
      onSecondaryContainer: AppColors.accentLight,
      tertiary: AppColors.detail,
      error: AppColors.error,
      onError: AppColors.white,
      errorContainer: AppColors.errorDark,
      surface: AppColors.surfaceDark,
      onSurface: AppColors.textPrimaryDark,
      surfaceContainerHighest: AppColors.surfaceVariantDark,
      outline: AppColors.grey300,
      outlineVariant: AppColors.grey700,
    ),
    
    scaffoldBackgroundColor: AppColors.backgroundDark,
    
    // App Bar Theme
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      titleTextStyle: TextStyle(
        fontSize: AppTypography.fontSizeLg,
        fontWeight: AppTypography.semiBold,
        color: AppColors.textPrimaryDark,
      ),
      iconTheme: IconThemeData(
        color: AppColors.textPrimaryDark,
        size: AppIconSize.md,
      ),
    ),
    
    // Card Theme
    cardTheme: CardThemeData(
      color: AppColors.surfaceDark,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.card),
        side: const BorderSide(color: AppColors.grey300, width: 1),
      ),
    ),
 
    // Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryLight,
        foregroundColor: AppColors.backgroundDark,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.button),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: 8,
        ),
        minimumSize: const Size(0, 44),
      ),
    ),
 
    // Text Theme
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: AppTypography.fontSize5xl,
        fontWeight: AppTypography.bold,
        color: AppColors.textPrimaryDark,
        letterSpacing: AppTypography.letterSpacingTight,
        height: 1.1,
      ),
      headlineMedium: TextStyle(
        fontSize: AppTypography.fontSize2xl,
        fontWeight: AppTypography.bold,
        color: AppColors.textPrimaryDark,
      ),
      bodyLarge: TextStyle(
        fontSize: AppTypography.fontSizeMd,
        fontWeight: AppTypography.regular,
        color: AppColors.textPrimaryDark,
        height: 1.6,
      ),
      bodyMedium: TextStyle(
        fontSize: AppTypography.fontSizeSm,
        fontWeight: AppTypography.regular,
        color: AppColors.textSecondaryDark,
        height: 1.6,
      ),
    ),
  );
}
