import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../services/auth/auth_service.dart';
import '../../../services/auth/token_service.dart';
import '../../../services/auth/user_service.dart';
import '../../../data/models/auth_model.dart';
import '../../../data/api/api_client.dart';
import '../../../data/database/app_database.dart';
import '../models/auth_state_sealed.dart';

/// Provider cho AppDatabase (singleton)
final databaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});

/// Provider cho TokenService
final tokenServiceProvider = Provider<TokenService>((ref) {
  return TokenService();
});

/// Provider cho UserService
final userServiceProvider = Provider<UserService>((ref) {
  final database = ref.watch(databaseProvider);
  return UserService(database);
});

/// Provider cho ApiClient
final apiClientProvider = Provider<ApiClient>((ref) {
  final tokenService = ref.watch(tokenServiceProvider);
  return ApiClient(tokenService: tokenService);
});

final authServiceProvider = Provider<AuthService>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return AuthService(apiClient);
});

/// Provider cho AuthStateNotifier
final authStateProvider = NotifierProvider<AuthStateNotifier, AuthState>(
  AuthStateNotifier.new,
);

/// Notifier để quản lý authentication state với JWT
class AuthStateNotifier extends Notifier<AuthState> {
  @override
  AuthState build() {
    return AuthUnauthenticated();
  }

  // Dependencies
  AuthService get _authService => ref.read(authServiceProvider);
  TokenService get _tokenService => ref.read(tokenServiceProvider);
  UserService get _userService => ref.read(userServiceProvider);

  /// Initialize auth state khi app khởi động
  /// Fetches latest profile from server to sync verification status
  Future<void> initializeAuth() async {
    state = AuthLoading();

    try {
        debugPrint('Initializing Auth State...');
        // Check if we have a session
        final session = await _tokenService.getRawSession();
        
        if (session != null) {
            // Check if tokens are valid
            if (await _tokenService.hasValidSession()) {
                 try {
                    debugPrint('Found session, fetching latest profile from server...');
                    // Always try to fetch latest profile from server to sync status
                    final data = await _authService.getProfile();
                    final user = User.fromJson(data['user']);
                    
                    // Update local DB
                    await _userService.saveUserProfile(user);
                    
                    debugPrint('Fetched latest user from server: ${user.email}, status: ${user.status}');
                    state = AuthAuthenticated(user: user, accessToken: session.accessToken);
                 } catch (e) {
                    // Fallback to local DB if server fetch fails (offline)
                    debugPrint('Failed to fetch profile from server: $e');
                    debugPrint('Falling back to local profile...');
                    
                    final user = await _userService.getUserProfile();
                    if (user != null) {
                        // Ensure we have the latest token from session
                        // (Though if getProfile failed due to 401, we might be logged out already)
                        debugPrint('Restored user from local DB: ${user.email}');
                        state = AuthAuthenticated(user: user, accessToken: session.accessToken);
                    } else {
                        // Edge case: Token exists but no profile?
                        debugPrint('User profile missing in local DB');
                        state = AuthUnauthenticated();
                    }
                 }
            } else {
                debugPrint('No session found in database');
                state = AuthUnauthenticated();
            }
        } else {
            state = AuthUnauthenticated();
        }
    } catch (e) {
      debugPrint('Auth initialization error: $e');
      state = AuthError(message: 'Failed to initialize auth: $e');
    }
  }

  /// Refresh user profile from server
  /// Called when app resumes to sync verification status
  /// 
  /// OPTIMIZATIONS:
  /// 1. Only refresh if user status is PENDING (not ACTIVE)
  /// 2. Debounce to prevent multiple calls
  /// 3. Fail silently with cached data
  DateTime? _lastRefreshTime;
  static const _refreshCooldown = Duration(seconds: 30);

  Future<void> refreshProfile() async {
    final currentState = state;
    
    // Only refresh if authenticated
    if (currentState is! AuthAuthenticated) {
      return;
    }

    final user = currentState.user;

    // OPTIMIZATION 1: Skip if user is already ACTIVE
    if (user.status == 'active') {
      debugPrint('User already active, skipping profile refresh');
      return;
    }

    // OPTIMIZATION 2: Debounce - skip if refreshed recently
    final now = DateTime.now();
    if (_lastRefreshTime != null) {
      final timeSinceLastRefresh = now.difference(_lastRefreshTime!);
      if (timeSinceLastRefresh < _refreshCooldown) {
        debugPrint('Skipping refresh - cooldown period (${_refreshCooldown.inSeconds - timeSinceLastRefresh.inSeconds}s remaining)');
        return;
      }
    }

    try {
      debugPrint('Refreshing user profile from server...');
      _lastRefreshTime = now;
      
      final data = await _authService.getProfile();
      
      if (data['user'] != null) {
        final updatedUser = User.fromJson(data['user']);
        debugPrint('Profile refreshed: ${updatedUser.email}, status: ${updatedUser.status}');
        
        // Update local database
        await _userService.saveUserProfile(updatedUser);
        
        // Update state
        state = AuthAuthenticated(
          user: updatedUser, 
          accessToken: currentState.accessToken,
        );
      }
    } catch (e) {
      debugPrint('Failed to refresh profile: $e');
      // OPTIMIZATION 3: Fail silently - keep existing cached data
      // Don't update state on error
    }
  }

