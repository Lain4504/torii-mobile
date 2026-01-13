import 'package:flutter/material.dart';

/// Torii Mobile Design System
/// 
/// A minimalist, zen-inspired design system for Japanese language learning.
/// Based on principles of "Ma" (negative space), "Wabi-sabi" (beauty in simplicity),
/// and the traditional aesthetic of Japanese gardens.

// ============================================================================
// COLORS - Zen Minimalist Palette
// ============================================================================

class AppColors {
  AppColors._();

  // Primary - Ruri-kon (Lapis Indigo)
  static const Color primary = Color(0xFF2B4C7E);
  static const Color primaryLight = Color(0xFF4A6DA1);
  static const Color primaryDark = Color(0xFF1B3254);
  static const Color primarySurface = Color(0xFFF0F4FA);
  
  // Accent - Yanagi (Willow Green)
  static const Color accent = Color(0xFF8B9D83);
  static const Color accentLight = Color(0xFFAAB8A5);
  static const Color accentDark = Color(0xFF6B7B64);
  static const Color accentSurface = Color(0xFFF4F6F3);
  
  // Second Accent - Sakura Dust (Subtle Detail)
  static const Color detail = Color(0xFFD4B5B0);
  static const Color detailLight = Color(0xFFE5D2CF);
  static const Color detailSurface = Color(0xFFFAF6F5);
  
  // Semantic Colors - Muted & Calm
  static const Color success = Color(0xFF6B8E6B);
  static const Color successLight = Color(0xFFF0F4F0);
  static const Color successDark = Color(0xFF4A634A);
  
  static const Color error = Color(0xFFBC6C6C);
  static const Color errorLight = Color(0xFFF9F1F1);
  static const Color errorDark = Color(0xFF8C4F4F);
  
  static const Color warning = Color(0xFFD4A373);
  static const Color warningLight = Color(0xFFFAF3EB);
  static const Color warningDark = Color(0xFF9E7A56);
  
  static const Color info = Color(0xFF7B9AAD);
  static const Color infoLight = Color(0xFFF1F5F7);
  static const Color infoDark = Color(0xFF5A7281);

  // Neutral - Sumi-iro (Ink)
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF1E293B);
  
  // Grey Scale - Refined Slate
  static const Color grey50 = Color(0xFFF8FAFC);
  static const Color grey100 = Color(0xFFF1F5F9);
  static const Color grey200 = Color(0xFFE2E8F0);
  static const Color grey300 = Color(0xFFCBD5E1);
  static const Color grey400 = Color(0xFF94A3B8);
  static const Color grey500 = Color(0xFF64748B);
  static const Color grey600 = Color(0xFF475569);
  static const Color grey700 = Color(0xFF334155);
  static const Color grey800 = Color(0xFF1E293B);
  static const Color grey900 = Color(0xFF0F172A);

  // Light Mode Backgrounds - Gofun-iro (Shell White)
  static const Color background = Color(0xFFFAF9F6); 
  static const Color surface = white;
  static const Color surfaceVariant = grey50;
  static const Color surfaceElevated = white;

  // Light Mode Text
  static const Color textPrimary = Color(0xFF1E293B);
  static const Color textSecondary = Color(0xFF475569);
  static const Color textTertiary = Color(0xFF94A3B8);
  static const Color textOnPrimary = white;
  static const Color textOnAccent = white;

  // Dark Mode Backgrounds - Kuro-tsurubami (Deep Charcoal)
  static const Color backgroundDark = Color(0xFF0F172A);
  static const Color surfaceDark = Color(0xFF1E293B);
  static const Color surfaceVariantDark = Color(0xFF334155);
  static const Color surfaceElevatedDark = Color(0xFF334155);

  // Dark Mode Text
  static const Color textPrimaryDark = Color(0xFFF8FAFC);
  static const Color textSecondaryDark = Color(0xFFCBD5E1);
  static const Color textTertiaryDark = Color(0xFF64748B);

  // Borders
  static const Color borderLight = Color(0xFFE2E8F0);
  static const Color borderDark = Color(0xFF334155);

  // Gradients - Zen Ambient Glow
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF2B4C7E), Color(0xFF4A6DA1)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient zenGradient = LinearGradient(
    colors: [Color(0xFFFAF9F6), Color(0xFFF0F4FA)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // Glass Effects
  static Color glassLight = white.withOpacity(0.8);
  static Color glassDark = Color(0xFF0F172A).withOpacity(0.8);
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
// BORDER RADIUS - Extra Rounded Zen Style
// ============================================================================

class AppRadius {
  AppRadius._();
  
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 12.0;
  static const double lg = 16.0;
  static const double xl = 24.0;
  static const double xxl = 32.0;
  static const double xxxl = 48.0;
  static const double full = 9999.0;
  
  // Semantic
  static const double card = 32.0;
  static const double button = 16.0;
  static const double input = 16.0;
  static const double chip = 9999.0;
}

// ============================================================================
// TYPOGRAPHY - Zen Education Focus
// ============================================================================

class AppTypography {
  AppTypography._();

  // Font Family
  static const String fontFamily = 'Outfit'; // Premium Modern Sans
  static const String fontFamilySerif = 'Noto Serif JP'; // Japanese Serif for headings
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
  
  // Soft Shadows - Light Mode
  static List<BoxShadow> softShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.03),
      blurRadius: 8,
      offset: const Offset(0, 2),
    ),
    BoxShadow(
      color: Colors.black.withOpacity(0.02),
      blurRadius: 24,
      offset: const Offset(0, 8),
    ),
  ];
  
  static List<BoxShadow> mediumShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.05),
      blurRadius: 12,
      offset: const Offset(0, 4),
    ),
    BoxShadow(
      color: Colors.black.withOpacity(0.03),
      blurRadius: 32,
      offset: const Offset(0, 12),
    ),
  ];
  
  static List<BoxShadow> cardShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.04),
      blurRadius: 16,
      offset: const Offset(0, 4),
    ),
  ];
  
  // Dark Mode Shadows
  static List<BoxShadow> darkSoftShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.2),
      blurRadius: 8,
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
