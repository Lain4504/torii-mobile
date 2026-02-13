import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/participant_provider.dart';
import '../../../providers/session_provider.dart';
import 'participant_item.dart';

/// Participants Bottom Sheet
/// Displays list of participants and search functionality
/// 1:1 clone of apps/meet/src/components/participants/index.tsx
class ParticipantsBottomSheet extends ConsumerStatefulWidget {
  const ParticipantsBottomSheet({super.key});

  @override
  ConsumerState<ParticipantsBottomSheet> createState() => _ParticipantsBottomSheetState();
}

class _ParticipantsBottomSheetState extends ConsumerState<ParticipantsBottomSheet> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      _searchQuery = _searchController.text.toLowerCase();
    });
  }

  @override
  Widget build(BuildContext context) {
    final participantState = ref.watch(participantProvider);
    final participants = participantState.allParticipants;
    final currentUser = ref.watch(sessionProvider.select((s) => s.currentUser));
    
    // Filter participants
    final filteredParticipants = participants.where((p) {
      if (_searchQuery.isEmpty) return true;
      return p.name.toLowerCase().contains(_searchQuery);
    }).toList();

    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        children: [
          // Header
          Container(
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
                const Icon(Icons.people_outline, size: 20),
                const SizedBox(width: 8),
                Text(
                  'Participants (${participantState.totalParticipants})',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  splashRadius: 20,
                ),
              ],
            ),
          ),
          
          // Search
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search for people',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.3),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                isDense: true,
              ),
            ),
          ),
          
          // List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: filteredParticipants.length,
              itemBuilder: (context, index) {
                final participant = filteredParticipants[index];
                final isMe = participant.userId == currentUser?.userId;
                
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: ParticipantItem(
                    participant: participant,
                    isMe: isMe,
                  ),
                );
              },
            ),
          ),
          
          // Actions (Mute All for host)
          if (currentUser?.metadata?.isAdmin == true)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Theme.of(context).dividerColor.withOpacity(0.1),
                  ),
                ),
              ),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () => _handleMuteAll(context, ref, participants),
                  icon: const Icon(Icons.mic_off),
                  label: const Text('Mute All'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _handleMuteAll(
    BuildContext context,
    WidgetRef ref,
    List<ParticipantInfo> participants,
  ) async {
    final session = ref.read(sessionProvider);
    final api = ref.read(meetApiServiceProvider);
    final roomId = session.currentRoom.roomId;
    final sid = session.currentRoom.sid;
    final currentUserId = session.currentUser?.userId;

    if (currentUserId == null) return;

    int successCount = 0;
    int failCount = 0;

    for (final participant in participants) {
      // Skip self and participants without audio tracks
      if (participant.userId == currentUserId || !participant.hasAudioTrack) {
        continue;
      }

      try {
        await api.muteUnmuteTrack(
          MuteUnMuteTrackReq(
            sid: sid,
            roomId: roomId,
            userId: participant.userId,
            muted: true,
          ),
        );
        successCount++;
      } catch (e) {
        failCount++;
      }
    }

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            failCount > 0
                ? 'Muted $successCount participants. Failed: $failCount'
                : 'Muted all $successCount participants',
          ),
        ),
      );
    }
  }
}
