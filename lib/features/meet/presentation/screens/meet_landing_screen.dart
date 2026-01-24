import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:torii_app/features/meet/presentation/providers/meet_provider.dart';
import 'package:torii_app/features/meet/presentation/widgets/join_meet_form.dart';

class MeetLandingScreen extends ConsumerWidget {
  const MeetLandingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Listen for connection success to navigate to full-screen meeting
    ref.listen<MeetState>(meetControllerProvider, (previous, next) {
      if (next.status == MeetStatus.connected && 
          (previous == null || previous.status != MeetStatus.connected)) {
        context.push('/meeting');
      }
    });

    return const Scaffold(
      backgroundColor: Color(0xFF0F0F1A),
      body: JoinMeetForm(),
    );
  }
}
