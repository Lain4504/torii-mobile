import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../providers/shared_prefs_provider.dart';

final themeModeProvider = NotifierProvider<ThemeModeNotifier, ThemeMode>(() {
  return ThemeModeNotifier();
});

class ThemeModeNotifier extends Notifier<ThemeMode> {
  static const _themeKey = 'theme_mode';

  @override
  ThemeMode build() {
    final prefs = ref.watch(sharedPreferencesProvider);
    return _getInitialTheme(prefs);
  }

  static ThemeMode _getInitialTheme(SharedPreferences prefs) {
    final savedTheme = prefs.getString(_themeKey);
    if (savedTheme == null) {
      // FORCE LIGHT MODE as default, ignoring system brightness
      return ThemeMode.light;
    }
    return ThemeMode.values.firstWhere(
      (e) => e.toString() == savedTheme,
      orElse: () => ThemeMode.light, // Default to light if invalid
    );
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    state = mode;
    final prefs = ref.read(sharedPreferencesProvider);
    await prefs.setString(_themeKey, mode.toString());
  }

  Future<void> toggleTheme() async {
    ThemeMode currentMode = state;
    
    // If system, resolve actual mode from platform
    if (currentMode == ThemeMode.system) {
       final brightness = PlatformDispatcher.instance.platformBrightness;
       currentMode = brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
    }

    if (currentMode == ThemeMode.dark) {
      await setThemeMode(ThemeMode.light);
    } else {
      await setThemeMode(ThemeMode.dark);
    }
  }
}
