import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Service để quản lý secure storage cho authentication token
class SecureStorageService {
  SecureStorageService() : _storage = const FlutterSecureStorage();

  final FlutterSecureStorage _storage;
  static const String _tokenKey = 'auth_token';

  /// Lưu access token vào secure storage
  Future<void> saveToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
  }

  /// Lấy access token từ secure storage
  Future<String?> getToken() async {
    return await _storage.read(key: _tokenKey);
  }

  /// Xóa access token khỏi secure storage
  Future<void> deleteToken() async {
    await _storage.delete(key: _tokenKey);
  }
}
