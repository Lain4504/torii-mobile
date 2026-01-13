
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:torii_app/features/auth/providers/auth_providers.dart';
import 'package:torii_app/features/auth/models/auth_state.dart';
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
import 'package:torii_app/features/notification/views/pages/notifications_page.dart';
import 'package:torii_app/features/search/views/pages/search_page.dart';
import 'package:torii_app/features/offline/views/pages/downloads_page.dart';
import 'package:torii_app/features/gamification/views/pages/achievements_page.dart';
import 'package:torii_app/features/course/views/pages/wishlist_page.dart';
import 'package:torii_app/features/instructor/views/pages/instructor_profile_page.dart';
import 'package:torii_app/core/widgets/app_shell.dart';

final routerProvider = Provider<GoRouter>((ref) {
  // Use ValueNotifier to bridge Riverpod state to GoRouter
  // Note: authNotifierProvider is now AsyncNotifier, so ref.watch returns AsyncValue<AuthState>
  // We initialize with what we have.
  final authStateAsync = ref.read(authNotifierProvider);
  final authNotifier = ValueNotifier<AsyncValue<AuthState>>(authStateAsync);

  // Listen to provider changes and update the notifier
  ref.listen<AsyncValue<AuthState>>(authNotifierProvider, (_, next) {
    authNotifier.value = next;
  });

  return GoRouter(
    navigatorKey: AppRouter.rootNavigatorKey,
    debugLogDiagnostics: kDebugMode,
    initialLocation: '/', // Start at root
    refreshListenable: authNotifier,
    
    redirect: (context, state) {
      final authAsync = ref.read(authNotifierProvider);

      // Template Logic: Only redirect when auth state is ready (AsyncData)
      if (authAsync is AsyncLoading || authAsync is AsyncError) return null;

      final authState = authAsync.asData?.value;
      if (authState == null) return null;

      final status = authState.status;
      final matchedLocation = state.matchedLocation;
      final isLogin = matchedLocation == '/login';
      final isRegister = matchedLocation == '/register';
      final isVerifying2FA = matchedLocation == '/auth/verify-2fa';
      
      // 1. Unauthenticated -> Force Login (except public routes)
      if (status == AuthStatus.unauthenticated) {
        // Handling Onboarding Check
        // Note: For strict template alignment, we prioritize Auth check first.
        // But we keep public route check to allow landing page access if needed.
        if (AppRouter.publicRoutes.contains(matchedLocation)) {
           return null;
        }
        return '/login';
      }

      // 2. Pending 2FA -> Force 2FA Page
      if (status == AuthStatus.pending2FA) {
        if (!isVerifying2FA) {
           return '/auth/verify-2fa';
        }
        return null;
      }

      // 3. Authenticated -> Redirect to Home if on Login/2FA
      if (status == AuthStatus.authenticated) {
        if (isLogin || isRegister || isVerifying2FA) {
           return '/';
        }
        return null; // Allow access to other pages
      }
      
      // 4. Requires OTP (Forgot Password Flow) logic
      if (status == AuthStatus.requiresOTP) {
         // Allow access to OTP verification pages
         if (matchedLocation.startsWith('/auth/')) return null;
         return '/auth/verify-otp';
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
              // Be careful watching async provider in build for logic, prefer checking value directly if needed
              // But here we rely on router to protect us.
              // Just in case, show loader if data is somehow missing in UI build
              final asyncAuth = ref.watch(authNotifierProvider);
              if (asyncAuth.value?.isAuthenticated == true) {
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
        parentNavigatorKey: AppRouter.rootNavigatorKey,
        builder: (context, state) {
          final redirect = state.uri.queryParameters['redirect'];
          return LoginPage(redirectTo: redirect);
        },
      ),
      GoRoute(
        path: '/register',
        parentNavigatorKey: AppRouter.rootNavigatorKey,
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
          return VerifyOTPPage(email: extra['email'] as String? ?? '');
        },
      ),
      GoRoute(
        path: '/auth/reset-password',
         parentNavigatorKey: AppRouter.rootNavigatorKey,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>? ?? {};
          return ResetPasswordPage(
            email: extra['email'] as String? ?? '',
            tempToken: extra['tempToken'] as String? ?? '',
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
        path: '/notifications',
        parentNavigatorKey: AppRouter.rootNavigatorKey,
        builder: (context, state) => const NotificationsPage(),
      ),
      GoRoute(
        path: '/search',
        parentNavigatorKey: AppRouter.rootNavigatorKey,
        builder: (context, state) => const SearchPage(),
      ),
      GoRoute(
        path: '/downloads',
        parentNavigatorKey: AppRouter.rootNavigatorKey,
        builder: (context, state) => const DownloadsPage(),
      ),
      GoRoute(
        path: '/achievements',
        parentNavigatorKey: AppRouter.rootNavigatorKey,
        builder: (context, state) => const AchievementsPage(),
      ),
      GoRoute(
        path: '/wishlist',
        parentNavigatorKey: AppRouter.rootNavigatorKey,
        builder: (context, state) => const WishlistPage(),
      ),
      GoRoute(
        path: '/instructor/:id',
        parentNavigatorKey: AppRouter.rootNavigatorKey,
        builder: (context, state) {
          final id = state.pathParameters['id'] ?? '';
          return InstructorProfilePage(instructorId: id);
        },
      ),
      GoRoute(
        path: '/learning/:courseId/:lessonId',
        parentNavigatorKey: AppRouter.rootNavigatorKey,
        builder: (context, state) {
          final courseId = state.pathParameters['courseId'] ?? '';
          final lessonId = state.pathParameters['lessonId'] ?? '';
          final lesson = state.extra as Lesson?;
          return LessonPage(
            courseId: courseId,
            lessonId: lessonId,
            lesson: lesson,
          );
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
    '/my-learning',
    '/settings',
    '/settings/profile/edit',
    '/settings/security',
    '/achievements',
    '/wishlist',
    '/notifications',
    '/downloads',
    '/exams/take',
    '/flashcards/practice',
    '/payment',
    '/learning/:courseId/:lessonId',
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
