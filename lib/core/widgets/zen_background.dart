import 'dart:ui';
import 'package:flutter/material.dart';
import '../constants/app_design_system.dart';

/// Zen Background Pattern - Rhythmic vertical lines inspired by Shoji screens
class ZenPatternPainter extends CustomPainter {
  final Color? color;
  final double spacing;
  final double strokeWidth;

  ZenPatternPainter({
    this.color,
    this.spacing = 80.0,
    this.strokeWidth = 0.5,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color ?? AppColors.primary.withOpacity(0.03)
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    for (double i = 0; i < size.width; i += spacing) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Zen Background Widget - A premium background with soft glows and patterns
class ZenBackground extends StatelessWidget {
  final Widget child;
  final List<Widget>? overlay;
  final bool animate;

  const ZenBackground({
    super.key,
    required this.child,
    this.overlay,
    this.animate = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Stack(
      children: [
        // Base Color
        Positioned.fill(
          child: Container(color: theme.scaffoldBackgroundColor),
        ),
        
        // Ambient Glows
        Positioned(
          top: -150,
          right: -100,
          child: _Glow(
            color: AppColors.primary.withOpacity(0.05),
            size: 450,
            blur: 100,
          ),
        ),
        Positioned(
          bottom: -100,
          left: -120,
          child: _Glow(
            color: AppColors.accent.withOpacity(0.04),
            size: 400,
            blur: 80,
          ),
        ),
        
        // Pattern
        Positioned.fill(
          child: CustomPaint(
            painter: ZenPatternPainter(),
          ),
        ),
        
        // Optional Overlays
        if (overlay != null) ...overlay!,
        
        // Content
        Positioned.fill(child: child),
      ],
    );
  }
}

class _Glow extends StatelessWidget {
  final Color color;
  final double size;
  final double blur;

  const _Glow({
    required this.color,
    required this.size,
    required this.blur,
  });

  @override
  Widget build(BuildContext context) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

