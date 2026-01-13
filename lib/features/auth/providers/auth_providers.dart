
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/services/auth/auth_service.dart';
import 'package:torii_app/services/auth/token_service.dart';
import 'package:torii_app/services/auth/user_service.dart';
import 'package:torii_app/data/api/api_client.dart';
import 'package:torii_app/data/database/app_database.dart';
import 'package:torii_app/features/auth/models/auth_state.dart';
import 'package:torii_app/features/auth/repositories/auth_repository.dart';
import 'package:torii_app/features/auth/repositories/token_storage.dart';

// --- DATA LAYER ---
final databaseProvider = Provider<AppDatabase>((ref) => AppDatabase());

final tokenServiceProvider = Provider<TokenService>((ref) => TokenService());

final tokenStorageProvider = Provider<TokenStorage>((ref) => TokenStorage());

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

// --- REPOSITORY LAYER ---
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final tokenStorage = ref.watch(tokenStorageProvider);
  final authService = ref.watch(authServiceProvider);
  return AuthRepository(tokenStorage, authService);
});

// --- STATE MANAGEMENT ---
class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository repository;
  final UserService userService;

  AuthNotifier(this.repository, this.userService) : super(AuthState.initial()) {
    _init();
  }

  Future<void> _init() async {
    final token = await repository.tokenStorage.getAccessToken();
    if (token != null) {
      final user = await userService.getUserProfile();
      if (user != null) {
        state = AuthState.authenticated(user);
      } else {
        try {
           final response = await repository.authService.getMe();
           if (response.success && response.data != null) {
              await userService.saveUserProfile(response.data!);
              state = AuthState.authenticated(response.data!);
           } else {
              // Token might be valid but profile fetch failed, stay valid optimistically or refresh
              state = const AuthState(status: AuthStatus.authenticated);
           }
        } catch (_) {
           state = const AuthState(status: AuthStatus.authenticated);
        }
      }
    } else {
      state = AuthState.unauthenticated();
    }
  }

  Future<void> login(String email, String password) async {
    state = AuthState.loading();
    final (result, data, error) = await repository.login(email, password);

    if (result == AuthResult.success && data != null) {
      await userService.saveUserProfile(data.user);
      state = AuthState.authenticated(data.user);
    } else if (result == AuthResult.requires2FA && data != null && data.tempToken != null) {
      state = AuthState.pending2FA(data.tempToken!);
    } else {
      state = AuthState.unauthenticated(error: error);
    }
  }

  Future<void> verify2FA(String tempToken, String code, {bool isBackupCode = false}) async {
    state = AuthState.loading();
    try {
      final success = await repository.verify2FA(tempToken, code, isBackupCode: isBackupCode);
      if (success) {
        final userParams = await repository.authService.getMe();
        if (userParams.success && userParams.data != null) {
           await userService.saveUserProfile(userParams.data!);
           state = AuthState.authenticated(userParams.data!);
        } else {
           state = const AuthState(status: AuthStatus.authenticated);
        }
      } else {
        state = AuthState.pending2FA(tempToken, error: 'Verification failed. Please check your code.');
      }
    } catch (e) {
       state = AuthState.pending2FA(tempToken, error: 'Error: $e');
    }
  }

  // --- RESTORED FUNCTIONALITY ---

  Future<void> register(String email, String password, String displayName) async {
    state = AuthState.loading();
    try {
      final response = await repository.authService.register(
        email: email,
        password: password,
        displayName: displayName,
      );
      if (response.success) {
        state = AuthState.unauthenticated();
      } else {
        state = AuthState.unauthenticated(error: response.message);
      }
    } catch (e) {
      state = AuthState.unauthenticated(error: 'Registration failed');
    }
  }

  Future<void> forgotPassword(String email) async {
    state = AuthState.loading();
    try {
      final response = await repository.authService.forgotPassword(email);
      if (response.success) {
        state = AuthState.requiresOTP(email);
      } else {
        state = AuthState.unauthenticated(error: response.message);
      }
    } catch (e) {
      state = AuthState.unauthenticated(error: 'Failed to send OTP');
    }
  }

  Future<void> verifyOTP(String email, String code) async {
    state = AuthState.loading();
    try {
      final response = await repository.authService.verifyOTP(email, code);
      if (response.success && response.data != null) {
        final tempToken = response.data!['tempToken'] as String?;
        if (tempToken != null) {
          // Stay in requiresOTP status but with tempToken to trigger navigation to reset password
          state = AuthState(
             status: AuthStatus.requiresOTP,
             email: email,
             tempToken: tempToken
          );
        } else {
          state = AuthState.requiresOTP(email, error: 'Invalid OTP response');
        }
      } else {
        state = AuthState.requiresOTP(email, error: response.message);
      }
    } catch (e) {
      state = AuthState.requiresOTP(email, error: 'Invalid OTP code');
    }
  }

  Future<void> resetPassword(String tempToken, String newPassword) async {
    state = AuthState.loading();
    try {
      final response = await repository.authService.resetPassword(tempToken, newPassword);
      if (response.success) {
        state = AuthState.unauthenticated();
      } else {
        state = AuthState.unauthenticated(error: response.message);
      }
    } catch (e) {
      state = AuthState.unauthenticated(error: 'Failed to reset password');
    }
  }

  Future<void> resendOTP(String email) async {
    try {
      await repository.authService.resendOTP(email);
    } catch (e) {
      debugPrint('Resend OTP error: $e');
    }
  }

  Future<void> logout() async {
    await repository.logout();
    await userService.clearUserProfile();
    state = AuthState.unauthenticated();
  }
}

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  final userService = ref.watch(userServiceProvider);
  return AuthNotifier(repository, userService);
});

// Alias for compatibility
final authStateProvider = authNotifierProvider;
