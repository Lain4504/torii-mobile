import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import '../../../providers/whiteboard_provider.dart';

/// Whiteboard Toolbar Widget
/// Drawing tools selection
class WhiteboardToolbar extends ConsumerWidget {
  const WhiteboardToolbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeTool = ref.watch(
      whiteboardProvider.select((s) => s.tool),
    );

    return Container(
      width: 48,
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: AppColors.textPrimary.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildToolButton(
            context,
            ref,
            icon: Icons.edit,
            tool: 'pencil',
            isActive: activeTool == 'pencil',
          ),
          const SizedBox(height: 8),
          _buildToolButton(
            context,
            ref,
            icon: Icons.text_fields,
            tool: 'text',
            isActive: activeTool == 'text',
          ),
          const SizedBox(height: 8),
          _buildToolButton(
            context,
            ref,
            icon: Icons.check_box_outline_blank,
            tool: 'rectangle',
            isActive: activeTool == 'rectangle',
          ),
          const SizedBox(height: 8),
          _buildToolButton(
            context,
            ref,
            icon: Icons.circle_outlined,
            tool: 'ellipse',
            isActive: activeTool == 'ellipse',
          ),
          const SizedBox(height: 8),
          const Divider(height: 16),
          _buildToolButton(
            context,
            ref,
            icon: Icons.cleaning_services,
            tool: 'eraser',
            isActive: activeTool == 'eraser',
            color: AppColors.error,
          ),
          const SizedBox(height: 8),
          IconButton(
            icon: const Icon(Icons.delete_outline, color: AppColors.error),
            onPressed: () {
              // TODO: Clear whiteboard
            },
            tooltip: 'Clear All',
          ),
        ],
      ),
    );
  }

  Widget _buildToolButton(
    BuildContext context,
    WidgetRef ref, {
    required IconData icon,
    required String tool,
    required bool isActive,
    Color? color,
  }) {
    return IconButton(
      icon: Icon(icon),
      color: isActive 
        ? Theme.of(context).colorScheme.primary 
        : (color ?? AppColors.grey700),
      style: IconButton.styleFrom(
        backgroundColor: isActive 
          ? Theme.of(context).colorScheme.primary.withOpacity(0.1) 
          : Colors.transparent,
      ),
      onPressed: () {
        ref.read(whiteboardProvider.notifier).setTool(tool);
      },
    );
  }
}
