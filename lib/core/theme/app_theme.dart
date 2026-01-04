import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/app_design_system.dart';

/// Torii Mobile App Theme
/// 
/// Minimalist, zen-inspired theme for a Japanese learning platform.
/// Emphasizes clarity, calmness, and focus.

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
      onPrimary: AppColors.textOnPrimary,
      primaryContainer: AppColors.primarySurface,
      onPrimaryContainer: AppColors.primaryDark,
      secondary: AppColors.accent,
      onSecondary: AppColors.textOnAccent,
      secondaryContainer: AppColors.accentSurface,
      onSecondaryContainer: AppColors.accentDark,
      tertiary: AppColors.accent,
      error: AppColors.error,
      onError: AppColors.white,
      errorContainer: AppColors.errorLight,
      surface: AppColors.surface,
      onSurface: AppColors.textPrimary,
      surfaceContainerHighest: AppColors.surfaceVariant,
      outline: AppColors.borderLight,
      outlineVariant: AppColors.grey200,
    ),
    
    scaffoldBackgroundColor: AppColors.background,
    
    // App Bar Theme - Minimal & Clean
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      titleTextStyle: TextStyle(
        fontSize: AppTypography.fontSizeXl,
        fontWeight: AppTypography.semiBold,
        color: AppColors.textPrimary,
        letterSpacing: AppTypography.letterSpacingTight,
      ),
      iconTheme: IconThemeData(
        color: AppColors.textPrimary,
        size: AppIconSize.md,
      ),
    ),
    
    // Card Theme - Subtle Elevation
    cardTheme: CardThemeData(
      color: AppColors.surface,
      elevation: 0,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.card),
        side: const BorderSide(color: AppColors.borderLight, width: 1),
      ),
      margin: EdgeInsets.zero,
    ),
    
    // Input Decoration Theme - Clean & Focused
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surfaceVariant,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.md,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.input),
        borderSide: const BorderSide(color: AppColors.borderLight),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.input),
        borderSide: const BorderSide(color: AppColors.borderLight),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.input),
        borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.input),
        borderSide: const BorderSide(color: AppColors.error),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.input),
        borderSide: const BorderSide(color: AppColors.error, width: 1.5),
      ),
      hintStyle: const TextStyle(
        color: AppColors.textTertiary,
        fontSize: AppTypography.fontSizeMd,
        fontWeight: AppTypography.regular,
      ),
      labelStyle: const TextStyle(
        color: AppColors.textSecondary,
        fontSize: AppTypography.fontSizeSm,
        fontWeight: AppTypography.medium,
      ),
    ),

    // Elevated Button Theme - Primary Action
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
          fontSize: AppTypography.fontSizeMd,
          fontWeight: AppTypography.semiBold,
          letterSpacing: AppTypography.letterSpacingNormal,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
        minimumSize: const Size(0, 52),
      ),
    ),

    // Outlined Button Theme - Secondary Action
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primary,
        side: const BorderSide(color: AppColors.borderLight, width: 1.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.button),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
        minimumSize: const Size(0, 52),
      ),
    ),

    // Text Button Theme - Tertiary Action
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primary,
        textStyle: const TextStyle(
          fontWeight: AppTypography.semiBold,
          fontSize: AppTypography.fontSizeMd,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
      ),
    ),

    // Icon Theme
    iconTheme: const IconThemeData(
      color: AppColors.textSecondary,
      size: AppIconSize.md,
    ),

    // Bottom Navigation Bar Theme - Clean & Minimal
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: AppColors.surface,
      elevation: 0,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      indicatorColor: AppColors.primarySurface,
      height: 72,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return const TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.w600,
            fontSize: 12,
          );
        }
        return const TextStyle(
          color: AppColors.textTertiary,
          fontSize: 12,
          fontWeight: FontWeight.w500,
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

    // Divider Theme
    dividerTheme: const DividerThemeData(
      color: AppColors.borderLight,
      thickness: 1,
      space: AppSpacing.md,
    ),

    // Chip Theme - Minimal Pills
    chipTheme: ChipThemeData(
      backgroundColor: AppColors.surfaceVariant,
      selectedColor: AppColors.primarySurface,
      labelStyle: const TextStyle(
        color: AppColors.textSecondary,
        fontSize: AppTypography.fontSizeSm,
        fontWeight: AppTypography.medium,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.chip),
        side: const BorderSide(color: AppColors.borderLight),
      ),
    ),

    // Text Theme - Clean Hierarchy
    textTheme: const TextTheme(
      // Display Styles - Hero Text
      displayLarge: TextStyle(
        fontSize: AppTypography.fontSize5xl,
        fontWeight: AppTypography.bold,
        color: AppColors.textPrimary,
        letterSpacing: AppTypography.letterSpacingTight,
        height: AppTypography.lineHeightTight,
      ),
      displayMedium: TextStyle(
        fontSize: AppTypography.fontSize4xl,
        fontWeight: AppTypography.bold,
        color: AppColors.textPrimary,
        letterSpacing: AppTypography.letterSpacingTight,
        height: AppTypography.lineHeightTight,
      ),
      displaySmall: TextStyle(
        fontSize: AppTypography.fontSize3xl,
        fontWeight: AppTypography.semiBold,
        color: AppColors.textPrimary,
        letterSpacing: AppTypography.letterSpacingTight,
        height: AppTypography.lineHeightSnug,
      ),
      
      // Headline Styles - Section Headers
      headlineLarge: TextStyle(
        fontSize: AppTypography.fontSize3xl,
        fontWeight: AppTypography.semiBold,
        color: AppColors.textPrimary,
        height: AppTypography.lineHeightSnug,
      ),
      headlineMedium: TextStyle(
        fontSize: AppTypography.fontSize2xl,
        fontWeight: AppTypography.semiBold,
        color: AppColors.textPrimary,
        height: AppTypography.lineHeightSnug,
      ),
      headlineSmall: TextStyle(
        fontSize: AppTypography.fontSizeXl,
        fontWeight: AppTypography.semiBold,
        color: AppColors.textPrimary,
        height: AppTypography.lineHeightNormal,
      ),
      
      // Title Styles - Card Headers
      titleLarge: TextStyle(
        fontSize: AppTypography.fontSizeLg,
        fontWeight: AppTypography.semiBold,
        color: AppColors.textPrimary,
        height: AppTypography.lineHeightNormal,
      ),
      titleMedium: TextStyle(
        fontSize: AppTypography.fontSizeMd,
        fontWeight: AppTypography.medium,
        color: AppColors.textPrimary,
        height: AppTypography.lineHeightNormal,
      ),
      titleSmall: TextStyle(
        fontSize: AppTypography.fontSizeSm,
        fontWeight: AppTypography.medium,
        color: AppColors.textSecondary,
        height: AppTypography.lineHeightNormal,
      ),
      
      // Body Styles - Content Text
      bodyLarge: TextStyle(
        fontSize: AppTypography.fontSizeMd,
        fontWeight: AppTypography.regular,
        color: AppColors.textPrimary,
        height: AppTypography.lineHeightRelaxed,
      ),
      bodyMedium: TextStyle(
        fontSize: AppTypography.fontSizeSm,
        fontWeight: AppTypography.regular,
        color: AppColors.textSecondary,
        height: AppTypography.lineHeightRelaxed,
      ),
      bodySmall: TextStyle(
        fontSize: AppTypography.fontSizeXs,
        fontWeight: AppTypography.regular,
        color: AppColors.textTertiary,
        height: AppTypography.lineHeightNormal,
      ),
      
      // Label Styles - UI Labels
      labelLarge: TextStyle(
        fontSize: AppTypography.fontSizeMd,
        fontWeight: AppTypography.medium,
        color: AppColors.textPrimary,
        letterSpacing: AppTypography.letterSpacingNormal,
      ),
      labelMedium: TextStyle(
        fontSize: AppTypography.fontSizeSm,
        fontWeight: AppTypography.medium,
        color: AppColors.textSecondary,
      ),
      labelSmall: TextStyle(
        fontSize: AppTypography.fontSizeXs,
        fontWeight: AppTypography.medium,
        color: AppColors.textTertiary,
      ),
    ),
    
    // List Tile Theme
    listTileTheme: const ListTileThemeData(
      contentPadding: EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      minLeadingWidth: 0,
      horizontalTitleGap: AppSpacing.md,
    ),
    
    // Bottom Sheet Theme
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.surface,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.xl)),
      ),
    ),
    
    // Dialog Theme
    dialogTheme: DialogThemeData(
      backgroundColor: AppColors.surface,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.xl),
      ),
    ),
  );

  // ============================================================================
  // DARK THEME
  // ============================================================================
  
  static final dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    
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
      tertiary: AppColors.accent,
      error: AppColors.error,
      onError: AppColors.white,
      errorContainer: AppColors.errorDark,
      surface: AppColors.surfaceDark,
      onSurface: AppColors.textPrimaryDark,
      surfaceContainerHighest: AppColors.surfaceVariantDark,
      outline: AppColors.borderDark,
      outlineVariant: AppColors.grey700,
    ),
    
    scaffoldBackgroundColor: AppColors.backgroundDark,
    
    // App Bar Theme
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.backgroundDark,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      titleTextStyle: TextStyle(
        fontSize: AppTypography.fontSizeXl,
        fontWeight: AppTypography.semiBold,
        color: AppColors.textPrimaryDark,
        letterSpacing: AppTypography.letterSpacingTight,
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
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.card),
        side: const BorderSide(color: AppColors.borderDark, width: 1),
      ),
      margin: EdgeInsets.zero,
    ),
    
    // Input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surfaceVariantDark,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.md,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.input),
        borderSide: const BorderSide(color: AppColors.borderDark),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.input),
        borderSide: const BorderSide(color: AppColors.borderDark),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.input),
        borderSide: const BorderSide(color: AppColors.primaryLight, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.input),
        borderSide: const BorderSide(color: AppColors.error),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.input),
        borderSide: const BorderSide(color: AppColors.error, width: 1.5),
      ),
      hintStyle: const TextStyle(
        color: AppColors.textTertiaryDark,
        fontSize: AppTypography.fontSizeMd,
        fontWeight: AppTypography.regular,
      ),
      labelStyle: const TextStyle(
        color: AppColors.textSecondaryDark,
        fontSize: AppTypography.fontSizeSm,
        fontWeight: AppTypography.medium,
      ),
    ),

    // Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryLight,
        foregroundColor: AppColors.backgroundDark,
        elevation: 0,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.button),
        ),
        textStyle: const TextStyle(
          fontSize: AppTypography.fontSizeMd,
          fontWeight: AppTypography.semiBold,
          letterSpacing: AppTypography.letterSpacingNormal,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
        minimumSize: const Size(0, 52),
      ),
    ),

    // Outlined Button Theme
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primaryLight,
        side: const BorderSide(color: AppColors.borderDark, width: 1.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.button),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
        minimumSize: const Size(0, 52),
      ),
    ),

    // Text Button Theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primaryLight,
        textStyle: const TextStyle(
          fontWeight: AppTypography.semiBold,
          fontSize: AppTypography.fontSizeMd,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
      ),
    ),

    // Icon Theme
    iconTheme: const IconThemeData(
      color: AppColors.textSecondaryDark,
      size: AppIconSize.md,
    ),

    // Bottom Navigation Bar Theme
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: AppColors.surfaceDark,
      elevation: 0,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      indicatorColor: AppColors.primaryDark,
      height: 72,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return const TextStyle(
            color: AppColors.primaryLight,
            fontWeight: FontWeight.w600,
            fontSize: 12,
          );
        }
        return const TextStyle(
          color: AppColors.textTertiaryDark,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        );
      }),
      iconTheme: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return const IconThemeData(
            color: AppColors.primaryLight,
            size: AppIconSize.md,
          );
        }
        return const IconThemeData(
          color: AppColors.textTertiaryDark,
          size: AppIconSize.md,
        );
      }),
    ),

    // Divider Theme
    dividerTheme: const DividerThemeData(
      color: AppColors.borderDark,
      thickness: 1,
      space: AppSpacing.md,
    ),

    // Chip Theme
    chipTheme: ChipThemeData(
      backgroundColor: AppColors.surfaceVariantDark,
      selectedColor: AppColors.primaryDark,
      labelStyle: const TextStyle(
        color: AppColors.textSecondaryDark,
        fontSize: AppTypography.fontSizeSm,
        fontWeight: AppTypography.medium,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.chip),
        side: const BorderSide(color: AppColors.borderDark),
      ),
    ),

    // Text Theme
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: AppTypography.fontSize5xl,
        fontWeight: AppTypography.bold,
        color: AppColors.textPrimaryDark,
        letterSpacing: AppTypography.letterSpacingTight,
        height: AppTypography.lineHeightTight,
      ),
      displayMedium: TextStyle(
        fontSize: AppTypography.fontSize4xl,
        fontWeight: AppTypography.bold,
        color: AppColors.textPrimaryDark,
        letterSpacing: AppTypography.letterSpacingTight,
        height: AppTypography.lineHeightTight,
      ),
      displaySmall: TextStyle(
        fontSize: AppTypography.fontSize3xl,
        fontWeight: AppTypography.semiBold,
        color: AppColors.textPrimaryDark,
        letterSpacing: AppTypography.letterSpacingTight,
        height: AppTypography.lineHeightSnug,
      ),
      headlineLarge: TextStyle(
        fontSize: AppTypography.fontSize3xl,
        fontWeight: AppTypography.semiBold,
        color: AppColors.textPrimaryDark,
        height: AppTypography.lineHeightSnug,
      ),
      headlineMedium: TextStyle(
        fontSize: AppTypography.fontSize2xl,
        fontWeight: AppTypography.semiBold,
        color: AppColors.textPrimaryDark,
        height: AppTypography.lineHeightSnug,
      ),
      headlineSmall: TextStyle(
        fontSize: AppTypography.fontSizeXl,
        fontWeight: AppTypography.semiBold,
        color: AppColors.textPrimaryDark,
        height: AppTypography.lineHeightNormal,
      ),
      titleLarge: TextStyle(
        fontSize: AppTypography.fontSizeLg,
        fontWeight: AppTypography.semiBold,
        color: AppColors.textPrimaryDark,
        height: AppTypography.lineHeightNormal,
      ),
      titleMedium: TextStyle(
        fontSize: AppTypography.fontSizeMd,
        fontWeight: AppTypography.medium,
        color: AppColors.textPrimaryDark,
        height: AppTypography.lineHeightNormal,
      ),
      titleSmall: TextStyle(
        fontSize: AppTypography.fontSizeSm,
        fontWeight: AppTypography.medium,
        color: AppColors.textSecondaryDark,
        height: AppTypography.lineHeightNormal,
      ),
      bodyLarge: TextStyle(
        fontSize: AppTypography.fontSizeMd,
        fontWeight: AppTypography.regular,
        color: AppColors.textPrimaryDark,
        height: AppTypography.lineHeightRelaxed,
      ),
      bodyMedium: TextStyle(
        fontSize: AppTypography.fontSizeSm,
        fontWeight: AppTypography.regular,
        color: AppColors.textSecondaryDark,
        height: AppTypography.lineHeightRelaxed,
      ),
      bodySmall: TextStyle(
        fontSize: AppTypography.fontSizeXs,
        fontWeight: AppTypography.regular,
        color: AppColors.textTertiaryDark,
        height: AppTypography.lineHeightNormal,
      ),
      labelLarge: TextStyle(
        fontSize: AppTypography.fontSizeMd,
        fontWeight: AppTypography.medium,
        color: AppColors.textPrimaryDark,
        letterSpacing: AppTypography.letterSpacingNormal,
      ),
      labelMedium: TextStyle(
        fontSize: AppTypography.fontSizeSm,
        fontWeight: AppTypography.medium,
        color: AppColors.textSecondaryDark,
      ),
      labelSmall: TextStyle(
        fontSize: AppTypography.fontSizeXs,
        fontWeight: AppTypography.medium,
        color: AppColors.textTertiaryDark,
      ),
    ),
    
    // List Tile Theme
    listTileTheme: const ListTileThemeData(
      contentPadding: EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      minLeadingWidth: 0,
      horizontalTitleGap: AppSpacing.md,
    ),
    
    // Bottom Sheet Theme
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.surfaceDark,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.xl)),
      ),
    ),
    
    // Dialog Theme
    dialogTheme: DialogThemeData(
      backgroundColor: AppColors.surfaceDark,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.xl),
      ),
    ),
  );
}
