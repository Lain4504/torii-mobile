import 'dart:async';
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
  final bool animate; // New property to explicitly trigger/reset animation

  const EntryAnimation({
    super.key,
    required this.child,
    this.delay,
    this.duration,
    this.curve,
    this.verticalOffset = 20.0,
    this.index = 0,
    this.stagger = const Duration(milliseconds: 50),
    this.animate = true,
  });

  @override
  State<EntryAnimation> createState() => _EntryAnimationState();
}

class _EntryAnimationState extends State<EntryAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<Offset> _translate;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration ?? AppDuration.slow,
    );

    _initAnimations();

    if (widget.animate) {
      _play();
    } else {
      _controller.value = 0;
    }
  }

  void _initAnimations() {
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
  }

  @override
  void didUpdateWidget(EntryAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    
    // If vertical offset changed, we need to rebuild the translation animation
    if (oldWidget.verticalOffset != widget.verticalOffset || 
        oldWidget.curve != widget.curve) {
      _initAnimations();
    }

    // Logic to re-trigger animation if state changed
    if (widget.animate && (!oldWidget.animate || oldWidget.index != widget.index)) {
      _stop();
      _controller.reset();
      _play();
    } else if (!widget.animate && oldWidget.animate) {
      _stop();
      _controller.reset();
    }
  }

  void _play() {
    _stop();
    final delay = (widget.delay ?? Duration.zero) + 
                  (widget.stagger * widget.index);
    
    if (delay > Duration.zero) {
      _timer = Timer(delay, () {
        if (mounted) _controller.forward();
      });
    } else {
      _controller.forward();
    }
  }

  void _stop() {
    _timer?.cancel();
    _timer = null;
  }

  @override
  void dispose() {
    _stop();
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
