import 'package:livekit_client/livekit_client.dart';

import '../../providers/participant_provider.dart';

/// Gắn [ParticipantInfo] từ NATS với [Participant] trong LiveKit room.
/// Web dùng trực tiếp `participant.identity`; server đôi khi lệch key map nên cần fallback.
Participant? resolveLivekitParticipant({
  required Room? room,
  required ParticipantInfo info,
  required String? localIdentity,
}) {
  if (room == null) return null;

  if (localIdentity != null && info.userId == localIdentity) {
    return room.localParticipant;
  }

  final remotes = room.remoteParticipants;
  final byUserId = remotes[info.userId];
  if (byUserId != null) return byUserId;

  for (final p in remotes.values) {
    if (p.identity == info.userId) return p;
  }

  final sid = info.sid;
  if (sid.isNotEmpty) {
    for (final p in remotes.values) {
      if (p.sid == sid) return p;
    }
  }

  return null;
}
