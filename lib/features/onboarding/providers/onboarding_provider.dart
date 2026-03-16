import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Key dùng trong SharedPreferences để lưu trạng thái đã hoàn thành onboarding hay chưa.
const String onboardingCompletedKey = 'onboarding_completed';

/// Provider bọc một [ValueNotifier<bool>] để các screen có thể listen
/// trạng thái onboarding một cách đơn giản.
///
/// Trong `main.dart` giá trị này sẽ được override bằng instance
/// đã được load từ `SharedPreferences`.
final onboardingNotifierProvider = Provider<ValueNotifier<bool>>((ref) {
  return ValueNotifier<bool>(false);
});

