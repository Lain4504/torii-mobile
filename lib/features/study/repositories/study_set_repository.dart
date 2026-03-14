import 'package:dio/dio.dart';
import '../models/study_set_model.dart';

/// Study-set repository – gateway /api/academy/study-sets, study-sets/:id, set-cards/:id, study, review.
/// Response: { success, data: { item } } or { success, data: { items } }.
class StudySetRepository {
  final Dio _dio;
  static const String _base = '/api/academy';

  StudySetRepository(this._dio);

  static T _item<T>(dynamic body, T Function(Map<String, dynamic>) fromJson) {
    if (body is Map<String, dynamic> && body['data'] != null) {
      final d = body['data'];
      if (d is Map<String, dynamic> && d['item'] != null) {
        return fromJson(d['item'] as Map<String, dynamic>);
      }
      if (d is Map<String, dynamic>) return fromJson(d);
    }
    throw Exception('Unexpected response');
  }

  static List<StudySet> _items(dynamic body) {
    if (body is Map<String, dynamic> && body['data'] != null) {
      final d = body['data'];
      if (d is Map && d['items'] != null && d['items'] is List) {
        return (d['items'] as List).map((e) => StudySet.fromJson(e as Map<String, dynamic>)).toList();
      }
    }
    return [];
  }

  /// GET /api/academy/study-sets
  Future<List<StudySet>> findAll() async {
    final res = await _dio.get('$_base/study-sets');
    if (res.statusCode != 200) throw Exception('Failed to fetch study sets: ${res.statusCode}');
    final body = res.data;
    if (body is Map && body['data'] != null) {
      final d = body['data'];
      if (d is Map && d['items'] != null && d['items'] is List) {
        return (d['items'] as List).map((e) => StudySet.fromJson(e as Map<String, dynamic>)).toList();
      }
    }
    return [];
  }

  /// GET /api/academy/study-sets/:id
  Future<StudySet> findById(String id) async {
    final res = await _dio.get('$_base/study-sets/$id');
    if (res.statusCode != 200) throw Exception('Failed to fetch study set: ${res.statusCode}');
    return _item(res.data, StudySet.fromJson);
  }

  /// POST /api/academy/study-sets
  Future<StudySet> create({required String title, String? description}) async {
    final res = await _dio.post('$_base/study-sets', data: {
      'title': title,
      if (description != null) 'description': description,
    });
    if (res.statusCode != 200 && res.statusCode != 201) throw Exception('Failed to create: ${res.statusCode}');
    return _item(res.data, StudySet.fromJson);
  }

  /// PATCH /api/academy/study-sets/:id
  Future<void> update(String id, {String? title, String? description}) async {
    final data = <String, dynamic>{};
    if (title != null) data['title'] = title;
    if (description != null) data['description'] = description;
    final res = await _dio.patch('$_base/study-sets/$id', data: data);
    if (res.statusCode != 200) throw Exception('Failed to update: ${res.statusCode}');
  }

  /// DELETE /api/academy/study-sets/:id
  Future<void> delete(String id) async {
    final res = await _dio.delete('$_base/study-sets/$id');
    if (res.statusCode != 200) throw Exception('Failed to delete: ${res.statusCode}');
  }

  /// POST /api/academy/study-sets/:id/cards
  Future<StudyCard> createCard(String setId, {required String term, required String definition, String? hint}) async {
    final res = await _dio.post('$_base/study-sets/$setId/cards', data: {
      'term': term,
      'definition': definition,
      if (hint != null) 'hint': hint,
    });
    if (res.statusCode != 200 && res.statusCode != 201) throw Exception('Failed to create card: ${res.statusCode}');
    return _item(res.data, StudyCard.fromJson);
  }

  /// PATCH /api/academy/set-cards/:id
  Future<void> updateCard(String cardId, {String? term, String? definition, String? hint}) async {
    final data = <String, dynamic>{};
    if (term != null) data['term'] = term;
    if (definition != null) data['definition'] = definition;
    if (hint != null) data['hint'] = hint;
    final res = await _dio.patch('$_base/set-cards/$cardId', data: data);
    if (res.statusCode != 200) throw Exception('Failed to update card: ${res.statusCode}');
  }

  /// DELETE /api/academy/set-cards/:id
  Future<void> deleteCard(String cardId) async {
    final res = await _dio.delete('$_base/set-cards/$cardId');
    if (res.statusCode != 200) throw Exception('Failed to delete card: ${res.statusCode}');
  }

  /// GET /api/academy/study-sets/:id/study – cards due for review
  Future<List<StudyCard>> getStudyCards(String setId) async {
    final res = await _dio.get('$_base/study-sets/$setId/study');
    if (res.statusCode != 200) throw Exception('Failed to get study cards: ${res.statusCode}');
    final body = res.data;
    if (body is Map && body['data'] != null) {
      final d = body['data'];
      if (d is Map && d['items'] != null && d['items'] is List) {
        return (d['items'] as List).map((e) => StudyCard.fromJson(e as Map<String, dynamic>)).toList();
      }
    }
    return [];
  }

  /// POST /api/academy/set-cards/:id/review – body: { quality: 0|1 }
  Future<void> reviewCard(String cardId, {required int quality}) async {
    final res = await _dio.post('$_base/set-cards/$cardId/review', data: {'quality': quality});
    if (res.statusCode != 200) throw Exception('Failed to review: ${res.statusCode}');
  }
}
