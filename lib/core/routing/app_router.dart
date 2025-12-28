import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/views/pages/login_page.dart';
import '../../features/course/views/pages/course_list_page.dart';
import '../../features/dashboard/views/dashboard_page.dart';
import '../../features/exam/views/pages/exam_page.dart';
import '../../features/flashcard/views/pages/flashcard_page.dart';
import '../../features/live_class/views/pages/live_class_page.dart';
import '../../features/payment/views/pages/payment_page.dart';

class AppRouter {
  AppRouter._();

  static final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const DashboardPage(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginPage(),
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
