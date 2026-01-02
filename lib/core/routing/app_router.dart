import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/providers/auth_providers.dart';
import '../../features/auth/models/auth_state_sealed.dart';
import '../../features/auth/views/pages/login_page.dart';
import '../../features/auth/views/pages/register_page.dart';
import '../../features/course/views/pages/course_list_page.dart';
import '../../features/dashboard/views/pages/dashboard_page.dart';
import '../../features/exam/views/pages/exam_page.dart';
import '../../features/flashcard/views/pages/flashcard_page.dart';
import '../../features/live_class/views/pages/live_class_page.dart';
import '../../features/onboarding/views/pages/onboarding_page.dart';
import '../../features/payment/views/pages/payment_page.dart';

class AppRouter {
  AppRouter._();

  /// Protected routes - yêu cầu authentication
  static const protectedRoutes = [
    '/live-classes',
    '/exams',
    '/flashcards',
    '/payments',
  ];

  /// Public routes - không yêu cầu authentication
  static const publicRoutes = [
    '/',
    '/login',
    '/register',
    '/courses',
    '/onboarding',
  ];

  static GoRouter config(WidgetRef ref) {
    return GoRouter(
      redirect: (context, state) async {
        final prefs = await SharedPreferences.getInstance();
        final onboardingCompleted = prefs.getBool('onboarding_completed') ?? false;
        final isOnboarding = state.matchedLocation == '/onboarding';

        // Onboarding check
        if (!onboardingCompleted && !isOnboarding) {
          return '/onboarding';
        }

        if (onboardingCompleted && isOnboarding) {
          return '/';
        }

        // Auth check
        final authState = ref.read(authStateProvider);
        final isAuthenticated = authState is AuthAuthenticated;
        final requestedLocation = state.matchedLocation;

        // Kiểm tra route có protected không
        final isProtectedRoute = protectedRoutes.contains(requestedLocation);
        final isLoginPage = requestedLocation == '/login';
        final isRegisterPage = requestedLocation == '/register';

        // Nếu user chưa login và cố vào protected route -> redirect login
        if (!isAuthenticated && isProtectedRoute) {
          // Lưu intended destination để redirect sau khi login
          return '/login?redirect=${Uri.encodeComponent(requestedLocation)}';
        }

        // Nếu user đã login và cố vào login/register page -> redirect home
        if (isAuthenticated && (isLoginPage || isRegisterPage)) {
          return '/';
        }

        return null; // Cho phép navigation
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
          builder: (context, state) {
            final redirect = state.uri.queryParameters['redirect'];
            return LoginPage(redirectTo: redirect);
          },
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
  }
}

