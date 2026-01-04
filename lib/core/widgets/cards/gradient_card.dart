import 'package:flutter/material.dart';
import '../../constants/app_design_system.dart';

/// Gradient Card - For accent/featured content
/// 
/// Use sparingly for emphasis. Prefer subtle gradients.
class GradientCard extends StatelessWidget {
  final Widget child;
  final Gradient? gradient;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  final BorderRadius? borderRadius;

  const GradientCard({
    super.key,
    required this.child,
    this.gradient,
    this.padding,
    this.onTap,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius ?? BorderRadius.circular(AppRadius.card),
        child: Container(
          padding: padding ?? const EdgeInsets.all(AppSpacing.cardPadding),
          decoration: BoxDecoration(
            gradient: gradient ?? AppColors.primaryGradient,
            borderRadius: borderRadius ?? BorderRadius.circular(AppRadius.card),
          ),
          child: child,
        ),
      ),
    );
  }
}
