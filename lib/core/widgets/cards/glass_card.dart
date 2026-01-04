import 'package:flutter/material.dart';
import '../../constants/app_design_system.dart';

/// Glass Card - Frosted glass effect (use sparingly)
/// 
/// Best for overlays on images or gradients.
class GlassCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  final Color? color;
  final Border? border;
  final BorderRadius? borderRadius;
  final double opacity;

  const GlassCard({
    super.key,
    required this.child,
    this.padding,
    this.onTap,
    this.color,
    this.border,
    this.borderRadius,
    this.opacity = 0.9,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    
    final glassColor = color ?? (isDark 
        ? AppColors.surfaceDark.withValues(alpha: opacity)
        : AppColors.surface.withValues(alpha: opacity));
    
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius ?? BorderRadius.circular(AppRadius.card),
        child: Container(
          padding: padding ?? const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: glassColor,
            borderRadius: borderRadius ?? BorderRadius.circular(AppRadius.card),
            border: border ?? Border.all(
              color: isDark 
                  ? AppColors.borderDark.withValues(alpha: 0.5)
                  : AppColors.borderLight.withValues(alpha: 0.5),
              width: 1,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
