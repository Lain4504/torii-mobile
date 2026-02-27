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

  // Core Palette (Mapped from Web OKLCH)
  // Primary: oklch(0.59 0.14 242) -> Vibrant Blue
  static const Color primary = Color(0xFF3B82F6);
  static const Color primaryForeground = Color(0xFFF8FAFC);
  
  // Secondary / Accent: oklch(0.967 0.001 286.375) -> Stone/Slate Ultra Light
  static const Color secondary = Color(0xFFF5F5F4);
  static const Color secondaryForeground = Color(0xFF1C1917);
  
  static const Color muted = Color(0xFFF5F5F4);
  static const Color mutedForeground = Color(0xFF78716C);
  
  static const Color accent = Color(0xFFF5F5F4);
  static const Color accentForeground = Color(0xFF1C1917);

  // Semantic
  static const Color destructive = Color(0xFFEF4444);
  static const Color destructiveForeground = Color(0xFFF8FAFC);
  
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color info = Color(0xFF3B82F6);

  // Neutral / Backgrounds
  static const Color background = Color(0xFFFFFFFF);
  static const Color foreground = Color(0xFF1C1917);
  static const Color card = Color(0xFFFFFFFF);
  static const Color cardForeground = Color(0xFF1C1917);
  static const Color popover = Color(0xFFFFFFFF);
  static const Color popoverForeground = Color(0xFF1C1917);
  
  // Borders & Inputs
  static const Color border = Color(0xFFE7E5E4); // oklch(0.92 0.004 286.32)
  static const Color input = Color(0xFFE7E5E4);
  static const Color ring = Color(0xFFD6D3D1);

  // Dark Mode (approximate mapping from .dark in globals.css)
  static const Color backgroundDark = Color(0xFF1C1917);
  static const Color foregroundDark = Color(0xFFF5F5F4);
  static const Color cardDark = Color(0xFF292524);
  static const Color primaryDark = Color(0xFF60A5FA);

  // Legacy mappings for compatibility during transition
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
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

  // Semantic Aliases
  static const Color textPrimary = foreground;
  static const Color textSecondary = mutedForeground;
  static const Color textTertiary = Color(0xFFA8A29E);
  static const Color textOnPrimary = primaryForeground;

  static const Color surface = card;
  static const Color surfaceVariant = secondary;

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, Color(0xFF60A5FA)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
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
// BORDER RADIUS - Shadcn Style
// ============================================================================

class AppRadius {
  AppRadius._();
  
  static const double xs = 2.0;
  static const double sm = 4.0;
  static const double md = 6.0;
  static const double lg = 10.0; // Matches --radius: 0.625rem (10px)
  static const double xl = 14.0;
  static const double xxl = 18.0;
  static const double xxxl = 22.0;
  static const double full = 9999.0;
  
  // Semantic
  static const double card = 10.0; 
  static const double button = 10.0;
  static const double input = 10.0;
  static const double chip = 9999.0;
}

// ============================================================================
// TYPOGRAPHY - Zen Education Focus
// ============================================================================

class AppTypography {
  AppTypography._();

  // Font Family
  static const String fontFamily = 'Nunito'; // Matches Web
  static const String fontFamilySerif = 'Nunito'; // Web uses Nunito for headings too
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
// ELEVATION & SHADOWS - Subtle & Soft
// ============================================================================

class AppElevation {
  AppElevation._();

  static const double none = 0.0;
  static const double xs = 1.0;
  static const double sm = 2.0;
  static const double md = 4.0;
  static const double lg = 8.0;
  static const double xl = 12.0;
  
  // Vibrant Shadows (Web-like)
  static List<BoxShadow> softShadow = [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.05),
      blurRadius: 10,
      offset: const Offset(0, 4),
    ),
  ];
  
  static List<BoxShadow> mediumShadow = [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.08),
      blurRadius: 16,
      offset: const Offset(0, 6),
    ),
  ];
  
  static List<BoxShadow> cardShadow = [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.06),
      blurRadius: 12,
      offset: const Offset(0, 4),
    ),
  ];

  static List<BoxShadow> darkSoftShadow = [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.2),
      blurRadius: 10,
      offset: const Offset(0, 4),
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
