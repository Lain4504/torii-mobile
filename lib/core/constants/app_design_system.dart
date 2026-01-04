import 'package:flutter/material.dart';

/// App Design System - Colors
/// Centralized color palette matching web design
class AppColors {
  AppColors._();

  // Primary Colors (Torii Red - Vermilion)
  static const Color primary = Color(0xFFE53935); // Vermilion Red
  static const Color primaryDark = Color(0xFFB71C1C); // Deep Red
  static const Color primaryLight = Color(0xFFFFCDD2); // Light Red/Pink

  // Secondary/Accent Colors (Ink & Gold)
  static const Color accent = Color(0xFF212121); // Ink Black
  static const Color accentLight = Color(0xFF484848); // Charcoal
  static const Color highlight = Color(0xFFFFC107); // Gold/Amber

  // Neutral Colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color black87 = Color(0xDE000000); // 87% opacity
  
  // Grey Scale (Cool Greys)
  static const Color grey50 = Color(0xFFF9FAFB);
  static const Color grey100 = Color(0xFFF3F4F6);
  static const Color grey200 = Color(0xFFE5E7EB);
  static const Color grey300 = Color(0xFFD1D5DB);
  static const Color grey400 = Color(0xFF9CA3AF);
  static const Color grey500 = Color(0xFF6B7280);
  static const Color grey600 = Color(0xFF4B5563);
  static const Color grey700 = Color(0xFF374151);
  static const Color grey800 = Color(0xFF1F2937);
  static const Color grey900 = Color(0xFF111827);

  // Semantic Colors
  static const Color success = Color(0xFF10B981); // Green
  static const Color successLight = Color(0xFFD1FAE5);
  static const Color error = Color(0xFFEF4444); // Red
  static const Color errorLight = Color(0xFFFEE2E2);
  static const Color warning = Color(0xFFF59E0B); // Amber
  static const Color warningLight = Color(0xFFFEF3C7);
  static const Color info = Color(0xFF3B82F6); // Blue
  static const Color infoLight = Color(0xFFDBEAFE);

  // Background Colors
  static const Color background = Color(0xFFFAFAFA); // Almost White
  static const Color surface = white;
  static const Color surfaceVariant = grey50;

  // Text Colors
  static const Color textPrimary = Color(0xFF1A1A1A); // Almost Black
  static const Color textSecondary = grey600;
  static const Color textTertiary = grey400;
  static const Color textOnPrimary = white;
}

/// App Design System - Spacing
/// Consistent spacing values (8px base unit)
class AppSpacing {
  AppSpacing._();

  static const double xs = 4.0;    // 0.5 unit
  static const double sm = 8.0;    // 1 unit
  static const double md = 16.0;   // 2 units
  static const double lg = 24.0;   // 3 units
  static const double xl = 32.0;   // 4 units
  static const double xxl = 48.0;  // 6 units
  static const double xxxl = 64.0; // 8 units
}

/// App Design System - Border Radius
class AppRadius {
  AppRadius._();
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 12.0;
  static const double lg = 16.0;
  static const double xl = 24.0;
  static const double full = 9999.0; // Fully rounded
}

/// App Design System - Typography
class AppTypography {
  AppTypography._();

  // Font Sizes
  static const double fontSizeXs = 12.0;
  static const double fontSizeSm = 14.0;
  static const double fontSizeMd = 16.0;
  static const double fontSizeLg = 18.0;
  static const double fontSizeXl = 20.0;
  static const double fontSize2xl = 24.0;
  static const double fontSize3xl = 28.0;
  static const double fontSize4xl = 32.0;

  // Font Weights
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;

  // Line Heights
  static const double lineHeightTight = 1.25;
  static const double lineHeightNormal = 1.5;
  static const double lineHeightRelaxed = 1.75;

  // Letter Spacing
  static const double letterSpacingTight = -0.5;
  static const double letterSpacingNormal = 0.0;
  static const double letterSpacingWide = 0.5;
}

/// App Design System - Elevation/Shadows
class AppElevation {
  AppElevation._();

  static const double none = 0.0;
  static const double sm = 2.0;
  static const double md = 4.0;
  static const double lg = 8.0;
  static const double xl = 16.0;
}

/// App Design System - Animation Durations
class AppDuration {
  AppDuration._();

  static const Duration fast = Duration(milliseconds: 150);
  static const Duration normal = Duration(milliseconds: 300);
  static const Duration slow = Duration(milliseconds: 500);
}
