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
  Future<void> initializeAuth() async {
    state = AuthLoading();

    try {
        print('Initializing Auth State...');
        // Sử dụng Optimistic Auth: Restore session nếu có data, bất kể token hết hạn chưa.
        // Việc refresh token sẽ do ApiClient Interceptor lo khi có request đầu tiên.
        final session = await _tokenService.getRawSession();
        
        if (session != null) {
            print('Found session for token: ${session.accessToken.substring(0, 5)}...');
            // Restore user profile
            final user = await _userService.getUserProfile();
            
            if (user != null) {
                print('Restored user: ${user.email}');
                state = AuthAuthenticated(user: user, accessToken: session.accessToken);
                return;
            } else {
                print('User profile missing');
            }
        } else {
            print('No session found in database');
        }
        state = AuthUnauthenticated();
    } catch (e) {
      print('Auth initialization error: $e');
      await _clearSession();
      state = AuthUnauthenticated();
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
      await _authService.register(email, password, fullName);
      // Auto login or ask user to login?
      // For now, let's just return true and let UI redirect to login
      state = AuthUnauthenticated(); // Or AuthSuccess logic
      return true;
    } catch (e) {
      state = AuthError(message: 'Registration failed: ${e.toString()}');
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
