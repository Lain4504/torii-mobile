import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:torii_app/features/meet/presentation/providers/meet_provider.dart';
import 'package:torii_app/features/meet/presentation/widgets/chat_bottom_sheet.dart';
import 'package:torii_app/features/meet/presentation/widgets/meeting_controls.dart';
import 'package:torii_app/features/meet/presentation/widgets/participant_tile.dart';
import 'package:torii_app/features/meet/presentation/widgets/join_meet_form.dart';

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
      backgroundColor: const Color(0xFF0F0F1A),
      appBar: meetState.status == MeetStatus.connected 
        ? AppBar(
            title: Text(
              meetState.roomInfo?.roomId ?? 'Meeting',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, letterSpacing: 0.5),
            ),
            centerTitle: true,
            backgroundColor: const Color(0xFF1A1A26).withOpacity(0.8),
            elevation: 0,
            flexibleSpace: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(color: Colors.transparent),
              ),
            ),
            foregroundColor: Colors.white,
            actions: [
              if (meetState.isRecording)
                Container(
                  margin: const EdgeInsets.only(right: 12),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.redAccent.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.redAccent.withOpacity(0.4)),
                  ),
                  child: const Row(
                    children: [
                       Icon(Icons.fiber_manual_record, color: Colors.redAccent, size: 12),
                       SizedBox(width: 6),
                       Text('REC', style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold, fontSize: 10)),
                    ],
                  ),
                ),
              IconButton(
                icon: const Icon(Icons.chat_bubble_outline, size: 22),
                onPressed: () => _showChat(context),
              ),
            ],
          )
        : null, // Hide appbar on Join screen
      body: Stack(
        children: [
          _buildBody(context, ref, meetState),
          if (meetState.notification != null)
            Positioned(
              top: 24,
              left: 32,
              right: 32,
              child: AnimatedOpacity(
                opacity: 1.0,
                duration: const Duration(milliseconds: 300),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: Colors.blueAccent.withOpacity(0.3), width: 1),
                      ),
                      child: Text(
                        meetState.notification!,
                        style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
      bottomNavigationBar: meetState.status == MeetStatus.connected
          ? const MeetingControls()
          : null,
    );
  }

  Widget _buildBody(BuildContext context, WidgetRef ref, MeetState state) {
    switch (state.status) {
      case MeetStatus.initial:
        return const JoinMeetForm();
      case MeetStatus.signaling:
      case MeetStatus.natsConnecting:
      case MeetStatus.natsConnected:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(color: Colors.white),
              const SizedBox(height: 16),
              Text(state.statusMessage ?? 'Connecting...', style: const TextStyle(color: Colors.white)),
            ],
          ),
        );
      case MeetStatus.deviceSetup:
        return _buildDeviceSetup(context, ref, state);
      case MeetStatus.mediaConnecting:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(color: Colors.white),
              const SizedBox(height: 16),
              Text(state.statusMessage ?? 'Connecting to media...', style: const TextStyle(color: Colors.white)),
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

  Widget _buildDeviceSetup(BuildContext context, WidgetRef ref, MeetState state) {
    final notifier = ref.read(meetControllerProvider.notifier);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              state.roomMetadata?.roomId ?? state.roomId ?? 'Meeting',
              style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(
              'Setup your camera and microphone',
              style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 14),
            ),
            const SizedBox(height: 48),
            // Camera preview placeholder
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E2C),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white24),
              ),
              child: Center(
                child: Icon(
                  state.isCamEnabled ? Icons.videocam : Icons.videocam_off,
                  size: 64,
                  color: state.isCamEnabled ? Colors.blueAccent : Colors.white38,
                ),
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _DeviceSetupChip(
                  icon: state.isCamEnabled ? Icons.videocam : Icons.videocam_off,
                  label: 'Camera',
                  isOn: state.isCamEnabled,
                  onTap: () => notifier.toggleCam(),
                ),
                const SizedBox(width: 24),
                _DeviceSetupChip(
                  icon: state.isMicEnabled ? Icons.mic : Icons.mic_off,
                  label: 'Microphone',
                  isOn: state.isMicEnabled,
                  onTap: () => notifier.toggleMic(),
                ),
              ],
            ),
            const SizedBox(height: 48),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => notifier.startMediaConnection(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5C6BC0),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: const Text('Join', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              ),
            ),
          ],
        ),
      ),
    );
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
              preferSource: TrackSource.screenShareVideo,
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
      return const Center(
        child: Text(
          "You're in the room. Camera will appear here.",
          style: TextStyle(color: Colors.white70, fontSize: 14),
          textAlign: TextAlign.center,
        ),
      );
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

class _DeviceSetupChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isOn;
  final VoidCallback onTap;

  const _DeviceSetupChip({
    required this.icon,
    required this.label,
    required this.isOn,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isOn ? const Color(0xFF2E2E3E) : const Color(0xFF1E1E2C),
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: isOn ? Colors.greenAccent : Colors.white54, size: 28),
              const SizedBox(width: 12),
              Text(label, style: const TextStyle(color: Colors.white, fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
