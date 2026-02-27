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
    
    final bgColor = color ?? (isDark ? Colors.white10 : AppColors.secondary);
    final fgColor = textColor ?? (isDark ? AppColors.mutedForeground : AppColors.mutedForeground);
    
    return Container(
      padding: padding ?? const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(AppRadius.full),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 12, color: fgColor),
            const SizedBox(width: 4),
          ],
          Text(
            label.toUpperCase(),
            style: TextStyle(
              color: fgColor,
              fontSize: fontSize ?? 8,
              fontWeight: fontWeight ?? AppTypography.black,
              letterSpacing: 1.5,
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
        bgColor = AppColors.success.withValues(alpha: 0.1);
        fgColor = AppColors.success;
        break;
      case StatusType.warning:
        bgColor = const Color(0xFFF59E0B).withValues(alpha: 0.1);
        fgColor = const Color(0xFFD97706);
        break;
      case StatusType.error:
        bgColor = AppColors.destructive.withValues(alpha: 0.1);
        fgColor = AppColors.destructive;
        break;
      case StatusType.info:
        bgColor = AppColors.primary.withValues(alpha: 0.1);
        fgColor = AppColors.primary;
        break;
      case StatusType.neutral:
        bgColor = AppColors.secondary;
        fgColor = AppColors.mutedForeground;
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
      color: AppColors.primary.withValues(alpha: 0.1),
      textColor: AppColors.primary,
    );
  }
}
