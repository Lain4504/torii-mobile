import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/session_provider.dart';
import '../../../providers/room_settings_provider.dart';
import '../../../core/nats/connect_nats.dart';
import '../../widgets/landing/join_form.dart';
import '../../widgets/landing/device_preview.dart';

/// Join Meeting Screen
/// 1:1 clone of apps/meet/src/components/landing/index.tsx
class JoinMeetingScreen extends ConsumerStatefulWidget {
  const JoinMeetingScreen({super.key});

  @override
  ConsumerState<JoinMeetingScreen> createState() => _JoinMeetingScreenState();
}

class _JoinMeetingScreenState extends ConsumerState<JoinMeetingScreen> {
  String? _loadingMessage;
  bool _isReadyToConnect = false;

  @override
  Widget build(BuildContext context) {
    final isStartup = ref.watch(sessionProvider.select((s) => s.isStartup));
    final waitForApproval = ref.watch(
      sessionProvider.select((s) => s.currentUser?.metadata?.waitForApproval ?? false),
    );
    final lockMicrophone = ref.watch(
      sessionProvider.select((s) => s.currentUser?.metadata?.lockSettings?.lockMicrophone ?? false),
    );
    final lockWebcam = ref.watch(
      sessionProvider.select((s) => s.currentUser?.metadata?.lockSettings?.lockWebcam ?? false),
    );

    if (!isStartup) {
      return const SizedBox.shrink();
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
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
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Header
                  Container(
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface.withOpacity(0.5),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                      border: Border(
                        bottom: BorderSide(
                          color: Theme.of(context).dividerColor.withOpacity(0.1),
                        ),
                      ),
                    ),
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Tham gia cuộc họp',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
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
                              DevicePreview(
                                lockMicrophone: lockMicrophone,
                                lockWebcam: lockWebcam,
                              ),
                              const SizedBox(height: 24),
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
                            Expanded(
                              child: DevicePreview(
                                lockMicrophone: lockMicrophone,
                                lockWebcam: lockWebcam,
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
    );
  }

  void _handleJoin() {
    setState(() {
      _isReadyToConnect = true;
      _loadingMessage = 'Đang hoàn tất cài đặt...';
    });
    
    // TODO: Call ConnectNats.finalizeAppConn()
    // This will be implemented when integrating with NATS
  }
}
