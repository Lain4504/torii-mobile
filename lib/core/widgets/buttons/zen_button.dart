import 'package:flutter/material.dart';
import '../../constants/app_design_system.dart';

class ZenButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isFullWidth;
  final bool isPrimary;
  final IconData? icon;
  final bool isLoading;
  final EdgeInsets? padding;

  const ZenButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isFullWidth = false,
    this.isPrimary = true,
    this.icon,
    this.isLoading = false,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final button = Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: (onPressed == null || isLoading) ? null : onPressed,
        borderRadius: BorderRadius.circular(AppRadius.md),
        child: Container(
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          decoration: BoxDecoration(
            color: isPrimary 
                ? ((onPressed == null || isLoading) ? AppColors.grey300 : AppColors.primary)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(AppRadius.md),
            border: isPrimary 
                ? null 
                : Border.all(color: AppColors.primary.withOpacity(0.5), width: 1.5),
            boxShadow: isPrimary && onPressed != null && !isLoading
                ? [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : null,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isLoading)
                const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
              else ...[
                if (icon != null) ...[
                  Icon(icon, size: 18, color: isPrimary ? Colors.white : AppColors.primary),
                  const SizedBox(width: 8),
                ],
                Text(
                  text.toUpperCase(),
                  style: TextStyle(
                    color: isPrimary ? Colors.white : AppColors.primary,
                    fontWeight: AppTypography.black,
                    fontSize: 12,
                    letterSpacing: 1.5,
                  ),
                ),
              ],
            ],
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
