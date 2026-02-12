import 'package:livekit_client/livekit_client.dart';
import '../../../providers/participant_provider.dart';
import '../../../providers/session_provider.dart';
import '../../../providers/livekit_providers.dart';
import 'video_tile.dart';

/// Video Grid Widget
/// Displays all participant videos in a responsive grid
/// 1:1 clone of apps/meet/src/components/main-area/index.tsx
class VideoGrid extends ConsumerWidget {
  const VideoGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get LiveKit participants
    final remoteParticipantsAsync = ref.watch(videoSubscribersProvider);
    final localParticipant = ref.watch(localParticipantProvider);
    
    // Combine participants
    final participants = <Participant>[];
    if (localParticipant != null) {
      participants.add(localParticipant);
    }
    
    remoteParticipantsAsync.whenData((remoteMap) {
      participants.addAll(remoteMap.values);
    });
    
    final screenSharing = ref.watch(
      sessionProvider.select((s) => s.screenSharing),
    );

    // If someone is screen sharing, show screen share prominently
    if (screenSharing.isActive) {
      return _buildScreenShareLayout(context, ref, participants);
    }
    
    // Check if loading or error
    if (remoteParticipantsAsync.isLoading && participants.isEmpty) {
       return const Center(child: CircularProgressIndicator());
    }

    // Normal grid layout
    return _buildGridLayout(context, participants);
  }

  Widget _buildScreenShareLayout(
    BuildContext context,
    WidgetRef ref,
    List<Participant> participants,
  ) {
    final screenSharing = ref.watch(
      sessionProvider.select((s) => s.screenSharing),
    );
    
    return Column(
      children: [
        // Screen share (main area)
        Expanded(
          flex: 3,
          child: Container(
            color: Colors.black,
            child: Center(
              child: Text(
                'Screen Share by ${screenSharing.sharedBy}',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        
        // Participant thumbnails
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(8),
            itemCount: participants.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: SizedBox(
                  width: 160,
                  child: VideoTile(
                    participant: participants[index],
                    isSmall: true,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildGridLayout(BuildContext context, List<Participant> participants) {
    if (participants.isEmpty) {
      return const Center(
        child: Text(
          'Waiting for participants...',
          style: TextStyle(color: Colors.white54),
        ),
      );
    }

    final orientation = MediaQuery.of(context).orientation;
    final isPortrait = orientation == Orientation.portrait;
    
    // Calculate grid columns based on participant count and orientation
    int crossAxisCount;
    if (participants.length == 1) {
      crossAxisCount = 1;
    } else if (participants.length == 2) {
      crossAxisCount = isPortrait ? 1 : 2;
    } else if (participants.length <= 4) {
      crossAxisCount = 2;
    } else if (participants.length <= 9) {
      crossAxisCount = isPortrait ? 2 : 3;
    } else {
      crossAxisCount = isPortrait ? 3 : 4;
    }

    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: 16 / 9,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: participants.length,
      itemBuilder: (context, index) {
        return VideoTile(participant: participants[index]);
      },
    );
  }
}
