import '../../../data/models/auth_model.dart';

/// Simplified auth status enum
enum AuthStatus {
  initial,        // App just started, checking auth
  unauthenticated, // No valid session
  authenticated,   // Has valid access token and user
  requires2FA,     // Login successful but needs 2FA verification
  requiresOTP,     // Forgot password flow - needs OTP verification
  loading,        // Processing an auth action
}

/// Simplified auth state - single source of truth
class AuthState {
  final AuthStatus status;
  final User? user;
  final String? tempToken;  // For 2FA verification or password reset
  final String? error;
  final String? email;      // For OTP flow

  const AuthState({
    required this.status,
    this.user,
    this.tempToken,
    this.error,
    this.email,
  });

  /// User is fully authenticated with valid session
  bool get isAuthenticated => status == AuthStatus.authenticated && user != null;

  /// Waiting for user input (2FA code or OTP)
  bool get needsUserInput => 
      status == AuthStatus.requires2FA || status == AuthStatus.requiresOTP;

  /// Currently processing an auth action
  bool get isLoading => status == AuthStatus.loading;

  /// Copy with method for easy state updates
  AuthState copyWith({
    AuthStatus? status,
    User? user,
    String? tempToken,
    String? error,
    String? email,
  }) {
    return AuthState(
      status: status ?? this.status,
      user: user ?? this.user,
      tempToken: tempToken ?? this.tempToken,
      error: error ?? this.error,
      email: email ?? this.email,
    );
  }

  /// Clear error helper
  AuthState clearError() {
    return copyWith(error: '');
  }

  /// Factory for initial unauthenticated state
  factory AuthState.unauthenticated({String? error}) {
    return AuthState(
      status: AuthStatus.unauthenticated,
      error: error,
    );
  }

  /// Factory for authenticated state
  factory AuthState.authenticated(User user) {
    return AuthState(
      status: AuthStatus.authenticated,
      user: user,
    );
  }

  /// Factory for 2FA required state
  factory AuthState.requires2FA(String tempToken, {String? message}) {
    return AuthState(
      status: AuthStatus.requires2FA,
      tempToken: tempToken,
      error: message,
    );
  }

  /// Factory for OTP required state
  factory AuthState.requiresOTP(String email) {
    return AuthState(
      status: AuthStatus.requiresOTP,
      email: email,
    );
  }

  /// Factory for loading state
  factory AuthState.loading() {
    return const AuthState(status: AuthStatus.loading);
  }

  /// Factory for initial state
  factory AuthState.initial() {
    return const AuthState(status: AuthStatus.initial);
  }

  @override
  String toString() {
    return 'AuthState(status: $status, user: ${user?.email ?? 'null'}, hasError: ${error != null})';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AuthState &&
        other.status == status &&
        other.user == user &&
        other.tempToken == tempToken &&
        other.error == error &&
        other.email == email;
  }

  @override
  int get hashCode {
    return Object.hash(status, user, tempToken, error, email);
  }
}
