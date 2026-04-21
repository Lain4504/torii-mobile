import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/bottom_icons_provider.dart';
import '../../../providers/session_provider.dart';
import 'control_button.dart';

/// Microphone Button Widget
/// Toggles microphone on/off
class MicButton extends ConsumerWidget {
  const MicButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMicMuted = ref.watch(
      bottomIconsProvider.select((s) => s.isMicMuted),
    );

    return ControlButton(
      icon: isMicMuted ? Icons.mic_off : Icons.mic,
      label: isMicMuted ? 'Unmute' : 'Mute',
      isActive: !isMicMuted,
      onTap: () {
        final enable = isMicMuted;
        ref.read(sessionProvider.notifier).livekitConn?.toggleAudio(enable);
      },
    );
  }
}
