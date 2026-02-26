import 'package:flutter/material.dart';
import '../../constants/app_design_system.dart';

class VoiceWaveAnimation extends StatefulWidget {
  final bool isListening;
  final Color color;

  const VoiceWaveAnimation({
    super.key,
    required this.isListening,
    this.color = AppColors.primary,
  });

  @override
  State<VoiceWaveAnimation> createState() => _VoiceWaveAnimationState();
}

class _VoiceWaveAnimationState extends State<VoiceWaveAnimation> with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<double>> _animations;
  final int _barCount = 5;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(_barCount, (index) {
      return AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 400 + (index * 100)),
      );
    });

    _animations = _controllers.map((controller) {
      return Tween<double>(begin: 0.2, end: 1.0).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInOut),
      );
    }).toList();

    if (widget.isListening) {
      _startAnimations();
    }
  }

  void _startAnimations() {
    for (var controller in _controllers) {
      controller.repeat(reverse: true);
    }
  }

  void _stopAnimations() {
    for (var controller in _controllers) {
      controller.stop();
      controller.animateTo(0.2);
    }
  }

  @override
  void didUpdateWidget(VoiceWaveAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isListening != oldWidget.isListening) {
      if (widget.isListening) {
        _startAnimations();
      } else {
        _stopAnimations();
      }
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(_barCount, (index) {
          return AnimatedBuilder(
            animation: _animations[index],
            builder: (context, child) {
              return Container(
                width: 4,
                height: 32 * _animations[index].value,
                margin: const EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(
                  color: widget.isListening 
                      ? widget.color.withValues(alpha: 0.8) 
                      : AppColors.grey300,
                  borderRadius: BorderRadius.circular(2),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
