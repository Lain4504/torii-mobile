import 'package:flutter/material.dart';
import 'dart:math' as math;

/// Decorative Japanese elements (Sakura, Torii pattern)
class JapaneseDecorativeElement extends StatelessWidget {
  final DecorativeType type;
  final double size;
  final Color? color;
  final double opacity;

  const JapaneseDecorativeElement({
    super.key,
    this.type = DecorativeType.sakura,
    this.size = 60,
    this.color,
    this.opacity = 0.3,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveColor = color ?? theme.colorScheme.primary;

    return Opacity(
      opacity: opacity,
      child: SizedBox(
        width: size,
        height: size,
        child: CustomPaint(
          painter: _JapanesePatternPainter(
            type: type,
            color: effectiveColor,
          ),
        ),
      ),
    );
  }
}

enum DecorativeType {
  sakura,
  torii,
  wave,
}

class _JapanesePatternPainter extends CustomPainter {
  final DecorativeType type;
  final Color color;

  _JapanesePatternPainter({
    required this.type,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    switch (type) {
      case DecorativeType.sakura:
        _drawSakura(canvas, size, paint);
        break;
      case DecorativeType.torii:
        _drawTorii(canvas, size, paint);
        break;
      case DecorativeType.wave:
        _drawWave(canvas, size, paint);
        break;
    }
  }

  void _drawSakura(Canvas canvas, Size size, Paint paint) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 3;

    // Draw 5 petals
    for (int i = 0; i < 5; i++) {
      final angle = (i * 2 * math.pi / 5) - math.pi / 2;
      final petalPath = Path();
      
      // Create petal shape
      final x1 = center.dx + radius * math.cos(angle);
      final y1 = center.dy + radius * math.sin(angle);
      final x2 = center.dx + radius * 0.6 * math.cos(angle + 0.3);
      final y2 = center.dy + radius * 0.6 * math.sin(angle + 0.3);
      final x3 = center.dx + radius * 0.6 * math.cos(angle - 0.3);
      final y3 = center.dy + radius * 0.6 * math.sin(angle - 0.3);

      petalPath.moveTo(center.dx, center.dy);
      petalPath.quadraticBezierTo(x2, y2, x1, y1);
      petalPath.quadraticBezierTo(x3, y3, center.dx, center.dy);
      petalPath.close();

      canvas.drawPath(petalPath, paint);
    }

    // Draw center circle
    canvas.drawCircle(center, radius * 0.2, paint..color = color.withValues(alpha: 0.8));
  }

  void _drawTorii(Canvas canvas, Size size, Paint paint) {
    final centerX = size.width / 2;
    final baseY = size.height * 0.8;
    final topY = size.height * 0.2;
    final width = size.width * 0.6;

    // Draw vertical posts
    final postWidth = size.width * 0.08;
    canvas.drawRect(
      Rect.fromLTWH(centerX - width / 2, topY, postWidth, baseY - topY),
      paint,
    );
    canvas.drawRect(
      Rect.fromLTWH(centerX + width / 2 - postWidth, topY, postWidth, baseY - topY),
      paint,
    );

    // Draw horizontal beam
    final beamHeight = size.height * 0.1;
    canvas.drawRect(
      Rect.fromLTWH(centerX - width / 2, topY, width, beamHeight),
      paint,
    );

    // Draw top beam
    final topBeamWidth = size.width * 0.8;
    canvas.drawRect(
      Rect.fromLTWH(
        centerX - topBeamWidth / 2,
        topY - beamHeight * 0.5,
        topBeamWidth,
        beamHeight * 0.5,
      ),
      paint,
    );
  }

  void _drawWave(Canvas canvas, Size size, Paint paint) {
    final path = Path();
    final waveHeight = size.height * 0.3;
    final waveCount = 3;

    path.moveTo(0, size.height / 2);

    for (int i = 0; i <= waveCount; i++) {
      final x = (i * size.width) / waveCount;
      final y = size.height / 2 +
          waveHeight * math.sin((i * 2 * math.pi) / waveCount);
      path.quadraticBezierTo(
        x + size.width / (waveCount * 2),
        y,
        x + size.width / waveCount,
        size.height / 2,
      );
    }

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

