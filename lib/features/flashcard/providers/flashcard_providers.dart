import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/features/auth/providers/auth_providers.dart';
import 'package:torii_app/features/flashcard/repositories/flashcard_repository.dart';
import 'package:torii_app/services/flashcard/flashcard_service.dart';
import '../models/flashcard_model.dart';
import 'flashcard_state.dart';

// --- DATA LAYER ---
final flashcardServiceProvider = Provider<FlashcardService>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return FlashcardService(apiClient);
});

final flashcardRepositoryProvider = Provider<FlashcardRepository>((ref) {
  final service = ref.watch(flashcardServiceProvider);
  return FlashcardRepository(service);
});

// --- FEATURES ---

// 1. Decks List Provider (AsyncNotifier - Persistent)
final flashcardDecksProvider = AsyncNotifierProvider<FlashcardDecksNotifier, List<FlashcardDeck>>(FlashcardDecksNotifier.new);

class FlashcardDecksNotifier extends AsyncNotifier<List<FlashcardDeck>> {
  @override
  FutureOr<List<FlashcardDeck>> build() {
     final repository = ref.watch(flashcardRepositoryProvider);
     return repository.getDecks();
  }

  Future<bool> deleteDeck(String id) async {
    final previous = state.valueOrNull ?? [];
    state = const AsyncValue.loading();
    try {
      await ref.read(flashcardRepositoryProvider).deleteDeck(id);
      final updated = previous.where((d) => d.id != id).toList();
      state = AsyncValue.data(updated);
      return true;
    } catch (e) {
      state = AsyncValue.data(previous); // Restore on error
      return false;
    }
  }

  void incrementCardCount(String deckId) {
    if (!state.hasValue) return;
    final decks = state.value!;
    final updated = decks.map((d) {
      if (d.id == deckId) {
        return d.copyWith(cardCount: (d.cardCount) + 1);
      }
      return d;
    }).toList();
    state = AsyncValue.data(updated);
  }

  void decrementCardCount(String deckId) {
    if (!state.hasValue) return;
    final decks = state.value!;
    final updated = decks.map((d) {
      if (d.id == deckId) {
        return d.copyWith(cardCount: (d.cardCount > 0 ? d.cardCount - 1 : 0));
      }
      return d;
    }).toList();
    state = AsyncValue.data(updated);
  }
}

// 2. Due Cards Provider (FutureProvider - AutoDispose)
final deckCardsProvider = FutureProvider.family.autoDispose<List<Flashcard>, String>((ref, deckId) async {
  final repository = ref.watch(flashcardRepositoryProvider);
  return repository.getCards(deckId);
});

// 3. Deck Content Provider (StateNotifier - Persistent)
// Uses StateNotifier to allow manual state mutation for optimistic updates.
// Kept alive to preserve state during navigation (e.g., when editing cards)
final deckContentProvider = StateNotifierProvider.family<DeckContentNotifier, AsyncValue<List<Flashcard>>, String>((ref, deckId) {
  return DeckContentNotifier(ref, deckId);
});

class DeckContentNotifier extends StateNotifier<AsyncValue<List<Flashcard>>> {
  final Ref ref;
  final String deckId;

  DeckContentNotifier(this.ref, this.deckId) : super(const AsyncValue.loading()) {
    _loadCards();
  }

  Future<void> _loadCards() async {
    try {
      final repository = ref.read(flashcardRepositoryProvider);
      final cards = await repository.getDeckCards(deckId);
      if (mounted) state = AsyncValue.data(cards);
    } catch (e, st) {
      if (mounted) state = AsyncValue.error(e, st);
    }
  }

  Future<bool> addCard(String front, String back, String? reading) async {
    final previous = state.valueOrNull ?? [];
    state = const AsyncValue.loading();
    try {
      final newCard = await ref.read(flashcardRepositoryProvider).addCard(deckId, front, back, reading);
      if (newCard != null) {
        if (mounted) state = AsyncValue.data([...previous, newCard]);
        return true;
      }
      if (mounted) state = AsyncValue.data(previous);
      return false;
    } catch (e, st) {
      if (mounted) state = AsyncValue<List<Flashcard>>.error(e, st).copyWithPrevious(AsyncValue.data(previous));
      return false;
    }
  }

