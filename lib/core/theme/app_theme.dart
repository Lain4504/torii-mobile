import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    
    // Color Scheme
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      onPrimary: AppColors.primaryForeground,
      primaryContainer: Color(0xFFE0E7FF), // Subtle primary container
      onPrimaryContainer: AppColors.primary,
      secondary: AppColors.secondary,
      onSecondary: AppColors.secondaryForeground,
      error: AppColors.destructive,
      onError: AppColors.destructiveForeground,
      surface: AppColors.background,
      onSurface: AppColors.foreground,
      outline: AppColors.border,
      shadow: Color(0xFF000000),
    ),
    
    scaffoldBackgroundColor: AppColors.background,
    
    // App Bar Theme - Clean & Floating
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      titleTextStyle: TextStyle(
        fontSize: AppTypography.fontSizeLg,
        fontWeight: AppTypography.bold,
        color: AppColors.foreground,
        letterSpacing: AppTypography.letterSpacingTight,
      ),
      iconTheme: IconThemeData(
        color: AppColors.foreground,
        size: AppIconSize.md,
      ),
    ),
    
    // Card Theme - Shadcn Style
    cardTheme: CardThemeData(
      color: AppColors.card,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.card),
        side: const BorderSide(color: AppColors.border, width: 1),
      ),
      margin: EdgeInsets.zero,
    ),

    // Input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.background,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.md,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.input),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.input),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.input),
        borderSide: const BorderSide(color: AppColors.primary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.input),
        borderSide: const BorderSide(color: AppColors.destructive),
      ),
      hintStyle: const TextStyle(
        color: AppColors.textTertiary,
        fontSize: AppTypography.fontSizeSm,
      ),
    ),
 
    // Elevated Button Theme - Bolder & Vibrant
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.primaryForeground,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.button),
        ),
        textStyle: const TextStyle(
          fontSize: AppTypography.fontSizeMd,
          fontWeight: AppTypography.bold,
          letterSpacing: AppTypography.letterSpacingNormal,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.xl,
          vertical: AppSpacing.md,
        ),
        minimumSize: const Size(0, 52),
      ),
    ),

    // Navigation Bar Theme
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: AppColors.background,
      elevation: 0,
      indicatorColor: AppColors.primary.withValues(alpha: 0.1),
      height: 70,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return const TextStyle(
            color: AppColors.primary,
            fontWeight: AppTypography.bold,
            fontSize: 11,
          );
        }
        return const TextStyle(
          color: AppColors.mutedForeground,
          fontSize: 11,
          fontWeight: AppTypography.medium,
        );
      }),
      iconTheme: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return const IconThemeData(
            color: AppColors.primary,
            size: 22,
          );
        }
        return const IconThemeData(
          color: AppColors.mutedForeground,
          size: 22,
        );
      }),
    ),
 
    // Text Theme
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: AppTypography.fontSize5xl,
        fontWeight: AppTypography.black,
        color: AppColors.foreground,
        letterSpacing: AppTypography.letterSpacingTight,
        height: 1.1,
      ),
      headlineLarge: TextStyle(
        fontSize: AppTypography.fontSize3xl,
        fontWeight: AppTypography.extraBold,
        color: AppColors.foreground,
        letterSpacing: AppTypography.letterSpacingTight,
      ),
      headlineMedium: TextStyle(
        fontSize: AppTypography.fontSize2xl,
        fontWeight: AppTypography.bold,
        color: AppColors.foreground,
        letterSpacing: AppTypography.letterSpacingTight,
      ),
      titleLarge: TextStyle(
        fontSize: AppTypography.fontSizeXl,
        fontWeight: AppTypography.bold,
        color: AppColors.foreground,
      ),
      bodyLarge: TextStyle(
        fontSize: AppTypography.fontSizeMd,
        fontWeight: AppTypography.medium,
        color: AppColors.foreground,
        height: 1.5,
      ),
      bodyMedium: TextStyle(
        fontSize: AppTypography.fontSizeSm,
        fontWeight: AppTypography.regular,
        color: AppColors.mutedForeground,
        height: 1.5,
      ),
    ),
  );
 
  static final dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    
    // Color Scheme
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryDark,
      onPrimary: AppColors.foreground, // Dark foreground is light stone
      secondary: AppColors.cardDark,
      onSecondary: AppColors.foregroundDark,
      error: AppColors.destructive,
      surface: AppColors.backgroundDark,
      onSurface: AppColors.foregroundDark,
      outline: Colors.white10,
    ),
    
    scaffoldBackgroundColor: AppColors.backgroundDark,
    
    // App Bar Theme
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.backgroundDark,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      titleTextStyle: TextStyle(
        fontSize: AppTypography.fontSizeLg,
        fontWeight: AppTypography.bold,
        color: AppColors.foregroundDark,
      ),
      iconTheme: IconThemeData(
        color: AppColors.foregroundDark,
        size: AppIconSize.md,
      ),
    ),
    
    // Card Theme
    cardTheme: CardThemeData(
      color: AppColors.cardDark,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.card),
        side: const BorderSide(color: Colors.white10, width: 1),
      ),
    ),

    // Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryDark,
        foregroundColor: AppColors.backgroundDark,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.button),
        ),
        minimumSize: const Size(0, 52),
      ),
    ),
 
    // Text Theme
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: AppTypography.fontSize5xl,
        fontWeight: AppTypography.black,
        color: AppColors.foregroundDark,
        letterSpacing: AppTypography.letterSpacingTight,
      ),
      headlineMedium: TextStyle(
        fontSize: AppTypography.fontSize2xl,
        fontWeight: AppTypography.bold,
        color: AppColors.foregroundDark,
      ),
      bodyLarge: TextStyle(
        fontSize: AppTypography.fontSizeMd,
        fontWeight: AppTypography.regular,
        color: AppColors.foregroundDark,
        height: 1.5,
      ),
      bodyMedium: TextStyle(
        fontSize: AppTypography.fontSizeSm,
        fontWeight: AppTypography.regular,
        color: AppColors.mutedForeground,
        height: 1.5,
      ),
    ),
  );
}
