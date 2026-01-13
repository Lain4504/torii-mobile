import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/services/auth/auth_service.dart';
import 'package:torii_app/services/auth/token_service.dart';
import 'package:torii_app/services/auth/user_service.dart';
import 'package:torii_app/data/models/auth_model.dart';
import 'package:torii_app/data/api/api_client.dart';
import 'package:torii_app/data/database/app_database.dart';
import 'package:torii_app/features/auth/models/auth_state.dart';

// Service Providers
final databaseProvider = Provider<AppDatabase>((ref) => AppDatabase());

final tokenServiceProvider = Provider<TokenService>((ref) => TokenService());

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

// Auth State Provider - Simplified
final authStateProvider = NotifierProvider<AuthStateNotifier, AuthState>(
  AuthStateNotifier.new,
);

class AuthStateNotifier extends Notifier<AuthState> {
  @override
  AuthState build() {
    // Simple initial state - check if we have tokens
    _initializeAuthState();
    return AuthState.initial();
  }

  AuthService get _authService => ref.read(authServiceProvider);
  TokenService get _tokenService => ref.read(tokenServiceProvider);
  UserService get _userService => ref.read(userServiceProvider);

  /// Initialize auth state on app start - SIMPLIFIED
  Future<void> _initializeAuthState() async {
    try {
      final tokens = await _tokenService.getRawSession();
      final cachedUser = await _userService.getUserProfile();

      if (tokens != null && cachedUser != null) {
        // Has stored session - assume authenticated
        state = AuthState.authenticated(cachedUser);
      } else {
        // No session
        state = AuthState.unauthenticated();
      }
    } catch (e) {
      debugPrint('Auth init error: $e');
      state = AuthState.unauthenticated();
    }
  }

  /// Login - SIMPLIFIED FLOW
  Future<void> login(String email, String password) async {
    state = AuthState.loading();

    try {
      final response = await _authService.login(email: email, password: password);

      if (response.success && response.data != null) {
        final authData = response.data!;

        // Check if requires 2FA
        if (authData.requiresTwoFactor == true && authData.tempToken != null) {
          state = AuthState.requires2FA(
            authData.tempToken!,
            message: response.message,
          );
        } else {
          // Direct login success
          await _completeLogin(authData);
        }
      } else {
        state = AuthState.unauthenticated(error: response.message);
      }
    } catch (e) {
      debugPrint('Login error: $e');
      state = AuthState.unauthenticated(error: 'Login failed. Please try again.');
    }
  }

  /// Complete login after successful authentication
  Future<void> _completeLogin(AuthData authData) async {
    try {
      // Save tokens
      await _tokenService.saveTokens(
        accessToken: authData.accessToken!,
        refreshToken: authData.refreshToken!,
      );

      // Save user profile
      await _userService.saveUserProfile(authData.user!);

      // Set authenticated state
      state = AuthState.authenticated(authData.user!);
    } catch (e) {
      debugPrint('Complete login error: $e');
      state = AuthState.unauthenticated(error: 'Failed to save session');
    }
  }

  /// Verify 2FA code
  Future<void> verify2FA(String tempToken, String code, {bool isBackupCode = false}) async {
    state = AuthState.loading();

    try {
      final response = await _authService.verify2FA(
        tempToken: tempToken,
        code: code,
        backupCode: isBackupCode,
      );

      if (response.success && response.data != null) {
        await _completeLogin(response.data!);
      } else {
        state = AuthState.requires2FA(tempToken, message: response.message);
      }
    } catch (e) {
      debugPrint('2FA verify error: $e');
      state = AuthState.requires2FA(tempToken, message: 'Verification failed');
    }
  }

  /// Register new account
  Future<void> register(String email, String password, String displayName) async {
    state = AuthState.loading();

    try {
      final response = await _authService.register(
        email: email,
        password: password,
        displayName: displayName,
      );

      if (response.success) {
        // Registration successful - user needs to login
        state = AuthState.unauthenticated();
      } else {
        state = AuthState.unauthenticated(error: response.message);
      }
    } catch (e) {
      debugPrint('Register error: $e');
      state = AuthState.unauthenticated(error: 'Registration failed');
    }
  }

  /// Forgot password - request OTP
  Future<void> forgotPassword(String email) async {
    state = AuthState.loading();

    try {
      final response = await _authService.forgotPassword(email);

      if (response.success) {
        // OTP sent - transition to OTP verification state
        state = AuthState.requiresOTP(email);
      } else {
        state = AuthState.unauthenticated(error: response.message);
      }
    } catch (e) {
      debugPrint('Forgot password error: $e');
      state = AuthState.unauthenticated(error: 'Failed to send OTP');
    }
  }

  /// Verify OTP code
  Future<void> verifyOTP(String email, String code) async {
    state = AuthState.loading();

    try {
      final response = await _authService.verifyOTP(email, code);

      if (response.success && response.data != null) {
        // OTP verified - got temp token for password reset
        final tempToken = response.data!['tempToken'] as String?;
        if (tempToken != null) {
          state = state.copyWith(
            status: AuthStatus.requiresOTP,
            tempToken: tempToken,
            email: email,
          );
        } else {
          state = AuthState.requiresOTP(email).copyWith(error: 'Invalid OTP response');
        }
      } else {
        state = AuthState.requiresOTP(email).copyWith(error: response.message);
      }
    } catch (e) {
      debugPrint('Verify OTP error: $e');
      state = AuthState.requiresOTP(email).copyWith(error: 'Invalid OTP code');
    }
  }

  /// Reset password with temp token
  Future<void> resetPassword(String tempToken, String newPassword) async {
    state = AuthState.loading();

    try {
      final response = await _authService.resetPassword(tempToken, newPassword);

      if (response.success) {
        // Password reset successful - user needs to login
        state = AuthState.unauthenticated();
      } else {
        state = AuthState.unauthenticated(error: response.message);
      }
    } catch (e) {
      debugPrint('Reset password error: $e');
      state = AuthState.unauthenticated(error: 'Failed to reset password');
    }
  }

  /// Resend OTP
  Future<void> resendOTP(String email) async {
    try {
      await _authService.resendOTP(email, reason: 'forgot_password');
      // Don't change state, just send OTP again
    } catch (e) {
      debugPrint('Resend OTP error: $e');
    }
  }

  /// Logout
  Future<void> logout() async {
    try {
      // Get refresh token for backend logout
      final tokens = await _tokenService.getRawSession();
      if (tokens != null) {
        await _authService.logout(tokens.refreshToken);
      }
    } catch (e) {
      debugPrint('Logout API error: $e');
    } finally {
      // Clear local state regardless of API success
      await _tokenService.clearTokens();
      await _userService.clearUserProfile();
      state = AuthState.unauthenticated();
    }
  }

  /// Reset state to unauthenticated (for page init)
  void reset() {
    state = AuthState.unauthenticated();
  }
}
