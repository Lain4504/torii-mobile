import 'package:flutter/material.dart';

/// Torii Mobile Design System
/// 
/// Updated to match Torii Web (Monorepo) Design System.
/// Based on Shadcn UI / OKLCH palette.

// ============================================================================
// COLORS - Torii Web Palette
// ============================================================================

class AppColors {
  AppColors._();

  // Primary - Cyan/Teal (from Web: oklch(0.75 0.12 195))
  static const Color primary = Color(0xFF2BC5C5);
  static const Color primaryLight = Color(0xFF4EDCDC); // Estimated lighter
  static const Color primaryDark = Color(0xFF00A5A5); // Dark mode primary
  static const Color primarySurface = Color(0xFFEDF7F7); // Secondary/Accent from web
  
  // Secondary / Accent (from Web: oklch(0.97 0.01 195))
  static const Color accent = Color(0xFFEDF7F7);
  static const Color accentLight = Color(0xFFF4FBFB);
  static const Color accentDark = Color(0xFF2A807F); // Secondary foreground
  static const Color accentSurface = Color(0xFFF6F8FB);
  
  // Detail / Muted (from Web: oklch(0.97 0 0))
  static const Color detail = Color(0xFFF4F4F4);
  static const Color detailLight = Color(0xFFFAFAFA);
  static const Color detailSurface = Color(0xFFF4F4F4);
  
  // Semantic Colors
  static const Color success = Color(0xFF2BC5C5); // Using primary for success/brand
  static const Color successLight = Color(0xFFEDF7F7);
  static const Color successDark = Color(0xFF00A5A5);
  
  static const Color error = Color(0xFFE8565F); // Destructive
  static const Color errorLight = Color(0xFFFEECEE);
  static const Color errorDark = Color(0xFFB8463B);
  
  static const Color warning = Color(0xFFD4A373); // Kept from original for now
  static const Color warningLight = Color(0xFFFAF3EB);
  static const Color warningDark = Color(0xFF9E7A56);
  
  static const Color info = Color(0xFF2BC5C5);
  static const Color infoLight = Color(0xFFEDF7F7);
  static const Color infoDark = Color(0xFF00A5A5);

