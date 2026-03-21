import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:torii_app/core/config/app_config.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import '../../../providers/session_provider.dart';
import '../../../data/datasources/meet_api_service.dart';
import 'package:torii_app/features/meet/data/models/proto/wajlc_nats_msg.pb.dart' as nats_msg;
import '../../widgets/landing/join_form.dart';
import '../../widgets/landing/device_preview.dart';

/// Join Meeting Screen
/// 1:1 clone of apps/meet/src/components/landing/index.tsx
/// Token from: [initialToken] param, or [ModalRoute.settings.arguments] (e.g. deep link).
class JoinMeetingScreen extends ConsumerStatefulWidget {
  /// Token from MeetLoginScreen or route extra
  final String? initialToken;

  const JoinMeetingScreen({super.key, this.initialToken});

  @override
  ConsumerState<JoinMeetingScreen> createState() => _JoinMeetingScreenState();
}

/// Arguments for join meeting (e.g. from deep link). [token] is the JWT for verifyToken + NATS/LiveKit.
class JoinMeetingArgs {
  final String? token;
  const JoinMeetingArgs({this.token});
}

class _JoinMeetingScreenState extends ConsumerState<JoinMeetingScreen> {
  String? _loadingMessage;
  bool _isMicEnabled = false;
  bool _isCameraEnabled = false;

