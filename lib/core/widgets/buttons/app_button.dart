import 'package:flutter/material.dart';
import '../../constants/app_design_system.dart';

enum AppButtonType { primary, secondary, ghost, outline, disabled }

enum AppButtonSize { small, medium, large }

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isFullWidth;
  final AppButtonType
  type; // Replaces simple isPrimary boolean for more variants
  final AppButtonSize size;
  final IconData? icon;
  final bool isLoading;
  final EdgeInsets? padding;
  final double? height;
  final double? fontSize;
  final double? width;

  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isFullWidth = false,
    this.type = AppButtonType.primary,
    this.size = AppButtonSize.medium,
    this.icon,
    this.isLoading = false,
    this.padding,
    this.height = 56,
    this.fontSize,
    this.width,
    // Backward compatibility helper if needed, though we prefer 'type'
    bool isPrimary = true,
  }) : assert(true); // Simplified for now, we will rely on 'type' mostly.
  // If isPrimary was passed as false in legacy calls, they should ideally be migrated,
  // but for now default 'type' is primary.

  @override
  Widget build(BuildContext context) {
    final bool disabled =
        onPressed == null || isLoading || type == AppButtonType.disabled;

    // Determine colors based on type
    Color? textColor;
    Gradient? bgGradient;
    Color? bgColor;
    BoxBorder? border;
    List<BoxShadow>? shadows;

    switch (type) {
      case AppButtonType.primary:
        bgColor = AppColors.primary;
        textColor = AppColors.primaryForeground;
        // Subtle shadcn-like shadow
        shadows = !disabled
            ? [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ]
            : null;
        break;
      case AppButtonType.secondary:
        bgColor = AppColors.secondary;
        textColor = AppColors.secondaryForeground;
        border = Border.all(
          color: AppColors.border,
          width: 1,
        );
        break;
      case AppButtonType.ghost:
        bgColor = Colors.transparent;
        textColor = AppColors.mutedForeground;
        break;
      case AppButtonType.outline:
        bgColor = Colors.transparent;
        border = Border.all(
          color: disabled ? AppColors.border : AppColors.primary,
          width: 1.5,
        );
        textColor = disabled ? AppColors.mutedForeground : AppColors.primary;
        break;
      case AppButtonType.disabled:
        bgColor = AppColors.secondary;
        textColor = AppColors.mutedForeground;
        break;
    }

    // Determine height based on size
    final double effectiveHeight =
        height ??
        (size == AppButtonSize.small
            ? 40
            : size == AppButtonSize.large
            ? 64
            : 56);

    final button = AnimatedContainer(
      duration: AppDuration.fast,
      height: effectiveHeight,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.button),
        gradient: bgGradient,
        color: bgColor,
        border: border,
        boxShadow: shadows,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: disabled ? null : onPressed,
          borderRadius: BorderRadius.circular(AppRadius.button),
          child: Padding(
            padding: padding ?? const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (isLoading)
                  const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.5,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                else ...[
                  if (icon != null) ...[
                    Icon(icon, size: 20, color: textColor),
                    const SizedBox(width: 12),
                  ],
                  Text(
                    text,
                    style: TextStyle(
                      color: textColor,
                      fontWeight: AppTypography.bold,
                      fontSize: fontSize ?? (size == AppButtonSize.small ? 13 : 15),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );

    if (isFullWidth) {
      return SizedBox(width: double.infinity, child: button);
    }

    return button;
  }
}
