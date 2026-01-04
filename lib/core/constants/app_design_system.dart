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

  // Primary - Deep Teal (Japanese Garden Inspired)
  static const Color primary = Color(0xFF2D5A5A);
  static const Color primaryLight = Color(0xFF4A7C7C);
  static const Color primaryDark = Color(0xFF1E3D3D);
  static const Color primarySurface = Color(0xFFE8F0F0);
  
  // Accent - Warm Sand (Traditional Wood Tones)
  static const Color accent = Color(0xFFD4A574);
  static const Color accentLight = Color(0xFFE5C9A8);
  static const Color accentDark = Color(0xFFB88A5C);
  static const Color accentSurface = Color(0xFFFAF5EF);
  
  // Semantic Colors - Muted & Calm
  static const Color success = Color(0xFF4A9168);
  static const Color successLight = Color(0xFFE8F5ED);
  static const Color successDark = Color(0xFF2E5A41);
  
  static const Color error = Color(0xFFBF4A4A);
  static const Color errorLight = Color(0xFFF8EAEA);
  static const Color errorDark = Color(0xFF8B3636);
  
  static const Color warning = Color(0xFFD49B4A);
  static const Color warningLight = Color(0xFFFDF6EB);
  static const Color warningDark = Color(0xFF9A7035);
  
  static const Color info = Color(0xFF4A7CB8);
  static const Color infoLight = Color(0xFFEBF2FA);
  static const Color infoDark = Color(0xFF355985);

  // Neutral - Light Mode (Soft & Warm)
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  
  // Grey Scale - Warmer tones
  static const Color grey50 = Color(0xFFFAFBFC);
  static const Color grey100 = Color(0xFFF3F4F6);
  static const Color grey200 = Color(0xFFE5E7EB);
  static const Color grey300 = Color(0xFFD1D5DB);
  static const Color grey400 = Color(0xFF9CA3AF);
  static const Color grey500 = Color(0xFF6B7280);
  static const Color grey600 = Color(0xFF4B5563);
  static const Color grey700 = Color(0xFF374151);
  static const Color grey800 = Color(0xFF1F2937);
  static const Color grey900 = Color(0xFF111827);

  // Light Mode Backgrounds
  static const Color background = Color(0xFFFAFBFC);
  static const Color surface = white;
  static const Color surfaceVariant = grey50;
  static const Color surfaceElevated = white;

  // Light Mode Text
  static const Color textPrimary = Color(0xFF1A1F26);
  static const Color textSecondary = Color(0xFF4B5563);
  static const Color textTertiary = Color(0xFF9CA3AF);
  static const Color textOnPrimary = white;
  static const Color textOnAccent = Color(0xFF1A1F26);

  // Dark Mode Backgrounds
  static const Color backgroundDark = Color(0xFF0F1419);
  static const Color surfaceDark = Color(0xFF1A1F26);
  static const Color surfaceVariantDark = Color(0xFF242B35);
  static const Color surfaceElevatedDark = Color(0xFF2D3643);

  // Dark Mode Text
  static const Color textPrimaryDark = Color(0xFFF5F7FA);
  static const Color textSecondaryDark = Color(0xFFB4BCC9);
  static const Color textTertiaryDark = Color(0xFF6B7A8A);

  // Borders
  static const Color borderLight = Color(0xFFE5E7EB);
  static const Color borderDark = Color(0xFF2D3643);

  // Gradients - Subtle & Elegant
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF2D5A5A), Color(0xFF4A7C7C)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient accentGradient = LinearGradient(
    colors: [Color(0xFFD4A574), Color(0xFFE5C9A8)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient surfaceGradient = LinearGradient(
    colors: [Color(0xFFFAFBFC), Color(0xFFF3F4F6)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // Glass Effects
  static Color glassLight = white.withValues(alpha: 0.9);
  static Color glassDark = surfaceDark.withValues(alpha: 0.85);
}

// ============================================================================
// SPACING - 8pt Grid System
// ============================================================================

class AppSpacing {
  AppSpacing._();

  static const double xxs = 2.0;   // Micro
  static const double xs = 4.0;    // Tiny
  static const double sm = 8.0;    // Small
  static const double md = 16.0;   // Medium (base unit)
  static const double lg = 24.0;   // Large
  static const double xl = 32.0;   // Extra large
  static const double xxl = 48.0;  // 2x large
  static const double xxxl = 64.0; // 3x large
  
  // Semantic Spacing
  static const double pageHorizontal = 20.0;
  static const double pagePaddingTop = 16.0;
  static const double sectionGap = 32.0;
  static const double cardPadding = 20.0;
  static const double listItemGap = 12.0;
}

// ============================================================================
// BORDER RADIUS - Soft & Rounded
// ============================================================================

class AppRadius {
  AppRadius._();
  
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 12.0;
  static const double lg = 16.0;
  static const double xl = 20.0;
  static const double xxl = 24.0;
  static const double full = 9999.0;
  
  // Semantic
  static const double card = 16.0;
  static const double button = 12.0;
  static const double input = 12.0;
  static const double chip = 9999.0;
}

// ============================================================================
// TYPOGRAPHY - Clean & Readable
// ============================================================================

class AppTypography {
  AppTypography._();

  // Font Family
  static const String fontFamily = 'Inter';
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

  // Line Heights
  static const double lineHeightTight = 1.2;
  static const double lineHeightSnug = 1.375;
  static const double lineHeightNormal = 1.5;
  static const double lineHeightRelaxed = 1.625;
  static const double lineHeightLoose = 2.0;

  // Letter Spacing
  static const double letterSpacingTight = -0.5;
  static const double letterSpacingNormal = 0.0;
  static const double letterSpacingWide = 0.5;
  static const double letterSpacingWider = 1.0;
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
      color: Colors.black.withValues(alpha: 0.03),
      blurRadius: 8,
      offset: const Offset(0, 2),
    ),
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.02),
      blurRadius: 24,
      offset: const Offset(0, 8),
    ),
  ];
  
  static List<BoxShadow> mediumShadow = [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.05),
      blurRadius: 12,
      offset: const Offset(0, 4),
    ),
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.03),
      blurRadius: 32,
      offset: const Offset(0, 12),
    ),
  ];
  
  static List<BoxShadow> cardShadow = [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.04),
      blurRadius: 16,
      offset: const Offset(0, 4),
    ),
  ];
  
  // Dark Mode Shadows
  static List<BoxShadow> darkSoftShadow = [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.2),
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
