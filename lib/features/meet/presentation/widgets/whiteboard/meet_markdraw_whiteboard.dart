import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide Element, SelectionOverlay, TextAlign;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:markdraw/markdraw.dart' hide TextAlign;

import '../../../providers/whiteboard_provider.dart';
import 'enrich_whiteboard_images.dart';

/// Bảng trắng Meet dùng [markdraw] — nhận scene Excalidraw (JSON) từ NATS qua [whiteboardProvider].
///
/// NATS thường gửi **mảng phần tử**; [ExcalidrawJsonCodec] cần object có `elements` + `files` (dataURL)
/// cho ảnh — [enrichMeetWhiteboardJsonWithImageFiles] tải theo `customData.fileUrl` (web upload).
class MeetMarkdrawWhiteboard extends ConsumerStatefulWidget {
  const MeetMarkdrawWhiteboard({super.key});

  @override
  ConsumerState<MeetMarkdrawWhiteboard> createState() =>
      _MeetMarkdrawWhiteboardState();
}

class _MeetMarkdrawWhiteboardState extends ConsumerState<MeetMarkdrawWhiteboard> {
  late final MarkdrawController _controller;
  /// Nguồn JSON gốc từ NATS (chưa enrich) — tránh lặp và hủy apply cũ khi scene đổi nhanh.
  String _lastLoadedSource = '';
  int _applySeq = 0;
  /// Đang tải blob ảnh từ API (chỉ bật khi scene có `image` + `customData.fileUrl`).
  bool _sceneEnriching = false;
  Timer? _retryTimer;

  /// Mobile: chỉ xem + pan (tay); không toolbar / zoom / vẽ — giảng viên dùng meet web.
  static const _config = MarkdrawEditorConfig(
    showPropertyPanel: false,
    showLibraryPanel: false,
    showMarkdownButton: false,
    showMenu: false,
    showHelpButton: false,
    showToolbar: false,
    showZoomControls: false,
    tools: [ToolType.hand],
  );

  void _enforceViewOnly() {
    if (!_controller.viewMode) {
      _controller.toggleViewMode();
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = MarkdrawController(config: _config);
    _enforceViewOnly();
    _controller.addListener(_enforceViewOnly);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final json = ref.read(whiteboardProvider).allExcalidrawElements;
      if (json.isNotEmpty) {
        unawaited(_applyExcalidraw(json));
      }
    });
  }

  @override
  void dispose() {
    _retryTimer?.cancel();
    _controller.removeListener(_enforceViewOnly);
    _controller.dispose();
    super.dispose();
  }

  Future<void> _applyExcalidraw(String raw) async {
    if (raw == _lastLoadedSource) return;
    final trimmed = raw.trim();
    if (trimmed.isEmpty) return;

    try {
      final decoded = jsonDecode(trimmed);
      final ok = decoded is List<dynamic> ||
          (decoded is Map<String, dynamic> &&
              decoded['elements'] is List<dynamic>);
      if (!ok) return;
    } catch (_) {
      return;
    }

    final token = ++_applySeq;
    final needsFetch = sceneJsonNeedsRemoteImageFetch(trimmed);
    if (mounted) {
      setState(() => _sceneEnriching = needsFetch);
    }

    try {
      final enriched = await enrichMeetWhiteboardJsonWithImageFiles(trimmed);
      if (!mounted || token != _applySeq) return;

      _controller.loadFromContent(enriched.json, 'sync.excalidraw');
      if (kDebugMode) {
        debugPrint(
          'Whiteboard apply: missingImageCount=${enriched.missingImageCount}',
        );
      }
      if (enriched.missingImageCount == 0) {
        _lastLoadedSource = raw;
        _retryTimer?.cancel();
      } else {
        // Nếu ảnh chưa tải kịp (HTTP lỗi tạm thời / file vừa upload), retry với cùng scene.
        _lastLoadedSource = '';
        _retryTimer?.cancel();
        _retryTimer = Timer(const Duration(seconds: 2), () {
          if (!mounted) return;
          final currentRaw =
              ref.read(whiteboardProvider).allExcalidrawElements;
          if (currentRaw.trim().isNotEmpty) {
            unawaited(_applyExcalidraw(currentRaw));
          }
        });
      }
    } finally {
      if (mounted && token == _applySeq && _sceneEnriching) {
        setState(() => _sceneEnriching = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    ref.listen<String>(
      whiteboardProvider.select((s) => s.allExcalidrawElements),
      (previous, next) {
        if (next.isNotEmpty && next != previous) {
          unawaited(_applyExcalidraw(next));
        }
      },
    );

    // Che pill "Exit view mode" của markdraw (không có API tắt); vẫn giữ pan ở phần còn lại.
    return Stack(
      fit: StackFit.expand,
      clipBehavior: Clip.hardEdge,
      children: [
        MarkdrawEditor(
          controller: _controller,
          config: _config,
          currentThemeMode: theme.brightness == Brightness.dark
              ? ThemeMode.dark
              : ThemeMode.light,
          onThemeModeChanged: (_) {},
        ),
        // Trùng nền canvas mặc định (#fff) để không lộ vệt khi theme tối.
        Positioned(
          top: 0,
          right: 0,
          child: const ColoredBox(
            color: Color(0xFFFFFFFF),
            child: SizedBox(
              width: 200,
              height: 56,
              child: AbsorbPointer(child: SizedBox.expand()),
            ),
          ),
        ),
        if (_sceneEnriching)
          Positioned.fill(
            child: ColoredBox(
              color: theme.colorScheme.surface.withValues(alpha: 0.72),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      width: 36,
                      height: 36,
                      child: CircularProgressIndicator(strokeWidth: 3),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Đang tải ảnh bảng trắng…',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
