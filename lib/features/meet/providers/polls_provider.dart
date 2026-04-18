import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/features/meet/data/models/proto/wajlc_polls.pb.dart' as polls_pb;

import '../data/models/poll.dart';

/// Convert protobuf PollResponse to app Poll list (for refetch/invalidation).
///
/// [userDisplayNames]: map userId → display name; `PollInfo.createdBy` is the
/// creator user id (UUID), not a display name — match web by resolving from room participants.
List<Poll> pollsFromPollResponse(
  polls_pb.PollResponse response, {
  Map<String, String> userDisplayNames = const {},
}) {
  return response.polls
      .map((info) => _pollFromPollInfo(info, userDisplayNames: userDisplayNames))
      .toList();
}

Poll _pollFromPollInfo(
  polls_pb.PollInfo info, {
  Map<String, String> userDisplayNames = const {},
}) {
  final creatorId = info.createdBy;
  final resolvedName = userDisplayNames[creatorId];
  final createdByName = (resolvedName != null && resolvedName.trim().isNotEmpty)
      ? resolvedName.trim()
      : 'Unknown';

  return Poll(
    id: info.id,
    question: info.question,
    options: info.options
        .map((o) => PollOption(
              id: o.id.toString(),
              text: o.text,
              votes: const [],
            ))
        .toList(),
    createdBy: creatorId,
    createdByName: createdByName,
    isActive: info.isRunning,
    createdAt: DateTime.fromMillisecondsSinceEpoch(info.created.toInt()),
  );
}

class PollsState {
  final List<Poll> polls;
  final bool isLoading;
  final String? error;

  const PollsState({
    this.polls = const [],
    this.isLoading = false,
    this.error,
  });

  PollsState copyWith({
    List<Poll>? polls,
    bool? isLoading,
    String? error,
  }) {
    return PollsState(
      polls: polls ?? this.polls,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

class PollsNotifier extends StateNotifier<PollsState> {
  PollsNotifier() : super(const PollsState());

  void addPoll(Poll poll) {
    state = state.copyWith(polls: [...state.polls, poll]);
  }

  void updatePoll(Poll updatedPoll) {
    state = state.copyWith(
      polls: state.polls.map((p) => p.id == updatedPoll.id ? updatedPoll : p).toList(),
    );
  }

  void removePoll(String pollId) {
    state = state.copyWith(
      polls: state.polls.where((p) => p.id != pollId).toList(),
    );
  }

  void setLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }

  void setError(String? error) {
    state = state.copyWith(error: error);
  }
  
  // Helper to update votes for a specific option in a specific poll
  void updateVotes(String pollId, String optionId, List<String> userIds) {
    final pollIndex = state.polls.indexWhere((p) => p.id == pollId);
    if (pollIndex != -1) {
      final poll = state.polls[pollIndex];
      final updatedOptions = poll.options.map((opt) {
        if (opt.id == optionId) {
          return opt.copyWith(votes: userIds);
        }
        return opt;
      }).toList();
      
      final updatedPoll = poll.copyWith(options: updatedOptions);
      updatePoll(updatedPoll);
    }
  }

  /// Replace polls with list from API (used after POLL_CREATED / POLL_CLOSED).
  void setPollsFromApi(List<Poll> polls) {
    state = state.copyWith(polls: polls, error: null);
  }
}

final pollsProvider = StateNotifierProvider<PollsNotifier, PollsState>((ref) {
  return PollsNotifier();
});
