import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/whiteboard_provider.dart';
import 'meet_markdraw_whiteboard.dart';

/// Bảng trắng trên mobile: đồng bộ scene Excalidraw từ web qua NATS, hiển thị bằng [markdraw].
class WhiteboardWidget extends ConsumerWidget {
  const WhiteboardWidget({super.key});

  bool _hasScene(WhiteboardState s) {
    final all = s.allExcalidrawElements.trim();
    final cur = s.excalidrawElements.trim();
    return all.isNotEmpty || cur.isNotEmpty;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final hasContent = ref.watch(whiteboardProvider.select(_hasScene));

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 960),
        child: Material(
          color: scheme.surface,
          elevation: 6,
          shadowColor: scheme.shadow,
          borderRadius: BorderRadius.circular(16),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            fit: StackFit.expand,
            children: [
              const MeetMarkdrawWhiteboard(),
              if (!hasContent)
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Text(
                      'Chưa có nội dung bảng trắng hoặc đang chờ đồng bộ từ người trình bày…',
                      textAlign: TextAlign.center,
                      style: textTheme.bodyMedium?.copyWith(
                        color: scheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ),
              Positioned(
                top: 8,
                right: 8,
                child: Material(
                  color: Colors.black26,
                  shape: const CircleBorder(),
                  clipBehavior: Clip.antiAlias,
                  child: IconButton(
                    onPressed: () {
                      ref.read(whiteboardProvider.notifier).setIsVisible(false);
                    },
                    icon: const Icon(Icons.close, color: Colors.white),
                    tooltip: 'Đóng',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
