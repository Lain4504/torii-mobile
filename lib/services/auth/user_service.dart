import '../../data/database/app_database.dart';
import '../../data/models/auth_model.dart';

/// Service for managing user profile with Drift database - Cleaned New Rebuild
class UserService {
  UserService(this._database);

  final AppDatabase _database;

  /// Save user profile to database
  Future<void> saveUserProfile(User user) async {
    await _database.saveUserProfile(
      id: user.id,
      email: user.email,
      displayName: user.displayName,
      avatar: user.avatarUrl,
      role: user.role,
      status: user.status,
    );
  }

  /// Get user profile from database
  Future<User?> getUserProfile() async {
    final profile = await _database.getUserProfile();
    
    if (profile == null) {
      return null;
    }

    return User(
      id: profile.id,
      email: profile.email,
      displayName: profile.displayName,
      avatarUrl: profile.avatar,
      role: profile.role ?? '',
      status: profile.status ?? '',
      createdAt: profile.createdAt,
      updatedAt: profile.updatedAt,
    );
  }

  /// Clear user profile (logout)
  Future<void> clearUserProfile() async {
    await _database.clearUserProfile();
  }

  /// Check if user profile exists
  Future<bool> hasUserProfile() async {
    final profile = await getUserProfile();
    return profile != null;
  }

  /// Update user profile
  Future<void> updateUserProfile(User user) async {
    await saveUserProfile(user);
  }
}
