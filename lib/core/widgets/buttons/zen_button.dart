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
  final double? height;

  const ZenButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isFullWidth = false,
    this.isPrimary = true,
    this.icon,
    this.isLoading = false,
    this.padding,
    this.height = 56,
  });

  @override
  Widget build(BuildContext context) {
    final bool disabled = onPressed == null || isLoading;
    
    final button = AnimatedContainer(
      duration: AppDuration.fast,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.full),
        gradient: isPrimary && !disabled ? AppColors.primaryGradient : null,
        color: !isPrimary 
            ? Colors.transparent 
            : (disabled ? AppColors.grey300 : null),
        border: !isPrimary 
            ? Border.all(color: AppColors.primary.withOpacity(0.5), width: 1.5)
            : null,
        boxShadow: isPrimary && !disabled
            ? [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.35),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ]
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: disabled ? null : onPressed,
          borderRadius: BorderRadius.circular(AppRadius.full),
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
                    Icon(icon, size: 20, color: isPrimary ? Colors.white : AppColors.primary),
                    const SizedBox(width: 12),
                  ],
                  Text(
                    text.toUpperCase(),
                    style: TextStyle(
                      color: isPrimary ? Colors.white : AppColors.primary,
                      fontWeight: AppTypography.black,
                      fontSize: 13,
                      letterSpacing: 2.0,
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

