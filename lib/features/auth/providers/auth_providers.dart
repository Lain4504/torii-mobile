import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/services/auth/auth_service.dart';
import 'package:torii_app/services/auth/token_service.dart';
import 'package:torii_app/services/auth/user_service.dart';
import 'package:torii_app/data/api/api_client.dart';
import 'package:torii_app/data/database/app_database.dart';
import 'package:torii_app/data/models/auth_model.dart';
import 'package:torii_app/features/auth/models/auth_state.dart';
import 'package:torii_app/features/auth/repositories/auth_repository.dart';
import 'package:torii_app/features/auth/repositories/token_storage.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:torii_app/core/config/app_config.dart';

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

  Future<void> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login(
        permissions: ['public_profile', 'email'],
      );

      if (result.status == LoginStatus.success) {
        final AccessToken? accessToken = result.accessToken;
        if (accessToken != null) {
          state = const AsyncValue.loading();
          final (authResult, data, error) =
              await _repository.facebookLogin(accessToken.tokenString);
          await _handleAuthResult(authResult, data, error);
        }
      } else if (result.status == LoginStatus.cancelled) {
        debugPrint('Facebook login cancelled');
      } else {
        debugPrint('Facebook login failed: ${result.message}');
        state = AsyncValue.data(
            AuthState.unauthenticated(error: 'Facebook login failed'));
      }
    } catch (e) {
      debugPrint('Facebook sign in error: $e');
      state = AsyncValue.data(
          AuthState.unauthenticated(error: 'Facebook sign in failed'));
    }
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

  Future<bool> login(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      final (result, data, error) = await _repository.login(email, password);
      await _handleAuthResult(result, data, error);
      return result == AuthResult.success || result == AuthResult.requires2FA;
    } catch (e) {
      await _repository.tokenStorage.clear();
      state = AsyncValue.error(e, StackTrace.current);
      return false;
    }
  }

  Future<void> googleLogin(String idToken) async {
    state = const AsyncValue.loading();
    try {
      final (result, data, error) = await _repository.googleLogin(idToken);
      await _handleAuthResult(result, data, error);
    } catch (e) {
      await _repository.tokenStorage.clear();
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> _handleAuthResult(AuthResult result, AuthData? data, String? error) async {
    if (result == AuthResult.success && data != null) {
      if (data.accessToken != null) {
        await _repository.tokenStorage.saveTokens(data.accessToken!, data.refreshToken ?? '');
      }
      await _userService.saveUserProfile(data.user);

      // Invalidate feature-specific caches if those providers are available.

      state = AsyncValue.data(AuthState.authenticated(data.user));
    } else if (result == AuthResult.requires2FA && data != null && data.tempToken != null) {
      state = AsyncValue.data(AuthState.pending2FA(data.tempToken!));
    } else {
      await _repository.tokenStorage.clear();
      state = AsyncValue.data(AuthState.unauthenticated(error: error));
    }
  }

  Future<bool> verify2FA(String tempToken, String code, {bool isBackupCode = false}) async {
    state = const AsyncValue.loading();
    try {
      final authData = await _repository.verify2FA(tempToken, code, isBackupCode: isBackupCode);
      if (authData != null) {
        await _userService.saveUserProfile(authData.user);
        
        // Clear flashcard cache from previous account
        // Optionally invalidate feature-specific providers here.
        
        state = AsyncValue.data(AuthState.authenticated(authData.user));
        return true;
      } else {
        state = AsyncValue.data(AuthState.pending2FA(tempToken, error: 'Verification failed. Please check your code.'));
        return false;
      }
    } catch (e) {
      state = AsyncValue.data(AuthState.pending2FA(tempToken, error: 'Error: $e'));
      return false;
    }
  }

  Future<bool> register(String email, String password, String displayName) async {
    state = const AsyncValue.loading();
    try {
      final response = await _repository.authService.register(
        email: email,
        password: password,
        displayName: displayName,
      );
      if (response.success) {
        state = AsyncValue.data(AuthState.unauthenticated());
        return true;
      } else {
        state = AsyncValue.data(AuthState.unauthenticated(error: response.message));
        return false;
      }
    } catch (e) {
      state = AsyncValue.data(AuthState.unauthenticated(error: 'Registration failed'));
      return false;
    }
  }

  Future<bool> forgotPassword(String email) async {
    state = const AsyncValue.loading();
    try {
      final response = await _repository.authService.forgotPassword(email);
      if (response.success) {
        state = AsyncValue.data(AuthState.requiresOTP(email));
        return true;
      } else {
        // Ensure clean state on failure
        await _repository.tokenStorage.clear();
        state = AsyncValue.data(AuthState.unauthenticated(error: response.message));
        return false;
      }
    } catch (e) {
      await _repository.tokenStorage.clear();
      state = AsyncValue.data(AuthState.unauthenticated(error: 'Failed to send OTP'));
      return false;
    }
  }

  Future<bool> verifyOTP(String email, String code, {required String type}) async {
     state = const AsyncValue.loading();
     try {
        final response = await _repository.authService.verifyOTP(
          email,
          code,
          type: type,
        );
        if (response.success && response.data != null) {
          final tempToken = response.data!['tempToken'] as String?;
          if (tempToken != null) {
             state = AsyncValue.data(AuthState(
                 status: AuthStatus.requiresOTP,
                 email: email,
                 tempToken: tempToken
             ));
             return true;
          } else {
             state = AsyncValue.data(AuthState.requiresOTP(email, error: 'Invalid OTP response'));
             return false;
          }
        } else {
          state = AsyncValue.data(AuthState.requiresOTP(email, error: response.message));
          return false;
        }
     } catch (e) {
       state = AsyncValue.data(AuthState.requiresOTP(email, error: 'Invalid OTP code'));
       return false;
     }
  }

  Future<bool> resetPassword(String tempToken, String newPassword) async {
    state = const AsyncValue.loading();
    try {
      final response = await _repository.authService.resetPassword(tempToken, newPassword);
      if (response.success) {
        state = AsyncValue.data(AuthState.unauthenticated());
        return true;
      } else {
        await _repository.tokenStorage.clear();
        state = AsyncValue.data(AuthState.unauthenticated(error: response.message));
        return false;
      }
    } catch (e) {
      await _repository.tokenStorage.clear();
      state = AsyncValue.data(AuthState.unauthenticated(error: 'Failed to reset password'));
      return false;
    }
  }

  Future<void> resendOTP(String email, {required String type}) async {
    try {
      await _repository.authService.resendOTP(email, type: type);
    } catch (e) {
      debugPrint('Resend OTP error: $e');
    }
  }

  Future<void> logout() async {
    try {
      await _repository.logout();
    } catch (_) {}
    await _userService.clearUserProfile();
    // Optionally invalidate feature-specific providers here.
    state = AsyncValue.data(AuthState.unauthenticated());
  }

  Future<bool> updateProfile({String? displayName, Map<String, dynamic>? metadata}) async {
    final response = await _repository.updateProfile(displayName: displayName, userMetadata: metadata);
    if (response.success && response.data != null) {
      await _userService.saveUserProfile(response.data!);
      state = AsyncValue.data(AuthState.authenticated(response.data!));
      return true;
    }
    return false;
  }

  Future<bool> changePassword(String oldPassword, String newPassword) async {
    final response = await _repository.changePassword(
      oldPassword: oldPassword,
      newPassword: newPassword,
    );
    return response.success;
  }
}


// AsyncNotifierProvider
final authNotifierProvider = AsyncNotifierProvider<AuthNotifier, AuthState>(AuthNotifier.new);

// Alias
final authStateProvider = authNotifierProvider;
