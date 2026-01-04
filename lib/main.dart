import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:firebase_core/firebase_core.dart'; // Removed
// import 'firebase_options.dart'; // Removed
import 'app/app.dart';
import 'features/auth/providers/auth_providers.dart';
import 'core/lifecycle/app_lifecycle_observer.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'core/providers/shared_prefs_provider.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'data/database/app_database.dart';
import 'services/auth/user_service.dart';
import 'services/auth/token_service.dart';
import 'data/models/auth_model.dart';
import 'features/auth/models/auth_state_sealed.dart';

Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Pre-fetch critical data for instant app launch
  final sharedPrefs = await SharedPreferences.getInstance();
  
  // Independent Services for Pre-fetching
  final database = AppDatabase();
  final userService = UserService(database);
  final tokenService = TokenService();
  
  // Parallel Fetching
  final results = await Future.wait([
    userService.getUserProfile(),
    tokenService.getRawSession(),
  ]);
  
  final userProfile = results[0] as User?;
  final session = results[1] as AuthSessionData?;
  
  // Determine Initial Auth State
  AuthState initialAuthState = AuthUnauthenticated();
  if (userProfile != null && session != null) {
    debugPrint('Hydrated User: ${userProfile.email}');
    initialAuthState = AuthAuthenticated(user: userProfile, accessToken: session.accessToken);
  }

  // Remove splash screen now that data is ready
  FlutterNativeSplash.remove();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPrefs),
        databaseProvider.overrideWithValue(database),
        tokenServiceProvider.overrideWithValue(tokenService),
        userServiceProvider.overrideWithValue(userService),
        initialAuthStateProvider.overrideWithValue(initialAuthState),
      ],
      child: const AuthInitializer(
        child: AppLifecycleObserver(
          child: ToriiApp(),
        ),
      ),
    ),
  );
}

/// Widget để check auth status khi app khởi động
class AuthInitializer extends ConsumerStatefulWidget {
  final Widget child;

  const AuthInitializer({super.key, required this.child});

  @override
  ConsumerState<AuthInitializer> createState() => _AuthInitializerState();
}

class _AuthInitializerState extends ConsumerState<AuthInitializer> {
  @override
  void initState() {
    super.initState();
    // Delay initialization until after widget tree is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeAuth();
    });
  }

  Future<void> _initializeAuth() async {
    // Fire and forget, auth state update will be handled by Riverpod
    await ref.read(authStateProvider.notifier).initializeAuth();
  }

  @override
  Widget build(BuildContext context) {
    // No blocking "initialized" check anymore
    return widget.child;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // This class is superseded by ToriiApp but kept to avoid breaking references.
    return const ToriiApp();
  }
}

