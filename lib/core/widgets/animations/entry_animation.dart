import 'package:flutter/material.dart';
import '../../constants/app_design_system.dart';

class EntryAnimation extends StatefulWidget {
  final Widget child;
  final Duration? delay;
  final Duration? duration;
  final Curve? curve;
  final double verticalOffset;
  final int index;
  final Duration stagger;

  const EntryAnimation({
    super.key,
    required this.child,
    this.delay,
    this.duration,
    this.curve,
    this.verticalOffset = 20.0,
    this.index = 0,
    this.stagger = const Duration(milliseconds: 50),
  });

  @override
  State<EntryAnimation> createState() => _EntryAnimationState();
}

class _EntryAnimationState extends State<EntryAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<Offset> _translate;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration ?? AppDuration.slow,
    );

    _opacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: widget.curve ?? AppCurves.easeOut,
      ),
    );

    _translate = Tween<Offset>(
      begin: Offset(0, widget.verticalOffset),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: widget.curve ?? AppCurves.easeOut,
      ),
    );

    _play();
  }

  void _play() async {
    final delay = (widget.delay ?? Duration.zero) + 
                  (widget.stagger * widget.index);
    
    if (delay > Duration.zero) {
      await Future.delayed(delay);
    }
    
    if (mounted) {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _opacity.value,
          child: Transform.translate(
            offset: _translate.value,
            child: widget.child,
          ),
        );
      },
    );
  }
}
