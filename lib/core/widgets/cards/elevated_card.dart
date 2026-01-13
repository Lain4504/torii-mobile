import 'package:flutter/material.dart';
import '../../constants/app_design_system.dart';

/// Elevated Card - Clean card with subtle shadow
/// 
/// For content that needs visual prominence.
class ElevatedCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final bool showBorder;

  const ElevatedCard({
    super.key,
    required this.child,
    this.padding,
    this.onTap,
    this.backgroundColor,
    this.borderRadius,
    this.showBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    
    final cardBackground = backgroundColor ?? 
        (isDark ? AppColors.surfaceDark : AppColors.surface);
    
    final borderColor = isDark ? AppColors.grey300 : AppColors.grey300;
    
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius ?? BorderRadius.circular(AppRadius.card),
        child: Container(
          padding: padding ?? const EdgeInsets.all(AppSpacing.cardPadding),
          decoration: BoxDecoration(
            color: cardBackground,
            borderRadius: borderRadius ?? BorderRadius.circular(AppRadius.card),
            border: showBorder ? Border.all(color: borderColor, width: 1) : null,
            boxShadow: isDark 
                ? AppElevation.darkSoftShadow 
                : AppElevation.softShadow,
          ),
          child: child,
        ),
      ),
    );
  }
}
