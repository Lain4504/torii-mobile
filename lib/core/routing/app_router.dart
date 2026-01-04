import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/providers/auth_providers.dart';
import '../../features/auth/models/auth_state_sealed.dart';
import '../../features/auth/views/pages/login_page.dart';
import '../../features/auth/views/pages/register_page.dart';
import '../../features/course/views/pages/course_list_page.dart';
import '../../features/course/views/pages/course_detail_page.dart';
import '../../features/course/models/course_model.dart';
import '../../features/dashboard/views/pages/home_page.dart';
import '../../features/exam/views/pages/exam_list_page.dart';
import '../../features/exam/views/pages/exam_taking_page.dart';
import '../../features/exam/models/exam_model.dart';
import '../../features/flashcard/views/pages/flashcard_list_page.dart';
import '../../features/flashcard/views/pages/flashcard_practice_page.dart';
import '../../features/flashcard/models/flashcard_model.dart';
import '../../features/live_class/views/pages/live_class_schedule_page.dart';
import '../../features/onboarding/views/pages/onboarding_page.dart';
import '../widgets/app_shell.dart';

class AppRouter {
  AppRouter._();

  /// Protected routes - yêu cầu authentication
  static const protectedRoutes = [
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
          return '/login?redirect=${Uri.encodeComponent(requestedLocation)}';
        }

        // GIỚI HẠN TÍNH NĂNG: Nếu user PENDING và cố vào protected route -> redirect home
        if (isAuthenticated && authState.user.status == 'pending' && isProtectedRoute) {
          return '/'; 
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
        ShellRoute(
          builder: (context, state, child) {
            return AppShell(state: state, child: child);
          },
          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => const HomePage(),
            ),
            GoRoute(
              path: '/courses',
              builder: (context, state) => const CourseCatalogPage(),
              routes: [
                GoRoute(
                  path: ':id',
                  builder: (context, state) {
                    final course = state.extra as Course;
                    return CourseDetailPage(course: course);
                  },
                ),
              ],
            ),
            GoRoute(
              path: '/exams',
              builder: (context, state) => const ExamListPage(),
            ),
            GoRoute(
              path: '/flashcards',
              builder: (context, state) => const FlashcardListPage(),
            ),
            GoRoute(
              path: '/live-schedule',
              builder: (context, state) => const LiveClassSchedulePage(),
            ),
          ],
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
          path: '/exams/take',
          builder: (context, state) {
             final exam = state.extra as Exam?;
             return ExamTakingPage(exam: exam);
          },
        ),
        GoRoute(
          path: '/flashcards/practice',
          builder: (context, state) {
             final deck = state.extra as FlashcardDeck?;
             return FlashcardPracticePage(deck: deck);
          },
        ),
      ],
      errorBuilder: (context, state) => Scaffold(
        body: Center(child: Text('Route error: ${state.error ?? 'unknown'}')),
      ),
    );
  }
}



