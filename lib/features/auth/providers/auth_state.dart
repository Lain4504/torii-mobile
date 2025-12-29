import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/models/auth_model.dart';
import '../../../data/repositories/auth_repository.dart';
import '../../../services/storage/secure_storage_service.dart';
import 'auth_providers.dart';

/// State model cho authentication
class AuthState {
  final bool isAuthenticated;
  final String? token;
  final bool isLoading;
  final String? error;

  AuthState({
    this.isAuthenticated = false,
    this.token,
    this.isLoading = false,
    this.error,
  });

  AuthState copyWith({
    bool? isAuthenticated,
    String? token,
    bool? isLoading,
    String? error,
  }) {
    return AuthState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      token: token ?? this.token,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

/// Notifier để quản lý authentication state
class AuthStateNotifier extends Notifier<AuthState> {
  @override
  AuthState build() {
    // Start with unauthenticated state
    // Check auth status manually when needed
    return AuthState();
  }

  // Dependencies accessed via ref
  AuthRepository get _authRepository => ref.read(authRepositoryProvider);
  SecureStorageService get _secureStorage => ref.read(secureStorageProvider);

  /// Login với email và password
  Future<void> login(String email, String password) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final request = LoginRequest(email: email, password: password);
      final response = await _authRepository.login(request);

      if (response.success && response.data != null) {
        // Parse token từ response
        final tokenResponse = TokenResponse.fromJson(response.data);
        final token = tokenResponse.token;

        // Lưu token vào secure storage
        await _secureStorage.saveToken(token);

        // Update state
        state = state.copyWith(
          isAuthenticated: true,
          token: token,
          isLoading: false,
        );
      } else {
        // Login thất bại
        state = state.copyWith(
          isLoading: false,
          error: response.message ?? 'Email hoặc mật khẩu không đúng',
        );
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Đã xảy ra lỗi khi đăng nhập: ${e.toString()}',
      );
    }
  }

  /// Register với email, fullName và password
  Future<void> register(String email, String fullName, String password) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final request = RegisterRequest(
        email: email,
        fullName: fullName,
        password: password,
      );
      final response = await _authRepository.register(request);

      if (response.success) {
        // Register thành công, không auto login
        state = state.copyWith(isLoading: false);
      } else {
        // Register thất bại
        state = state.copyWith(
          isLoading: false,
          error: response.message ?? 'Đã xảy ra lỗi khi đăng ký',
        );
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Đã xảy ra lỗi khi đăng ký: ${e.toString()}',
      );
    }
  }

  /// Logout
  Future<void> logout() async {
    state = state.copyWith(isLoading: true);

    try {
      // Xóa token từ secure storage
      await _secureStorage.deleteToken();

      // Reset state
      state = AuthState();

      // Call API logout (optional)
      await _authRepository.logout();
    } catch (e) {
      // Ngay cả khi có lỗi, vẫn reset state
      state = AuthState();
    }
  }

  /// Check authentication status từ secure storage
  Future<void> checkAuthStatus() async {
    try {
      final token = await _secureStorage.getToken();
      if (token != null && token.isNotEmpty) {
        state = state.copyWith(
          isAuthenticated: true,
          token: token,
        );
      } else {
        state = state.copyWith(isAuthenticated: false);
      }
    } catch (e) {
      state = state.copyWith(isAuthenticated: false);
    }
  }
}

