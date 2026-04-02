import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/features/meet/data/datasources/meet_api_service.dart';
import 'package:torii_app/features/meet/providers/breakout_room_provider.dart';
import 'package:torii_app/features/meet/providers/session_provider.dart';
import 'package:torii_app/features/meet/presentation/navigation/meet_exit_navigation.dart';
import 'package:torii_app/features/meet/data/models/proto/wajlc_breakout_room.pb.dart'
    as breakout_room;
import 'package:torii_app/features/meet/data/models/proto/wajlc_nats_msg.pb.dart'
    as nats_msg;

/// Switch to breakout room:
/// 1) call /api/breakoutRoom/join to get new access token
/// 2) verifyToken(newToken) to obtain NATS/stream/subjects
/// 3) disconnect current session and connect with newToken
///
/// On SESSION_ENDED while inside breakout: auto switch back to parent if available.
Future<void> joinAndSwitchToBreakoutRoom({
  required BuildContext context,
  required WidgetRef ref,
  required String breakoutRoomId,
  required bool isAdmin,
}) async {
  final session = ref.read(sessionProvider);
  final userId = session.currentUser?.userId ?? '';
  final parentToken = session.token;
  final parentRoomId = session.currentRoom.roomId;

  if (userId.isEmpty || parentToken.isEmpty || parentRoomId.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Thiếu thông tin phiên họp để chuyển phòng'),
        backgroundColor: AppColors.error,
      ),
    );
    return;
  }

  final api = ref.read(meetApiServiceProvider);
  final dialog = _showBlockingLoading(context, 'Đang chuyển phòng…');
  try {
    // Step 1: get breakout token
    final joinRes = await api.joinBreakoutRoom(
      breakout_room.JoinBreakoutRoomReq(
        breakoutRoomId: breakoutRoomId,
        userId: userId,
        roomId: parentRoomId,
        isAdmin: isAdmin,
      ),
    );
    if (!joinRes.status || joinRes.token.isEmpty) {
      await dialog.close();
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(joinRes.msg.isNotEmpty ? joinRes.msg : 'Không tham gia được phòng nhóm'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    final breakoutToken = joinRes.token;

    // Step 2: verifyToken with breakout token to get connection config
    api.setManualToken(breakoutToken);
    final verify = await api.verifyToken(isProduction: kReleaseMode);
    if (!verify.status) {
      await dialog.close();
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(verify.msg.isNotEmpty ? verify.msg : 'Xác thực token phòng nhóm thất bại'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    if (verify.natsWsUrls.isEmpty ||
        verify.roomId.isEmpty ||
        verify.userId.isEmpty ||
        verify.roomStreamName.isEmpty) {
      await dialog.close();
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Thiếu thông tin kết nối phòng nhóm từ server'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    // Store parent snapshot so we can auto-return when breakout ends.
    ref.read(breakoutRoomProvider.notifier).markEnteredBreakoutRoom(
          parentToken: parentToken,
          parentRoomId: parentRoomId,
        );

    // Step 3: disconnect current session and reconnect with breakout token/config
    await ref.read(sessionProvider.notifier).disconnect(
          userInitiatedLeave: true,
          sessionEndMessage: 'switch-room',
        );

    final subjects = verify.hasNatsSubjects()
        ? verify.natsSubjects
        : nats_msg.NatsSubjects(
            systemApiWorker: 'sysApiWorker',
            systemJsWorker: 'sysJsWorker',
            systemPublic: 'sysPublic',
            systemPrivate: 'sysPrivate',
            chat: 'chat',
            whiteboard: 'whiteboard',
            dataChannel: 'dataChannel',
          );

    await ref.read(sessionProvider.notifier).connect(
          natsWSUrls: verify.natsWsUrls,
          token: breakoutToken,
          roomId: verify.roomId,
          userId: verify.userId,
          roomStreamName: verify.roomStreamName,
          subjects: subjects,
          setErrorState: (title, message) {
            if (!context.mounted) return;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('$title: $message'),
                backgroundColor: AppColors.error,
              ),
            );
          },
          setRoomConnectionStatusState: (_) {},
          setCurrentMediaServerConn: (_) {},
          onRemoteSessionEnded: () {
            if (!context.mounted) return;
            _handleRemoteSessionEnded(context, ref);
          },
        );

    await dialog.close();
  } catch (e, st) {
    if (kDebugMode) {
      debugPrint('joinAndSwitchToBreakoutRoom error: $e\n$st');
    }
    await dialog.close();
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Lỗi chuyển phòng: $e'),
        backgroundColor: AppColors.error,
      ),
    );
  }
}

