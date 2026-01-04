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
  int get schemaVersion => 4;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onUpgrade: (Migrator m, int from, int to) async {
        if (from < 2) {
          await customStatement('DROP TABLE IF EXISTS auth_sessions;');
        }
        if (from < 3) {
          await m.addColumn(userProfiles, userProfiles.status);
        }
        if (from < 4) {
          // Migrate from fullName to displayName, remove emailVerified
          await customStatement(
            'CREATE TABLE IF NOT EXISTS user_profiles_new ('
            'id TEXT NOT NULL PRIMARY KEY, '
            'email TEXT NOT NULL, '
            'display_name TEXT NOT NULL, '
            'avatar TEXT, '
            'role TEXT NOT NULL DEFAULT \'learner\', '
            'status TEXT NOT NULL DEFAULT \'active\', '
            'created_at INTEGER NOT NULL, '
            'updated_at INTEGER NOT NULL'
            ');'
          );
          await customStatement(
            'INSERT INTO user_profiles_new (id, email, display_name, avatar, role, status, created_at, updated_at) '
            'SELECT id, email, full_name, avatar, role, status, created_at, updated_at FROM user_profiles;'
          );
          await customStatement('DROP TABLE user_profiles;');
          await customStatement('ALTER TABLE user_profiles_new RENAME TO user_profiles;');
        }
      },
    );
  }

  /// User Profile DAO methods

  // Lưu hoặc update user profile
  Future<void> saveUserProfile({
    required String id,
    required String email,
    required String displayName,
    String? avatar,
    String? role,
    String? status,
  }) async {
    await into(userProfiles).insertOnConflictUpdate(
      UserProfilesCompanion.insert(
        id: id,
        email: email,
        displayName: displayName,
        avatar: Value(avatar),
        role: Value(role ?? 'learner'),
        status: Value(status ?? 'active'),
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
