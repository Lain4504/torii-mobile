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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  children: [
                    Icon(Icons.visibility_outlined, color: scheme.primary, size: 22),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bảng trắng',
                            style: textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Markdraw · Chế độ xem (tay/khung) · Đồng bộ từ meet web',
                            style: textTheme.bodySmall?.copyWith(
                              color: scheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        ref.read(whiteboardProvider.notifier).setIsVisible(false);
                      },
                      icon: const Icon(Icons.close),
                      tooltip: 'Đóng',
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),
              Expanded(
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
