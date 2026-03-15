import 'package:flutter/material.dart';
import 'package:torii_app/core/constants/app_design_system.dart';

class ControlButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;
  final Color? activeColor;

  const ControlButton({
    super.key,
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
    this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    final primaryColor = activeColor ?? Theme.of(context).colorScheme.primary;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: isMobile ? 52 : 60,
            height: isMobile ? 52 : 60,
            decoration: BoxDecoration(
              color: isActive
                  ? primaryColor
                  : (isDark ? AppColors.textPrimaryDark.withOpacity(0.08) : AppColors.textPrimary.withOpacity(0.05)),
              borderRadius: BorderRadius.circular(16),
              boxShadow: isActive
                  ? [
                      BoxShadow(
                        color: primaryColor.withOpacity(0.3),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ]
                  : null,
            ),
            child: Icon(
              icon,
              color: isActive 
                  ? AppColors.textOnPrimary 
                  : (isDark ? AppColors.textPrimaryDark.withOpacity(0.7) : AppColors.textPrimary.withOpacity(0.6)),
              size: isMobile ? 24 : 28,
            ),
          ),
        ),
        if (!isMobile) ...[
          const SizedBox(height: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: isDark ? AppColors.textPrimaryDark : AppColors.grey700,
              letterSpacing: 0.2,
            ),
          ),
        ],
      ],
    );
  }
}
