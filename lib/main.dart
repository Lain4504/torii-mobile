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
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:torii_app/services/notification_service.dart';
import 'dart:io' show Platform;

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
  
  // Firebase + FCM: iOS cần GoogleService-Info.plist; Android cần google-services.json + plugin.
  // Người dùng yêu cầu bỏ FCM trên iOS để build thành công.
  if (!Platform.isIOS) {
    try {
      await Firebase.initializeApp();
      if (Firebase.apps.isEmpty) {
        debugPrint('Firebase: initializeApp returned without any app — skip FCM.');
      } else {
        // Register background message handler
        FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
        
        final notificationService = container.read(notificationServiceProvider);
        await notificationService.initialize();
      }
    } catch (e, st) {
      debugPrint('Firebase/Notification init failed: $e\n$st');
    }
  } else {
    debugPrint('Firebase: Skipped initialization on iOS per user request.');
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
