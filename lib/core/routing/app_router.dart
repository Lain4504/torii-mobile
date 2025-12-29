import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/views/pages/login_page.dart';
import '../../features/auth/views/pages/register_page.dart';
import '../../features/course/views/pages/course_list_page.dart';
import '../../features/dashboard/views/dashboard_page.dart';
import '../../features/exam/views/pages/exam_page.dart';
import '../../features/flashcard/views/pages/flashcard_page.dart';
import '../../features/live_class/views/pages/live_class_page.dart';
import '../../features/onboarding/views/pages/onboarding_page.dart';
import '../../features/payment/views/pages/payment_page.dart';

class AppRouter {
  AppRouter._();

  static final _router = GoRouter(
    redirect: (context, state) async {
      final prefs = await SharedPreferences.getInstance();
      final onboardingCompleted = prefs.getBool('onboarding_completed') ?? false;
      final isOnboarding = state.matchedLocation == '/onboarding';
      
      if (!onboardingCompleted && !isOnboarding) {
        return '/onboarding';
      }
      
      if (onboardingCompleted && isOnboarding) {
        return '/';
      }
      
      return null;
    },
    routes: [
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingPage(),
      ),
      GoRoute(
        path: '/',
        builder: (context, state) => const DashboardPage(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        path: '/courses',
        builder: (context, state) => const CourseListPage(),
      ),
      GoRoute(
        path: '/live-classes',
        builder: (context, state) => const LiveClassPage(),
      ),
      GoRoute(
        path: '/exams',
        builder: (context, state) => const ExamPage(),
      ),
      GoRoute(
        path: '/flashcards',
        builder: (context, state) => const FlashcardPage(),
      ),
      GoRoute(
        path: '/payments',
        builder: (context, state) => const PaymentPage(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(child: Text('Route error: ${state.error ?? 'unknown'}')),
    ),
  );

  static GoRouter get config => _router;
}
