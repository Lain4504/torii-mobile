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
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surface,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => _goHome(context),
        ),
        title: const Text(
          'Tham gia cuộc họp',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 1024),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Theme.of(context).dividerColor.withOpacity(0.1),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.textPrimary.withOpacity(0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Waiting room / room message (from room metadata when available)
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
                        padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
                        child: Text(
                          welcomeMsg,
                          style: TextStyle(
                            fontSize: 13,
                            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      );
                    },
                  ),
                  // Content
                  Padding(
                    padding: const EdgeInsets.all(32),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final isMobile = constraints.maxWidth < 768;
                        
                        if (isMobile) {
                          return Column(
                            children: [
                              if (_loadingMessage == null) ...[
                                DevicePreview(
                                  lockMicrophone: lockMicrophone,
                                  lockWebcam: lockWebcam,
                                  onMicToggled: (val) => _isMicEnabled = val,
                                  onCameraToggled: (val) => _isCameraEnabled = val,
                                ),
                                const SizedBox(height: 24),
                              ],
                              JoinForm(
                                loadingMessage: _loadingMessage,
                                waitForApproval: waitForApproval,
                                lockMicrophone: lockMicrophone,
                                lockWebcam: lockWebcam,
                                onJoin: _handleJoin,
                              ),
                            ],
                          );
                        }
                        
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (_loadingMessage == null)
                              Expanded(
                                child: DevicePreview(
                                  lockMicrophone: lockMicrophone,
                                  lockWebcam: lockWebcam,
                                  onMicToggled: (val) => _isMicEnabled = val,
                                  onCameraToggled: (val) => _isCameraEnabled = val,
                                ),
                              ),
                            const SizedBox(width: 32),
                            Expanded(
                              child: JoinForm(
                                loadingMessage: _loadingMessage,
                                waitForApproval: waitForApproval,
                                lockMicrophone: lockMicrophone,
                                lockWebcam: lockWebcam,
                                onJoin: _handleJoin,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
          child: SizedBox(
            height: 48,
            child: OutlinedButton.icon(
              onPressed: () => _goHome(context),
              icon: const Icon(Icons.home_outlined),
              label: const Text(
                'Về trang chủ',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
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
