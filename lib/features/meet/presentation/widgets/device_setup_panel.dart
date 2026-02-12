import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/features/meet/presentation/providers/meet_provider.dart';

/// Device setup view (camera/mic preview + Join button).
/// Used on landing (before entering the main meeting screen) and as a fallback in meeting screen.
class DeviceSetupPanel extends ConsumerWidget {
  const DeviceSetupPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(meetControllerProvider);
    final notifier = ref.read(meetControllerProvider.notifier);
    final isWaiting =
        state.localMetadata?.waitForApproval ?? false;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              state.roomMetadata?.roomId ?? state.roomId ?? 'Cuộc họp',

              style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(
              isWaiting
                  ? 'Bạn đang ở trong phòng chờ. Vui lòng đợi người chủ trì chấp nhận.'
                  : 'Cài đặt camera và micro',


              style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 14),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 48),
            if (isWaiting) ...[
              const SizedBox(
                height: 64,
                width: 64,
                child: CircularProgressIndicator(
                  color: Colors.white70,
                  strokeWidth: 3,
                ),
              ),
            ] else ...[
              // Camera preview placeholder
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1E2C),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.white24),
                ),
                child: Center(
                  child: Icon(
                    state.isCamEnabled ? Icons.videocam : Icons.videocam_off,
                    size: 64,
                    color: state.isCamEnabled ? Colors.blueAccent : Colors.white38,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _DeviceSetupChip(
                    icon: state.isCamEnabled ? Icons.videocam : Icons.videocam_off,
                    label: 'Máy ảnh',

                    isOn: state.isCamEnabled,
                    onTap: () => notifier.toggleCam(),
                  ),
                  const SizedBox(width: 24),
                  _DeviceSetupChip(
                    icon: state.isMicEnabled ? Icons.mic : Icons.mic_off,
                    label: 'Micro',

                    isOn: state.isMicEnabled,
                    onTap: () => notifier.toggleMic(),
                  ),
                ],
              ),
              const SizedBox(height: 48),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => notifier.startMediaConnection(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5C6BC0),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  child: const Text('Tham gia', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),

                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _DeviceSetupChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isOn;
  final VoidCallback onTap;

  const _DeviceSetupChip({
    required this.icon,
    required this.label,
    required this.isOn,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isOn ? const Color(0xFF2E2E3E) : const Color(0xFF1E1E2C),
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: isOn ? Colors.greenAccent : Colors.white54, size: 28),
              const SizedBox(width: 12),
              Text(label, style: const TextStyle(color: Colors.white, fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}

