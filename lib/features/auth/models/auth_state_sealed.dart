import '../../../data/models/auth_model.dart';

/// Sealed class cho Authentication State
/// Sử dụng sealed class để type-safe state management
sealed class AuthState {}

/// State khi user chưa đăng nhập
class AuthUnauthenticated extends AuthState {}

/// State khi user đã đăng nhập
class AuthAuthenticated extends AuthState {
  final User user;
  final String accessToken;

  AuthAuthenticated({
    required this.user,
    required this.accessToken,
  });
}

/// State khi đang loading (login, logout, check auth)
class AuthLoading extends AuthState {}

/// State khi token đã hết hạn và cần refresh
class AuthExpired extends AuthState {
  final String message;

  AuthExpired({this.message = 'Phiên đăng nhập đã hết hạn'});
}

/// State khi có lỗi xảy ra
class AuthError extends AuthState {
  final String message;

  AuthError({required this.message});
}

/// State khi yêu cầu Two-Factor Authentication
class AuthTwoFactorRequired extends AuthState {
  final String tempToken;
  final String method; // 'totp' or 'email'
  final String message;
  final String? error;

  AuthTwoFactorRequired({
    required this.tempToken,
    this.method = 'totp',
    this.message = 'Enter code from your authenticator app',
    this.error,
  });

  AuthTwoFactorRequired copyWith({String? error}) {
    return AuthTwoFactorRequired(
      tempToken: tempToken,
      method: method,
      message: message,
      error: error ?? this.error,
    );
  }
}