  @override
  Widget build(BuildContext context) {
    final isStartup = ref.watch(sessionProvider.select((s) => s.isStartup));
    final waitForApproval = ref.watch(
      sessionProvider.select((s) => s.currentUser?.metadata?.waitForApproval ?? false),
    );
    final lockMicrophone = ref.watch(
      sessionProvider.select((s) => s.currentUser?.metadata?.lockSettings?.lockMic ?? false),
    );
    final lockWebcam = ref.watch(
      sessionProvider.select((s) => s.currentUser?.metadata?.lockSettings?.lockCamera ?? false),
    );

    if (!isStartup) {
      return const SizedBox.shrink();
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.surface,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => _goHome(context),
        ),
        title: Text(
          'Tham gia cuộc họp',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                letterSpacing: 0.2,
              ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.22),
                      blurRadius: 14,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: AppColors.textOnPrimary.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.video_call_rounded,
                        color: AppColors.textOnPrimary,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Sẵn sàng vào phòng học trực tuyến',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: AppColors.textOnPrimary,
                              fontWeight: FontWeight.w800,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              Builder(
                builder: (context) {
                  final roomMeta = ref.watch(
                    sessionProvider.select((s) => s.currentRoom.metadata),
                  );
                  final welcomeMsg = roomMeta?.welcomeMessage;
                  if (welcomeMsg == null || welcomeMsg.isEmpty) {
                    return const SizedBox.shrink();
                  }
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppColors.grey300.withOpacity(0.9)),
                      ),
                      child: Text(
                        welcomeMsg,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: AppColors.textSecondary,
                              height: 1.35,
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
              ),

              if (_loadingMessage == null) ...[
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.grey300),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.textPrimary.withOpacity(0.04),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(10),
                  child: DevicePreview(
                    lockMicrophone: lockMicrophone,
                    lockWebcam: lockWebcam,
                    onMicToggled: (val) => _isMicEnabled = val,
                    onCameraToggled: (val) => _isCameraEnabled = val,
                  ),
                ),
                const SizedBox(height: 12),
              ],

              Container(
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.grey300),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.textPrimary.withOpacity(0.04),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(14),
                child: JoinForm(
                  loadingMessage: _loadingMessage,
                  waitForApproval: waitForApproval,
                  lockMicrophone: lockMicrophone,
                  lockWebcam: lockWebcam,
                  onJoin: _handleJoin,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _goHome(BuildContext context) {
    final router = GoRouter.maybeOf(context);
    if (router != null) {
      router.go('/');
    } else {
      Navigator.of(context).popUntil((route) => route.isFirst);
    }
  }

  void _handleJoin() async {
    setState(() {
      _loadingMessage = 'Đang kết nối đến máy chủ...';
    });

    // Token: initialToken (from MeetLoginScreen) > route args (deep link)
    String? accessToken = widget.initialToken;
    if (accessToken == null || accessToken.isEmpty) {
      final raw = ModalRoute.of(context)?.settings.arguments;
      if (raw is JoinMeetingArgs) {
        accessToken = raw.token;
      } else if (raw is Map && raw['token'] != null) {
        accessToken = raw['token']?.toString();
      }
    }

    try {
      String token;
      List<String> natsWSUrls;
      String roomId;
      String userId;
      String roomStreamName;
      nats_msg.NatsSubjects subjects;

      if (accessToken != null && accessToken.isNotEmpty) {
        // Use verifyToken API (1:1 with web flow)
        setState(() {
          _loadingMessage = 'Đang xác thực token...';
        });
        final api = ref.read(meetApiServiceProvider);
        api.setManualToken(accessToken);
        final res = await api.verifyToken(isProduction: kReleaseMode);
        if (!mounted) return;
        if (!res.status) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(res.msg.isNotEmpty ? res.msg : 'Xác thực token thất bại'),
              backgroundColor: AppColors.error,
            ),
          );
          setState(() => _loadingMessage = null);
          return;
        }
        if (res.natsWsUrls.isEmpty ||
            res.roomId.isEmpty ||
            res.userId.isEmpty ||
            res.roomStreamName.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Thiếu thông tin phòng từ server'),
              backgroundColor: AppColors.error,
            ),
          );
          setState(() => _loadingMessage = null);
          return;
        }
        token = accessToken;
        natsWSUrls = res.natsWsUrls;
        roomId = res.roomId;
        userId = res.userId;
        roomStreamName = res.roomStreamName;
        subjects = res.hasNatsSubjects()
            ? res.natsSubjects
            : nats_msg.NatsSubjects(
                systemApiWorker: 'sysApiWorker',
                systemJsWorker: 'sysJsWorker',
                systemPublic: 'sysPublic',
                systemPrivate: 'sysPrivate',
                chat: 'chat',
                whiteboard: 'whiteboard',
                dataChannel: 'dataChannel',
              );
        ref.read(sessionProvider.notifier).addServerVersion(res.serverVersion);
      } else {
        // Fallback for dev: placeholder (no verifyToken)
        if (kDebugMode) {
          natsWSUrls = [AppConfig.natsWsUrl];
          token = 'test-token';
          roomId = 'test-room';
          userId = 'user-${DateTime.now().millisecondsSinceEpoch}';
          roomStreamName = 'ROOM_test-room';
          subjects = nats_msg.NatsSubjects(
            systemApiWorker: 'system.worker',
            systemJsWorker: 'system.js',
            systemPublic: 'system.public',
            systemPrivate: 'system.private',
            chat: 'chat',
            whiteboard: 'whiteboard',
            dataChannel: 'data',
          );
        } else {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Vui lòng mở link từ email hoặc LMS để tham gia phòng.'),
                backgroundColor: AppColors.accent,
              ),
            );
          }
          setState(() => _loadingMessage = null);
          return;
        }
      }

      setState(() {
        _loadingMessage = 'Đang kết nối đến máy chủ...';
      });

      await ref.read(sessionProvider.notifier).connect(
        natsWSUrls: natsWSUrls,
        token: token,
        roomId: roomId,
        userId: userId,
        roomStreamName: roomStreamName,
        subjects: subjects,
        setErrorState: (title, message) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('$title: $message'),
                backgroundColor: AppColors.error,
              ),
            );
            setState(() {
              _loadingMessage = null;
            });
          }
        },
        setRoomConnectionStatusState: (status) {
          if (kDebugMode) {
            print('Connection Status: $status');
          }
          // Web: chỉ coi app "ready" khi media-server-conn-established (LiveKit connected).
          // Mobile: map 1:1 theo roomConnectionStatus từ NATS + LiveKit.
          if (status == 'media-server-conn-established') {
            if (mounted) {
              ref.read(sessionProvider.notifier).toggleStartup(false);
            }
          }
        },
        setCurrentMediaServerConn: (conn) {
          // Handled by SessionProvider
        },
        initialAudioEnabled: _isMicEnabled,
        initialVideoEnabled: _isCameraEnabled,
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Lỗi kết nối: $e'),
            backgroundColor: AppColors.error,
          ),
        );
        setState(() {
          _loadingMessage = null;
        });
      }
    }
  }
}
