import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import '../../../providers/participant_provider.dart';
import '../../../providers/session_provider.dart';
import '../../../providers/bottom_icons_provider.dart';
import '../../../providers/room_settings_provider.dart';
import '../../../data/datasources/meet_api_service.dart';
import 'package:torii_app/features/meet/data/models/proto/wajlc_common_api.pb.dart';

/// Manage Waiting Room Bottom Sheet (admin only)
/// Lists participants waiting for approval, approve/reject per user or bulk
/// 1:1 clone of apps/meet/src/components/waiting-room/index.tsx
class WaitingRoomBottomSheet extends ConsumerWidget {
  const WaitingRoomBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final participants = ref.watch(participantProvider).allParticipants;
    final waiting = participants
        .where((p) => p.metadata.waitForApproval)
        .toList();

    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        children: [
          _buildHeader(context, ref),
          const Divider(height: 1),
          if (waiting.isEmpty)
            const Expanded(
              child: Center(
                child: Text('No participants waiting for approval'),
              ),
            )
          else ...[
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                itemCount: waiting.length,
                itemBuilder: (context, index) {
                  return _WaitingParticipantItem(
                    participant: waiting[index],
                    onApproved: () => Navigator.pop(context),
                  );
                },
              ),
            ),
            _buildBulkActions(context, ref, waiting),
          ],
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).dividerColor.withOpacity(0.1),
          ),
        ),
      ),
      child: Row(
        children: [
          Icon(Icons.person_add, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 8),
          const Text(
            'Manage Waiting Room',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              ref.read(bottomIconsProvider.notifier).updateShowManageWaitingRoomModal(false);
              Navigator.pop(context);
            },
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }

  Widget _buildBulkActions(
    BuildContext context,
    WidgetRef ref,
    List<ParticipantInfo> waiting,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Theme.of(context).dividerColor.withOpacity(0.1),
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () => _approveAll(context, ref, waiting),
              icon: const Icon(Icons.check_circle),
              label: const Text('Accept all'),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () => _rejectAll(context, ref, waiting),
              style: OutlinedButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.error,
              ),
              icon: const Icon(Icons.cancel),
              label: const Text('Reject all'),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _approveAll(
    BuildContext context,
    WidgetRef ref,
    List<ParticipantInfo> waiting,
  ) async {
    final session = ref.read(sessionProvider);
    final roomId = session.currentRoom.roomId;
    final api = ref.read(meetApiServiceProvider);

    for (final p in waiting) {
      try {
        await api.approveWaitingUsers(
          ApproveWaitingUsersReq(roomId: roomId, userId: p.userId),
        );
        ref.read(roomSettingsProvider.notifier).addUserNotification(
          UserNotification(message: '${p.name} approved', typeOption: 'info'),
        );
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to approve: $e')),
          );
        }
      }
    }
    if (context.mounted) Navigator.pop(context);
  }

  Future<void> _rejectAll(
    BuildContext context,
    WidgetRef ref,
    List<ParticipantInfo> waiting,
  ) async {
    final session = ref.read(sessionProvider);
    final api = ref.read(meetApiServiceProvider);

    for (final p in waiting) {
      try {
        await api.removeParticipant(
          RemoveParticipantReq(
            sid: session.currentRoom.sid,
            roomId: session.currentRoom.roomId,
            userId: p.userId,
            msg: 'You have been rejected from the meeting.',
            blockUser: false,
          ),
        );
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to reject: $e')),
          );
        }
      }
    }
    if (context.mounted) Navigator.pop(context);
  }
}

class _WaitingParticipantItem extends ConsumerStatefulWidget {
  final ParticipantInfo participant;
  final VoidCallback onApproved;

  const _WaitingParticipantItem({
    required this.participant,
    required this.onApproved,
  });

  @override
  ConsumerState<_WaitingParticipantItem> createState() =>
      _WaitingParticipantItemState();
}

class _WaitingParticipantItemState extends ConsumerState<_WaitingParticipantItem> {
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    final p = widget.participant;

    return ListTile(
      leading: CircleAvatar(
        child: Text(
          p.name.isNotEmpty ? p.name[0].toUpperCase() : '?',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      title: Text(p.name),
      subtitle: const Text('Waiting for approval'),
      trailing: _loading
          ? const SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.check_circle),
                  color: AppColors.success,
                  onPressed: () => _approve(context),
                ),
                IconButton(
                  icon: const Icon(Icons.cancel),
                  color: Theme.of(context).colorScheme.error,
                  onPressed: () => _reject(context),
                ),
              ],
            ),
    );
  }

  Future<void> _approve(BuildContext context) async {
    setState(() => _loading = true);
    try {
      final session = ref.read(sessionProvider);
      await ref.read(meetApiServiceProvider).approveWaitingUsers(
            ApproveWaitingUsersReq(
              roomId: session.currentRoom.roomId,
              userId: widget.participant.userId,
            ),
          );
      ref.read(roomSettingsProvider.notifier).addUserNotification(
            UserNotification(
              message: '${widget.participant.name} approved',
              typeOption: 'info',
            ),
          );
      widget.onApproved();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _reject(BuildContext context) async {
    setState(() => _loading = true);
    try {
      final session = ref.read(sessionProvider);
      await ref.read(meetApiServiceProvider).removeParticipant(
            RemoveParticipantReq(
              sid: session.currentRoom.sid,
              roomId: session.currentRoom.roomId,
              userId: widget.participant.userId,
              msg: 'You have been rejected from the meeting.',
              blockUser: false,
            ),
          );
      widget.onApproved();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }
}
