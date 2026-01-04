import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/auth/providers/auth_providers.dart';
import '../../features/auth/models/auth_state_sealed.dart';

/// Widget wrapper to listen for app lifecycle changes
/// Refreshes user profile when app resumes from background
class AppLifecycleObserver extends ConsumerStatefulWidget {
  final Widget child;

  const AppLifecycleObserver({super.key, required this.child});

  @override
  ConsumerState<AppLifecycleObserver> createState() => _AppLifecycleObserverState();
}

class _AppLifecycleObserverState extends ConsumerState<AppLifecycleObserver> 
    with WidgetsBindingObserver {
  
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    
    // When app resumes from background
    if (state == AppLifecycleState.resumed) {
      debugPrint('App resumed - refreshing user profile...');
      _refreshUserProfile();
    }
  }

  Future<void> _refreshUserProfile() async {
    final authState = ref.read(authStateProvider);
    
    // Only refresh if user is authenticated
    if (authState is AuthAuthenticated) {
      try {
        // Fetch latest profile from server
        await ref.read(authStateProvider.notifier).refreshProfile();
        debugPrint('Profile refreshed successfully');
      } catch (e) {
        debugPrint('Failed to refresh profile: $e');
        // Fail silently - user can still use cached data
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
