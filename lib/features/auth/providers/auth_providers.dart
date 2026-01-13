import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/services/auth/auth_service.dart';
import 'package:torii_app/services/auth/token_service.dart';
import 'package:torii_app/services/auth/user_service.dart';
import 'package:torii_app/data/models/auth_model.dart';
import 'package:torii_app/data/api/api_client.dart';
import 'package:torii_app/data/database/app_database.dart';
import 'package:torii_app/features/auth/models/auth_state_sealed.dart';

final databaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});

final tokenServiceProvider = Provider<TokenService>((ref) {
  return TokenService();
});

final userServiceProvider = Provider<UserService>((ref) {
  final database = ref.watch(databaseProvider);
  return UserService(database);
});

final apiClientProvider = Provider<ApiClient>((ref) {
  final tokenService = ref.watch(tokenServiceProvider);
  return ApiClient(tokenService: tokenService);
});

final authServiceProvider = Provider<AuthService>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return AuthService(apiClient);
});

final initialAuthStateProvider = Provider<AuthState>((ref) {
  return AuthInitial();
});

final authStateProvider = NotifierProvider<AuthStateNotifier, AuthState>(
  AuthStateNotifier.new,
);

class AuthStateNotifier extends Notifier<AuthState> {
  @override
  AuthState build() {
    return ref.read(initialAuthStateProvider);
  }

  AuthService get _authService => ref.read(authServiceProvider);
  TokenService get _tokenService => ref.read(tokenServiceProvider);
  UserService get _userService => ref.read(userServiceProvider);

  Future<void> initializeAuth() async {
    state = AuthLoading();
    try {
      final hasSession = await _tokenService.hasValidSession();
      if (hasSession) {
        final profileResponse = await _authService.getMe();
        if (profileResponse.success && profileResponse.data != null) {
          final user = profileResponse.data!;
          final accessToken = await _tokenService.getAccessToken();
          await _userService.saveUserProfile(user);
          state = AuthAuthenticated(user: user, accessToken: accessToken!);
        } else {
          // Try local fallback
          final localUser = await _userService.getUserProfile();
          if (localUser != null) {
            final accessToken = await _tokenService.getAccessToken();
            state = AuthAuthenticated(user: localUser, accessToken: accessToken!);
          } else {
            state = AuthUnauthenticated();
          }
        }
      } else {
        state = AuthUnauthenticated();
      }
    } catch (e) {
      debugPrint('Auth initialization error: $e');
      state = AuthUnauthenticated();
    }
  }

  Future<void> login(String email, String password) async {
    state = AuthLoading();
    try {
      final response = await _authService.login(email: email, password: password);
      if (response.success && response.data != null) {
        final data = response.data!;
        if (data.requiresTwoFactor) {
          state = AuthTwoFactorRequired(
            tempToken: data.tempToken!,
            method: data.twoFactorMethod ?? 'totp',
            message: response.message ?? 'Enter code from your authenticator app',
          );
        } else {
          await _tokenService.saveTokens(
            accessToken: data.accessToken!,
            refreshToken: data.refreshToken!,
          );
          await _userService.saveUserProfile(data.user);
          state = AuthAuthenticated(user: data.user, accessToken: data.accessToken!);
        }
      } else {
        state = AuthError(message: response.message ?? 'Login failed');
      }
    } catch (e) {
      state = AuthError(message: e.toString());
    }
  }

  Future<void> verify2FA(String tempToken, String code, {bool isBackupCode = false}) async {
    state = AuthLoading();
    try {
      final response = await _authService.verify2FA(
        tempToken: tempToken,
        code: code,
        backupCode: isBackupCode,
      );
      if (response.success && response.data != null) {
        final data = response.data!;
        await _tokenService.saveTokens(
          accessToken: data.accessToken!,
          refreshToken: data.refreshToken!,
        );
        await _userService.saveUserProfile(data.user);
        state = AuthAuthenticated(user: data.user, accessToken: data.accessToken!);
      } else {
        state = AuthError(message: response.message ?? 'Invalid or expired verification code');
      }
    } catch (e) {
      state = AuthError(message: e.toString());
    }
  }

  Future<void> register(String email, String password, String displayName) async {
    state = AuthLoading();
    try {
      final response = await _authService.register(
        email: email,
        password: password,
        displayName: displayName,
      );
      if (response.success) {
        state = AuthUnauthenticated(message: response.message);
      } else {
        state = AuthError(message: response.message ?? 'Registration failed');
      }
    } catch (e) {
      state = AuthError(message: e.toString());
    }
  }

  Future<void> forgotPassword(String email) async {
    state = AuthLoading();
    try {
      final response = await _authService.forgotPassword(email);
      if (response.success) {
        state = AuthVerifyOTPRequired(email: email, message: response.message ?? 'OTP sent to your email');
      } else {
        state = AuthError(message: response.message ?? 'Failed to send OTP');
      }
    } catch (e) {
      state = AuthError(message: e.toString());
    }
  }

  Future<void> verifyOTP(String email, String code) async {
    state = AuthLoading();
    try {
      final response = await _authService.verifyOTP(email, code);
      if (response.success && response.data != null) {
        final tempToken = response.data!['tempToken'];
        state = AuthResetPasswordRequired(tempToken: tempToken, email: email);
      } else {
        state = AuthError(message: response.message ?? 'Invalid OTP');
      }
    } catch (e) {
      state = AuthError(message: e.toString());
    }
  }

  Future<void> resetPassword(String token, String password) async {
    state = AuthLoading();
    try {
      final response = await _authService.resetPassword(token, password);
      if (response.success) {
        state = AuthUnauthenticated(message: response.message);
      } else {
        state = AuthError(message: response.message ?? 'Failed to reset password');
      }
    } catch (e) {
      state = AuthError(message: e.toString());
    }
  }

  Future<void> logout() async {
    final refreshToken = await _tokenService.getRefreshToken();
    if (refreshToken != null) {
      await _authService.logout(refreshToken);
    }
    await _tokenService.clearTokens();
    await _userService.clearUserProfile();
    state = AuthUnauthenticated();
  }

  Future<void> refreshProfile() async {
    try {
      final response = await _authService.getMe();
      if (response.success && response.data != null) {
        final user = response.data!;
        await _userService.saveUserProfile(user);
        final accessToken = await _tokenService.getAccessToken();
        if (accessToken != null) {
          state = AuthAuthenticated(user: user, accessToken: accessToken);
        }
      }
    } catch (e) {
      debugPrint('Silent profile refresh failed: $e');
    }
  }

  void resetError() {
    if (state is AuthError) {
      state = AuthUnauthenticated();
    }
  }

  void reset() {
    state = AuthUnauthenticated();
  }

  User? get currentUser {
    final s = state;
    if (s is AuthAuthenticated) return s.user;
    return null;
  }
}
