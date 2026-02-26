import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../screens/landing/join_meeting_screen.dart';
import '../screens/room/meeting_room_screen.dart';
import '../../providers/session_provider.dart';

/// Meet App - Main application wrapper
/// 1:1 clone of apps/meet/src/components/app/index.tsx
class MeetApp extends ConsumerWidget {
  const MeetApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isStartup = ref.watch(sessionProvider.select((s) => s.isStartup));
    
    return MaterialApp(
      title: 'Torii Meet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.dark(
          primary: const Color(0xFF1976D2),
          secondary: const Color(0xFFFF4081),
          surface: const Color(0xFF1E1E1E),
        ),
        scaffoldBackgroundColor: const Color(0xFF121212),
      ),
      home: isStartup ? const JoinMeetingScreen() : const MeetingRoomScreen(),
    );
  }
}
