import 'dart:async';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../features/auth/providers/auth_providers.dart';

final notificationServiceProvider = Provider<NotificationService>((ref) {
  return NotificationService(ref: ref);
});

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using otherwise they will throw an error.
  await Firebase.initializeApp();
  print("NotificationService: Handling a background message: ${message.messageId}");
}

class NotificationService {
  NotificationService({required this.ref});

  final Ref ref;
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  // Stream controller to broadcast notification tap events
  final _notificationTapController = StreamController<RemoteMessage>.broadcast();
  Stream<RemoteMessage> get onNotificationTap => _notificationTapController.stream;

  /// Không dùng [FirebaseMessaging.instance] ở field initializer — nếu chưa cấu hình Firebase
  /// (iOS: GoogleService-Info.plist; Android: google-services.json) thì [Firebase.apps] rỗng / lỗi [core/no-app].
  static bool get _firebaseReady => Firebase.apps.isNotEmpty;

  Future<void> initialize() async {
    if (!_firebaseReady) {
      debugPrint(
        'NotificationService: bỏ qua FCM (Firebase chưa init — cấu hình iOS/Android khi cần push).',
      );
      return;
    }

    final fcm = FirebaseMessaging.instance;

    // 1. Request permissions (especially for iOS and Android 13+)
    NotificationSettings settings = await fcm.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      debugPrint('NotificationService: User granted permission');
    } else {
      debugPrint(
        'NotificationService: User declined or has not accepted permission',
      );
    }

    // 2. Setup Local Notifications
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    
    const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await _localNotifications.initialize(
      settings: initializationSettings,
      onDidReceiveNotificationResponse: (details) {
        // Handle notification tap
        debugPrint('NotificationService: Notification tapped: ${details.payload}');
      },
    );

    // 3. Handle foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      debugPrint('NotificationService: Got a message whilst in the foreground!');
      _showLocalNotification(message);
    });

    // 4. Handle background/terminated state messages
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      debugPrint(
        'NotificationService: A new onMessageOpenedApp event was published!',
      );
      _notificationTapController.add(message);
    });

    // 5. Check for initial message (app opened from terminated state)
    _handleInitialMessage();

    // 6. Setup Token refresh listener
    fcm.onTokenRefresh.listen((token) {
      debugPrint('NotificationService: FCM Token refreshed');
      registerToken(token: token);
    });

    // Initial token registration will be handled manually when user is logged in
    // or on app start if already logged in.
    _checkAndRegisterToken();
  }

  Future<void> _handleInitialMessage() async {
    RemoteMessage? initialMessage = await _fcm.getInitialMessage();
    if (initialMessage != null) {
      print('NotificationService: App opened from terminated state via notification');
      _notificationTapController.add(initialMessage);
    }
  }

  Future<void> _checkAndRegisterToken() async {
    // Wait a bit for auth state to be ready
    await Future.delayed(const Duration(seconds: 2));
    final authState = ref.read(authNotifierProvider);
    if (authState.value?.isAuthenticated ?? false) {
      await registerToken();
    }
  }

  Future<void> registerToken({String? token}) async {
    try {
      if (!_firebaseReady) {
        debugPrint(
          'NotificationService: Skip registerToken — Firebase chưa cấu hình (iOS/Android).',
        );
        return;
      }

      final authState = ref.read(authNotifierProvider);
      if (!(authState.value?.isAuthenticated ?? false)) {
        debugPrint('NotificationService: Skip registration, user not authenticated');
        return;
      }

      final fcm = FirebaseMessaging.instance;
      final fcmToken = token ?? await fcm.getToken();
      if (fcmToken == null) return;

      debugPrint('NotificationService: Registering FCM Token: $fcmToken');

      final deviceInfo = DeviceInfoPlugin();
      String? deviceName;
      String platform = Platform.isAndroid ? 'android' : 'ios';

      try {
        if (Platform.isAndroid) {
          final androidInfo = await deviceInfo.androidInfo;
          deviceName = '${androidInfo.manufacturer} ${androidInfo.model}';
        } else if (Platform.isIOS) {
          final iosInfo = await deviceInfo.iosInfo;
          deviceName = iosInfo.name;
        }
      } catch (e) {
        debugPrint('NotificationService: Error getting device info: $e');
      }

      final apiClient = ref.read(apiClientProvider);
      
      await apiClient.client.post('/api/notifications/register-token', data: {
        'token': fcmToken,
        'platform': platform,
        'deviceName': deviceName,
      });
      
      debugPrint(
        'NotificationService: Device token registered with backend successfully',
      );
    } catch (e) {
      debugPrint('NotificationService: Error registering device token: $e');
    }
  }

  Future<void> _showLocalNotification(RemoteMessage message) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      channelDescription: 'This channel is used for important notifications.',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: true,
    );
    
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
        
    await _localNotifications.show(
      id: message.hashCode,
      title: message.notification?.title,
      body: message.notification?.body,
      notificationDetails: platformChannelSpecifics,
      payload: message.data.toString(),
    );
  }
}
