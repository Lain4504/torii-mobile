import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import '../../../providers/whiteboard_provider.dart';

/// Whiteboard Canvas Widget
/// Read-only renderer for received Excalidraw elements.
///
/// Mobile whiteboard does not support collaboration: we only render
/// `whiteboardProvider.excalidrawElements` (scene elements) coming from donors.
class WhiteboardCanvas extends ConsumerWidget {
  const WhiteboardCanvas({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final elementsJson = ref.watch(
      whiteboardProvider.select((s) {
        // For rendering we prefer the full-scene cache (`allExcalidrawElements`).
        final all = s.allExcalidrawElements;
        if (all.isNotEmpty) return all;
        return s.excalidrawElements;
      }),
    );
    final appState = ref.watch(
      whiteboardProvider.select((s) => s.whiteboardAppState),
    );
    final panOffset = ref.watch(
      whiteboardProvider.select((s) => s.panOffset),
    );
    final localZoomFactor = ref.watch(
      whiteboardProvider.select((s) => s.localZoomFactor),
    );

    // Remote appState format (web): { zoomValue, scrollX, scrollY, width, height, ... }
    double remoteZoom = double.nan;
    final zv = appState?['zoomValue'];
    if (zv is num) {
      remoteZoom = zv.toDouble();
    } else if (zv is String) {
      remoteZoom = double.tryParse(zv) ?? double.nan;
    }
    final remoteZoomFinite = remoteZoom.isFinite && remoteZoom > 0;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onScaleUpdate: (details) {
        final nextLocalZoomFactor = (details.scale != 1.0)
            ? (localZoomFactor * details.scale).clamp(0.5, 6.0)
            : localZoomFactor;

        if (nextLocalZoomFactor != localZoomFactor) {
          ref.read(whiteboardProvider.notifier).setLocalZoomFactor(nextLocalZoomFactor);
        }

        // Keep panning working together with pinch.
        final z = remoteZoomFinite ? (remoteZoom * nextLocalZoomFactor) : nextLocalZoomFactor;
        ref.read(whiteboardProvider.notifier).updatePanOffset(
              details.focalPointDelta / (z.isFinite && z > 0 ? z : 1.0),
            );
      },
      onDoubleTap: () {
        // Double tap reset cả pan lẫn zoom local về mặc định.
        ref.read(whiteboardProvider.notifier).resetLocalView();
      },
      child: CustomPaint(
        painter: WhiteboardElementsPainter(
          elementsJson: elementsJson,
          appState: appState,
          panOffset: panOffset,
          localZoomFactor: localZoomFactor,
        ),
        size: Size.infinite,
      ),
    );
  }
}

class WhiteboardElementsPainter extends CustomPainter {
  WhiteboardElementsPainter({
    required this.elementsJson,
    required this.appState,
    required this.panOffset,
    required this.localZoomFactor,
  });

  final String elementsJson;
  final Map<String, dynamic>? appState;
  final Offset panOffset;
  final double localZoomFactor;

  @override
  void paint(Canvas canvas, Size size) {
    // Always draw a faint grid in screen space.
    _drawGrid(canvas, size);

    if (elementsJson.isEmpty) return;

    final decoded = _tryDecode(elementsJson);
    if (decoded == null) return;
    if (decoded.isEmpty) return;

    final elements = decoded
        .whereType<Map<String, dynamic>>()
        .toList(growable: false);
    if (elements.isEmpty) return;

    canvas.save();

    final remoteZoom = _extractZoom(appState);
    final scrollX = _toDouble(appState?['scrollX']);
    final scrollY = _toDouble(appState?['scrollY']);
    final senderWidth = _toDouble(appState?['width']);
    final senderHeight = _toDouble(appState?['height']);

    // When receiver canvas size differs from sender, Excalidraw adjusts scroll
    // so both users are centered on the same scene coordinates.
    final adjustedScrollX = (remoteZoom.isFinite && remoteZoom > 0 && senderWidth.isFinite)
        ? scrollX + (size.width - senderWidth) / (2 * remoteZoom)
        : scrollX;
    final adjustedScrollY = (remoteZoom.isFinite && remoteZoom > 0 && senderHeight.isFinite)
        ? scrollY + (size.height - senderHeight) / (2 * remoteZoom)
        : scrollY;

    final effectiveZoom =
        (remoteZoom.isFinite && remoteZoom > 0) ? remoteZoom * localZoomFactor : localZoomFactor;

    // Excalidraw-like viewport transform:
    // screen = scene * zoom + (center + scroll) + localPan
    if (effectiveZoom.isFinite && effectiveZoom > 0 && adjustedScrollX.isFinite && adjustedScrollY.isFinite) {
      canvas.translate(
        size.width / 2 + adjustedScrollX + panOffset.dx,
        size.height / 2 + adjustedScrollY + panOffset.dy,
      );
      canvas.scale(effectiveZoom, effectiveZoom);
    } else {
      // Fallback: fit whole scene (legacy behavior)
      final bounds = _computeBounds(elements);
      if (bounds == null) {
        canvas.restore();
        return;
      }
      final (minX, minY, maxX, maxY) = bounds;
      final w = maxX - minX;
      final h = maxY - minY;
      if (w <= 0 || h <= 0) {
        canvas.restore();
        return;
      }

      const padding = 20.0;
      final scaleX = (size.width - padding * 2) / w;
      final scaleY = (size.height - padding * 2) / h;
      final scale = math.min(scaleX, scaleY);
      if (!scale.isFinite || scale <= 0) {
        canvas.restore();
        return;
      }
      final offset = Offset(
        padding - minX * scale + panOffset.dx,
        padding - minY * scale + panOffset.dy,
      );
      canvas.translate(offset.dx, offset.dy);
      canvas.scale(scale, scale);
    }

    for (final element in elements) {
      if (_isDeleted(element)) continue;

      _drawElement(canvas, element);
    }

    canvas.restore();
  }