Future<void> _handleRemoteSessionEnded(BuildContext context, WidgetRef ref) async {
  final bk = ref.read(breakoutRoomProvider);
  // If we were inside a breakout room, try to switch back to parent.
  if (bk.isInBreakoutRoom && (bk.parentToken?.isNotEmpty ?? false)) {
    final parentToken = bk.parentToken!;
    final api = ref.read(meetApiServiceProvider);
    final dialog = _showBlockingLoading(context, 'Phòng nhóm đã kết thúc. Đang quay lại…');
    try {
      api.setManualToken(parentToken);
      final verify = await api.verifyToken(isProduction: kReleaseMode);
      if (!verify.status) {
        await dialog.close();
        if (!context.mounted) return;
        ref.read(breakoutRoomProvider.notifier).clearBreakoutSession();
        navigateOutOfMeet(context);
        return;
      }

      final subjects = verify.hasNatsSubjects()
          ? verify.natsSubjects
          : nats_msg.NatsSubjects(
              systemApiWorker: 'sysApiWorker',
              systemJsWorker: 'sysJsWorker',
              systemPublic: 'sysPublic',
              systemPrivate: 'sysPrivate',
              chat: 'chat',
              whiteboard: 'whiteboard',
              dataChannel: 'dataChannel',
            );

      // Session already absorbed remote end; ensure state is clean.
      await ref.read(sessionProvider.notifier).disconnect(
            userInitiatedLeave: true,
            sessionEndMessage: 'breakout-ended',
          );

      await ref.read(sessionProvider.notifier).connect(
            natsWSUrls: verify.natsWsUrls,
            token: parentToken,
            roomId: verify.roomId,
            userId: verify.userId,
            roomStreamName: verify.roomStreamName,
            subjects: subjects,
            setErrorState: (title, message) {
              if (!context.mounted) return;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('$title: $message'),
                  backgroundColor: AppColors.error,
                ),
              );
            },
            setRoomConnectionStatusState: (_) {},
            setCurrentMediaServerConn: (_) {},
            onRemoteSessionEnded: () {
              if (!context.mounted) return;
              navigateOutOfMeet(context);
            },
          );

      ref.read(breakoutRoomProvider.notifier).clearBreakoutSession();
      await dialog.close();
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Đã quay lại phòng chính')),
      );
    } catch (e) {
      await dialog.close();
      if (!context.mounted) return;
      ref.read(breakoutRoomProvider.notifier).clearBreakoutSession();
      navigateOutOfMeet(context);
    }
    return;
  }

  // Default behavior: session ended -> leave meet.
  navigateOutOfMeet(context);
}

class _BlockingDialogController {
  final NavigatorState _navigator;
  final Route<void> _route;
  bool _closed = false;

  _BlockingDialogController(this._navigator, this._route);

  Future<void> close() async {
    if (_closed) return;
    _closed = true;
    if (_route.isActive) {
      _navigator.removeRoute(_route);
    }
  }
}

_BlockingDialogController _showBlockingLoading(BuildContext context, String text) {
  final navigator = Navigator.of(context, rootNavigator: true);
  final route = DialogRoute<void>(
    context: context,
    barrierDismissible: false,
    builder: (ctx) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        content: Row(
          children: [
            const SizedBox(
              width: 18,
              height: 18,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
            const SizedBox(width: 12),
            Expanded(child: Text(text)),
          ],
        ),
      );
    },
  );
  navigator.push(route);
  return _BlockingDialogController(navigator, route);
}

