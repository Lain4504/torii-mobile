import 'package:flutter/material.dart';
import '../../constants/app_design_system.dart';

class ToriiIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const ToriiIcon({
    super.key,
    this.size = 64,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final iconColor = color ?? AppColors.secondary;
    
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _ToriiPainter(color: iconColor),
      ),
    );
  }
}

class _ToriiPainter extends CustomPainter {
  final Color color;

  _ToriiPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final w = size.width;
    final h = size.height;

    // Pillars
    final pillarW = w * 0.1;
    final pillarH = h * 0.8;
    final pillarDist = w * 0.6;
    
    final leftPillar = Rect.fromLTWH((w - pillarDist - pillarW) / 2, h - pillarH, pillarW, pillarH);
    final rightPillar = Rect.fromLTWH((w + pillarDist - pillarW) / 2, h - pillarH, pillarW, pillarH);
    
    canvas.drawRRect(RRect.fromRectAndRadius(leftPillar, const Radius.circular(2)), paint);
    canvas.drawRRect(RRect.fromRectAndRadius(rightPillar, const Radius.circular(2)), paint);

    // Beams
    final topBeamW = w * 0.9;
    final topBeamH = h * 0.12;
    final topBeamY = h * 0.15;
    
    final bottomBeamW = w * 0.75;
    final bottomBeamH = h * 0.1;
    final bottomBeamY = h * 0.35;

    final topBeam = Rect.fromLTWH((w - topBeamW) / 2, topBeamY, topBeamW, topBeamH);
    final bottomBeam = Rect.fromLTWH((w - bottomBeamW) / 2, bottomBeamY, bottomBeamW, bottomBeamH);

    canvas.drawRRect(RRect.fromRectAndRadius(topBeam, const Radius.circular(4)), paint);
    canvas.drawRRect(RRect.fromRectAndRadius(bottomBeam, const Radius.circular(2)), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
