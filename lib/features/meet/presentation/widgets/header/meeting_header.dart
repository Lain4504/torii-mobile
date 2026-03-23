import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import '../../../providers/participant_provider.dart';
import '../../../providers/session_provider.dart';

/// Meeting Header Widget
/// Shows meeting title, participant count, recording status
/// 1:1 clone of apps/meet/src/components/header/index.tsx
class MeetingHeader extends ConsumerWidget {
  const MeetingHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final roomMetadata = ref.watch(
      sessionProvider.select((s) => s.currentRoom.metadata),
    );
    final participantCount = ref.watch(
      participantProvider.select((p) => p.totalParticipants),
    );
    final isRecording = ref.watch(
      sessionProvider.select((s) => s.isActiveRecording),
    );
    final isRtmpBroadcasting = ref.watch(
      sessionProvider.select((s) => s.isActiveRtmpBroadcasting),
    );
    final theme = Theme.of(context);

    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        border: Border(
          bottom: BorderSide(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.05),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          // Meeting title & Participant info
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        roomMetadata?.roomTitle ?? 'Meeting',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.2,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.onSurface.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.people_outline,
                            size: 12,
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '$participantCount',
                            style: theme.textTheme.bodySmall?.copyWith(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  'Torii Meet • Secure Connection',
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontSize: 11,
                    color: theme.colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          
          // Recording & LIVE indicator in a single refined group
          if (isRecording || isRtmpBroadcasting)
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  if (isRecording)
                    _StatusIndicator(
                      label: 'REC',
                      color: theme.colorScheme.error,
                    ),
                  if (isRecording && isRtmpBroadcasting)
                    const SizedBox(width: 4),
                  if (isRtmpBroadcasting)
                    _StatusIndicator(
                      label: 'LIVE',
                      color: theme.colorScheme.secondary,
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _StatusIndicator extends StatelessWidget {
  final String label;
  final Color color;

  const _StatusIndicator({
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withValues(alpha: 0.3), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: color.withValues(alpha: 0.5),
                  blurRadius: 4,
                ),
              ],
            ),
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w800,
              color: color,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
