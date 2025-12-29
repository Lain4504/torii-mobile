import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/legacy.dart';
import '../../../data/repositories/auth_repository.dart';
import '../../../services/storage/secure_storage_service.dart';
import 'auth_state_notifier.dart';

/// Provider cho SecureStorageService (singleton)
final secureStorageProvider = Provider<SecureStorageService>((ref) {
  return SecureStorageService();
});

/// Provider cho AuthRepository (singleton)
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});

/// Provider cho AuthStateNotifier
final authStateProvider = StateNotifierProvider<AuthStateNotifier, AuthState>(
  (ref) {
    final authRepository = ref.watch(authRepositoryProvider);
    final secureStorage = ref.watch(secureStorageProvider);
    return AuthStateNotifier(authRepository, secureStorage);
  },
);
