import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../constants/app_design_system.dart';

/// Course Progress Ring - Zen-inspired Circular Progress
/// 
/// A minimalist circular progress indicator for enrolled courses.
/// Displays completion percentage with smooth animations and color coding.
class CourseProgressRing extends StatefulWidget {
  final double progress; // 0.0 to 1.0
  final double size;
  final double strokeWidth;
  final bool showPercentage;
  final bool animate;

  const CourseProgressRing({
    super.key,
    required this.progress,
    this.size = 60,
    this.strokeWidth = 4,
    this.showPercentage = true,
    this.animate = true,
  });

  @override
  State<CourseProgressRing> createState() => _CourseProgressRingState();
}

class _CourseProgressRingState extends State<CourseProgressRing>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    
    _controller = AnimationController(
      duration: widget.animate 
          ? const Duration(milliseconds: 1200)
          : Duration.zero,
      vsync: this,
    );

    _animation = Tween<double>(
      begin: 0.0,
      end: widget.progress,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    ));

    _controller.forward();
  }

  @override
  void didUpdateWidget(CourseProgressRing oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.progress != widget.progress) {
      _animation = Tween<double>(
        begin: oldWidget.progress,
        end: widget.progress,
      ).animate(CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutCubic,
      ));
      _controller
        ..reset()
        ..forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color _getProgressColor(double progress) {
    if (progress < 0.3) {
      return AppColors.info;
    } else if (progress < 0.7) {
      return AppColors.warning;
    } else if (progress < 1.0) {
      return AppColors.primary;
    } else {
      return AppColors.success;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          final currentProgress = _animation.value;
          final progressColor = _getProgressColor(currentProgress);
          final percentage = (currentProgress * 100).toInt();

          return Stack(
            alignment: Alignment.center,
            children: [
              // Background circle
              CustomPaint(
                size: Size(widget.size, widget.size),
                painter: _ProgressRingPainter(
                  progress: 1.0,
                  color: AppColors.grey200,
                  strokeWidth: widget.strokeWidth,
                  backgroundColor: true,
                ),
              ),
              
              // Progress arc
              CustomPaint(
                size: Size(widget.size, widget.size),
                painter: _ProgressRingPainter(
                  progress: currentProgress,
                  color: progressColor,
                  strokeWidth: widget.strokeWidth,
                  backgroundColor: false,
                ),
              ),
              
              // Percentage text
              if (widget.showPercentage)
                Padding(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '$percentage',
                        style: TextStyle(
                          fontSize: widget.size * 0.25,
                          fontWeight: AppTypography.black,
                          color: progressColor,
                          height: 1.0,
                        ),
                      ),
                      Text(
                        '%',
                        style: TextStyle(
                          fontSize: widget.size * 0.12,
                          fontWeight: AppTypography.bold,
                          color: AppColors.textTertiary,
                          height: 1.0,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class _ProgressRingPainter extends CustomPainter {
  final double progress;
  final Color color;
  final double strokeWidth;
  final bool backgroundColor;

  _ProgressRingPainter({
    required this.progress,
    required this.color,
    required this.strokeWidth,
    required this.backgroundColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;
    
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = backgroundColor ? StrokeCap.butt : StrokeCap.round;

    const startAngle = -math.pi / 2; // Start from top
    final sweepAngle = 2 * math.pi * progress;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(_ProgressRingPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
