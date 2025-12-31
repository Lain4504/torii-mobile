import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import '../../../data/database/app_database.dart';
import '../../../data/api/api_client.dart';
import '../../../services/auth/firebase_auth_service.dart';
import '../../../services/auth/token_service.dart';
import '../../../services/auth/user_service.dart';
import '../../../data/models/auth_model.dart';
import '../models/auth_state_sealed.dart';

/// Provider cho AppDatabase (singleton)
final databaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});

/// Provider cho FirebaseAuthService
final firebaseAuthServiceProvider = Provider<FirebaseAuthService>((ref) {
  return FirebaseAuthService();
});

/// Provider cho TokenService
final tokenServiceProvider = Provider<TokenService>((ref) {
  final database = ref.watch(databaseProvider);
  return TokenService(database);
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

/// Provider cho AuthStateNotifier
final authStateProvider = NotifierProvider<AuthStateNotifier, AuthState>(
  AuthStateNotifier.new,
);

/// Notifier để quản lý authentication state với Firebase
class AuthStateNotifier extends Notifier<AuthState> {
  @override
  AuthState build() {
    // Start với unauthenticated state
    // initializeAuth() sẽ được gọi từ main.dart
    return AuthUnauthenticated();
  }

  // Dependencies
  FirebaseAuthService get _firebaseAuth => ref.read(firebaseAuthServiceProvider);
  TokenService get _tokenService => ref.read(tokenServiceProvider);
  UserService get _userService => ref.read(userServiceProvider);
  ApiClient get _apiClient => ref.read(apiClientProvider);

  /// Initialize auth state khi app khởi động
  /// Listen to Firebase auth state changes
  Future<void> initializeAuth() async {
    state = AuthLoading();

    try {
      // Listen to Firebase auth state changes
      _firebaseAuth.authStateChanges.listen((firebase_auth.User? firebaseUser) {
        _handleAuthStateChange(firebaseUser);
      });

      // Check initial auth state
      final firebaseUser = _firebaseAuth.currentUser;
      await _handleAuthStateChange(firebaseUser);
    } catch (e) {
      await _clearSession();
      state = AuthUnauthenticated();
    }
  }

  /// Handle Firebase auth state changes
  Future<void> _handleAuthStateChange(firebase_auth.User? firebaseUser) async {
    if (firebaseUser == null) {
      // User signed out
      await _clearSession();
      state = AuthUnauthenticated();
      return;
    }

    try {
      // Get Firebase ID token
      final idToken = await firebaseUser.getIdToken();
      if (idToken == null) {
        await _clearSession();
        state = AuthUnauthenticated();
        return;
      }

      // Sync with backend to get user profile with role
      final response = await _apiClient.client.post(
        '/auth/firebase-sync',
        data: {
          'firebaseUid': firebaseUser.uid,
          'email': firebaseUser.email,
          'displayName': firebaseUser.displayName,
        },
      );

      if (response.data['success'] == true && response.data['data'] != null) {
        final user = User.fromJson(response.data['data']['user']);

        // Save Firebase ID token to local database (for offline access)
        // Token validity: 1 hour (3600 seconds)
        await _tokenService.saveTokens(
          accessToken: idToken,
          refreshToken: firebaseUser.uid, // Use UID as refresh token identifier
          expiresIn: 3600, // Firebase tokens valid for 1 hour
        );

        // Save user profile
        await _userService.saveUserProfile(user);

        state = AuthAuthenticated(user: user, accessToken: idToken);
      } else {
        // Failed to sync with backend
        await _clearSession();
        state = AuthError(message: 'Không thể đồng bộ thông tin người dùng');
      }
    } catch (e) {
      await _clearSession();
      state = AuthError(message: 'Lỗi khi xử lý đăng nhập: ${e.toString()}');
    }
  }

  /// Login với Firebase email và password
  Future<void> login(String email, String password) async {
    state = AuthLoading();

    try {
      // Sign in with Firebase
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      // Auth state will be updated by listener
      // No need to manually set state here
    } on firebase_auth.FirebaseAuthException catch (e) {
      String message = 'Đã xảy ra lỗi khi đăng nhập';
      
      switch (e.code) {
        case 'user-not-found':
          message = 'Không tìm thấy tài khoản với email này';
          break;
        case 'wrong-password':
          message = 'Mật khẩu không đúng';
          break;
        case 'invalid-email':
          message = 'Email không hợp lệ';
          break;
        case 'user-disabled':
          message = 'Tài khoản đã bị vô hiệu hóa';
          break;
        case 'too-many-requests':
          message = 'Quá nhiều lần thử. Vui lòng thử lại sau';
          break;
        default:
          message = e.message ?? message;
      }
      
      state = AuthError(message: message);
    } catch (e) {
      state = AuthError(message: 'Đã xảy ra lỗi: ${e.toString()}');
    }
  }

  /// Register với Firebase email, password và fullName
  Future<bool> register(String email, String fullName, String password) async {
    state = AuthLoading();

    try {
      // Create user with Firebase
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
        displayName: fullName,
      );

      // Auth state will be updated by listener
      // The listener will sync with backend
      return true;
    } on firebase_auth.FirebaseAuthException catch (e) {
      String message = 'Đã xảy ra lỗi khi đăng ký';
      
      switch (e.code) {
        case 'email-already-in-use':
          message = 'Email đã được sử dụng';
          break;
        case 'invalid-email':
          message = 'Email không hợp lệ';
          break;
        case 'weak-password':
          message = 'Mật khẩu quá yếu. Vui lòng chọn mật khẩu mạnh hơn';
          break;
        case 'operation-not-allowed':
          message = 'Đăng ký email/password chưa được kích hoạt';
          break;
        default:
          message = e.message ?? message;
      }
      
      state = AuthError(message: message);
      return false;
    } catch (e) {
      state = AuthError(message: 'Đã xảy ra lỗi: ${e.toString()}');
      return false;
    }
  }

  /// Logout
  Future<void> logout() async {
    state = AuthLoading();

    try {
      // Sign out from Firebase
      await _firebaseAuth.signOut();
      
      // Clear local session
      await _clearSession();
      
      // State will be updated by auth state listener
      state = AuthUnauthenticated();
    } catch (e) {
      // Even if Firebase signOut fails, clear local session
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
    await _firebaseAuth.signOut();
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

  /// Get current Firebase user
  firebase_auth.User? get currentFirebaseUser => _firebaseAuth.currentUser;

  /// Force refresh Firebase ID token
  Future<void> refreshToken() async {
    try {
      final firebaseUser = _firebaseAuth.currentUser;
      if (firebaseUser != null) {
        final newToken = await firebaseUser.getIdToken(true); // Force refresh
        if (newToken != null) {
          await _tokenService.saveTokens(
            accessToken: newToken,
            refreshToken: firebaseUser.uid,
            expiresIn: 3600,
          );

          // Update state with new token
          final currentState = state;
          if (currentState is AuthAuthenticated) {
            state = AuthAuthenticated(
              user: currentState.user,
              accessToken: newToken,
            );
          }
        }
      }
    } catch (e) {
      // Token refresh failed, sign out
      await handleSessionExpired();
    }
  }
}
