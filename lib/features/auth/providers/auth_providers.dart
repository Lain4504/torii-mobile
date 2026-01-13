
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
class AuthNotifier extends AsyncNotifier<AuthState> {
  late AuthRepository _repository;
  late UserService _userService;

  @override
  Future<AuthState> build() async {
    _repository = ref.watch(authRepositoryProvider);
    _userService = ref.watch(userServiceProvider);
    return _init();
  }

  Future<AuthState> _init() async {
    final token = await _repository.tokenStorage.getAccessToken();
    if (token != null) {
      final user = await _userService.getUserProfile();
      if (user != null) {
        return AuthState.authenticated(user);
      } else {
        try {
           final response = await _repository.authService.getMe();
           if (response.success && response.data != null) {
              await _userService.saveUserProfile(response.data!);
              return AuthState.authenticated(response.data!);
           } else {
              // Token valid, but profile fetch failed
              return const AuthState(status: AuthStatus.authenticated, error: 'Could not refresh profile');
           }
        } catch (_) {
           return const AuthState(status: AuthStatus.authenticated, error: 'Offline');
        }
      }
    } else {
      return AuthState.unauthenticated();
    }
  }

  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      final (result, data, error) = await _repository.login(email, password);

      if (result == AuthResult.success && data != null) {
        await _userService.saveUserProfile(data.user);
        state = AsyncValue.data(AuthState.authenticated(data.user));
      } else if (result == AuthResult.requires2FA && data != null && data.tempToken != null) {
        state = AsyncValue.data(AuthState.pending2FA(data.tempToken!));
      } else {
        state = AsyncValue.data(AuthState.unauthenticated(error: error));
      }
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> verify2FA(String tempToken, String code, {bool isBackupCode = false}) async {
    state = const AsyncValue.loading();
    try {
      final success = await _repository.verify2FA(tempToken, code, isBackupCode: isBackupCode);
      if (success) {
        final userParams = await _repository.authService.getMe();
        if (userParams.success && userParams.data != null) {
          await _userService.saveUserProfile(userParams.data!);
          state = AsyncValue.data(AuthState.authenticated(userParams.data!));
        } else {
          // Fallback if profile fails load but token is valid
          state = const AsyncValue.data(AuthState(status: AuthStatus.authenticated));
        }
      } else {
        state = AsyncValue.data(AuthState.pending2FA(tempToken, error: 'Verification failed. Please check your code.'));
      }
    } catch (e) {
      state = AsyncValue.data(AuthState.pending2FA(tempToken, error: 'Error: $e'));
    }
  }

  Future<void> register(String email, String password, String displayName) async {
    state = const AsyncValue.loading();
    try {
      final response = await _repository.authService.register(
        email: email,
        password: password,
        displayName: displayName,
      );
      if (response.success) {
        state = AsyncValue.data(AuthState.unauthenticated());
      } else {
        state = AsyncValue.data(AuthState.unauthenticated(error: response.message));
      }
    } catch (e) {
      state = AsyncValue.data(AuthState.unauthenticated(error: 'Registration failed'));
    }
  }

  Future<void> forgotPassword(String email) async {
    state = const AsyncValue.loading();
    try {
      final response = await _repository.authService.forgotPassword(email);
      if (response.success) {
        state = AsyncValue.data(AuthState.requiresOTP(email));
      } else {
        state = AsyncValue.data(AuthState.unauthenticated(error: response.message));
      }
    } catch (e) {
      state = AsyncValue.data(AuthState.unauthenticated(error: 'Failed to send OTP'));
    }
  }

  Future<void> verifyOTP(String email, String code) async {
     state = const AsyncValue.loading();
     try {
        final response = await _repository.authService.verifyOTP(email, code);
        if (response.success && response.data != null) {
          final tempToken = response.data!['tempToken'] as String?;
          if (tempToken != null) {
             state = AsyncValue.data(AuthState(
                 status: AuthStatus.requiresOTP,
                 email: email,
                 tempToken: tempToken
             ));
          } else {
             state = AsyncValue.data(AuthState.requiresOTP(email, error: 'Invalid OTP response'));
          }
        } else {
          state = AsyncValue.data(AuthState.requiresOTP(email, error: response.message));
        }
     } catch (e) {
       state = AsyncValue.data(AuthState.requiresOTP(email, error: 'Invalid OTP code'));
     }
  }

  Future<void> resetPassword(String tempToken, String newPassword) async {
    state = const AsyncValue.loading();
    try {
      final response = await _repository.authService.resetPassword(tempToken, newPassword);
      if (response.success) {
        state = AsyncValue.data(AuthState.unauthenticated());
      } else {
        state = AsyncValue.data(AuthState.unauthenticated(error: response.message));
      }
    } catch (e) {
      state = AsyncValue.data(AuthState.unauthenticated(error: 'Failed to reset password'));
    }
  }

  Future<void> resendOTP(String email) async {
    try {
      await _repository.authService.resendOTP(email);
    } catch (e) {
      debugPrint('Resend OTP error: $e');
    }
  }

  Future<void> logout() async {
    try {
      await _repository.logout();
    } catch (_) {}
    await _userService.clearUserProfile();
    state = AsyncValue.data(AuthState.unauthenticated());
  }
}


// AsyncNotifierProvider
final authNotifierProvider = AsyncNotifierProvider<AuthNotifier, AuthState>(AuthNotifier.new);

// Alias
final authStateProvider = authNotifierProvider;
