import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Key used in SharedPreferences to persist onboarding completion.
const String onboardingCompletedKey = 'onboarding_completed';

/// Provides a [ValueNotifier] for onboarding completion so the router can
/// refresh when the user completes onboarding. Initial value should be
/// overridden in main from SharedPreferences.
final onboardingNotifierProvider = Provider<ValueNotifier<bool>>((ref) {
  return ValueNotifier<bool>(false);
});
