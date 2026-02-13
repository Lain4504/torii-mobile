// Participant Provider - Riverpod State Management
// 1:1 clone of apps/meet/src/store/slices/participantSlice.ts
//
// Manages:
// - Participant list (add/remove/update)
// - Participant metadata
// - Sorting and filtering

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:torii_app/features/meet/data/models/user_metadata.dart';

// ============================================================================
// STATE CLASSES
// ============================================================================

/// Participant info
class ParticipantInfo {
  final String userId;
  final String sid;
  final String name;
  final UserMetadata metadata;
  final String? connectionQuality;
  final String? visibility;
  /// From LiveKit track subscriptions (handle_media_tracks)
  final bool hasAudioTrack;
  final bool hasVideoTrack;

  const ParticipantInfo({
    required this.userId,
    required this.sid,
    required this.name,
    required this.metadata,
    this.connectionQuality,
    this.visibility,
    this.hasAudioTrack = true,
    this.hasVideoTrack = true,
  });

  ParticipantInfo copyWith({
    String? userId,
    String? sid,
    String? name,
    UserMetadata? metadata,
    String? connectionQuality,
    String? visibility,
    bool? hasAudioTrack,
    bool? hasVideoTrack,
  }) {
    return ParticipantInfo(
      userId: userId ?? this.userId,
      sid: sid ?? this.sid,
      name: name ?? this.name,
      metadata: metadata ?? this.metadata,
      connectionQuality: connectionQuality ?? this.connectionQuality,
      visibility: visibility ?? this.visibility,
      hasAudioTrack: hasAudioTrack ?? this.hasAudioTrack,
      hasVideoTrack: hasVideoTrack ?? this.hasVideoTrack,
    );
  }
}

/// Main participant state
class ParticipantState {
  final Map<String, ParticipantInfo> participants;
  
  const ParticipantState({
    this.participants = const {},
  });
  
  ParticipantState copyWith({
    Map<String, ParticipantInfo>? participants,
  }) {
    return ParticipantState(
      participants: participants ?? this.participants,
    );
  }
  
  /// Get total participant count
  int get totalParticipants => participants.length;
  
  /// Get all participants as list
  List<ParticipantInfo> get allParticipants => participants.values.toList()
    ..sort((a, b) => a.name.compareTo(b.name));
}

// ============================================================================
// NOTIFIER
// ============================================================================

/// Participant state notifier
/// Matches: participantsSlice reducers in participantSlice.ts
class ParticipantNotifier extends StateNotifier<ParticipantState> {
  ParticipantNotifier() : super(const ParticipantState());
  
  /// Add participant
  /// Matches: addParticipant
  void addParticipant(ParticipantInfo participant) {
    final newParticipants = Map<String, ParticipantInfo>.from(state.participants);
    newParticipants[participant.userId] = participant;
    state = state.copyWith(participants: newParticipants);
  }
  
  /// Remove participant
  /// Matches: removeParticipant
  void removeParticipant(String userId) {
    final newParticipants = Map<String, ParticipantInfo>.from(state.participants);
    newParticipants.remove(userId);
    state = state.copyWith(participants: newParticipants);
  }
  
  /// Update participant
  /// Matches: updateParticipant
  void updateParticipant({
    required String userId,
    required Map<String, dynamic> changes,
  }) {
    final participant = state.participants[userId];
    if (participant == null) return;
    
    final newParticipants = Map<String, ParticipantInfo>.from(state.participants);
    newParticipants[userId] = participant.copyWith(
      name: changes['name'] as String? ?? participant.name,
      sid: changes['sid'] as String? ?? participant.sid,
      metadata: changes['metadata'] as UserMetadata? ?? participant.metadata,
      connectionQuality: changes['connectionQuality'] as String? ?? participant.connectionQuality,
      visibility: changes['visibility'] as String? ?? participant.visibility,
      hasAudioTrack: changes['hasAudioTrack'] as bool? ?? participant.hasAudioTrack,
      hasVideoTrack: changes['hasVideoTrack'] as bool? ?? participant.hasVideoTrack,
    );
    state = state.copyWith(participants: newParticipants);
  }
  
  /// Clear all participants
  void clearParticipants() {
    state = const ParticipantState();
  }
}

// ============================================================================
// PROVIDER
// ============================================================================

/// Participant provider
/// Matches: participantsSlice in Redux store
final participantProvider = StateNotifierProvider<ParticipantNotifier, ParticipantState>((ref) {
  return ParticipantNotifier();
});

// ============================================================================
// SELECTORS (for convenience)
// ============================================================================

/// Get all participants
final allParticipantsProvider = Provider<List<ParticipantInfo>>((ref) {
  return ref.watch(participantProvider).allParticipants;
});

/// Get total participant count
final totalParticipantsProvider = Provider<int>((ref) {
  return ref.watch(participantProvider).totalParticipants;
});

/// Get basic participants (for UI lists)
/// Matches: selectBasicParticipants
final basicParticipantsProvider = Provider<List<Map<String, dynamic>>>((ref) {
  final participants = ref.watch(allParticipantsProvider);
  return participants.map((p) => {
    'userId': p.userId,
    'sid': p.sid,
    'name': p.name,
    'isAdmin': p.metadata.isAdmin,
  }).toList();
});

/// Get whiteboard participants
/// Matches: selectWhiteboardParticipants
final whiteboardParticipantsProvider = Provider<List<Map<String, dynamic>>>((ref) {
  final participants = ref.watch(allParticipantsProvider);
  return participants.map((p) => {
    'userId': p.userId,
    'sid': p.sid,
    'name': p.name,
    'isAdmin': p.metadata.isAdmin,
    'isPresenter': p.metadata.isPresenter,
    'isWhiteboardLocked': p.metadata.lockSettings?.lockWhiteboard ?? false,
  }).toList();
});

/// Get visible participants (filtered)
/// Matches: selectVisibleParticipants
Provider<List<Map<String, dynamic>>> visibleParticipantsProvider({
  required bool isAdmin,
  String search = '',
  bool allowViewOtherUsers = true,
  String? currentUserId,
}) {
  return Provider<List<Map<String, dynamic>>>((ref) {
    final participants = ref.watch(allParticipantsProvider);
    
    // Filter out bots and empty names
    var list = participants.where((p) =>
      p.name.isNotEmpty &&
      p.userId != 'RECORDER_BOT' &&
      p.userId != 'RTMP_BOT'
    ).toList();
    
    // Filter by permissions
    if (!isAdmin && !allowViewOtherUsers) {
      list = list.where((p) =>
        p.metadata.isAdmin || p.userId == currentUserId
      ).toList();
    }
    
    // Filter by search
    if (search.isNotEmpty) {
      list = list.where((p) =>
        p.name.toLowerCase().contains(search.toLowerCase())
      ).toList();
    }
    
    // Sort by waiting approval (admins only)
    if (isAdmin) {
      list.sort((a, b) {
        final aWaiting = a.metadata.waitForApproval;
        final bWaiting = b.metadata.waitForApproval;
        if (aWaiting == bWaiting) return 0;
        return aWaiting ? -1 : 1;
      });
    }
    
    return list.map((p) => {
      'userId': p.userId,
      'name': p.name,
      'isAdmin': p.metadata.isAdmin,
      'waitForApproval': p.metadata.waitForApproval,
      'profilePic': p.metadata.profilePic,
    }).toList();
  });
}
