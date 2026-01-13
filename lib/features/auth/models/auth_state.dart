
import 'package:torii_app/data/models/auth_model.dart';

enum AuthStatus { authenticated, unauthenticated, pending2FA, requiresOTP }

class AuthState {
  final AuthStatus status;
  final User? user;
  final String? tempToken; // For 2FA or Reset Password
  final String? email; // For OTP flow
  final String? error;

  const AuthState({
    this.status = AuthStatus.unauthenticated,
    this.user,
    this.tempToken,
    this.email,
    this.error,
  });

  // Convenience getters
  bool get isAuthenticated => status == AuthStatus.authenticated;

  // Factory constructors for easier state management
  factory AuthState.initial() => const AuthState(status: AuthStatus.unauthenticated);
  
  factory AuthState.authenticated(User user) => AuthState(status: AuthStatus.authenticated, user: user);
  
  factory AuthState.unauthenticated({String? error}) => AuthState(status: AuthStatus.unauthenticated, error: error);
  
  factory AuthState.pending2FA(String tempToken, {String? error}) => 
      AuthState(status: AuthStatus.pending2FA, tempToken: tempToken, error: error);

  factory AuthState.requiresOTP(String email, {String? error}) => 
      AuthState(status: AuthStatus.requiresOTP, email: email, error: error);

  AuthState copyWith({
    AuthStatus? status,
    User? user,
    String? tempToken,
    String? email,
    String? error,
  }) {
    return AuthState(
      status: status ?? this.status,
      user: user ?? this.user,
      tempToken: tempToken ?? this.tempToken,
      email: email ?? this.email,
      error: error ?? this.error,
    );
  }
}
