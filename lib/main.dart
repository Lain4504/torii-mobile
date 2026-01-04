import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:firebase_core/firebase_core.dart'; // Removed
// import 'firebase_options.dart'; // Removed
import 'app/app.dart';
import 'features/auth/providers/auth_providers.dart';
import 'core/lifecycle/app_lifecycle_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Firebase (Removed)
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );<bos>
  
  runApp(
    const ProviderScope(
      child: AuthInitializer(
        child: AppLifecycleObserver(
          child: ToriiApp(),
        ),
      ),
    ),
  );
}

/// Widget để check auth status khi app khởi động
class AuthInitializer extends ConsumerStatefulWidget {
  final Widget child;

  const AuthInitializer({super.key, required this.child});

  @override
  ConsumerState<AuthInitializer> createState() => _AuthInitializerState();
}

class _AuthInitializerState extends ConsumerState<AuthInitializer> {
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    // Delay initialization until after widget tree is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeAuth();
    });
  }

  Future<void> _initializeAuth() async {
    await ref.read(authStateProvider.notifier).initializeAuth();
    if (mounted) {
      setState(() {
        _initialized = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_initialized) {
      // Show loading screen khi đang khởi tạo
      return const MaterialApp(
        home: Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }

    return widget.child;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // This class is superseded by ToriiApp but kept to avoid breaking references.
    return const ToriiApp();
  }
}

