import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../core/utils/validators.dart';
import '../core/network/api_exception.dart';
import '../data/auth_service.dart';
import '../models/auth/user.dart';

/// ViewModel for authentication state management
class AuthViewModel extends ChangeNotifier {
  final AuthService _authService;

  // State
  bool _isLoading = false;
  bool _isAuthenticated = false;
  User? _user;
  String? _error;
  String? _successMessage;

  // Getters
  bool get isLoading => _isLoading;
  bool get isAuthenticated => _isAuthenticated;
  User? get user => _user;
  String? get error => _error;
  String? get successMessage => _successMessage;

  AuthViewModel({AuthService? authService})
      : _authService = authService ?? AuthService() {
    _checkAuthStatus();
  }

  /// Check authentication status on app start
  Future<void> _checkAuthStatus() async {
    try {
      final isAuth = await _authService.isAuthenticated();
      if (isAuth) {
        _user = await _authService.getUser();
        _isAuthenticated = true;
        notifyListeners();
      }
    } catch (e) {
      // Silent fail on startup check
      debugPrint('Auth status check failed: $e');
    }
  }

  /// Clear error message
  void clearError() {
    _error = null;
    notifyListeners();
  }

  /// Clear success message
  void clearSuccessMessage() {
    _successMessage = null;
    notifyListeners();
  }

  /// Login user
  Future<bool> login({
    required String email,
    required String password,
  }) async {
    // Validation
    final emailError = Validators.email(email);
    if (emailError != null) {
      _error = emailError;
      notifyListeners();
      return false;
    }

    final passwordError = Validators.password(password);
    if (passwordError != null) {
      _error = passwordError;
      notifyListeners();
      return false;
    }

    _isLoading = true;
    _error = null;
    _successMessage = null;
    notifyListeners();

    try {
      final response = await _authService.login(
        email: email.trim(),
        password: password,
      );

      _user = response.user;
      _isAuthenticated = true;
      _successMessage = 'Đăng nhập thành công!';
      _error = null;

      notifyListeners();
      return true;
    } on ApiException catch (e) {
      _error = _getErrorMessage(e);
      _isAuthenticated = false;
      _user = null;
      notifyListeners();
      return false;
    } catch (e) {
      _error = 'Đã xảy ra lỗi không mong muốn: ${e.toString()}';
      _isAuthenticated = false;
      _user = null;
      notifyListeners();
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Register new user
  Future<bool> register({
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    // Validation
    final emailError = Validators.email(email);
    if (emailError != null) {
      _error = emailError;
      notifyListeners();
      return false;
    }

    final passwordError = Validators.password(password);
    if (passwordError != null) {
      _error = passwordError;
      notifyListeners();
      return false;
    }

    final confirmPasswordError = Validators.confirmPassword(
      confirmPassword,
      password,
    );
    if (confirmPasswordError != null) {
      _error = confirmPasswordError;
      notifyListeners();
      return false;
    }

    _isLoading = true;
    _error = null;
    _successMessage = null;
    notifyListeners();

    try {
      final response = await _authService.register(
        email: email.trim(),
        password: password,
      );

      _user = response.user;
      _isAuthenticated = true;
      _successMessage = 'Đăng ký thành công!';
      _error = null;

      notifyListeners();
      return true;
    } on ApiException catch (e) {
      _error = _getErrorMessage(e);
      _isAuthenticated = false;
      _user = null;
      notifyListeners();
      return false;
    } catch (e) {
      _error = 'Đã xảy ra lỗi không mong muốn: ${e.toString()}';
      _isAuthenticated = false;
      _user = null;
      notifyListeners();
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Logout user
  Future<void> logout() async {
    _isLoading = true;
    _error = null;
    _successMessage = null;
    notifyListeners();

    try {
      await _authService.logout();
      _user = null;
      _isAuthenticated = false;
      _successMessage = 'Đăng xuất thành công!';
      notifyListeners();
    } catch (e) {
      _error = 'Đăng xuất thất bại: ${e.toString()}';
      notifyListeners();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Get user-friendly error message
  String _getErrorMessage(ApiException exception) {
    final message = exception.message.toLowerCase();

    if (message.contains('email') && message.contains('already')) {
      return 'Email này đã được sử dụng';
    }
    if (message.contains('invalid') && message.contains('password')) {
      return 'Email hoặc mật khẩu không đúng';
    }
    if (message.contains('unauthorized')) {
      return 'Email hoặc mật khẩu không đúng';
    }
    if (message.contains('network')) {
      return 'Lỗi kết nối. Vui lòng kiểm tra internet';
    }
    if (message.contains('timeout')) {
      return 'Hết thời gian chờ. Vui lòng thử lại';
    }

    return exception.message;
  }
}

