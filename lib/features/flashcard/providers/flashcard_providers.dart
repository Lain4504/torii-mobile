import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'flashcard_state.dart';

/// Provider for flashcard state
final flashcardProvider = NotifierProvider<FlashcardNotifier, FlashcardState>(
  FlashcardNotifier.new,
);

// TODO: Add more flashcard-related providers
// Example:
// final flashcardDecksProvider = FutureProvider<List<FlashcardDeck>>((ref) async {
//   return await flashcardRepository.getDecks();
// });
