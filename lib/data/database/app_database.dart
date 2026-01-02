import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'database_tables.dart';

part 'app_database.g.dart';

/// Main database class cho Torii app
@DriftDatabase(tables: [UserProfiles])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onUpgrade: (Migrator m, int from, int to) async {
        if (from < 2) {
          // Drop auth_sessions table as we moved to Secure Storage
          await customStatement('DROP TABLE IF EXISTS auth_sessions;');
        }
      },
    );
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
