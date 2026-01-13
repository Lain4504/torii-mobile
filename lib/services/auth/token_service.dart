import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthSessionData {
  final String accessToken;
  final String refreshToken;

  AuthSessionData({required this.accessToken, required this.refreshToken});
}

class TokenService {
  final _storage = const FlutterSecureStorage();

  static const String _accessTokenKey = 'accessToken';
  static const String _refreshTokenKey = 'refreshToken';

  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await _storage.write(key: _accessTokenKey, value: accessToken);
    await _storage.write(key: _refreshTokenKey, value: refreshToken);
  }

  Future<String?> getAccessToken() async {
    return await _storage.read(key: _accessTokenKey);
  }

  Future<String?> getRefreshToken() async {
    return await _storage.read(key: _refreshTokenKey);
  }

  Future<AuthSessionData?> getRawSession() async {
    final accessToken = await getAccessToken();
    final refreshToken = await getRefreshToken();
    if (accessToken != null && refreshToken != null) {
      return AuthSessionData(accessToken: accessToken, refreshToken: refreshToken);
    }
    return null;
  }

  Future<void> clearTokens() async {
    await _storage.delete(key: _accessTokenKey);
    await _storage.delete(key: _refreshTokenKey);
  }

  Future<bool> hasValidSession() async {
    final token = await getAccessToken();
    return token != null && token.isNotEmpty;
  }
}
