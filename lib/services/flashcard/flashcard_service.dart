import 'package:dio/dio.dart';
import '../../data/api/api_client.dart';
import '../../features/flashcard/models/flashcard_model.dart';
import '../../core/models/api_response.dart';

class FlashcardService {
  final ApiClient _apiClient;

  FlashcardService(this._apiClient);

  /// 2. Get All Decks
  /// GET /api/flashcard-decks
  Future<ApiResponse<List<FlashcardDeck>>> getDecks() async {
    try {
      final response = await _apiClient.client.get('/api/flashcard-decks');
      return ApiResponse.fromJson(
        response.data,
        (json) => (json as List).map((e) => FlashcardDeck.fromJson(e)).toList(),
      );
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  /// 1. Create Deck
  /// POST /api/flashcard-decks
  Future<ApiResponse<FlashcardDeck>> createDeck({
    required String title,
    required String description,
  }) async {
    try {
      final response = await _apiClient.client.post(
        '/api/flashcard-decks',
        data: {
          'name': title,
          'description': description,
          'jlptLevel': 'N5', // Default level or expose optional param
          'isPublic': false,
          'tags': [], // Could add tags
        },
      );
      // Response wraps deck in data.deck object
      // But ApiResponse structure typically handles 'data'. 
      // Docs: { success: true, data: { deck: {...} } }
      // ApiResponse.fromJson extracts 'data'. So 'json' passed to parser is { deck: ... }
      return ApiResponse.fromJson(
        response.data, 
        (json) => FlashcardDeck.fromJson(json['deck']),
      );
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  /// 1. Create Flashcard
  /// POST /api/flashcards
  Future<ApiResponse<Flashcard>> addCard(String deckId, {
    required String front,
    required String back,
    String? reading,
    String? example,
  }) async {
    try {
      final response = await _apiClient.client.post(
        '/api/flashcards',
        data: {
          'deckId': deckId,
          'frontText': front,
          'backText': back,
          'pronunciation': reading,
          'exampleSentence': example,
          'wordJlptLevel': 'N5', // Default
          'difficulty': 1, // Default Easy/Medium
        },
      );
      // Response keys: { success, data: { flashcard: {...} } }
      return ApiResponse.fromJson(
        response.data, 
        (json) => Flashcard.fromJson(json['flashcard']),
      );
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  /// 3.1 Get Due Cards for Review
  /// GET /api/flashcards/reviews/due
  Future<ApiResponse<List<Flashcard>>> getCards(String deckId) async {
    try {
      final response = await _apiClient.client.get(
        '/api/flashcards/reviews/due',
        queryParameters: {
          'deckId': deckId,
          // 'limit': 20, // Backend Bug: prisma expects Int but receives String via query. Default limit is fine.
          'includeNew': 'true',
        },
      );
      
      // Response: { data: { flashcards: [ { flashcard: {...}, userProgress: {...}, isDue: true } ] } }
      // ApiResponse extracts 'data'. 'json' is { flashcards: [...] }
      
      return ApiResponse.fromJson(response.data, (json) {
        final list = json['flashcards'] as List;
        return list.map((item) {
          // item['flashcard'] holds the card data
          return Flashcard.fromJson(item['flashcard']);
        }).toList();
      });
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  /// 3.3 Get All Cards in Deck (Management View)
  /// GET /api/flashcards?deckId=...
  Future<ApiResponse<List<Flashcard>>> getDeckCards(String deckId) async {
    try {
      final response = await _apiClient.client.get(
        '/api/flashcards',
        queryParameters: {
           'deckId': deckId,
           // Removed page/limit - backend has issues parsing query params as integers
        },
      );
      
      // Response: { data: { flashcards: [ ... ] }, meta: ... }
      // Or matches standard ApiResponse structure?
      // Spec 1.3: { data: { flashcards: [ ... ], pagination: ... } }
      // So json['flashcards'] is the list.
      
      return ApiResponse.fromJson(response.data, (json) {
        if (json is List) {
           return json.map((item) => Flashcard.fromJson(item)).toList();
        }
        if (json is Map && json['flashcards'] != null) {
           final list = json['flashcards'] as List;
           return list.map((item) => Flashcard.fromJson(item)).toList();
        }
        return <Flashcard>[];
      });
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  /// 3.2 Submit Review Result
  /// POST /api/flashcards/reviews/submit
  Future<ApiResponse<void>> submitProgress(String cardId, int quality) async {
    // Map numerical quality (0-5) to Spec enums
    // ZERO, ONE, TWO, THREE, FOUR
    String rating = 'TWO';
    if (quality <= 1) {
      rating = 'ZERO'; // Again
    } else if (quality == 3) {
      rating = 'ONE'; // Hard? Or 3 is Hard in 1-4 scale? 
                      // Spec: ONE=Hard. THREE=Easy.
                      // UI: 1=Again, 3=Hard, 4=Good, 5=Easy
                      
      // Let's remap logic to standard SM-2 inputs usually used in UI
      // 1 (Fail) -> ZERO
      // 2 (Hard) -> ONE
      // 3 (Good) -> TWO
      // 4 (Easy) -> THREE
      
      // My UI Swipe:
      // Left (Again) -> 1
      // Bottom (Hard) -> 3
      // Right (Good) -> 4
      // Top (Easy) -> 5
       
      rating = 'ONE';
    } else if (quality == 4) {
      rating = 'TWO'; // Good
    } else if (quality >= 5) {
      rating = 'THREE'; // Easy
    }

    try {
      final response = await _apiClient.client.post(
        '/api/flashcards/reviews/submit',
        data: {
          'flashcardId': cardId,
          'quality': rating,
          'timeSpent': 2000, 
        },
      );
      return ApiResponse.fromJson(response.data, (_) {});
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  /// 4. Delete Deck
  /// DELETE /api/flashcard-decks/:id
  Future<ApiResponse<void>> deleteDeck(String deckId) async {
    try {
      final response = await _apiClient.client.delete('/api/flashcard-decks/$deckId');
      return ApiResponse.fromJson(response.data, (_) {});
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  /// 5. Delete Card
  /// DELETE /api/flashcards/:id
  Future<ApiResponse<void>> deleteCard(String cardId) async {
    try {
      final response = await _apiClient.client.delete('/api/flashcards/$cardId');
      return ApiResponse.fromJson(response.data, (_) {});
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  /// 7. Update Card
  /// PATCH /api/flashcards (id in body, not URL)
  Future<ApiResponse<Flashcard>> updateCard(String id, {
    String? front,
    String? back,
    String? reading,
    String? example,
  }) async {
    try {
      final response = await _apiClient.client.patch(
        '/api/flashcards',
        data: {
          'id': id,
          if (front != null) 'frontText': front,
          if (back != null) 'backText': back,
          if (reading != null) 'pronunciation': reading,
          if (example != null) 'exampleSentence': example,
        },
      );
      return ApiResponse.fromJson(
         response.data, 
         (json) => Flashcard.fromJson(json['flashcard']),
      );
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  /// 6. Update Deck
  /// PATCH /api/flashcard-decks/:id
  Future<ApiResponse<FlashcardDeck>> updateDeck(String id, {
    String? name,
    String? description,
    String? emoji,
  }) async {
    try {
      final response = await _apiClient.client.patch(
        '/api/flashcard-decks/$id',
        data: {
          if (name != null) 'name': name,
          if (description != null) 'description': description,
          if (emoji != null) 'icon': emoji,
        },
      );
      return ApiResponse.fromJson(
        response.data, 
        (json) => FlashcardDeck.fromJson(json['deck']),
      );
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  ApiResponse<T> _handleError<T>(DioException e) {
    if (e.response?.data != null && e.response?.data is Map) {
      try {
        return ApiResponse.fromJson(e.response!.data, (_) => null as T);
      } catch (_) {
        // Fallback
      }
    }
    return ApiResponse(
      success: false, 
      message: e.message ?? 'Unknown error occurred',
    );
  }
}
