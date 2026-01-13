import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../providers/shared_prefs_provider.dart';

final themeModeProvider = StateNotifierProvider<ThemeModeNotifier, ThemeMode>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return ThemeModeNotifier(prefs);
});

class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  final SharedPreferences _prefs;
  static const _themeKey = 'theme_mode';

  ThemeModeNotifier(this._prefs) : super(_getInitialTheme(_prefs));

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
    await _prefs.setString(_themeKey, mode.toString());
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
