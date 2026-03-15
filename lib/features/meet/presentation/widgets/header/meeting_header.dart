import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
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
      sessionProvider.select((s) => s.totalParticipants),
    );
    final isRecording = ref.watch(
      sessionProvider.select((s) => s.isActiveRecording),
    );
    final isRtmpBroadcasting = ref.watch(
      sessionProvider.select((s) => s.isActiveRtmpBroadcasting),
    );
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : AppColors.surface,
        border: Border(
          bottom: BorderSide(
            color: (isDark ? AppColors.textPrimaryDark : AppColors.textPrimary).withOpacity(0.05),
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
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimary,
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
                        color: (isDark ? AppColors.textPrimaryDark : AppColors.textPrimary).withOpacity(0.08),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.people_outline,
                            size: 12,
                            color: isDark ? AppColors.textPrimaryDark : AppColors.grey700,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '$participantCount',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: isDark ? AppColors.textPrimaryDark : AppColors.grey700,
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
                  style: TextStyle(
                    fontSize: 11,
                    color: isDark ? AppColors.textSecondaryDark : AppColors.textTertiary,
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
                color: (isDark ? AppColors.textPrimaryDark : AppColors.textPrimary).withOpacity(0.05),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  if (isRecording)
                    _StatusIndicator(
                      label: 'REC',
                      color: AppColors.error,
                      isDark: isDark,
                    ),
                  if (isRecording && isRtmpBroadcasting)
                    const SizedBox(width: 4),
                  if (isRtmpBroadcasting)
                    _StatusIndicator(
                      label: 'LIVE',
                      color: AppColors.accent,
                      isDark: isDark,
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
  final bool isDark;

  const _StatusIndicator({
    required this.label,
    required this.color,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withOpacity(0.3), width: 1),
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
                  color: color.withOpacity(0.5),
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
