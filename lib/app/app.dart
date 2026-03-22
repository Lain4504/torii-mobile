import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../core/routing/app_router.dart';
import '../core/theme/app_theme.dart';
import '../core/theme/theme_provider.dart';

import 'package:torii_app/services/notification_service.dart';

class ToriiApp extends ConsumerStatefulWidget {
  const ToriiApp({super.key});

  @override
  ConsumerState<ToriiApp> createState() => _ToriiAppState();
}

class _ToriiAppState extends ConsumerState<ToriiApp> {
  @override
  void initState() {
    super.initState();
    _setupNotificationListener();
  }

  void _setupNotificationListener() {
    // We use a microtask to ensure the router is ready
    Future.microtask(() {
      ref.read(notificationServiceProvider).onNotificationTap.listen((message) {
        final router = ref.read(routerProvider);
        
        // Example: Navigate to notifications screen if it's a general notification
        // You can customize this based on message.data
        if (message.data['type'] == 'blog') {
           final slug = message.data['slug'];
           if (slug != null) {
              router.push('/blog-detail/$slug');
              return;
           }
        } else if (message.data['type'] == 'course') {
           final id = message.data['courseId'];
           if (id != null) {
              router.push('/course-detail/$id');
              return;
           }
        }
        
        // Default navigation
        router.push('/notifications');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeModeProvider);
    final router = ref.watch(routerProvider);
    
    return MaterialApp.router(
      title: 'Torii Nihongo',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeMode,
      locale: const Locale('vi', 'VN'),
      themeAnimationDuration: const Duration(milliseconds: 500),
      themeAnimationCurve: Curves.easeInOut,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
