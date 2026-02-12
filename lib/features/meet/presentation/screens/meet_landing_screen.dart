import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:torii_app/features/meet/presentation/providers/meet_provider.dart';
import 'package:torii_app/features/meet/presentation/widgets/join_meet_form.dart';
import 'package:torii_app/features/meet/presentation/widgets/device_setup_panel.dart';

class MeetLandingScreen extends ConsumerWidget {
  const MeetLandingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(meetControllerProvider);

    // Điều hướng sang /meeting chỉ khi đã bắt đầu kết nối media / đã vào phòng.
    ref.listen<MeetState>(meetControllerProvider, (previous, next) {
      final wasNotYetInMeeting = previous == null ||
          (previous.status != MeetStatus.mediaConnecting &&
              previous.status != MeetStatus.connected);
      if (wasNotYetInMeeting &&
          (next.status == MeetStatus.mediaConnecting ||
              next.status == MeetStatus.connected)) {
        context.push('/meeting');
      }
    });

    // Show full-screen loading only while connecting to NATS (before device setup)
    final isConnecting = state.status == MeetStatus.signaling ||
        state.status == MeetStatus.natsConnecting ||
        state.status == MeetStatus.natsConnected;

    return Scaffold(
      backgroundColor: const Color(0xFF0F0F1A),
      body: Builder(
        builder: (context) {
          if (isConnecting) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(color: Color(0xFF5C6BC0)),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Text(
                      state.statusMessage ?? 'Đang kết nối...',

                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }

          if (state.status == MeetStatus.deviceSetup) {
            // Giống web: step preview cam/mic nằm trên landing.
            return const DeviceSetupPanel();
          }

          if (state.status == MeetStatus.mediaConnecting) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(color: Color(0xFF5C6BC0)),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Text(
                      state.statusMessage ?? 'Đang kết nối phương tiện...',

                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }

          // Default: form nhập roomId + name
          return const JoinMeetForm();
        },
      ),
    );
  }
}
