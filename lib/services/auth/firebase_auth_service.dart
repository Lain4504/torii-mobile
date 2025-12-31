import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

/// Service wrapper around Firebase Authentication
/// Provides methods for email/password authentication with Firebase
class FirebaseAuthService {
  final firebase_auth.FirebaseAuth _firebaseAuth;

  FirebaseAuthService({firebase_auth.FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;

  /// Get current Firebase user
  firebase_auth.User? get currentUser => _firebaseAuth.currentUser;

  /// Stream of auth state changes
  Stream<firebase_auth.User?> get authStateChanges =>
      _firebaseAuth.authStateChanges();

  /// Sign in with email and password
  /// Returns the Firebase User on success, throws FirebaseAuthException on error
  Future<firebase_auth.User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final credential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    if (credential.user == null) {
      throw firebase_auth.FirebaseAuthException(
        code: 'user-not-found',
        message: 'No user found after sign in',
      );
    }

    return credential.user!;
  }

  /// Create user with email and password
  /// Returns the Firebase User on success, throws FirebaseAuthException on error
  Future<firebase_auth.User> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String displayName,
  }) async {
    final credential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    if (credential.user == null) {
      throw firebase_auth.FirebaseAuthException(
        code: 'user-creation-failed',
        message: 'Failed to create user',
      );
    }

    // Update display name
    await credential.user!.updateDisplayName(displayName);
    await credential.user!.reload();

    return _firebaseAuth.currentUser!;
  }

  /// Sign out
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  /// Get Firebase ID token for API authentication
  /// [forceRefresh] - if true, forces token refresh even if not expired
  Future<String?> getIdToken({bool forceRefresh = false}) async {
    final user = _firebaseAuth.currentUser;
    if (user == null) return null;

    return await user.getIdToken(forceRefresh);
  }

  /// Send password reset email
  Future<void> sendPasswordResetEmail(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  /// Reload current user data
  Future<void> reloadUser() async {
    await _firebaseAuth.currentUser?.reload();
  }
}
