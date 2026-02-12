import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/bottom_icons_provider.dart';

/// Microphone Button Widget
/// Toggles microphone on/off
/// 1:1 clone of apps/meet/src/components/footer/icons/mic.tsx
class MicButton extends ConsumerWidget {
  const MicButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMicMuted = ref.watch(
      bottomIconsProvider.select((s) => s.isMicMuted),
    );

    return _ControlButton(
      icon: isMicMuted ? Icons.mic_off : Icons.mic,
      label: isMicMuted ? 'Unmute' : 'Mute',
      isActive: !isMicMuted,
      onTap: () {
        ref.read(bottomIconsProvider.notifier).toggleMic();
        // TODO: Integrate with LiveKit to actually mute/unmute
      },
    );
  }
}

class _ControlButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;
  final Color? activeColor;

  const _ControlButton({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
    this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    final color = activeColor ?? Theme.of(context).colorScheme.primary;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: isMobile ? 56 : 64,
        height: isMobile ? 56 : 64,
        decoration: BoxDecoration(
          color: isActive
              ? color.withOpacity(0.2)
              : Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isActive
                ? color
                : Theme.of(context).dividerColor.withOpacity(0.2),
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isActive ? color : Colors.white70,
              size: isMobile ? 24 : 28,
            ),
            if (!isMobile) ...[
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  fontSize: 10,
                  color: isActive ? color : Colors.white70,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
