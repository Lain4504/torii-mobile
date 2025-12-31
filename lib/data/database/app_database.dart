import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'database_tables.dart';

part 'app_database.g.dart';

/// Main database class cho Torii app
@DriftDatabase(tables: [AuthSessions, UserProfiles])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  /// Auth Session DAO methods
  
  // Lưu hoặc update auth session
  Future<void> saveAuthSession({
    required String accessToken,
    required String refreshToken,
    required DateTime expiresAt,
  }) async {
    // Xóa session cũ (chỉ có 1 session active)
    await delete(authSessions).go();

    // Insert session mới
    await into(authSessions).insert(
      AuthSessionsCompanion.insert(
        accessToken: accessToken,
        refreshToken: refreshToken,
        expiresAt: expiresAt,
      ),
    );
  }

  // Lấy auth session hiện tại
  Future<AuthSessionData?> getAuthSession() async {
    return await (select(authSessions)..limit(1)).getSingleOrNull();
  }

  // Xóa auth session (logout)
  Future<void> clearAuthSession() async {
    await delete(authSessions).go();
  }

  // Update access token (sau khi refresh)
  Future<void> updateAccessToken({
    required String accessToken,
    required DateTime expiresAt,
  }) async {
    final session = await getAuthSession();
    if (session != null) {
      await (update(authSessions)..where((t) => t.id.equals(session.id))).write(
        AuthSessionsCompanion(
          accessToken: Value(accessToken),
          expiresAt: Value(expiresAt),
          updatedAt: Value(DateTime.now()),
        ),
      );
    }
  }

  /// User Profile DAO methods

  // Lưu hoặc update user profile
  Future<void> saveUserProfile({
    required String id,
    required String email,
    required String fullName,
    String? avatar,
    String? role,
  }) async {
    await into(userProfiles).insertOnConflictUpdate(
      UserProfilesCompanion.insert(
        id: id,
        email: email,
        fullName: fullName,
        avatar: Value(avatar),
        role: Value(role ?? 'learner'),
      ),
    );
  }

  // Lấy user profile
  Future<UserProfileData?> getUserProfile() async {
    return await (select(userProfiles)..limit(1)).getSingleOrNull();
  }

  // Xóa user profile (logout)
  Future<void> clearUserProfile() async {
    await delete(userProfiles).go();
  }

  // Clear toàn bộ data (logout)
  Future<void> clearAllAuthData() async {
    await clearAuthSession();
    await clearUserProfile();
  }
}

/// Helper để mở connection đến SQLite database
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'torii_app.db'));
    return NativeDatabase(file);
  });
}
