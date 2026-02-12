import 'package:flutter/material.dart';

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
    final color = activeColor ?? Theme.of(context).colorScheme.primary;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: isMobile ? 56 : 64,
        height: isMobile ? 56 : 64,
        decoration: BoxDecoration(
          color: isActive
              ? color.withOpacity(0.2)
              : Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isActive
                ? color
                : Theme.of(context).dividerColor.withOpacity(0.2),
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isActive ? color : Colors.white70,
              size: isMobile ? 24 : 28,
            ),
            if (!isMobile) ...[
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  fontSize: 10,
                  color: isActive ? color : Colors.white70,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
