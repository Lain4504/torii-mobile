import 'package:flutter/material.dart';

/// Torii Mobile Design System
/// Simplified version - removed unused variables.

class AppColors {
  AppColors._();

  // Primary - Web brand "nhaikanji blue" (approx OKLCH 0.64 0.14 255)
  // Kept a small scale of tints/shades around the same blue.
  static const Color primary = Color(0xFF345DFF);        // --primary
  static const Color primaryLight = Color(0xFF6F8BFF);   // ~ --chart-2/3
  static const Color primaryDark = Color(0xFF223DB3);
  static const Color primarySurface = Color(0xFFE3E7FF); // soft blue surface
  
  // Secondary - Soft lavender / neutral from web palette
  static const Color secondary = Color(0xFFECE7FF);      // ~ --secondary
  
  // Success - keep separate from brand, slightly tuned
  static const Color success = Color(0xFF3BB25E);
  
  // Accent / Muted neutrals (mapped from --accent / --muted)
  static const Color accent = Color(0xFFF2F2F6);         // light neutral
  static const Color accentLight = Color(0xFFFAFAFC);
  static const Color accentDark = Color(0xFF202127);
  static const Color accentSurface = Color(0xFFF5F5F9);
  
  // Semantic Colors (mapped from --destructive)
  static const Color error = Color(0xFFDE5240);
  static const Color errorLight = Color(0xFFFEE7E4);
  static const Color errorDark = Color(0xFFB5392D);
  
  // Detail - Purple accent close to palette's cool tones
  static const Color detail = Color(0xFF6D56B8);

  // Neutral
  static const Color white = Color(0xFFFFFFFF);
  
  // Grey Scale (Commonly used in AppTheme)
  static const Color grey200 = Color(0xFFE7E7EC); // ~ --border / --input
  static const Color grey300 = Color(0xFFD5D5DD);
  static const Color grey700 = Color(0xFF4A4A55); // ~ --muted-foreground

  // Backgrounds & Surface
  static const Color background = Color(0xFFFFFFFF);     // --background
  static const Color surface = Color(0xFFFFFFFF);        // cards/popovers
  static const Color surfaceVariant = Color(0xFFF5F5FA);

  // Text
  static const Color textPrimary = Color(0xFF17171B);      // --foreground
  static const Color textSecondary = Color(0xFF40404A);    // sidebar-foreground
  static const Color textTertiary = Color(0xFF8B8B96);     // muted-foreground
  static const Color textOnPrimary = Color(0xFFFEFEFF);    // --primary-foreground
  static const Color textOnAccent = Color(0xFF17171B);

  // Dark Mode Backgrounds & Text
  static const Color backgroundDark = Color(0xFF15151A);     // --background (dark)
  static const Color surfaceDark = Color(0xFF202027);        // --card / --popover (dark)
  static const Color surfaceVariantDark = Color(0xFF2A2A33); 
  static const Color textPrimaryDark = Color(0xFFF5F5F7);    // --foreground (dark)
  static const Color textSecondaryDark = Color(0xFFD2D2DA);  // muted-foreground (dark)

  // Borders
  static const Color border = Color(0xFFE2E2EA);           // --border
  static const Color borderLight = Color(0xFFF0F0F6);

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

