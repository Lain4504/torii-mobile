
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

    if (response.success && response.data != null) {
      final data = response.data!;
      if (data.requiresTwoFactor) {
        // If 2FA is required, we usually get a temp token, not full access tokens yet.
        // But if the backend returns valid tokens immediately (rare), we save them.
        // Assuming standard flow: tempToken is used for next step.
        // We do NOT save access tokens yet if they are not verified.
        return (AuthResult.requires2FA, data, null);
      } else {
        // Login success
        if (data.accessToken != null && data.refreshToken != null) {
          await tokenStorage.saveTokens(data.accessToken!, data.refreshToken!);
          return (AuthResult.success, data, null);
        }
      }
    }
    return (AuthResult.failure, null, response.message ?? 'Login failed');
  }

  Future<bool> verify2FA(String tempToken, String code, {bool isBackupCode = false}) async {
    final response = await authService.verify2FA(
      tempToken: tempToken,
      code: code,
      backupCode: isBackupCode,
    );

    if (response.success && response.data != null) {
      final data = response.data!;
      if (data.accessToken != null && data.refreshToken != null) {
        await tokenStorage.saveTokens(data.accessToken!, data.refreshToken!);
        return true;
      }
    }
    return false;
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
      final newAccessToken = response.data!['accessToken'];
      final newRefreshToken = response.data!['refreshToken'] ?? refreshToken; // Sometimes refresh token rotates
      
      if (newAccessToken != null) {
        await tokenStorage.saveTokens(newAccessToken, newRefreshToken);
        return true;
      }
    }
    return false;
  }
}
