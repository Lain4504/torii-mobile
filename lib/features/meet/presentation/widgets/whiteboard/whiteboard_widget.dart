import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import '../../../providers/whiteboard_provider.dart';
import 'whiteboard_canvas.dart';
import 'whiteboard_toolbar.dart';

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
      color: AppColors.surface,
      child: Stack(
        children: [
          // Canvas
          const Positioned.fill(
            child: WhiteboardCanvas(),
          ),
          
          // Toolbar
          const Positioned(
            left: 16,
            top: 16,
            bottom: 16,
            child: WhiteboardToolbar(),
          ),
          
          // Page controls (bottom center)
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: Center(
              child: _buildPageControls(context, ref),
            ),
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
                backgroundColor: AppColors.textPrimary.withOpacity(0.12),
                foregroundColor: AppColors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageControls(BuildContext context, WidgetRef ref) {
    final currentPage = ref.watch(
      whiteboardProvider.select((s) => s.currentPage),
    );
    final totalPages = ref.watch(
      whiteboardProvider.select((s) => s.totalPages),
    );

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.textPrimary.withOpacity(0.87),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.chevron_left, color: AppColors.textOnPrimary),
            onPressed: currentPage > 1 
              ? () {
                  // TODO: Previous page
                  ref.read(whiteboardProvider.notifier).setCurrentPage(currentPage - 1);
                } 
              : null,
            iconSize: 20,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
          const SizedBox(width: 16),
          Text(
            '$currentPage / $totalPages',
            style: const TextStyle(
              color: AppColors.textOnPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 16),
          IconButton(
            icon: const Icon(Icons.chevron_right, color: AppColors.textOnPrimary),
            onPressed: currentPage < totalPages 
              ? () {
                  // TODO: Next page
                  ref.read(whiteboardProvider.notifier).setCurrentPage(currentPage + 1);
                } 
              : null,
            iconSize: 20,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }
}
