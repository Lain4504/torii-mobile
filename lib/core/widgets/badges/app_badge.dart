import 'package:flutter/material.dart';
import '../../constants/app_design_system.dart';

/// App Badge - Minimal label for metadata
/// 
/// Use for status indicators, categories, and tags.
class AppBadge extends StatelessWidget {
  final String label;
  final Color? color;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final EdgeInsetsGeometry? padding;
  final IconData? icon;

  const AppBadge({
    super.key,
    required this.label,
    this.color,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.padding,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    
    final bgColor = color ?? (isDark ? AppColors.surfaceVariantDark : AppColors.surfaceVariant);
    final fgColor = textColor ?? (isDark ? AppColors.textSecondaryDark : AppColors.textSecondary);
    
    return Container(
      padding: padding ?? const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(AppRadius.xs),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 12, color: fgColor),
            const SizedBox(width: 4),
          ],
          Text(
            label,
            style: TextStyle(
              color: fgColor,
              fontSize: fontSize ?? AppTypography.fontSizeXs,
              fontWeight: fontWeight ?? AppTypography.semiBold,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}

/// Status Badge - For status indicators with semantic colors
class StatusBadge extends StatelessWidget {
  final String label;
  final StatusType status;

  const StatusBadge({
    super.key,
    required this.label,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    Color bgColor;
    Color fgColor;
    
    switch (status) {
      case StatusType.success:
        bgColor = AppColors.successLight;
        fgColor = AppColors.successDark;
        break;
      case StatusType.warning:
        bgColor = AppColors.warningLight;
        fgColor = AppColors.warningDark;
        break;
      case StatusType.error:
        bgColor = AppColors.errorLight;
        fgColor = AppColors.errorDark;
        break;
      case StatusType.info:
        bgColor = AppColors.infoLight;
        fgColor = AppColors.infoDark;
        break;
      case StatusType.neutral:
        bgColor = AppColors.surfaceVariant;
        fgColor = AppColors.textSecondary;
        break;
    }
    
    return AppBadge(
      label: label,
      color: bgColor,
      textColor: fgColor,
    );
  }
}

enum StatusType {
  success,
  warning,
  error,
  info,
  neutral,
}

/// Level Badge - For JLPT levels
class LevelBadge extends StatelessWidget {
  final String level;

  const LevelBadge({super.key, required this.level});

  @override
  Widget build(BuildContext context) {
    return AppBadge(
      label: level,
      color: AppColors.primarySurface,
      textColor: AppColors.primary,
    );
  }
}
