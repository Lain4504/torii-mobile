import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/app/app.dart';
import 'package:torii_app/features/auth/providers/auth_providers.dart';
import 'package:torii_app/features/onboarding/providers/onboarding_provider.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:torii_app/core/providers/shared_prefs_provider.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:torii_app/data/database/app_database.dart';
import 'package:torii_app/services/auth/user_service.dart';
import 'package:torii_app/services/auth/token_service.dart';

Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Pre-fetch critical data for instant app launch
  final sharedPrefs = await SharedPreferences.getInstance();
  final onboardingCompleted = sharedPrefs.getBool(onboardingCompletedKey) ?? false;
  final onboardingNotifier = ValueNotifier<bool>(onboardingCompleted);

  // Independent Services for Pre-fetching
  final database = AppDatabase();
  final userService = UserService(database);
  final tokenService = TokenService();

  // Remove splash screen now that data is ready
  FlutterNativeSplash.remove();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPrefs),
        onboardingNotifierProvider.overrideWithValue(onboardingNotifier),
        databaseProvider.overrideWithValue(database),
        tokenServiceProvider.overrideWithValue(tokenService),
        userServiceProvider.overrideWithValue(userService),
      ],
      child: const ToriiApp(),
    ),
  );
}