  void _drawGrid(Canvas canvas, Size size) {
    // grid background
    final paint = Paint()
      ..color = AppColors.grey300.withOpacity(0.2)
      ..strokeWidth = 1;

    const gridSize = 40.0;
    
    // Draw vertical lines
    for (double x = 0; x < size.width; x += gridSize) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }

    // Draw horizontal lines
    for (double y = 0; y < size.height; y += gridSize) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    final old = oldDelegate;
    if (old is! WhiteboardElementsPainter) return true;
    return old.elementsJson != elementsJson ||
        old.appState != appState ||
        old.panOffset != panOffset ||
        old.localZoomFactor != localZoomFactor;
  }

  double _extractZoom(Map<String, dynamic>? state) {
    if (state == null) return double.nan;
    // Web payload key: `zoomValue`
    final zoomValue = state['zoomValue'];
    if (zoomValue is num) return zoomValue.toDouble();
    if (zoomValue is String) return double.tryParse(zoomValue) ?? double.nan;

    // Compatibility: older shape might carry `zoom`
    final zoomRaw = state['zoom'];
    if (zoomRaw is num) return zoomRaw.toDouble();
    if (zoomRaw is Map<String, dynamic>) {
      final value = zoomRaw['value'];
      if (value is num) return value.toDouble();
      if (value is String) return double.tryParse(value) ?? double.nan;
    }
    if (zoomRaw is String) return double.tryParse(zoomRaw) ?? double.nan;
    return double.nan;
  }

  List<dynamic>? _tryDecode(String json) {
    try {
      final v = jsonDecode(json);
      // Expected: array of elements.
      if (v is List<dynamic>) return v;
      // Fallback: some servers may wrap.
      if (v is Map<String, dynamic> && v['elements'] is List<dynamic>) {
        return v['elements'] as List<dynamic>;
      }
      return null;
    } catch (_) {
      return null;
    }
  }

  bool _isDeleted(Map<String, dynamic> e) {
    final isDeleted = e['isDeleted'];
    return isDeleted == true;
  }

  (double minX, double minY, double maxX, double maxY)? _computeBounds(
    List<Map<String, dynamic>> elements,
  ) {
    double? minX, minY, maxX, maxY;

    for (final e in elements) {
      final points = _elementPoints(e);
      if (points.isEmpty) continue;

      for (final p in points) {
        minX = (minX == null) ? p.dx : math.min(minX, p.dx);
        minY = (minY == null) ? p.dy : math.min(minY, p.dy);
        maxX = (maxX == null) ? p.dx : math.max(maxX, p.dx);
        maxY = (maxY == null) ? p.dy : math.max(maxY, p.dy);
      }
    }

    if (minX == null || minY == null || maxX == null || maxY == null) return null;
    return (minX, minY, maxX, maxY);
  }

  List<Offset> _elementPoints(Map<String, dynamic> e) {
    // Try to extract a bounding point set for scaling.
    final type = e['type']?.toString() ?? '';

    if (type == 'rectangle' || type == 'ellipse') {
      final x = _toDouble(e['x']);
      final y = _toDouble(e['y']);
      final w = _toDouble(e['width']);
      final h = _toDouble(e['height']);
      if (_allFinite([x, y, w, h]) && w > 0 && h > 0) {
        return [
          Offset(x, y),
          Offset(x + w, y + h),
        ];
      }
    }

    if (type == 'line') {
      final x1 = _toDouble(e['x1']);
      final y1 = _toDouble(e['y1']);
      final x2 = _toDouble(e['x2']);
      final y2 = _toDouble(e['y2']);
      if (_allFinite([x1, y1, x2, y2])) {
        return [Offset(x1, y1), Offset(x2, y2)];
      }

      final pointsRaw = e['points'];
      final points = _parsePoints(pointsRaw);
      if (points.length >= 2) return points;
    }

    if (type == 'freedraw') {
      final points = _parsePoints(e['points']);
      if (points.isNotEmpty) return points;
    }

    if (type == 'text') {
      final x = _toDouble(e['x']);
      final y = _toDouble(e['y']);
      final w = _toDouble(e['width']);
      final h = _toDouble(e['height']);
      if (_allFinite([x, y]) && (w > 0 && h > 0)) {
        return [Offset(x, y), Offset(x + w, y + h)];
      }
      if (_allFinite([x, y])) {
        return [Offset(x, y)];
      }
    }

    // Generic fallback: use x/y/width/height if present.
    final x = _toDouble(e['x']);
    final y = _toDouble(e['y']);
    final w = _toDouble(e['width']);
    final h = _toDouble(e['height']);
    if (_allFinite([x, y]) && w > 0 && h > 0) {
      return [Offset(x, y), Offset(x + w, y + h)];
    }

    return const [];
  }

  void _drawElement(Canvas canvas, Map<String, dynamic> e) {
    final type = e['type']?.toString() ?? '';

    final strokeColor = _parseColor(
      e['strokeColor']?.toString() ??
          e['stroke']?.toString() ??
          e['color']?.toString(),
      fallback: AppColors.textPrimary,
    );
    final fillColor = _parseColor(
      e['backgroundColor']?.toString() ??
          e['fillColor']?.toString() ??
          e['fillStyle']?.toString(),
      fallback: Colors.transparent,
    );
    final opacity = _toDouble(e['opacity'] ?? 1.0).clamp(0.0, 1.0);

    final strokeWidth = _toDouble(e['strokeWidth'] ?? 2.0);

    final strokePaint = Paint()
      ..color = strokeColor.withOpacity(opacity)
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;
    strokePaint.isAntiAlias = true;
    strokePaint
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final fillPaint = Paint()
      ..color = fillColor.withOpacity(opacity)
      ..style = PaintingStyle.fill;
    fillPaint.isAntiAlias = true;

    if (type == 'rectangle') {
      final x = _toDouble(e['x']);
      final y = _toDouble(e['y']);
      final w = _toDouble(e['width']);
      final h = _toDouble(e['height']);
      if (!_allFinite([x, y, w, h])) return;

      final r = _toDouble(e['cornerRadius'] ?? 0);
      final rect = Rect.fromLTWH(x, y, w, h);
      if (r > 0 && r.isFinite) {
        final rClamped = math.min(r, math.min(w, h) / 2);
        if (fillColor != Colors.transparent) {
          canvas.drawRRect(
            RRect.fromRectAndRadius(rect, Radius.circular(rClamped)),
            fillPaint,
          );
        }
        canvas.drawRRect(
          RRect.fromRectAndRadius(rect, Radius.circular(rClamped)),
          strokePaint,
        );
      } else {
        if (fillColor != Colors.transparent) {
          canvas.drawRect(rect, fillPaint);
        }
        canvas.drawRect(rect, strokePaint);
      }
      return;
    }

    if (type == 'ellipse') {
      final x = _toDouble(e['x']);
      final y = _toDouble(e['y']);
      final w = _toDouble(e['width']);
      final h = _toDouble(e['height']);
      if (!_allFinite([x, y, w, h])) return;

      final rect = Rect.fromLTWH(x, y, w, h);
      if (fillColor != Colors.transparent) {
        canvas.drawOval(rect, fillPaint);
      }
      canvas.drawOval(rect, strokePaint);
      return;
    }

    if (type == 'line') {
      final x1 = _toDouble(e['x1']);
      final y1 = _toDouble(e['y1']);
      final x2 = _toDouble(e['x2']);
      final y2 = _toDouble(e['y2']);

      if (_allFinite([x1, y1, x2, y2])) {
        canvas.drawLine(Offset(x1, y1), Offset(x2, y2), strokePaint);
        return;
      }

      final pts = _parsePoints(e['points']);
      if (pts.length >= 2) {
        for (var i = 0; i < pts.length - 1; i++) {
          canvas.drawLine(pts[i], pts[i + 1], strokePaint);
        }
      }
      return;
    }

    if (type == 'freedraw') {
      final pts = _parsePoints(e['points']);
      if (pts.length < 2) return;
      final path = Path()..moveTo(pts.first.dx, pts.first.dy);
      for (final p in pts.skip(1)) {
        path.lineTo(p.dx, p.dy);
      }
      final paint = strokePaint..style = PaintingStyle.stroke;
      canvas.drawPath(path, paint);
      return;
    }

    if (type == 'text') {
      final text = e['text']?.toString() ?? '';
      final x = _toDouble(e['x']);
      final y = _toDouble(e['y']);
      if (text.isEmpty || !_allFinite([x, y])) return;

      final fontSize = _toDouble(e['fontSize'] ?? 16);
      final tp = TextPainter(
        text: TextSpan(
          text: text,
          style: TextStyle(
            color: strokeColor.withOpacity(opacity),
            fontSize: fontSize,
          ),
        ),
        textDirection: TextDirection.ltr,
      )..layout();
      tp.paint(canvas, Offset(x, y - tp.height));
      return;
    }

    // Unknown element type: try rectangle fallback.
    final x = _toDouble(e['x']);
    final y = _toDouble(e['y']);
    final w = _toDouble(e['width']);
    final h = _toDouble(e['height']);
    if (_allFinite([x, y, w, h]) && w > 0 && h > 0) {
      final rect = Rect.fromLTWH(x, y, w, h);
      if (fillColor != Colors.transparent) canvas.drawRect(rect, fillPaint);
      canvas.drawRect(rect, strokePaint);
    }
  }

  double _toDouble(dynamic v) {
    if (v == null) return double.nan;
    if (v is num) return v.toDouble();
    if (v is String) return double.tryParse(v) ?? double.nan;
    return double.nan;
  }

  bool _allFinite(List<double> values) {
    for (final v in values) {
      if (!v.isFinite) return false;
    }
    return true;
  }

  Color _parseColor(String? raw, {required Color fallback}) {
    if (raw == null || raw.isEmpty) return fallback;
    final s = raw.trim();
    if (s.toLowerCase() == 'transparent') return Colors.transparent;
    if (s.startsWith('#')) {
      final hex = s.substring(1);
      return _colorFromHex(hex, fallback: fallback);
    }

    // ex: "rgb(255, 0, 0)" or "rgba(255, 0, 0, 0.5)" (best-effort)
    final rgbMatch = RegExp(r'rgba?\\(([^)]+)\\)').firstMatch(s);
    if (rgbMatch != null) {
      final parts = (rgbMatch.group(1) ?? '').split(',').map((p) => p.trim()).toList();
      if (parts.length >= 3) {
        final r = int.tryParse(parts[0]) ?? 0;
        final g = int.tryParse(parts[1]) ?? 0;
        final b = int.tryParse(parts[2]) ?? 0;
        return Color.fromARGB(255, r.clamp(0, 255), g.clamp(0, 255), b.clamp(0, 255));
      }
    }

    return fallback;
  }

  Color _colorFromHex(String hex, {required Color fallback}) {
    try {
      if (hex.length == 6) {
        final value = int.parse(hex, radix: 16);
        return Color(0xFF000000 | value);
      }
      if (hex.length == 8) {
        final value = int.parse(hex, radix: 16);
        return Color(value);
      }
    } catch (_) {}
    return fallback;
  }

  List<Offset> _parsePoints(dynamic pointsRaw) {
    if (pointsRaw == null) return const [];
    if (pointsRaw is! List) return const [];

    final out = <Offset>[];
    for (final p in pointsRaw) {
      if (p is Map) {
        final x = _toDouble(p['x']);
        final y = _toDouble(p['y']);
        if (x.isFinite && y.isFinite) out.add(Offset(x, y));
      } else if (p is List && p.length >= 2) {
        final x = _toDouble(p[0]);
        final y = _toDouble(p[1]);
        if (x.isFinite && y.isFinite) out.add(Offset(x, y));
      }
    }
    return out;
  }
}
