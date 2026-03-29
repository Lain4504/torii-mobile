import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/participant_provider.dart';
import '../../../providers/room_settings_provider.dart';
import '../../../providers/session_provider.dart';
import '../settings/settings_bottom_sheet.dart';

/// Header meet — clone [apps/meet Header]: bên phải thông báo, âm lượng, menu (cài đặt / rời họp).
/// Trưởng phòng **kết thúc phòng cho mọi người** chỉ qua nút footer [LeaveButton]; menu đây là **rời họp** giống web.
class MeetingHeader extends ConsumerWidget {
  const MeetingHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isRecorder = ref.watch(
      sessionProvider.select((s) => s.currentUser?.isRecorder ?? false),
    );
    if (isRecorder) {
      return const SizedBox.shrink();
    }

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
    final notifCount = ref.watch(
      roomSettingsProvider.select((s) => s.notifications.length),
    );
    final theme = Theme.of(context);

    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 12),
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
          if (isRecording || isRtmpBroadcasting)
            Padding(
              padding: const EdgeInsets.only(right: 4),
              child: Container(
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
                    if (isRecording && isRtmpBroadcasting) const SizedBox(width: 4),
                    if (isRtmpBroadcasting)
                      _StatusIndicator(
                        label: 'LIVE',
                        color: theme.colorScheme.secondary,
                      ),
                  ],
                ),
              ),
            ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              IconButton(
                tooltip: 'Thông báo',
                onPressed: () => _showNotificationsSheet(context, ref),
                icon: const Icon(Icons.notifications_outlined),
              ),
              if (notifCount > 0)
                Positioned(
                  right: 6,
                  top: 6,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.error,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
                    child: Text(
                      notifCount > 9 ? '9+' : '$notifCount',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 9,
                        fontWeight: FontWeight.w800,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
          IconButton(
            tooltip: 'Âm lượng',
            onPressed: () => _showVolumeSheet(context, ref),
            icon: const Icon(Icons.volume_up_outlined),
          ),
          PopupMenuButton<String>(
            tooltip: 'Thêm',
            child: const Icon(Icons.more_vert),
            onSelected: (value) {
              if (value == 'settings') {
                showModalBottomSheet<void>(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (ctx) => const SettingsBottomSheet(),
                );
              } else if (value == 'leave') {
                _confirmHeaderLeave(context, ref);
              }
            },
            itemBuilder: (ctx) => [
              const PopupMenuItem(
                value: 'settings',
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(Icons.settings_outlined),
                  title: Text('Cài đặt'),
                ),
              ),
              const PopupMenuItem(
                value: 'leave',
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(Icons.logout),
                  title: Text('Rời khỏi họp'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showNotificationsSheet(BuildContext context, WidgetRef ref) {
    final scheme = Theme.of(context).colorScheme;
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: scheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        final maxH = MediaQuery.sizeOf(context).height * 0.5;
        return SafeArea(
          child: Consumer(
            builder: (context, ref2, _) {
              final list = ref2.watch(roomSettingsProvider.select((s) => s.notifications));
              if (list.isEmpty) {
                return Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text(
                    'Chưa có thông báo.',
                    style: TextStyle(color: scheme.onSurfaceVariant),
                  ),
                );
              }
              final reversed = list.reversed.toList();
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 12, 8, 8),
                    child: Row(
                      children: [
                        Text(
                          'Thông báo',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            ref2.read(roomSettingsProvider.notifier).clearUserNotifications();
                          },
                          child: const Text('Xóa hết'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: maxH.clamp(120.0, 400.0),
                    child: ListView.separated(
                      itemCount: reversed.length,
                      separatorBuilder: (context, _) => Divider(height: 1, color: scheme.outlineVariant),
                      itemBuilder: (_, i) {
                        final n = reversed[i];
                        IconData icon;
                        Color? c;
                        switch (n.typeOption) {
                          case 'error':
                            icon = Icons.error_outline;
                            c = scheme.error;
                            break;
                          case 'warning':
                            icon = Icons.warning_amber_outlined;
                            c = scheme.tertiary;
                            break;
                          default:
                            icon = Icons.info_outline;
                            c = scheme.primary;
                        }
                        return ListTile(
                          leading: Icon(icon, color: c, size: 22),
                          title: Text(n.message),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
              );
            },
          ),
        );
      },
    );
  }

  void _showVolumeSheet(BuildContext context, WidgetRef ref) {
    final scheme = Theme.of(context).colorScheme;
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: scheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return SafeArea(
          child: Consumer(
            builder: (context, ref2, _) {
              final roomVol = ref2.watch(
                roomSettingsProvider.select((s) => s.roomAudioVolume),
              );
              final shareVol = ref2.watch(
                roomSettingsProvider.select((s) => s.roomScreenShareAudioVolume),
              );
              return Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Âm lượng',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Âm thanh phòng & chia sẻ màn hình (ưu tiên thiết bị; điều chỉnh hệ thống nếu cần).',
                      style: TextStyle(fontSize: 12, color: scheme.onSurfaceVariant),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Icon(Icons.people_outline, size: 20, color: scheme.onSurfaceVariant),
                        const SizedBox(width: 8),
                        Text('Phòng họp', style: TextStyle(color: scheme.onSurface)),
                        const Spacer(),
                        Text('${(roomVol * 100).round()}%'),
                      ],
                    ),
                    Slider(
                      value: roomVol,
                      onChanged: (v) {
                        ref2.read(roomSettingsProvider.notifier).updateRoomAudioVolume(v);
                      },
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.desktop_windows_outlined, size: 20, color: scheme.onSurfaceVariant),
                        const SizedBox(width: 8),
                        Text('Chia sẻ màn hình', style: TextStyle(color: scheme.onSurface)),
                        const Spacer(),
                        Text('${(shareVol * 100).round()}%'),
                      ],
                    ),
                    Slider(
                      value: shareVol,
                      onChanged: (v) {
                        ref2.read(roomSettingsProvider.notifier).updateRoomScreenShareAudioVolume(v);
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  void _confirmHeaderLeave(BuildContext context, WidgetRef ref) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Xác nhận'),
        content: const Text('Bạn có chắc chắn muốn thoát khỏi phiên họp này không?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Hủy'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(dialogContext).pop();
              await ref.read(sessionProvider.notifier).disconnect(
                    userInitiatedLeave: true,
                    sessionEndMessage: 'Người dùng đã đăng xuất',
                  );
              if (!context.mounted) return;
              ref.read(sessionProvider.notifier).toggleStartup(true);
            },
            child: Text('Rời khỏi họp', style: TextStyle(color: Theme.of(context).colorScheme.error)),
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
