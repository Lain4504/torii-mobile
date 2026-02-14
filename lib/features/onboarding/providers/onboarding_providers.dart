import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers/shared_prefs_provider.dart';

final onboardingCompletedProvider = StateProvider<bool>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return prefs.getBool('onboarding_completed') ?? false;
});