  /// Login với email và password
  Future<void> login(String email, String password) async {
    state = AuthLoading();

    try {
      final data = await _authService.login(email, password);
      
      if (data['user'] != null) {
          final user = User.fromJson(data['user']);
          final accessToken = data['access_token'];
          final refreshToken = data['refresh_token'] ?? '';

          // Save Session
          // Access Token validity: 15 minutes (900s)
          await _tokenService.saveTokens(
              accessToken: accessToken,
              refreshToken: refreshToken,
              expiresIn: 15 * 60, 
          );

          await _userService.saveUserProfile(user);

          state = AuthAuthenticated(user: user, accessToken: accessToken);
      } else {
          state = AuthError(message: 'Login failed: Invalid response');
      }

    } catch (e) {
      state = AuthError(message: 'Login failed: ${e.toString()}');
    }
  }

  /// Register
  Future<bool> register(String email, String fullName, String password) async {
    state = AuthLoading();

    try {
      final data = await _authService.register(email, password, fullName);
      
      // AUTO LOGIN logic similar to login()
      if (data['user'] != null) {
          final user = User.fromJson(data['user']);
          final accessToken = data['access_token'];
          final refreshToken = data['refresh_token'] ?? '';

          await _tokenService.saveTokens(
              accessToken: accessToken,
              refreshToken: refreshToken,
              expiresIn: 15 * 60, 
          );

          await _userService.saveUserProfile(user);

          state = AuthAuthenticated(user: user, accessToken: accessToken);
          return true;
      } else {
          // If for some reason backend only returns user but not tokens
          state = AuthUnauthenticated();
          return true;
      }
    } catch (e) {
      state = AuthError(message: 'Registration failed: ${e.toString()}');
      return false;
    }
  }

  /// Verify Email
  Future<bool> verifyEmail(String otp) async {
    final user = currentUser;
    if (user == null) return false;

    try {
      final response = await _authService.verifyEmail(user.email, otp);
      
      if (response['success'] == true) {
          // Update local user state to ACTIVE
          final updatedUser = User(
              id: user.id,
              email: user.email,
              displayName: user.displayName,
              avatar: user.avatar,
              role: user.role,
              status: 'active',
          );
          
          await _userService.saveUserProfile(updatedUser);
          
          final currentState = state;
          if (currentState is AuthAuthenticated) {
            state = AuthAuthenticated(user: updatedUser, accessToken: currentState.accessToken);
          }
          return true;
      }
      return false;
    } catch (e) {
      // Don't change global state to error, just return false
      return false;
    }
  }

  /// Resend Verification
  Future<bool> resendVerification() async {
    final user = currentUser;
    if (user == null) return false;

    try {
      final response = await _authService.resendVerification(user.email);
      return response['success'] == true;
    } catch (e) {
      return false;
    }
  }

  /// Logout
  Future<void> logout() async {
    state = AuthLoading();
    try {
      await _authService.logout();
    } catch (_) {
      // Ignore checks
    } finally {
        await _clearSession();
        state = AuthUnauthenticated();
    }
  }

  /// Clear toàn bộ session data
  Future<void> _clearSession() async {
    await _tokenService.clearTokens();
    await _userService.clearUserProfile();
  }

  /// Handle session expired (gọi từ UI khi cần)
  Future<void> handleSessionExpired() async {
    await _clearSession();
    state = AuthExpired(message: 'Phiên đăng nhập đã hết hạn. Vui lòng đăng nhập lại.');
  }

  /// Check if user is authenticated
  bool get isAuthenticated => state is AuthAuthenticated;

  /// Get current user (null nếu chưa login)
  User? get currentUser {
    final currentState = state;
    if (currentState is AuthAuthenticated) {
      return currentState.user;
    }
    return null;
  }
}
