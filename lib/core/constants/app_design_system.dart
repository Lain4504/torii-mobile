import 'package:flutter/material.dart';

/// Torii Mobile Design System
/// Simplified version - removed unused variables.

class AppColors {
  AppColors._();

  // Brand primary: nhaikanji blue (from CSS OKLCH palette)
  static const Color primary = Color(0xFF4C8EDF); // --primary / --ring / --chart-1
  static const Color primaryLight = Color(0xFF69A1E8); // --chart-2
  static const Color primaryLighter = Color(0xFF85B4F0); // --chart-3
  static const Color primaryDark = Color(0xFF2B7AD6); // --chart-4
  static const Color primaryDarker = Color(0xFF005FC6); // --chart-5

  // Legacy surface aliases used across the app theme/screens.
  // Keep them stable to avoid breaking older UI code.
  static const Color primarySurface = Color(0xFFEAF2FF);
  static const Color accentSurface = Color(0xFFF5F5F5);
  static const Color accentLight = Color(0xFF9CC1F3);
  
  // Neutrals (Light)
  static const Color background = Color(0xFFFFFFFF); // --background
  static const Color foreground = Color(0xFF0A0A0A); // --foreground
  static const Color card = Color(0xFFFFFFFF); // --card
  static const Color cardForeground = Color(0xFF0A0A0A); // --card-foreground
  static const Color popover = Color(0xFFFFFFFF); // --popover
  static const Color popoverForeground = Color(0xFF0A0A0A); // --popover-foreground

  static const Color primaryForeground = Color(0xFFFAFAFA); // --primary-foreground

  static const Color secondary = Color(0xFFF4F4F5); // --secondary
  static const Color secondaryForeground = Color(0xFF18181B); // --secondary-foreground

  static const Color muted = Color(0xFFF5F5F5); // --muted
  static const Color mutedForeground = Color(0xFF737373); // --muted-foreground

  static const Color accent = Color(0xFFF5F5F5); // --accent
  static const Color accentForeground = Color(0xFF171717); // --accent-foreground

  static const Color destructive = Color(0xFFDF2225); // --destructive

  static const Color border = Color(0xFFE5E5E5); // --border
  static const Color input = Color(0xFFE5E5E5); // --input

  static const Color sidebar = Color(0xFFFAFAFA); // --sidebar
  static const Color sidebarForeground = Color(0xFF0A0A0A); // --sidebar-foreground
  static const Color sidebarPrimary = Color(0xFF4C8EDF); // --sidebar-primary
  static const Color sidebarPrimaryForeground = Color(0xFFFAFAFA); // --sidebar-primary-foreground
  static const Color sidebarAccent = Color(0xFFF5F5F5); // --sidebar-accent
  static const Color sidebarAccentForeground = Color(0xFF171717); // --sidebar-accent-foreground
  static const Color sidebarBorder = Color(0xFFE5E5E5); // --sidebar-border
  static const Color sidebarRing = Color(0xFF8EA0B8); // --sidebar-ring
  
  // Semantic
  static const Color success = Color(0xFF3BB25E);

  static const Color error = destructive;
  static const Color errorLight = Color(0xFFFFE4E6);
  static const Color errorDark = Color(0xFFFF6467); // dark --destructive
  
  // Detail - Purple accent close to palette's cool tones
  static const Color detail = Color(0xFF6D56B8);

  // Convenience aliases (backward compatible with existing code)
  static const Color white = Color(0xFFFFFFFF);
  
  // Grey Scale (Commonly used in AppTheme)
  static const Color grey200 = border; // ~ --border / --input
  static const Color grey300 = Color(0xFFD5D5DD);
  static const Color grey700 = mutedForeground; // ~ --muted-foreground

  // Surfaces
  static const Color surface = card;
  static const Color surfaceVariant = muted;

  // Text
  static const Color textPrimary = foreground;
  static const Color textSecondary = secondaryForeground;
  static const Color textTertiary = mutedForeground;
  static const Color textOnPrimary = primaryForeground;
  static const Color textOnAccent = accentForeground;

  // Neutrals (Dark) from CSS .dark palette
  static const Color backgroundDark = Color(0xFF0A0A0A); // --background (dark)
  static const Color foregroundDark = Color(0xFFFAFAFA); // --foreground (dark)
  static const Color surfaceDark = Color(0xFF171717); // --card / --popover (dark)
  static const Color surfaceVariantDark = Color(0xFF262626); // --muted (dark)

  static const Color secondaryDark = Color(0xFF27272A); // --secondary (dark)
  static const Color mutedDark = Color(0xFF262626); // --muted (dark)
  static const Color mutedForegroundDark = Color(0xFFA1A1A1); // --muted-foreground (dark)
  static const Color accentDark = Color(0xFF404040); // --accent (dark)

  // CSS: --border: oklch(1 0 0 / 10%); --input: oklch(1 0 0 / 15%)
  static const Color borderDark = Color(0x1AFFFFFF); // 10% white
  static const Color inputDark = Color(0x26FFFFFF); // 15% white

  static const Color sidebarDark = Color(0xFF171717); // --sidebar (dark)
  static const Color sidebarForegroundDark = Color(0xFFFAFAFA); // --sidebar-foreground (dark)
  static const Color sidebarAccentDark = Color(0xFF262626); // --sidebar-accent (dark)
  static const Color sidebarBorderDark = Color(0x1AFFFFFF); // --sidebar-border (dark)

  static const Color textPrimaryDark = foregroundDark;
  static const Color textSecondaryDark = mutedForegroundDark;

  // Border helpers
  static const Color borderLight = border;

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
  
  // CSS: --radius: 0.625rem (assuming 16px/rem => 10px)
  static const double md = 10.0;
  static const double lg = 12.0;
  static const double xl = 16.0;
  static const double full = 9999.0;
  
  // Semantic
  static const double card = md;
  static const double button = md;
  static const double input = md;
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

