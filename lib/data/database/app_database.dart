import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import '../models/study_set_models.dart';

/// Kiểu dữ liệu nội bộ lưu trong local storage.
class UserProfileEntity {
  UserProfileEntity({
    required this.id,
    required this.email,
    required this.displayName,
    this.isOnboarded = false,
    this.avatar,
    this.role,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  final String id;
  final String email;
  final String displayName;
  final bool isOnboarded;
  final String? avatar;
  final String? role;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'displayName': displayName,
        'isOnboarded': isOnboarded,
        'avatar': avatar,
        'role': role,
        'status': status,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
      };

  factory UserProfileEntity.fromJson(Map<String, dynamic> json) {
    DateTime? parseDate(String? value) {
      if (value == null) return null;
      try {
        return DateTime.parse(value);
      } catch (_) {
        return null;
      }
    }

    return UserProfileEntity(
      id: json['id'] as String,
      email: json['email'] as String,
      displayName: json['displayName'] as String,
      isOnboarded: json['isOnboarded'] ?? false,
      avatar: json['avatar'] as String?,
      role: json['role'] as String?,
      status: json['status'] as String?,
      createdAt: parseDate(json['createdAt'] as String?),
      updatedAt: parseDate(json['updatedAt'] as String?),
    );
  }
}

/// Đơn giản hoá AppDatabase cho bản rebuild:
/// chỉ quản lý profile người dùng bằng SharedPreferences,
/// tránh phụ thuộc Drift / codegen để đảm bảo build nhanh chóng.
class AppDatabase {
  static const String _userProfileKey = 'user_profile';

  Future<SharedPreferences> get _prefs async =>
      SharedPreferences.getInstance();

  /// Lưu profile xuống local storage.
  Future<void> saveUserProfile({
    required String id,
    required String email,
    required String displayName,
    required bool isOnboarded,
    String? avatar,
    String? role,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) async {
    final prefs = await _prefs;

    final now = DateTime.now();
    final entity = UserProfileEntity(
      id: id,
      email: email,
      displayName: displayName,
      isOnboarded: isOnboarded,
      avatar: avatar,
      role: role,
      status: status,
      createdAt: createdAt ?? now,
      updatedAt: updatedAt ?? now,
    );

    await prefs.setString(_userProfileKey, jsonEncode(entity.toJson()));
  }

  /// Lấy profile từ local storage, nếu có.
  Future<UserProfileEntity?> getUserProfile() async {
    final prefs = await _prefs;
    final raw = prefs.getString(_userProfileKey);
    if (raw == null) return null;
    try {
      final map = jsonDecode(raw) as Map<String, dynamic>;
      return UserProfileEntity.fromJson(map);
    } catch (_) {
      return null;
    }
  }

  /// Xoá profile (được dùng khi logout).
  Future<void> clearUserProfile() async {
    final prefs = await _prefs;
    await prefs.remove(_userProfileKey);
  }

  // ---------- Offline Caching for Study Sets ----------
  
  static const String _studySetsKey = 'cached_study_sets';
  static const String _studyCardsPrefix = 'cached_cards_';
  static const String _studyDetailPrefix = 'cached_detail_';

  Future<void> saveStudySets(List<StudySetModel> sets) async {
    final prefs = await _prefs;
    final data = jsonEncode(sets.map((e) => e.toJson()).toList());
    await prefs.setString(_studySetsKey, data);
  }

  Future<List<StudySetModel>?> getStudySets() async {
    final prefs = await _prefs;
    final data = prefs.getString(_studySetsKey);
    if (data == null) return null;
    try {
      final list = jsonDecode(data) as List;
      return list.map((e) => StudySetModel.fromJson(Map<String, dynamic>.from(e))).toList();
    } catch (_) {
      return null;
    }
  }

  Future<void> saveStudyCards(String setId, List<SetCardModel> cards) async {
    final prefs = await _prefs;
    final data = jsonEncode(cards.map((e) => e.toJson()).toList());
    await prefs.setString('${_studyCardsPrefix}$setId', data);
  }

  Future<List<SetCardModel>?> getStudyCards(String setId) async {
    final prefs = await _prefs;
    final data = prefs.getString('${_studyCardsPrefix}$setId');
    if (data == null) return null;
    try {
      final list = jsonDecode(data) as List;
      return list.map((e) => SetCardModel.fromJson(Map<String, dynamic>.from(e))).toList();
    } catch (_) {
      return null;
    }
  }

  Future<void> saveStudySetDetail(String setId, Map<String, dynamic> detail) async {
    final prefs = await _prefs;
    await prefs.setString('${_studyDetailPrefix}$setId', jsonEncode(detail));
  }

  Future<Map<String, dynamic>?> getStudySetDetail(String setId) async {
    final prefs = await _prefs;
    final data = prefs.getString('${_studyDetailPrefix}$setId');
    if (data == null) return null;
    try {
      return jsonDecode(data) as Map<String, dynamic>;
    } catch (_) {
      return null;
    }
  }

  Future<void> clearStudySetCache() async {
    final prefs = await _prefs;
    final keys = prefs.getKeys().where((k) => 
        k == _studySetsKey || 
        k.startsWith(_studyCardsPrefix) || 
        k.startsWith(_studyDetailPrefix)
    ).toList();
    for (final k in keys) await prefs.remove(k);
  }
}