  Future<bool> updateCard(String id, {String? front, String? back, String? reading, String? example}) async {
    final previous = state.valueOrNull ?? [];
    state = const AsyncValue.loading();
    try {
      final updatedCard = await ref.read(flashcardRepositoryProvider).updateCard(id, front: front, back: back, reading: reading, example: example);
      if (updatedCard != null) {
        if (mounted) {
           state = AsyncValue.data(previous.map((c) => c.id == id ? updatedCard : c).toList());
        }
        return true;
      }
      if (mounted) state = AsyncValue.data(previous);
      return false;
    } catch (e, st) {
       if (mounted) state = AsyncValue<List<Flashcard>>.error(e, st).copyWithPrevious(AsyncValue.data(previous));
       return false;
    }
  }

  Future<bool> deleteCard(String cardId) async {
    final previous = state.valueOrNull ?? [];
    // Optimistic Update: Remove from list immediately
    if (mounted) state = AsyncValue.data(previous.where((c) => c.id != cardId).toList());
    
    try {
      final success = await ref.read(flashcardRepositoryProvider).deleteCard(cardId);
      if (!success) {
         // Revert if failed
         if (mounted) state = AsyncValue.data(previous);
         return false;
      }
      return true;
    } catch (e, st) {
       // Revert on error
       if (mounted) state = AsyncValue<List<Flashcard>>.error(e, st).copyWithPrevious(AsyncValue.data(previous));
       return false;
    }
  }
}

// 4. Controller (Persistent AsyncNotifier)
// Keeps alive to manage deleting decks/cards without crashing on navigation/dispose
final flashcardControllerProvider = AsyncNotifierProvider<FlashcardController, void>(FlashcardController.new);

class FlashcardController extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() => null;

  FlashcardRepository get _repository => ref.read(flashcardRepositoryProvider);

  Future<bool> createDeck(String title, String description) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _repository.createDeck(title, description);
    });
    if (!state.hasError) {
       ref.invalidate(flashcardDecksProvider);
       return true;
    }
    return false;
  }

  Future<bool> addCard(String deckId, String front, String back, String? reading) async {
    // Delegates to the StateNotifier which handles state update
    final success = await ref.read(deckContentProvider(deckId).notifier).addCard(front, back, reading);
    if (success) {
      ref.read(flashcardDecksProvider.notifier).incrementCardCount(deckId);
    }
    return success;
  }

  Future<void> submitProgress(String cardId, int quality) async {
    try { await _repository.submitProgress(cardId, quality); } catch (_) {}
  }

  Future<bool> deleteDeck(String deckId) async {
    return ref.read(flashcardDecksProvider.notifier).deleteDeck(deckId);
  }

  Future<bool> deleteCard(String cardId, String deckId) async {
    final success = await ref.read(deckContentProvider(deckId).notifier).deleteCard(cardId);
    if (success) {
      ref.read(flashcardDecksProvider.notifier).decrementCardCount(deckId);
    }
    return success;
  }

  Future<bool> updateDeck(String id, String name, String description) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _repository.updateDeck(id, name: name, description: description);
    });
    if (!state.hasError) {
      ref.invalidate(flashcardDecksProvider);
      return true;
    }
    return false;
  }

  Future<bool> updateCard(String id, String deckId, {
    String? front, 
    String? back, 
    String? reading, 
    String? example
  }) async {
    return ref.read(deckContentProvider(deckId).notifier).updateCard(id, front: front, back: back, reading: reading, example: example);
  }
}

// Legacy Provider
final flashcardProvider = NotifierProvider<FlashcardNotifier, FlashcardState>(
  FlashcardNotifier.new,
);
