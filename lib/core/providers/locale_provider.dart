import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../providers/shared_prefs_provider.dart';

final localeProvider = NotifierProvider<LocaleNotifier, Locale>(
  LocaleNotifier.new,
);

class LocaleNotifier extends Notifier<Locale> {
  static const _localeKey = 'app_locale';

  @override
  Locale build() {
    final prefs = ref.watch(sharedPreferencesProvider);
    return _getInitialLocale(prefs);
  }

  static Locale _getInitialLocale(SharedPreferences prefs) {
    final savedLocaleCode = prefs.getString(_localeKey);
    if (savedLocaleCode == null) {
      // Return system locale or default to English
      return const Locale('en');
    }
    
    // Parse saved locale code (e.g., "en", "vi")
    final parts = savedLocaleCode.split('_');
    if (parts.length == 1) {
      return Locale(parts[0]);
    } else if (parts.length == 2) {
      return Locale(parts[0], parts[1]);
    }
    
    return const Locale('en');
  }

  Future<void> setLocale(Locale locale) async {
    state = locale;
    // Save locale code (e.g., "en", "vi", "en_US")
    final prefs = ref.read(sharedPreferencesProvider);
    final localeCode = locale.countryCode != null
        ? '${locale.languageCode}_${locale.countryCode}'
        : locale.languageCode;
    await prefs.setString(_localeKey, localeCode);
  }

  // Helper method to set locale by language code
  Future<void> setLocaleByCode(String languageCode) async {
    await setLocale(Locale(languageCode));
  }
}
