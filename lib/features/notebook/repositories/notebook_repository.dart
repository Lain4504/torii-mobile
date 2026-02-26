import 'package:dio/dio.dart';
import '../models/notebook_model.dart';

class NotebookRepository {
  final Dio _dio;

  NotebookRepository({required Dio dio}) : _dio = dio;

  Future<List<Notebook>> getMyNotebooks() async {
    try {
      final response = await _dio.get('/api/notebooks/my-notebooks');
      final data = response.data;
      if (data is Map && data['success'] == true && data['data'] != null) {
        return (data['data'] as List).map((i) => Notebook.fromJson(i)).toList();
      } else if (data is List) {
        return data.map((i) => Notebook.fromJson(i)).toList();
      }
      return [];
    } catch (e) {
      throw Exception('Failed to fetch my notebooks: $e');
    }
  }

  Future<List<Notebook>> getPublicNotebooks() async {
    try {
      final response = await _dio.get('/api/notebooks/public');
      final data = response.data;
      if (data is Map && data['success'] == true && data['data'] != null) {
        return (data['data'] as List).map((i) => Notebook.fromJson(i)).toList();
      } else if (data is List) {
        return data.map((i) => Notebook.fromJson(i)).toList();
      }
      return [];
    } catch (e) {
      throw Exception('Failed to fetch public notebooks: $e');
    }
  }

  Future<Notebook> getNotebookById(String id) async {
    try {
      final response = await _dio.get('/api/notebooks/$id');
      final data = response.data;
      if (data is Map && data['success'] == true && data['data'] != null) {
        return Notebook.fromJson(data['data']);
      }
      return Notebook.fromJson(data);
    } catch (e) {
      throw Exception('Failed to load notebook: $e');
    }
  }

  Future<Notebook> createNotebook({
    required String name,
    String? description,
    bool isPublic = false,
  }) async {
    try {
      final response = await _dio.post('/api/notebooks', data: {
        'name': name,
        if (description != null) 'description': description,
        'isPublic': isPublic,
      });
      final data = response.data;
      if (data is Map && data['success'] == true && data['data'] != null) {
        return Notebook.fromJson(data['data']);
      }
      return Notebook.fromJson(data);
    } catch (e) {
      throw Exception('Failed to create notebook: $e');
    }
  }

  Future<Notebook> updateNotebook(String id, {
    String? name,
    String? description,
    bool? isPublic,
  }) async {
    try {
      final data = <String, dynamic>{};
      if (name != null) data['name'] = name;
      if (description != null) data['description'] = description;
      if (isPublic != null) data['isPublic'] = isPublic;

      final response = await _dio.patch('/api/notebooks/$id', data: data);
      final respData = response.data;
      if (respData is Map && respData['success'] == true && respData['data'] != null) {
        return Notebook.fromJson(respData['data']);
      }
      return Notebook.fromJson(respData);
    } catch (e) {
      throw Exception('Failed to update notebook: $e');
    }
  }

  Future<void> deleteNotebook(String id) async {
    try {
      await _dio.delete('/api/notebooks/$id');
    } catch (e) {
      throw Exception('Failed to delete notebook: $e');
    }
  }

  // --- Note Entries ---

  Future<NoteEntry> addEntry(String notebookId, {
    required String word,
    String? phonetic,
    required String meaning,
    String? note,
    String partOfSpeech = 'noun',
  }) async {
    try {
      final response = await _dio.post('/api/notebooks/$notebookId/entries', data: {
        'word': word,
        if (phonetic != null) 'phonetic': phonetic,
        'meaning': meaning,
        if (note != null) 'note': note,
        'partOfSpeech': partOfSpeech,
      });
      final data = response.data;
      if (data is Map && data['success'] == true && data['data'] != null) {
        return NoteEntry.fromJson(data['data']);
      }
      return NoteEntry.fromJson(data);
    } catch (e) {
      throw Exception('Failed to add word: $e');
    }
  }

  Future<NoteEntry> updateEntry(String notebookId, String entryId, {
    required String word,
    String? phonetic,
    required String meaning,
    String? note,
    String partOfSpeech = 'noun',
  }) async {
    try {
      final response = await _dio.patch('/api/notebooks/$notebookId/entries/$entryId', data: {
        'word': word,
        if (phonetic != null) 'phonetic': phonetic,
        'meaning': meaning,
        if (note != null) 'note': note,
        'partOfSpeech': partOfSpeech,
      });
      final data = response.data;
      if (data is Map && data['success'] == true && data['data'] != null) {
        return NoteEntry.fromJson(data['data']);
      }
      return NoteEntry.fromJson(data);
    } catch (e) {
      throw Exception('Failed to update word: $e');
    }
  }

  Future<void> deleteEntry(String notebookId, String entryId) async {
    try {
      await _dio.delete('/api/notebooks/$notebookId/entries/$entryId');
    } catch (e) {
      throw Exception('Failed to delete word: $e');
    }
  }
}
