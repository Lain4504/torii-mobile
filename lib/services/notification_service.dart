import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:device_info_plus/device_info_plus.dart';
import '../features/auth/providers/auth_providers.dart';

final notificationServiceProvider = Provider<NotificationService>((ref) {
  return NotificationService(ref: ref);
});

class NotificationService {
  final Ref ref;
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotifications = FlutterLocalNotificationsPlugin();

  NotificationService({required this.ref});

  Future<void> initialize() async {
    // 1. Request permissions (especially for iOS and Android 13+)
    NotificationSettings settings = await _fcm.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('NotificationService: User granted permission');
    } else {
      print('NotificationService: User declined or has not accepted permission');
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
        print('NotificationService: Notification tapped: ${details.payload}');
      },
    );

    // 3. Handle foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('NotificationService: Got a message whilst in the foreground!');
      _showLocalNotification(message);
    });

    // 4. Handle background/terminated state messages
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('NotificationService: A new onMessageOpenedApp event was published!');
    });

    // 5. Setup Token refresh listener
    _fcm.onTokenRefresh.listen((token) {
      print('NotificationService: FCM Token refreshed');
      registerToken(token: token);
    });

    // Initial token registration will be handled manually when user is logged in
    // or on app start if already logged in.
    _checkAndRegisterToken();
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
      final authState = ref.read(authNotifierProvider);
      if (!(authState.value?.isAuthenticated ?? false)) {
        print('NotificationService: Skip registration, user not authenticated');
        return;
      }

      final fcmToken = token ?? await _fcm.getToken();
      if (fcmToken == null) return;

      print('NotificationService: Registering FCM Token: $fcmToken');

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
        print('NotificationService: Error getting device info: $e');
      }

      final apiClient = ref.read(apiClientProvider);
      
      await apiClient.client.post('/api/notifications/register-token', data: {
        'token': fcmToken,
        'platform': platform,
        'deviceName': deviceName,
      });
      
      print('NotificationService: Device token registered with backend successfully');
    } catch (e) {
      print('NotificationService: Error registering device token: $e');
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
