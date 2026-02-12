import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/models/poll.dart';

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
}

final pollsProvider = StateNotifierProvider<PollsNotifier, PollsState>((ref) {
  return PollsNotifier();
});
