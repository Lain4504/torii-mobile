import 'package:flutter/material.dart';
import 'package:livekit_client/livekit_client.dart';

class ParticipantTile extends StatefulWidget {
  final Participant participant;

  const ParticipantTile({super.key, required this.participant});

  @override
  State<ParticipantTile> createState() => _ParticipantTileState();
}

class _ParticipantTileState extends State<ParticipantTile> {
  TrackPublication? _videoPublication;

  @override
  void initState() {
    super.initState();
    _findVideoTrack();
  }

  @override
  void didUpdateWidget(ParticipantTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    _findVideoTrack();
  }

  void _findVideoTrack() {
    // Basic logic to find the first camera video track
    _videoPublication = widget.participant.videoTrackPublications.values.where((p) => p.source == TrackSource.camera).firstOrNull ??
        widget.participant.videoTrackPublications.values.firstOrNull;
  }

  @override
  Widget build(BuildContext context) {
    final track = _videoPublication?.track;
    final isMuted = _videoPublication?.muted ?? true;

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[700]!, width: 1),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          // Video Layer
          if (track != null && track is VideoTrack && !isMuted)
            VideoTrackRenderer(track as VideoTrack, fit: RTCVideoViewObjectFit.RTCVideoViewObjectFitCover)
          else
            Center(
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.grey[700],
                child: Text(
                  widget.participant.identity.substring(0, 1).toUpperCase(),
                  style: const TextStyle(fontSize: 32, color: Colors.white),
                ),
              ),
            ),

          // Identity Overlay
          Positioned(
            bottom: 8,
            left: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (widget.participant.isSpeaking)
                    const Padding(
                      padding: EdgeInsets.only(right: 4.0),
                      child: Icon(Icons.volume_up, color: Colors.green, size: 14),
                    ),
                  Text(
                    widget.participant.identity,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
