import 'package:flutter_riverpod/flutter_riverpod.dart';

/// State for flashcard deck
class FlashcardState {
  final List<dynamic> flashcards; // TODO: Replace with Flashcard model
  final int currentIndex;
  final bool isFlipped;
  final bool isLoading;
  final String? error;

  const FlashcardState({
    this.flashcards = const [],
    this.currentIndex = 0,
    this.isFlipped = false,
    this.isLoading = false,
    this.error,
  });

  FlashcardState copyWith({
    List<dynamic>? flashcards,
    int? currentIndex,
    bool? isFlipped,
    bool? isLoading,
    String? error,
  }) {
    return FlashcardState(
      flashcards: flashcards ?? this.flashcards,
      currentIndex: currentIndex ?? this.currentIndex,
      isFlipped: isFlipped ?? this.isFlipped,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

/// Notifier for flashcard deck
class FlashcardNotifier extends Notifier<FlashcardState> {
  @override
  FlashcardState build() => const FlashcardState();

  // TODO: Inject FlashcardRepository
  
  Future<void> loadFlashcards(String deckId) async {
    state = state.copyWith(isLoading: true, error: null);
    
    try {
      // TODO: Call repository to fetch flashcards
      await Future.delayed(const Duration(seconds: 1)); // Simulate API call
      
      state = state.copyWith(
        flashcards: [], // TODO: Set actual flashcards
        currentIndex: 0,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  void flipCard() {
    state = state.copyWith(isFlipped: !state.isFlipped);
  }

  void nextCard() {
    if (state.currentIndex < state.flashcards.length - 1) {
      state = state.copyWith(
        currentIndex: state.currentIndex + 1,
        isFlipped: false,
      );
    }
  }

  void previousCard() {
    if (state.currentIndex > 0) {
      state = state.copyWith(
        currentIndex: state.currentIndex - 1,
        isFlipped: false,
      );
    }
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}

