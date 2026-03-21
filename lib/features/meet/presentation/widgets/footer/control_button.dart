import 'package:flutter/material.dart';
import 'package:torii_app/core/constants/app_design_system.dart';

class ControlButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;
  final Color? activeColor;
  final bool isDanger;

  const ControlButton({
    super.key,
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
    this.activeColor,
    this.isDanger = false,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final baseBg = isDark
        ? AppColors.textPrimaryDark.withOpacity(0.10)
        : AppColors.textPrimary.withOpacity(0.06);
    final baseFg = isDark
        ? AppColors.textPrimaryDark.withOpacity(0.9)
        : AppColors.textPrimary.withOpacity(0.75);
    final activeBg = isDanger
        ? AppColors.error
        : (activeColor ?? Theme.of(context).colorScheme.primary);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(24),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: isMobile ? 44 : 50,
            height: isMobile ? 44 : 50,
            decoration: BoxDecoration(
              color: isActive
                  ? activeBg
                  : baseBg,
              shape: BoxShape.circle,
              border: Border.all(
                color: isActive
                    ? activeBg.withOpacity(0.35)
                    : (isDark
                        ? AppColors.borderDark.withOpacity(0.9)
                        : AppColors.grey300.withOpacity(0.9)),
                width: 1.2,
              ),
              boxShadow: (isActive || isDanger)
                  ? [
                      BoxShadow(
                        color: activeBg.withOpacity(0.24),
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ]
                  : null,
            ),
            child: Icon(
              icon,
              color: isActive 
                  ? AppColors.textOnPrimary 
                  : baseFg,
              size: isMobile ? 21 : 23,
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
