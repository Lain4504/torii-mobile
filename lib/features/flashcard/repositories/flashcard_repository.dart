import 'package:torii_app/services/flashcard/flashcard_service.dart';
import 'package:torii_app/features/flashcard/models/flashcard_model.dart';

class FlashcardRepository {
  final FlashcardService _service;

  FlashcardRepository(this._service);

  Future<List<FlashcardDeck>> getDecks() async {
    final response = await _service.getDecks();
    if (response.success && response.data != null) {
      return response.data!;
    }
    // Return empty list or throw error depending on app policy
    // For now, empty list
    return [];
  }

  Future<FlashcardDeck?> createDeck(String title, String description) async {
    final response = await _service.createDeck(
      title: title, 
      description: description,
    );
    return response.data;
  }

  Future<Flashcard?> addCard(String deckId, String front, String back, String? reading) async {
    final response = await _service.addCard(
      deckId, 
      front: front, 
      back: back, 
      reading: reading
    );
    return response.data;
  }

  Future<List<Flashcard>> getCards(String deckId) async {
    final response = await _service.getCards(deckId);
    if (response.success && response.data != null) {
      return response.data!;
    }
    return [];
  }

  Future<List<Flashcard>> getDeckCards(String deckId) async {
    final response = await _service.getDeckCards(deckId);
    if (response.success && response.data != null) {
      return response.data!;
    }
    return [];
  }

  Future<bool> submitProgress(String cardId, int quality) async {
    final response = await _service.submitProgress(cardId, quality);
    return response.success;
  }

  Future<bool> deleteDeck(String deckId) async {
    final response = await _service.deleteDeck(deckId);
    return response.success;
  }

  Future<bool> deleteCard(String cardId) async {
    final response = await _service.deleteCard(cardId);
    return response.success;
  }

  Future<FlashcardDeck?> updateDeck(String id, {String? name, String? description}) async {
    final response = await _service.updateDeck(id, name: name, description: description);
    return response.data;
  }

  Future<Flashcard?> updateCard(String id, {String? front, String? back, String? reading, String? example}) async {
    final response = await _service.updateCard(id, front: front, back: back, reading: reading, example: example);
    return response.data;
  }
}
