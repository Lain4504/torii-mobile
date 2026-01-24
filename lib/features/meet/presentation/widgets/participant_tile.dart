import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:livekit_client/livekit_client.dart';

class ParticipantTile extends StatefulWidget {
  final Participant participant;
  final TrackSource? preferSource;

  const ParticipantTile({
    super.key,
    required this.participant,
    this.preferSource,
  });

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
    if (widget.preferSource != null) {
      _videoPublication = widget.participant.videoTrackPublications
          .where((p) => p.source == widget.preferSource)
          .firstOrNull;
    }
    
    _videoPublication ??= widget.participant.videoTrackPublications
        .where((p) => p.source == TrackSource.camera)
        .firstOrNull ?? 
        widget.participant.videoTrackPublications.firstOrNull;
  }

  @override
  Widget build(BuildContext context) {
    final track = _videoPublication?.track;
    final isMuted = _videoPublication?.muted ?? true;

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E2C),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: widget.participant.isSpeaking 
            ? Colors.greenAccent.withOpacity(0.6) 
            : Colors.white.withOpacity(0.05), 
          width: 2,
        ),
        boxShadow: widget.participant.isSpeaking ? [
          BoxShadow(
            color: Colors.greenAccent.withOpacity(0.2),
            blurRadius: 12,
            spreadRadius: 2,
          )
        ] : [],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          // Video Layer
          if (track != null && track is VideoTrack && !isMuted)
            VideoTrackRenderer(track, fit: RTCVideoViewObjectFit.RTCVideoViewObjectFitCover)
          else
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF2E2E3E), Color(0xFF1A1A26)],
                ),
              ),
              child: Center(
                child: CircleAvatar(
                  radius: 44,
                  backgroundColor: Colors.white.withOpacity(0.05),
                  child: Text(
                    widget.participant.identity.substring(0, 1).toUpperCase(),
                    style: const TextStyle(
                      fontSize: 36, 
                      fontWeight: FontWeight.bold,
                      color: Colors.white70,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
              ),
            ),

          // Identity Overlay (Glassmorphism)
          Positioned(
            bottom: 12,
            left: 12,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white.withOpacity(0.1), width: 0.5),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (widget.participant.isSpeaking)
                        const Padding(
                          padding: EdgeInsets.only(right: 6.0),
                          child: Icon(Icons.mic, color: Colors.greenAccent, size: 14),
                        )
                      else if (widget.participant.isMicrophoneEnabled())
                         const Padding(
                          padding: EdgeInsets.only(right: 6.0),
                          child: Icon(Icons.mic, color: Colors.white54, size: 14),
                        )
                      else
                        const Padding(
                          padding: EdgeInsets.only(right: 6.0),
                          child: Icon(Icons.mic_off, color: Colors.redAccent, size: 14),
                        ),
                      Text(
                        widget.participant.name ?? widget.participant.identity,
                        style: const TextStyle(
                          color: Colors.white, 
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
