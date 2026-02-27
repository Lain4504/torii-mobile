import 'package:flutter/material.dart';
import '../../constants/app_design_system.dart';

/// Progress Bar - Clean, minimal progress indicator
/// 
/// For displaying learning progress, goals, etc.
class ProgressBar extends StatelessWidget {
  final double progress;
  final double height;
  final Color? progressColor;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final bool showLabel;
  final String? label;

  const ProgressBar({
    super.key,
    required this.progress,
    this.height = 6,
    this.progressColor,
    this.backgroundColor,
    this.borderRadius,
    this.showLabel = false,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    
    final bgColor = backgroundColor ?? 
        (isDark ? Colors.white10 : AppColors.secondary);
    final fgColor = progressColor ?? AppColors.primary;
    final radius = borderRadius ?? BorderRadius.circular(height / 2);
    
    final progressWidget = ClipRRect(
      borderRadius: radius,
      child: Stack(
        children: [
          // Background
          Container(
            height: height,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: radius,
            ),
          ),
          // Progress
          AnimatedFractionallySizedBox(
            duration: AppDuration.normal,
            curve: AppCurves.easeOut,
            widthFactor: progress.clamp(0.0, 1.0),
            child: Container(
              height: height,
              decoration: BoxDecoration(
                color: fgColor,
                borderRadius: radius,
              ),
            ),
          ),
        ],
      ),
    );
    
    if (showLabel) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (label != null)
                Text(
                  label!,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: AppColors.mutedForeground,
                    fontWeight: AppTypography.medium,
                  ),
                ),
              Text(
                '${(progress * 100).round()}%',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: AppColors.primary,
                  fontWeight: AppTypography.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xs),
          progressWidget,
        ],
      );
    }
    
    return progressWidget;
  }
}

/// Circular Progress - For compact progress display
class CircularProgress extends StatelessWidget {
  final double progress;
  final double size;
  final double strokeWidth;
  final Color? progressColor;
  final Color? backgroundColor;
  final Widget? child;

  const CircularProgress({
    super.key,
    required this.progress,
    this.size = 48,
    this.strokeWidth = 4,
    this.progressColor,
    this.backgroundColor,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    
    final bgColor = backgroundColor ?? 
        (isDark ? Colors.white10 : AppColors.secondary);
    final fgColor = progressColor ?? AppColors.primary;
    
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CircularProgressIndicator(
            value: progress.clamp(0.0, 1.0),
            strokeWidth: strokeWidth,
            backgroundColor: bgColor,
            valueColor: AlwaysStoppedAnimation(fgColor),
            strokeCap: StrokeCap.round,
          ),
          if (child != null)
            Center(child: child),
        ],
      ),
    );
  }
}
