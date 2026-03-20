
import 'package:torii_app/features/auth/repositories/token_storage.dart';
import 'package:torii_app/services/auth/auth_service.dart';
import 'package:torii_app/data/models/auth_model.dart';
import 'package:torii_app/core/models/api_response.dart';

enum AuthResult { success, requires2FA, failure }

class AuthRepository {
  final TokenStorage tokenStorage;
  final AuthService authService;

  AuthRepository(this.tokenStorage, this.authService);

  Future<(AuthResult, AuthData?, String?)> login(String email, String password) async {
    final response = await authService.login(email: email, password: password);
    return _handleAuthResponse(response);
  }

  Future<(AuthResult, AuthData?, String?)> googleLogin(String idToken) async {
    final response = await authService.googleLogin(idToken);
    return _handleAuthResponse(response);
  }

  Future<(AuthResult, AuthData?, String?)> facebookLogin(String accessToken) async {
    final response = await authService.facebookLogin(accessToken);
    return _handleAuthResponse(response);
  }

  Future<(AuthResult, AuthData?, String?)> _handleAuthResponse(ApiResponse<AuthData> response) async {
    if (response.success && response.data != null) {
      final data = response.data!;
      if (data.requiresTwoFactor) {
        return (AuthResult.requires2FA, data, null);
      } else {
        if (data.accessToken != null && data.refreshToken != null) {
          await tokenStorage.saveTokens(data.accessToken!, data.refreshToken!);
          return (AuthResult.success, data, null);
        }
      }
    }
    return (AuthResult.failure, null, response.message ?? 'Authentication failed');
  }

  Future<AuthData?> verify2FA(String tempToken, String code, {bool isBackupCode = false}) async {
    final response = await authService.verify2FA(
      tempToken: tempToken,
      code: code,
      backupCode: isBackupCode,
    );

    if (response.success && response.data != null) {
      final data = response.data!;
      if (data.accessToken != null && data.refreshToken != null) {
        await tokenStorage.saveTokens(data.accessToken!, data.refreshToken!);
        return data;
      }
    }
    return null;
  }

  Future<void> logout() async {
    final refreshToken = await tokenStorage.getRefreshToken();
    if (refreshToken != null) {
        try {
            await authService.logout(refreshToken);
        } catch (_) {
            // Ignore logout errors on server side (e.g. token already invalid)
        }
    }
    await tokenStorage.clear();
  }

  Future<bool> refreshToken() async {
    final refreshToken = await tokenStorage.getRefreshToken();
    if (refreshToken == null) return false;

    final response = await authService.refreshToken(refreshToken);
    if (response.success && response.data != null) {
      final data = response.data!;
      final newAccessToken = data['accessToken'] ?? data['access_token'];
      final newRefreshToken = data['refreshToken'] ?? data['refresh_token'] ?? refreshToken; // Sometimes refresh token rotates
      
      if (newAccessToken != null) {
        await tokenStorage.saveTokens(newAccessToken, newRefreshToken);
        return true;
      }
    }
    return false;
  }

  Future<ApiResponse<User>> updateProfile({
    String? displayName,
    Map<String, dynamic>? userMetadata,
  }) async {
    return await authService.updateProfile(
      displayName: displayName,
      userMetadata: userMetadata,
    );
  }

  Future<ApiResponse<void>> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    return await authService.changePassword(
      oldPassword: oldPassword,
      newPassword: newPassword,
    );
  }
}
