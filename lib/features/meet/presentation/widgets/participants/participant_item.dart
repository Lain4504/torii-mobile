import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/participant_provider.dart';
import '../../../providers/session_provider.dart';
import '../../../data/datasources/meet_api_service.dart';
import 'package:torii_app/features/meet/data/models/proto/wajlc_common_api.pb.dart';

/// Participant Item Widget with menu and waiting-approval state
/// 1:1 clone of apps/meet/src/components/participants/participantItem.tsx
class ParticipantItem extends ConsumerWidget {
  final ParticipantInfo participant;
  final bool isMe;

  const ParticipantItem({
    super.key,
    required this.participant,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasAudio = participant.hasAudioTrack;
    final hasVideo = participant.hasVideoTrack;
    final isRaisedHand = participant.metadata.isHandRaised;
    final waitForApproval = participant.metadata.waitForApproval;
    final isAdmin = ref.watch(
      sessionProvider.select(
        (s) => s.currentUser?.metadata?.isAdmin ?? false,
      ),
    );

    return Row(
      children: [
        // Avatar
        CircleAvatar(
          radius: 20,
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: Text(
            _getInitials(participant.name),
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(width: 12),
        
        // Name & Role
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                isMe ? '${participant.name} (You)' : participant.name,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              if (participant.metadata.isAdmin)
                Text(
                  'Host',
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              if (waitForApproval)
                Text(
                  'Waiting for approval',
                  style: TextStyle(
                    fontSize: 11,
                    color: Theme.of(context).colorScheme.secondary,
                    fontStyle: FontStyle.italic,
                  ),
                ),
            ],
          ),
        ),
        
        // Status Icons
        Row(
          children: [
            if (isRaisedHand)
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Icon(
                  Icons.back_hand,
                  size: 16,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: hasVideo 
                    ? Colors.transparent 
                    : Theme.of(context).disabledColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                hasVideo ? Icons.videocam : Icons.videocam_off,
                size: 16,
                color: hasVideo 
                    ? Theme.of(context).colorScheme.onSurface 
                    : Theme.of(context).disabledColor,
              ),
            ),
            const SizedBox(width: 4),
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: hasAudio 
                    ? Colors.transparent 
                    : Theme.of(context).disabledColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                hasAudio ? Icons.mic : Icons.mic_off,
                size: 16,
                color: hasAudio 
                    ? Theme.of(context).colorScheme.onSurface 
                    : Theme.of(context).disabledColor,
              ),
            ),
            
            // Menu button for actions (admin or for others: private chat)
            if (!isMe)
              PopupMenuButton<String>(
                icon: const Icon(Icons.more_vert, size: 20),
                onSelected: (value) => _onMenuSelected(context, ref, value),
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 'private_chat',
                    child: ListTile(
                      leading: Icon(Icons.chat),
                      title: Text('Private chat'),
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                  if (isAdmin) ...[
                    const PopupMenuItem(
                      value: 'mute',
                      child: ListTile(
                        leading: Icon(Icons.mic_off),
                        title: Text('Mute'),
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                    const PopupMenuItem(
                      value: 'presenter',
                      child: ListTile(
                        leading: Icon(Icons.person_pin),
                        title: Text('Make presenter'),
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                    const PopupMenuItem(
                      value: 'remove',
                      child: ListTile(
                        leading: Icon(Icons.person_remove, color: Colors.red),
                        title: Text('Remove', style: TextStyle(color: Colors.red)),
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  ],
                ],
              ),
          ],
        ),
      ],
    );
  }

  Future<void> _onMenuSelected(
    BuildContext context,
    WidgetRef ref,
    String value,
  ) async {
    final session = ref.read(sessionProvider);
    final api = ref.read(meetApiServiceProvider);
    final roomId = session.currentRoom.roomId;
    final sid = session.currentRoom.sid;

    try {
      switch (value) {
        case 'mute':
          await api.muteUnmuteTrack(
            MuteUnMuteTrackReq(
              sid: sid,
              roomId: roomId,
              userId: participant.userId,
              muted: true,
            ),
          );
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Muted ${participant.name}')),
            );
          }
          break;
        case 'presenter':
          await api.switchPresenter(
            SwitchPresenterReq(
              task: SwitchPresenterTask.PROMOTE,
              roomId: roomId,
              userId: participant.userId,
            ),
          );
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('${participant.name} is now presenter')),
            );
          }
          break;
        case 'remove':
          await api.removeParticipant(
            RemoveParticipantReq(
              sid: sid,
              roomId: roomId,
              userId: participant.userId,
              msg: 'You have been removed from the meeting.',
              blockUser: false,
            ),
          );
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Removed ${participant.name}')),
            );
          }
          break;
        case 'private_chat':
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Open private chat with ${participant.name}'),
              ),
            );
          }
          break;
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }

  String _getInitials(String name) {
    if (name.isEmpty) return '?';
    final parts = name.trim().split(' ');
    if (parts.length == 1) return parts[0][0].toUpperCase();
    return '${parts[0][0]}${parts[parts.length - 1][0]}'.toUpperCase();
  }
}
