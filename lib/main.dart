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
import 'package:firebase_core/firebase_core.dart';
import 'package:torii_app/services/notification_service.dart';

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
  // Integrated ProviderContainer for early service initialization
  final container = ProviderContainer(
    overrides: [
      sharedPreferencesProvider.overrideWithValue(sharedPrefs),
      onboardingNotifierProvider.overrideWithValue(onboardingNotifier),
      databaseProvider.overrideWithValue(database),
      tokenServiceProvider.overrideWithValue(tokenService),
      userServiceProvider.overrideWithValue(userService),
    ],
  );
  
  // Initialize Firebase (required: GoogleService-Info.plist in ios/Runner/)
  // Without it, iOS app crashes with white screen on launch.
  try {
    await Firebase.initializeApp();
    final notificationService = container.read(notificationServiceProvider);
    await notificationService.initialize();
  } catch (e, st) {
    // Firebase/Notification init failed (e.g. missing GoogleService-Info.plist on iOS).
    // App will still run but push notifications won't work.
    debugPrint('Firebase/Notification init failed: $e\n$st');
  }

  // Remove splash screen now that data is ready
  FlutterNativeSplash.remove();

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const ToriiApp(),
    ),
  );
}
