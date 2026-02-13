// Notification Sound Service
// Plays notification sound for join/leave/poll etc. (matches web audio notification)
// Add assets/sounds/notification.mp3 for a custom sound; optional.

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';

class NotificationSoundService {
  NotificationSoundService._();
  static final NotificationSoundService _instance = NotificationSoundService._();
  static NotificationSoundService get instance => _instance;

  /// Path relative to pubspec assets (e.g. sounds/notification.mp3)
  static const String _assetPath = 'sounds/notification.mp3';
  final AudioPlayer _player = AudioPlayer();

  /// Play notification sound (fire-and-forget; catches errors if asset missing)
  Future<void> play() async {
    try {
      await _player.play(AssetSource(_assetPath));
    } catch (e) {
      if (kDebugMode) {
        print('NotificationSoundService: Could not play sound - $e');
      }
    }
  }

  void dispose() {
    _player.dispose();
  }
}
