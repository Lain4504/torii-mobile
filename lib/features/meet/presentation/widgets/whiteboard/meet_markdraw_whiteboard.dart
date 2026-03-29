import 'dart:convert';

import 'package:flutter/material.dart' hide Element, SelectionOverlay, TextAlign;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:markdraw/markdraw.dart' hide TextAlign;

import '../../../providers/whiteboard_provider.dart';

/// Bảng trắng Meet dùng [markdraw] — nhận scene Excalidraw (JSON) từ NATS qua [whiteboardProvider].
///
/// NATS thường gửi **mảng phần tử**; [ExcalidrawJsonCodec] của markdraw cần object có key `elements`.
class MeetMarkdrawWhiteboard extends ConsumerStatefulWidget {
  const MeetMarkdrawWhiteboard({super.key});

  @override
  ConsumerState<MeetMarkdrawWhiteboard> createState() =>
      _MeetMarkdrawWhiteboardState();
}

class _MeetMarkdrawWhiteboardState extends ConsumerState<MeetMarkdrawWhiteboard> {
  late final MarkdrawController _controller;
  String _lastLoaded = '';

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
        _applyExcalidraw(json);
      }
    });
  }

  @override
  void dispose() {
    _controller.removeListener(_enforceViewOnly);
    _controller.dispose();
    super.dispose();
  }

  void _applyExcalidraw(String raw) {
    if (raw == _lastLoaded) return;
    final trimmed = raw.trim();
    if (trimmed.isEmpty) return;

    late final String excalidrawDoc;
    try {
      final decoded = jsonDecode(trimmed);
      if (decoded is List<dynamic>) {
        excalidrawDoc = jsonEncode({
          'type': 'excalidraw',
          'version': 2,
          'source': 'torii-meet-sync',
          'elements': decoded,
        });
      } else if (decoded is Map<String, dynamic> &&
          decoded['elements'] is List<dynamic>) {
        excalidrawDoc = trimmed;
      } else {
        return;
      }
    } catch (_) {
      return;
    }

    _controller.loadFromContent(excalidrawDoc, 'sync.excalidraw');
    _lastLoaded = raw;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    ref.listen<String>(
      whiteboardProvider.select((s) => s.allExcalidrawElements),
      (previous, next) {
        if (next.isNotEmpty && next != previous) {
          _applyExcalidraw(next);
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
      ],
    );
  }
}
