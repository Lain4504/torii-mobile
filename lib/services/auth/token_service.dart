import '../../data/database/app_database.dart';

/// Service để quản lý token (access token, refresh token) với Drift database
class TokenService {
  TokenService(this._database);

  final AppDatabase _database;

  /// Lưu tokens vào database
  /// [expiresIn] là số giây cho đến khi token hết hạn (ví dụ: 900 = 15 phút)
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
    required int expiresIn,
  }) async {
    final expiresAt = DateTime.now().add(Duration(seconds: expiresIn));

    await _database.saveAuthSession(
      accessToken: accessToken,
      refreshToken: refreshToken,
      expiresAt: expiresAt,
    );
  }

  /// Lấy Firebase ID token (access token)
  /// Trả về null nếu không có user hoặc token
  /// Firebase tự động refresh token nếu cần
  Future<String?> getAccessToken() async {
    // Firebase ID token will be retrieved from FirebaseAuth in auth_providers
    // This method now just retrieves the cached token
    final session = await _database.getAuthSession();
    
    if (session == null) {
      return null;
    }

    // Note: Firebase tokens có validity 1 hour, nhưng SDK tự refresh
    // Kiểm tra expiry để biết khi nào cần force refresh từ Firebase
    if (isTokenExpired(session.expiresAt)) {
      return null;
    }

    return session.accessToken;
  }

  /// Lấy refresh token từ database
  Future<String?> getRefreshToken() async {
    final session = await _database.getAuthSession();
    return session?.refreshToken;
  }

  /// Kiểm tra token có hết hạn chưa
  /// Thêm buffer 30 giây để tránh token hết hạn ngay khi đang gửi request
  bool isTokenExpired(DateTime expiresAt) {
    final now = DateTime.now();
    final buffer = const Duration(seconds: 30);
    return now.isAfter(expiresAt.subtract(buffer));
  }

  /// Kiểm tra có session không
  Future<bool> hasValidSession() async {
    final token = await getAccessToken();
    return token != null;
  }

  /// Update access token sau khi refresh
  Future<void> updateAccessToken({
    required String accessToken,
    required int expiresIn,
  }) async {
    final expiresAt = DateTime.now().add(Duration(seconds: expiresIn));

    await _database.updateAccessToken(
      accessToken: accessToken,
      expiresAt: expiresAt,
    );
  }

  /// Xóa toàn bộ tokens (logout)
  Future<void> clearTokens() async {
    await _database.clearAuthSession();
  }

  /// Lấy thời gian hết hạn của token
  Future<DateTime?> getTokenExpiry() async {
    final session = await _database.getAuthSession();
    return session?.expiresAt;
  }
}
