import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:torii_app/features/auth/providers/auth_providers.dart';
import 'package:torii_app/features/auth/models/auth_state_sealed.dart';
import 'package:torii_app/features/auth/views/pages/login_page.dart';
import 'package:torii_app/features/auth/views/pages/register_page.dart';
import 'package:torii_app/features/auth/views/pages/forgot_password_page.dart';
import 'package:torii_app/features/auth/views/pages/verify_otp_page.dart';
import 'package:torii_app/features/auth/views/pages/reset_password_page.dart';
import 'package:torii_app/features/auth/views/pages/two_factor_verify_page.dart';
import 'package:torii_app/features/course/views/pages/course_list_page.dart';
import 'package:torii_app/features/course/views/pages/course_detail_page.dart';
import 'package:torii_app/features/course/views/pages/payment_page.dart';
import 'package:torii_app/features/dashboard/views/pages/home_page.dart';
import 'package:torii_app/features/dashboard/views/pages/dashboard_page.dart';
import 'package:torii_app/features/course/views/pages/my_learning_page.dart';
import 'package:torii_app/features/exam/views/pages/exam_list_page.dart';
import 'package:torii_app/features/exam/views/pages/exam_taking_page.dart';
import 'package:torii_app/features/exam/models/exam_model.dart';
import 'package:torii_app/features/flashcard/views/pages/flashcard_list_page.dart';
import 'package:torii_app/features/flashcard/views/pages/flashcard_practice_page.dart';
import 'package:torii_app/features/flashcard/models/flashcard_model.dart';
import 'package:torii_app/features/course/views/pages/lesson_page.dart';
import 'package:torii_app/features/course/models/lesson_model.dart';
import 'package:torii_app/features/live_class/views/pages/live_class_schedule_page.dart';
import 'package:torii_app/features/onboarding/views/pages/onboarding_page.dart';
import 'package:torii_app/features/settings/views/pages/settings_page.dart';
import 'package:torii_app/features/community/views/pages/post_list_page.dart';
import 'package:torii_app/features/community/views/pages/post_detail_page.dart';
import 'package:torii_app/features/community/models/post_model.dart';
import 'package:torii_app/features/settings/views/pages/profile_edit_page.dart';
import 'package:torii_app/features/settings/views/pages/security_settings_page.dart';
import 'package:torii_app/core/widgets/app_shell.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authNotifier = ValueNotifier<AuthState>(ref.read(authStateProvider));
  
  ref.listen(authStateProvider, (_, next) {
    authNotifier.value = next;
  });

  return GoRouter(
    navigatorKey: AppRouter.rootNavigatorKey,
    refreshListenable: authNotifier,
    debugLogDiagnostics: kDebugMode,
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

      debugPrint('AppRouter Redirect Check: Location=$requestedLocation, AuthState=$authState');

      // PRIORITY 1: Handle 2FA Requirement
      if (authState is AuthTwoFactorRequired) {
        if (requestedLocation != '/auth/verify-2fa') {
          return '/auth/verify-2fa';
        }
        return null;
      }



      // Kiểm tra route có protected không
      final isProtectedRoute = AppRouter.protectedRoutes.contains(requestedLocation);
      final isLoginPage = requestedLocation == '/login';
      final isRegisterPage = requestedLocation == '/register';
      final isVerify2FAPage = requestedLocation == '/auth/verify-2fa';

      // Nếu user chưa login và cố vào protected route -> redirect login
      if (!isAuthenticated && isProtectedRoute) {
        return '/login?redirect=${Uri.encodeComponent(requestedLocation)}';
      }

      // Nếu user đã login và cố vào login/register/verify-2fa page -> redirect home
      if (isAuthenticated && (isLoginPage || isRegisterPage || isVerify2FAPage)) {
        return '/';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingPage(),
      ),
      ShellRoute(
        navigatorKey: AppRouter.shellNavigatorKey,
        builder: (context, state, child) {
          return AppShell(state: state, child: child);
        },
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) {
              final authState = ref.watch(authStateProvider);

              
              if (authState is AuthAuthenticated) {
                return const DashboardPage();
              }
              return const HomePage();
            },
          ),
          GoRoute(
            path: '/my-learning',
            builder: (context, state) => const MyLearningPage(),
          ),
          GoRoute(
            path: '/community',
            builder: (context, state) => const PostListPage(),
            routes: [
              GoRoute(
                path: ':id',
                builder: (context, state) {
                   final post = state.extra as Post?;
                   final id = state.pathParameters['id'] ?? '';
                   return PostDetailPage(postId: id, post: post);
                },
              ),
            ],
          ),
          GoRoute(
            path: '/courses',
            builder: (context, state) => const CourseCatalogPage(),
            routes: [
              GoRoute(
                path: ':id',
                parentNavigatorKey: AppRouter.rootNavigatorKey,
                builder: (context, state) {
                  final courseId = state.pathParameters['id'] ?? '';
                  return CourseDetailPage(courseId: courseId);
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
        path: '/auth/forgot-password',
        parentNavigatorKey: AppRouter.rootNavigatorKey,
        builder: (context, state) => const ForgotPasswordPage(),
      ),
      GoRoute(
        path: '/auth/verify-otp',
        parentNavigatorKey: AppRouter.rootNavigatorKey,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>? ?? {};
          return VerifyOTPPage(
            email: extra['email'] as String? ?? '',
          );
        },
      ),
      GoRoute(
        path: '/auth/reset-password',
        parentNavigatorKey: AppRouter.rootNavigatorKey,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>? ?? {};
          return ResetPasswordPage(
            email: extra['email'] as String? ?? '',
            token: extra['token'] as String? ?? '',
          );
        },
      ),
      GoRoute(
        path: '/auth/verify-2fa',
        parentNavigatorKey: AppRouter.rootNavigatorKey,
        builder: (context, state) => const TwoFactorVerifyPage(),
      ),
      GoRoute(
        path: '/exams/take',
        parentNavigatorKey: AppRouter.rootNavigatorKey,
        builder: (context, state) {
           final exam = state.extra as Exam?;
           return ExamTakingPage(exam: exam);
        },
      ),
      GoRoute(
        path: '/flashcards/practice',
        parentNavigatorKey: AppRouter.rootNavigatorKey,
        builder: (context, state) {
           final deck = state.extra as FlashcardDeck?;
           return FlashcardPracticePage(deck: deck);
        },
      ),
      GoRoute(
        path: '/payment',
        parentNavigatorKey: AppRouter.rootNavigatorKey,
        builder: (context, state) => const PaymentPage(),
      ),
      GoRoute(
        path: '/settings',
        parentNavigatorKey: AppRouter.rootNavigatorKey,
        builder: (context, state) => const SettingsPage(),
        routes: [
          GoRoute(
            path: 'profile/edit',
            builder: (context, state) => const ProfileEditPage(),
          ),
          GoRoute(
            path: 'security',
            builder: (context, state) => const SecuritySettingsPage(),
          ),
        ],
      ),
      GoRoute(
        path: '/learning/:courseId/:lessonId',
        parentNavigatorKey: AppRouter.rootNavigatorKey,
        builder: (context, state) {
          final courseId = state.pathParameters['courseId'] ?? '';
          final lessonId = state.pathParameters['lessonId'] ?? '';
          final lesson = state.extra as Lesson?;
          return LessonPage(courseId: courseId, lessonId: lessonId, lesson: lesson);
        },
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(child: Text('Route error: ${state.error ?? 'unknown'}')),
    ),
  );
});

class AppRouter {
  AppRouter._();

  static final rootNavigatorKey = GlobalKey<NavigatorState>();
  static final shellNavigatorKey = GlobalKey<NavigatorState>();

  static const protectedRoutes = [
  ];

  static const publicRoutes = [
    '/',
    '/login',
    '/register',
    '/courses',
    '/onboarding',
    '/auth/forgot-password',
    '/auth/verify-otp',
    '/auth/reset-password',
    '/auth/verify-2fa',
  ];
}



