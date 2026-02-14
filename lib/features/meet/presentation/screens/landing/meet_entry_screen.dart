import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'meet_login_screen.dart';
import 'join_meeting_screen.dart';
import '../room/meeting_room_screen.dart';
import '../../../providers/session_provider.dart';

/// Meet Entry Screen - Wrapper matching web flow
/// - No token → MeetLoginScreen (form to get token via getJoinToken)
/// - Has token → JoinMeetingScreen (device preview + Join form)
/// Token can come from: route extra (deep link), or from MeetLoginScreen success.
class MeetEntryScreen extends ConsumerStatefulWidget {
  /// Initial token from route extra (e.g. deep link ?access_token=)
  final String? initialToken;

  const MeetEntryScreen({super.key, this.initialToken});

  @override
  ConsumerState<MeetEntryScreen> createState() => _MeetEntryScreenState();
}

class _MeetEntryScreenState extends ConsumerState<MeetEntryScreen> {
  /// Token obtained from MeetLoginScreen (when no initial token)
  String? _loginToken;

  String? get _effectiveToken => widget.initialToken ?? _loginToken;

  void _onLoginSuccess(String token) {
    setState(() => _loginToken = token);
  }

  @override
  Widget build(BuildContext context) {
    final isStartup = ref.watch(sessionProvider.select((s) => s.isStartup));

    if (!isStartup) {
      return const MeetingRoomScreen();
    }

    if (_effectiveToken != null && _effectiveToken!.isNotEmpty) {
      return JoinMeetingScreen(initialToken: _effectiveToken!);
    }
    return MeetLoginScreen(onLoginSuccess: _onLoginSuccess);
  }
}
