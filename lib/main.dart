import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/app/app.dart';
import 'package:torii_app/features/auth/providers/auth_providers.dart';
import 'package:torii_app/core/lifecycle/app_lifecycle_observer.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:torii_app/core/providers/shared_prefs_provider.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:torii_app/data/database/app_database.dart';
import 'package:torii_app/services/auth/user_service.dart';
import 'package:torii_app/services/auth/token_service.dart';
import 'package:torii_app/data/models/auth_model.dart';
import 'package:torii_app/features/auth/models/auth_state_sealed.dart';

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
  final List<dynamic> results = await Future.wait([
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeAuth();
    });
  }

  Future<void> _initializeAuth() async {
    await ref.read(authStateProvider.notifier).initializeAuth();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
