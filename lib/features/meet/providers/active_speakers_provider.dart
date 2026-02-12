// Active Speakers Provider - Riverpod State Management
// 1:1 clone of apps/meet/src/store/slices/activeSpeakersSlice.ts
//
// Manages:
// - Active speakers list (voice activity detection)
// - Speaker audio levels
// - Last spoke timestamps
// - Speaker sorting by activity

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'active_speakers_provider.freezed.dart';

// ============================================================================
// STATE CLASSES
// ============================================================================

/// Active speaker info
@freezed
abstract class ActiveSpeaker with _$ActiveSpeaker {
  const factory ActiveSpeaker({
    required String userId,
    required String name,
    @Default(false) bool isSpeaking,
    @Default(0.0) double audioLevel, // 0.0 to 1.0
    @Default(0) int lastSpokeAt, // Timestamp in milliseconds
  }) = _ActiveSpeaker;
}

/// Active speakers state
@freezed
abstract class ActiveSpeakersState with _$ActiveSpeakersState {
  const factory ActiveSpeakersState({
    @Default({}) Map<String, ActiveSpeaker> speakers, // userId -> ActiveSpeaker
  }) = _ActiveSpeakersState;
  
  /// Factory for initial state
  factory ActiveSpeakersState.initial() {
    return const ActiveSpeakersState();
  }
}

// ============================================================================
// NOTIFIER
// ============================================================================

/// Active speakers state notifier
/// Matches: activeSpeakersSlice reducers in activeSpeakersSlice.ts
class ActiveSpeakersNotifier extends StateNotifier<ActiveSpeakersState> {
  ActiveSpeakersNotifier() : super(ActiveSpeakersState.initial());
  
  /// Add or update speaker
  /// Matches: addOrUpdateSpeaker
  void addOrUpdateSpeaker({
    required String userId,
    required String name,
    bool? isSpeaking,
    double? audioLevel,
  }) {
    final currentSpeaker = state.speakers[userId];
    final now = DateTime.now().millisecondsSinceEpoch;
    
    final updatedSpeaker = ActiveSpeaker(
      userId: userId,
      name: name,
      isSpeaking: isSpeaking ?? currentSpeaker?.isSpeaking ?? false,
      audioLevel: audioLevel ?? currentSpeaker?.audioLevel ?? 0.0,
      lastSpokeAt: (isSpeaking == true) ? now : (currentSpeaker?.lastSpokeAt ?? 0),
    );
    
    final updatedSpeakers = Map<String, ActiveSpeaker>.from(state.speakers);
    updatedSpeakers[userId] = updatedSpeaker;
    
    state = state.copyWith(speakers: updatedSpeakers);
  }
  
  /// Remove one speaker
  /// Matches: removeOneSpeaker
  void removeOneSpeaker(String userId) {
    final updatedSpeakers = Map<String, ActiveSpeaker>.from(state.speakers);
    updatedSpeakers.remove(userId);
    
    state = state.copyWith(speakers: updatedSpeakers);
  }
  
  /// Clear all speakers
  /// Matches: clearAllSpeakers (implicit in web via removeAll)
  void clearAllSpeakers() {
    state = ActiveSpeakersState.initial();
  }
  
  /// Update speaker audio level
  void updateSpeakerAudioLevel(String userId, double audioLevel) {
    final speaker = state.speakers[userId];
    if (speaker == null) return;
    
    final isSpeaking = audioLevel > 0.01; // Threshold for speaking
    final now = DateTime.now().millisecondsSinceEpoch;
    
    final updatedSpeaker = speaker.copyWith(
      audioLevel: audioLevel,
      isSpeaking: isSpeaking,
      lastSpokeAt: isSpeaking ? now : speaker.lastSpokeAt,
    );
    
    final updatedSpeakers = Map<String, ActiveSpeaker>.from(state.speakers);
    updatedSpeakers[userId] = updatedSpeaker;
    
    state = state.copyWith(speakers: updatedSpeakers);
  }
}

// ============================================================================
// PROVIDER
// ============================================================================

/// Active speakers provider
/// Matches: activeSpeakersSlice in Redux store
final activeSpeakersProvider = StateNotifierProvider<ActiveSpeakersNotifier, ActiveSpeakersState>((ref) {
  return ActiveSpeakersNotifier();
});

// ============================================================================
// SELECTORS (for convenience)
// ============================================================================

/// Get all speakers as list (sorted by activity)
final activeSpeakersListProvider = Provider<List<ActiveSpeaker>>((ref) {
  final speakers = ref.watch(activeSpeakersProvider).speakers.values.toList();
  
  // Sort by activity:
  // 1. Currently speaking first
  // 2. Then by last spoke time (most recent first)
  // 3. Then by name
  speakers.sort((a, b) {
    // Speaking speakers first
    if (a.isSpeaking != b.isSpeaking) {
      return a.isSpeaking ? -1 : 1;
    }
    
    // Then by last spoke time
    if (a.lastSpokeAt != b.lastSpokeAt) {
      return b.lastSpokeAt.compareTo(a.lastSpokeAt);
    }
    
    // Then by name
    return a.name.compareTo(b.name);
  });
  
  return speakers;
});

/// Get currently speaking users
final currentlySpeakingProvider = Provider<List<ActiveSpeaker>>((ref) {
  final speakers = ref.watch(activeSpeakersListProvider);
  return speakers.where((s) => s.isSpeaking).toList();
});

/// Check if specific user is speaking
Provider<bool> isUserSpeakingProvider(String userId) {
  return Provider<bool>((ref) {
    final speaker = ref.watch(activeSpeakersProvider).speakers[userId];
    return speaker?.isSpeaking ?? false;
  });
}

/// Get speaker count
final activeSpeakerCountProvider = Provider<int>((ref) {
  return ref.watch(activeSpeakersProvider).speakers.length;
});
