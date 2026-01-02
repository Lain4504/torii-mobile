import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Define data structure for session to maintain compatibility
class AuthSessionData {
  final String accessToken;
  final String refreshToken;
  final DateTime expiresAt;

  AuthSessionData({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresAt,
  });
}

/// Service để quản lý token sử dụng FlutterSecureStorage (Keychain/Keystore)
/// Thay thế hoàn toàn cho AppDatabase để đảm bảo bảo mật.
class TokenService {
  // Config secure storage
  final _storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock,
    ),
  );

  static const _keyAccessToken = 'access_token';
  static const _keyRefreshToken = 'refresh_token';
  static const _keyExpiresAt = 'expires_at';

  /// Lưu tokens vào Secure Storage
  /// [expiresIn] là số giây cho đến khi token hết hạn
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
    required int expiresIn,
  }) async {
    final expiresAt = DateTime.now().add(Duration(seconds: expiresIn));

    await _storage.write(key: _keyAccessToken, value: accessToken);
    await _storage.write(key: _keyRefreshToken, value: refreshToken);
    await _storage.write(key: _keyExpiresAt, value: expiresAt.toIso8601String());
  }

  /// Get Access Token
  /// Returns null if not found or expired
  Future<String?> getAccessToken() async {
    final token = await _storage.read(key: _keyAccessToken);
    final expiresAtStr = await _storage.read(key: _keyExpiresAt);

    if (token == null || expiresAtStr == null) {
      return null;
    }

    // Check expiry
    final expiresAt = DateTime.parse(expiresAtStr);
    if (isTokenExpired(expiresAt)) {
      return null;
    }

    return token;
  }

  /// Lấy refresh token (raw string)
  Future<String?> getRefreshToken() async {
    return await _storage.read(key: _keyRefreshToken);
  }

  /// Kiểm tra token có hết hạn chưa (với buffer 30s)
  bool isTokenExpired(DateTime expiresAt) {
    final now = DateTime.now();
    final buffer = const Duration(seconds: 30);
    return now.isAfter(expiresAt.subtract(buffer));
  }

  /// Kiểm tra có session không (dựa trên Access Token valid)
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

    await _storage.write(key: _keyAccessToken, value: accessToken);
    await _storage.write(key: _keyExpiresAt, value: expiresAt.toIso8601String());
  }

  /// Xóa toàn bộ tokens (Logout)
  Future<void> clearTokens() async {
    await _storage.deleteAll();
  }

  /// Lấy session thô (không check expiry) - Dùng cho Optimistic Auth
  Future<AuthSessionData?> getRawSession() async {
    final accessToken = await _storage.read(key: _keyAccessToken);
    final refreshToken = await _storage.read(key: _keyRefreshToken);
    final expiresAtStr = await _storage.read(key: _keyExpiresAt);

    if (accessToken == null || refreshToken == null || expiresAtStr == null) {
      return null;
    }

    return AuthSessionData(
      accessToken: accessToken,
      refreshToken: refreshToken,
      expiresAt: DateTime.parse(expiresAtStr),
    );
  }

  /// Lấy thời gian hết hạn
  Future<DateTime?> getTokenExpiry() async {
    final expiresAtStr = await _storage.read(key: _keyExpiresAt);
    if (expiresAtStr == null) return null;
    return DateTime.parse(expiresAtStr);
  }
}
