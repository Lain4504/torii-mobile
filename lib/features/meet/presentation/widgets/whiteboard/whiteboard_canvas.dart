import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Whiteboard Canvas Widget
/// Handles drawing operations
class WhiteboardCanvas extends ConsumerStatefulWidget {
  const WhiteboardCanvas({super.key});

  @override
  ConsumerState<WhiteboardCanvas> createState() => _WhiteboardCanvasState();
}

class _WhiteboardCanvasState extends ConsumerState<WhiteboardCanvas> {
  // TODO: Use CustomPainter for actual drawing
  
  @override
  Widget build(BuildContext context) {
    // This is a placeholder for the actual canvas implementation
    // In a real app, this would use CustomPaint and handle touch events
    return GestureDetector(
      onPanStart: (details) {
        // TODO: Start drawing
      },
      onPanUpdate: (details) {
        // TODO: Update drawing
      },
      onPanEnd: (details) {
        // TODO: End drawing
      },
      child: CustomPaint(
        painter: _WhiteboardPainter(),
        size: Size.infinite,
      ),
    );
  }
}

class _WhiteboardPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // grid background
    final paint = Paint()
      ..color = Colors.grey.withOpacity(0.2)
      ..strokeWidth = 1;

    const gridSize = 40.0;
    
    // Draw vertical lines
    for (double x = 0; x < size.width; x += gridSize) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }

    // Draw horizontal lines
    for (double y = 0; y < size.height; y += gridSize) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
