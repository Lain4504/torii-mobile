import '../../../data/models/auth_model.dart';

sealed class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthUnauthenticated extends AuthState {
  final String? message;
  AuthUnauthenticated({this.message});
}

class AuthAuthenticated extends AuthState {
  final User user;
  final String accessToken;

  AuthAuthenticated({
    required this.user,
    required this.accessToken,
  });
}

class AuthTwoFactorRequired extends AuthState {
  final String tempToken;
  final String method;
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

class AuthError extends AuthState {
  final String message;

  AuthError({required this.message});
}

class AuthVerifyOTPRequired extends AuthState {
  final String email;
  final String message;

  AuthVerifyOTPRequired({required this.email, required this.message});
}

class AuthResetPasswordRequired extends AuthState {
  final String tempToken;
  final String email;

  AuthResetPasswordRequired({required this.tempToken, required this.email});
}
