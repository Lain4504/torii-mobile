import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:torii_app/features/meet/presentation/providers/meet_provider.dart';
import 'package:torii_app/features/meet/presentation/widgets/chat_bottom_sheet.dart';
import 'package:torii_app/features/meet/presentation/widgets/meeting_controls.dart';
import 'package:torii_app/features/meet/presentation/widgets/participant_tile.dart';

class MeetingScreen extends ConsumerWidget {
  const MeetingScreen({super.key});

  void _showChat(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const ChatBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final meetState = ref.watch(meetControllerProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(meetState.roomInfo?.roomId ?? 'Meeting'),
        backgroundColor: Colors.grey[900],
        foregroundColor: Colors.white,
        actions: [
          if (meetState.isRecording)
            const Row(
              children: [
                Icon(Icons.fiber_manual_record, color: Colors.red, size: 16),
                SizedBox(width: 4),
                Text('REC', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 12)),
                SizedBox(width: 8),
              ],
            ),
          if (meetState.status == MeetStatus.connected)
            IconButton(
              icon: const Icon(Icons.chat),
              onPressed: () => _showChat(context),
            ),
        ],
      ),
      body: _buildBody(context, ref, meetState),
      bottomNavigationBar: meetState.status == MeetStatus.connected
          ? const MeetingControls()
          : null,
    );
  }

  Widget _buildBody(BuildContext context, WidgetRef ref, MeetState state) {
    switch (state.status) {
      case MeetStatus.initial:
        return Center(
          child: ElevatedButton(
            onPressed: () => ref.read(meetControllerProvider.notifier).joinMeeting(),
            child: const Text('Join Meeting'),
          ),
        );
      case MeetStatus.signaling:
      case MeetStatus.natsConnecting:
      case MeetStatus.natsConnected:
      case MeetStatus.mediaConnecting:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 16),
              Text(state.statusMessage ?? 'Please wait...', style: const TextStyle(color: Colors.white)),
            ],
          ),
        );
      case MeetStatus.connected:
        if (state.screenSharingParticipant != null) {
          return _buildScreenShareLayout(state.screenSharingParticipant!, state.participants);
        }
        return _buildParticipantGrid(state.participants);
      case MeetStatus.error:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error, color: Colors.red, size: 64),
              const SizedBox(height: 16),
              Text(state.errorMessage ?? 'Unknown Error', style: const TextStyle(color: Colors.white)),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref.read(meetControllerProvider.notifier).joinMeeting(),
                child: const Text('Retry'),
              ),
            ],
          ),
        );
      default:
        return const Center(child: Text('Disconnected', style: TextStyle(color: Colors.white)));
    }
  }

  Widget _buildScreenShareLayout(Participant presenter, List<Participant> allParticipants) {
    final others = allParticipants.where((p) => p.identity != presenter.identity).toList();

    return Column(
      children: [
        // Main Screen Share View
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ParticipantTile(
              participant: presenter,
              preferSource: TrackSource.screenShare,
            ),
          ),
        ),
        
        // Presenter's Camera (Optional)
        SizedBox(
          height: 120,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            children: [
              // Presenter themselves (Camera)
              SizedBox(
                width: 160,
                child: ParticipantTile(participant: presenter, preferSource: TrackSource.camera),
              ),
              const SizedBox(width: 8),
              // Others
              ...others.map((p) => Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: SizedBox(
                  width: 160,
                  child: ParticipantTile(participant: p),
                ),
              )),
            ],
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _buildParticipantGrid(List<Participant> participants) {
    if (participants.isEmpty) {
      return const Center(child: Text('Waiting for participants...', style: TextStyle(color: Colors.white)));
    }

    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 400,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 16 / 9,
      ),
      itemCount: participants.length,
      itemBuilder: (context, index) {
        return ParticipantTile(participant: participants[index]);
      },
    );
  }
}
