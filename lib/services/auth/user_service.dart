import '../../data/database/app_database.dart';
import '../../data/models/auth_model.dart';

/// Service để quản lý user profile với Drift database
class UserService {
  UserService(this._database);

  final AppDatabase _database;

  /// Lưu user profile vào database
  Future<void> saveUserProfile(User user) async {
    await _database.saveUserProfile(
      id: user.id,
      email: user.email,
      fullName: user.fullName,
      avatar: user.avatar,
      role: user.role,
    );
  }

  /// Lấy user profile từ database
  Future<User?> getUserProfile() async {
    final profile = await _database.getUserProfile();
    
    if (profile == null) {
      return null;
    }

    return User(
      id: profile.id,
      email: profile.email,
      fullName: profile.fullName,
      avatar: profile.avatar,
      role: profile.role,
    );
  }

  /// Xóa user profile (logout)
  Future<void> clearUserProfile() async {
    await _database.clearUserProfile();
  }

  /// Kiểm tra có user profile không
  Future<bool> hasUserProfile() async {
    final profile = await getUserProfile();
    return profile != null;
  }

  /// Update user profile
  Future<void> updateUserProfile(User user) async {
    await saveUserProfile(user);
  }
}