  // Neutral
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF0E141C); // Foreground
  
  // Grey Scale (Mapped from Web borders/inputs)
  static const Color grey50 = Color(0xFFF6F8FB); // Background
  static const Color grey100 = Color(0xFFF1F1F1); // Input
  static const Color grey200 = Color(0xFFDEDDDD); // Border
  static const Color grey300 = Color(0xFFDEDDDD);
  static const Color grey400 = Color(0xFFA0A8B4); // Dark Foreground
  static const Color grey500 = Color(0xFF6E7177); // Muted Foreground
  static const Color grey600 = Color(0xFF596374);
  static const Color grey700 = Color(0xFF313A4A); // Dark Border
  static const Color grey800 = Color(0xFF191F28); // Dark Input
  static const Color grey900 = Color(0xFF0E141C); // Dark Card

  // Light Mode Backgrounds
  static const Color background = Color(0xFFF6F8FB); 
  static const Color surface = Color(0xFFFFFFFF); // Card
  static const Color surfaceVariant = Color(0xFFEDF7F7);
  static const Color surfaceElevated = Color(0xFFFFFFFF);

  // Light Mode Text
  static const Color textPrimary = Color(0xFF0E141C); // Foreground
  static const Color textSecondary = Color(0xFF6E7177); // Muted Foreground
  static const Color textTertiary = Color(0xFFA0A8B4);
  static const Color textOnPrimary = Color(0xFFFFFFFF);
  static const Color textOnAccent = Color(0xFF2A807F); // Secondary Foreground

  // Dark Mode Backgrounds
  static const Color backgroundDark = Color(0xFF191F28);
  static const Color surfaceDark = Color(0xFF0E141C); // Card Dark
  static const Color surfaceVariantDark = Color(0xFF252E3D); // Muted Dark
  static const Color surfaceElevatedDark = Color(0xFF192130); // Secondary Dark

  // Dark Mode Text
  static const Color textPrimaryDark = Color(0xFFA0A8B4); // Foreground Dark
  static const Color textSecondaryDark = Color(0xFF596374); // Muted Foreground Dark
  static const Color textTertiaryDark = Color(0xFF596374);

  // Borders
  static const Color borderLight = Color(0xFFDEDDDD);
  static const Color borderDark = Color(0xFF313A4A);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF2BC5C5), Color(0xFF4EDCDC)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient zenGradient = LinearGradient(
    colors: [Color(0xFFF6F8FB), Color(0xFFFFFFFF)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // Glass Effects
  static Color glassLight = white.withValues(alpha: 0.8);
  static Color glassDark = Color(0xFF0E141C).withValues(alpha: 0.8);
}

// ============================================================================
// SPACING - 8pt Grid System
// ============================================================================

class AppSpacing {
  AppSpacing._();

  static const double xxs = 2.0;   
  static const double xs = 4.0;    
  static const double sm = 8.0;    
  static const double md = 16.0;   
  static const double lg = 24.0;   
  static const double xl = 32.0;   
  static const double xxl = 48.0;  
  static const double xxxl = 64.0; 
  
  // Semantic Spacing
  static const double pageHorizontal = 20.0;
  static const double pagePaddingTop = 16.0;
  static const double sectionGap = 32.0;
  static const double cardPadding = 20.0;
  static const double listItemGap = 12.0;
}

// ============================================================================
// BORDER RADIUS - Matches Web
// ============================================================================

class AppRadius {
  AppRadius._();
  
  static const double xs = 4.0;
  static const double sm = 4.0;  // Matches Tailwind sm
  static const double md = 6.0;  // Matches Tailwind md
  static const double lg = 8.0;  // Matches Tailwind lg (base radius)
  static const double xl = 12.0; // Matches Tailwind xl
  static const double xxl = 16.0; // Matches 2xl roughly
  static const double xxxl = 24.0; // For larger cards
  static const double full = 9999.0;
  
  // Semantic
  static const double card = lg; // 8.0
  static const double button = lg; // 8.0
  static const double input = lg; // 8.0
  static const double chip = full;
}

// ============================================================================
// TYPOGRAPHY - Nunito (Web Match)
// ============================================================================

class AppTypography {
  AppTypography._();

  // Font Family
  static const String fontFamily = 'Nunito'; 
  static const String fontFamilySerif = 'Noto Serif JP'; 
  static const String fontFamilyJapanese = 'Noto Sans JP';

  // Font Sizes - Modular Scale
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
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
  static const FontWeight black = FontWeight.w900;

  // Line Heights
  static const double lineHeightTight = 1.1;
  static const double lineHeightSnug = 1.25;
  static const double lineHeightNormal = 1.5;
  static const double lineHeightRelaxed = 1.6;

  // Letter Spacing
  static const double letterSpacingTight = -0.5;
  static const double letterSpacingNormal = 0.0;
  static const double letterSpacingWide = 0.5;
  static const double letterSpacingWider = 1.0;
  static const double letterSpacingWidest = 2.0;
}


// ============================================================================
// ELEVATION & SHADOWS - Matches Web Variables
// ============================================================================

class AppElevation {
  AppElevation._();

  static const double none = 0.0;
  static const double xs = 1.0;
  static const double sm = 2.0;
  static const double md = 4.0;
  static const double lg = 8.0;
  static const double xl = 12.0;
  
  // --shadow-sm: 0px 1px 2px rgba(0, 0, 0, 0.05);
  static List<BoxShadow> shadowSm = [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.05),
      blurRadius: 2,
      offset: const Offset(0, 1),
    ),
  ];

  // --shadow: 0px 4px 6px -1px rgba(0, 0, 0, 0.05), 0px 2px 4px -1px rgba(0, 0, 0, 0.03);
  static List<BoxShadow> shadow = [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.05),
      blurRadius: 6,
      spreadRadius: -1,
      offset: const Offset(0, 4),
    ),
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.03),
      blurRadius: 4,
      spreadRadius: -1,
      offset: const Offset(0, 2),
    ),
  ];

  // --shadow-md: 0px 6px 16px -4px rgba(0, 0, 0, 0.08);
  static List<BoxShadow> shadowMd = [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.08),
      blurRadius: 16,
      spreadRadius: -4,
      offset: const Offset(0, 6),
    ),
  ];
  
  // --shadow-lg: 0px 10px 32px -8px rgba(0, 0, 0, 0.10);
  static List<BoxShadow> shadowLg = [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.10),
      blurRadius: 32,
      spreadRadius: -8,
      offset: const Offset(0, 10),
    ),
  ];

  // --shadow-xl: 0px 20px 40px -12px rgba(0, 0, 0, 0.12);
  static List<BoxShadow> shadowXl = [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.12),
      blurRadius: 40,
      spreadRadius: -12,
      offset: const Offset(0, 20),
    ),
  ];
  
  // Aliases for backward compatibility
  static List<BoxShadow> softShadow = shadowSm;
  static List<BoxShadow> mediumShadow = shadowMd;
  static List<BoxShadow> cardShadow = shadow;
  
  // Dark Mode Shadows
  static List<BoxShadow> darkSoftShadow = [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.2),
      blurRadius: 4,
      offset: const Offset(0, 2),
    ),
  ];
}

// ============================================================================
// ANIMATION - Smooth & Natural
// ============================================================================

class AppDuration {
  AppDuration._();

  static const Duration instant = Duration(milliseconds: 0);
  static const Duration fast = Duration(milliseconds: 150);
  static const Duration normal = Duration(milliseconds: 250);
  static const Duration slow = Duration(milliseconds: 400);
  static const Duration slower = Duration(milliseconds: 600);
  static const Duration page = Duration(milliseconds: 350);
}

class AppCurves {
  AppCurves._();

  static const Curve easeIn = Curves.easeIn;
  static const Curve easeOut = Curves.easeOut;
  static const Curve easeInOut = Curves.easeInOut;
  static const Curve decelerate = Curves.decelerate;
  static const Curve bounceOut = Curves.bounceOut;
  static const Curve fastOutSlowIn = Curves.fastOutSlowIn;
  
  // Custom spring-like curve
  static const Curve spring = Curves.elasticOut;
}

// ============================================================================
// ICON SIZES
// ============================================================================

class AppIconSize {
  AppIconSize._();

  static const double xs = 16.0;
  static const double sm = 20.0;
  static const double md = 24.0;
  static const double lg = 28.0;
  static const double xl = 32.0;
  static const double xxl = 40.0;
}

// ============================================================================
// BREAKPOINTS
// ============================================================================

class AppBreakpoints {
  AppBreakpoints._();
  
  static const double mobile = 0;
  static const double tablet = 600;
  static const double desktop = 1024;
  static const double wide = 1440;
}
