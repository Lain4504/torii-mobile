import 'package:flutter/material.dart';
import '../../../providers/participant_provider.dart';

/// Participant Item Widget
/// Displays single participant info with status icons
/// 1:1 clone of apps/meet/src/components/participants/participantItem.tsx
class ParticipantItem extends StatelessWidget {
  final ParticipantInfo participant;
  final bool isMe;

  const ParticipantItem({
    super.key,
    required this.participant,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    // Check audio/video status
    final hasAudio = true; // Placeholder: could be tracked in ParticipantInfo
    final hasVideo = true; // Placeholder: could be tracked in ParticipantInfo
    final isRaisedHand = participant.metadata.isHandRaised;

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
              if (participant.metadata?.isAdmin ?? false)
                Text(
                  'Host',
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).colorScheme.primary,
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
            
            // Menu button for actions
            IconButton(
              icon: const Icon(Icons.more_vert),
              iconSize: 20,
              onPressed: () {
                // TODO: Show participant actions menu
                // (Mute, Remove, Make Host, etc.)
              },
            ),
          ],
        ),
      ],
    );
  }

  String _getInitials(String name) {
    if (name.isEmpty) return '?';
    final parts = name.trim().split(' ');
    if (parts.length == 1) return parts[0][0].toUpperCase();
    return '${parts[0][0]}${parts[parts.length - 1][0]}'.toUpperCase();
  }
}
