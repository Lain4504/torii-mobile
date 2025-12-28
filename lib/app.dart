import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/course_service.dart';
import 'viewmodels/course_view_model.dart';
import 'views/onboarding/onboarding_view.dart';
import 'views/course/course_view.dart';
import 'graphql/client.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final client = createClientNotifier();

    return GraphQLProvider(
      client: client,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => CourseViewModel(
              service: CourseService(client.value),
            ),
          ),
        ],
        child: MaterialApp(
          title: 'Torii Nihongo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const _InitialScreen(),
        ),
      ),
    );
  }
}
class _InitialScreen extends StatefulWidget {
  const _InitialScreen();

  @override
  State<_InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<_InitialScreen> {
  @override
  void initState() {
    super.initState();
    _checkOnboardingStatus();
  }

  Future<void> _checkOnboardingStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final isOnboardingCompleted = prefs.getBool('onboarding_completed') ?? false;

    if (!mounted) return;

    if (isOnboardingCompleted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const CourseView()),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const OnboardingView()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

