import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import '../../../providers/whiteboard_provider.dart';
import 'whiteboard_canvas.dart';

/// Whiteboard Widget
/// Main whiteboard container
/// 1:1 clone of apps/meet/src/components/whiteboard/index.tsx
class WhiteboardWidget extends ConsumerWidget {
  const WhiteboardWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Only show if whiteboard is active
    final isWhiteboardVisible = ref.watch(
      whiteboardProvider.select((s) => s.isVisible),
    );

    if (!isWhiteboardVisible) {
      return const SizedBox.shrink();
    }

    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: Stack(
        children: [
          // Canvas
          const Positioned.fill(
            child: WhiteboardCanvas(),
          ),
          
          // Close button (top right)
          Positioned(
            top: 16,
            right: 16,
            child: IconButton.filled(
              onPressed: () {
                // TODO: Close whiteboard
                ref.read(whiteboardProvider.notifier).setIsVisible(false);
              },
              icon: const Icon(Icons.close),
              style: IconButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
                foregroundColor: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
