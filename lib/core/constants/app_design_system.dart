import 'package:flutter/material.dart';

/// Torii Mobile Design System
/// Simplified version - removed unused variables.

class AppColors {
  AppColors._();

  // Primary - Blue (#5E82BB)
  static const Color primary = Color(0xFF5E82BB);
  static const Color primaryLight = Color(0xFF8BA5CF);
  static const Color primaryDark = Color(0xFF1F3E72); 
  static const Color primarySurface = Color(0xFFE8EEF7);
  
  // Secondary - Deep Blue (#1F3E72)
  static const Color secondary = Color(0xFF1F3E72);
  
  // Success - Green (#87C744)
  static const Color success = Color(0xFF87C744);
  
  // Accent - Teal (#02A190)
  static const Color accent = Color(0xFF02A190);
  static const Color accentLight = Color(0xFFE6F6F4);
  static const Color accentDark = Color(0xFF018073);
  static const Color accentSurface = Color(0xFFF1F8F7);
  
  // Semantic Colors
  static const Color error = Color(0xFFE8565F);
  static const Color errorLight = Color(0xFFFEECEE);
  static const Color errorDark = Color(0xFFB8463B);
  
  // Detail - Purple
  static const Color detail = Color(0xFF7D58A1);

  // Neutral
  static const Color white = Color(0xFFFFFFFF);
  
  // Grey Scale (Commonly used in AppTheme)
  static const Color grey200 = Color(0xFFE9ECEF);
  static const Color grey300 = Color(0xFFDEE2E6);
  static const Color grey700 = Color(0xFF495057);

  // Backgrounds & Surface
  static const Color background = Color(0xFFF8F9FA); 
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceVariant = Color(0xFFE8EEF7);

  // Text
  static const Color textPrimary = Color(0xFF1F3E72);
  static const Color textSecondary = Color(0xFF5E82BB);
  static const Color textTertiary = Color(0xFFADB5BD);
  static const Color textOnPrimary = Color(0xFFFFFFFF);
  static const Color textOnAccent = Color(0xFFFFFFFF);

  // Dark Mode Backgrounds & Text
  static const Color backgroundDark = Color(0xFF15151D);
  static const Color surfaceDark = Color(0xFF0E141C);
  static const Color surfaceVariantDark = Color(0xFF252E3D);
  static const Color textPrimaryDark = Color(0xFFA0A8B4);
  static const Color textSecondaryDark = Color(0xFF596374);

  // Borders
  static const Color border = Color(0xFFDEE2E6);
  static const Color borderLight = Color(0xFFDEDDDD);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, primaryLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

// ============================================================================
// SPACING - 8pt Grid System
// ============================================================================

class AppSpacing {
  AppSpacing._();

  static const double md = 16.0;   
  static const double lg = 24.0;   
  static const double xl = 32.0;   
}

// ============================================================================
// BORDER RADIUS
// ============================================================================

class AppRadius {
  AppRadius._();
  
  static const double md = 8.0;
  static const double lg = 12.0;
  static const double xl = 16.0;
  static const double full = 9999.0;
  
  // Semantic
  static const double card = 16.0;
  static const double button = 12.0;
  static const double input = 12.0;
}

// ============================================================================
// TYPOGRAPHY
// ============================================================================

class AppTypography {
  AppTypography._();

  static const String fontFamily = 'Andika';

  // Font Sizes
  static const double fontSizeXs = 12.0;
  static const double fontSizeSm = 14.0;
  static const double fontSizeMd = 16.0;
  static const double fontSizeLg = 18.0;
  static const double fontSizeXl = 20.0;
  static const double fontSize2xl = 24.0;
  static const double fontSize3xl = 30.0;
  static const double fontSize4xl = 36.0;
  static const double fontSize5xl = 48.0;

  // Font Weights
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
  static const FontWeight black = FontWeight.w900;

  // Letter Spacing
  static const double letterSpacingTight = -0.5;
  static const double letterSpacingNormal = 0.0;
}

// ============================================================================
// ICON SIZES
// ============================================================================

class AppIconSize {
  AppIconSize._();

  static const double md = 24.0;
}

