import 'package:flutter/material.dart';
import '../../constants/app_design_system.dart';
import '../animations/entry_animation.dart';

/// Zen Loading Component - Zen UI Pro Max
/// 
/// A premium, minimalist loading indicator with smooth animations.
/// Inspired by the Japanese aesthetic of "Ma" (negative space).
class ZenLoading extends StatefulWidget {
  final String? text;
  final double size;
  final Color? color;

  const ZenLoading({
    super.key,
    this.text,
    this.size = 48.0,
    this.color,
  });

  @override
  State<ZenLoading> createState() => _ZenLoadingState();
}

class _ZenLoadingState extends State<ZenLoading> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = widget.color ?? AppColors.primary;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RotationTransition(
            turns: _controller,
            child: Container(
              width: widget.size,
              height: widget.size,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppRadius.lg),
                border: Border.all(
                  color: primaryColor.withOpacity(0.1),
                  width: 2.5,
                ),
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: CustomPaint(
                      painter: _ZenSpinnerPainter(
                        color: primaryColor,
                        strokeWidth: 2.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (widget.text != null) ...[
            const SizedBox(height: AppSpacing.lg),
            _PulseText(text: widget.text!.toUpperCase()),
          ],
        ],
      ),
    );
  }
}

/// Full screen variant of Zen Loading
class ZenLoadingScreen extends StatelessWidget {
  final String? text;
  const ZenLoadingScreen({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: EntryAnimation(
        child: ZenLoading(text: text ?? 'Initializing System...'),
      ),
    );
  }
}

class _ZenSpinnerPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;

  _ZenSpinnerPainter({required this.color, required this.strokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Draw only the top-right arc (about 90 degrees)
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawArc(rect, -1.5, 1.2, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _PulseText extends StatefulWidget {
  final String text;
  const _PulseText({required this.text});

  @override
  State<_PulseText> createState() => _PulseTextState();
}

class _PulseTextState extends State<_PulseText> with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);
    _opacityAnimation = Tween<double>(begin: 0.2, end: 0.6).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacityAnimation,
      child: Text(
        widget.text,
        style: const TextStyle(
          fontSize: 10,
          fontWeight: AppTypography.black,
          letterSpacing: 4.0,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }
}
