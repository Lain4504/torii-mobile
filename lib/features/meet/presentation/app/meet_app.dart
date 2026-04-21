import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/theme/app_theme.dart';
import 'package:torii_app/core/theme/theme_provider.dart';
import '../screens/landing/join_meeting_screen.dart';
import '../screens/room/meeting_room_screen.dart';
import '../../providers/session_provider.dart';

/// Meet App - Main application wrapper
class MeetApp extends ConsumerWidget {
  const MeetApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isStartup = ref.watch(sessionProvider.select((s) => s.isStartup));
    
    final themeMode = ref.watch(themeModeProvider);
    
    return MaterialApp(
      title: 'Torii Meet',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeMode,
      home: isStartup ? const JoinMeetingScreen() : const MeetingRoomScreen(),
    );
  }
}
