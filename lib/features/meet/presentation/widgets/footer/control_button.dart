import 'package:flutter/material.dart';
import 'package:torii_app/core/constants/app_design_system.dart';

class ControlButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;
  final int badgeCount;
  final Color? activeColor;
  final bool isDanger;

  const ControlButton({
    super.key,
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
    this.badgeCount = 0,
    this.activeColor,
    this.isDanger = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = MediaQuery.of(context).size.width < 768;

    final baseBg = theme.colorScheme.onSurface.withValues(alpha: 0.08);
    final baseFg = theme.colorScheme.onSurface.withValues(alpha: 0.7);
    final activeBg = isDanger
        ? theme.colorScheme.error
        : (activeColor ?? theme.colorScheme.primary);

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
                    ? activeBg.withValues(alpha: 0.35)
                    : theme.colorScheme.outlineVariant,
                width: 1.2,
              ),
              boxShadow: (isActive || isDanger)
                  ? [
                      BoxShadow(
                        color: activeBg.withValues(alpha: 0.24),
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ]
                  : null,
            ),
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Icon(
                  icon,
                  color: isActive
                      ? AppColors.textOnPrimary
                      : baseFg,
                  size: isMobile ? 21 : 23,
                ),
                if (badgeCount > 0)
                  Positioned(
                    top: isMobile ? -2 : -3,
                    right: isMobile ? -2 : -3,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(999),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 18,
                        minHeight: 18,
                      ),
                      child: Center(
                        child: Text(
                          badgeCount > 99 ? '99+' : '$badgeCount',
                          style: const TextStyle(
                            color: AppColors.textOnPrimary,
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
        if (!isMobile) ...[
          const SizedBox(height: 6),
          Text(
            label,
            style: theme.textTheme.bodySmall?.copyWith(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: theme.colorScheme.onSurfaceVariant,
              letterSpacing: 0.2,
            ),
          ),
        ],
      ],
    );
  }
}
