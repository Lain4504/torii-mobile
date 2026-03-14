import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:torii_app/features/auth/providers/auth_providers.dart';
import 'package:torii_app/features/auth/models/auth_state.dart';
import 'package:torii_app/features/auth/views/pages/login_page.dart';
import 'package:torii_app/features/auth/views/pages/register_page.dart';
import 'package:torii_app/features/auth/views/pages/forgot_password_page.dart';
import 'package:torii_app/features/auth/views/pages/verify_otp_page.dart';
import 'package:torii_app/features/auth/views/pages/reset_password_page.dart';
import 'package:torii_app/features/auth/views/pages/two_factor_verify_page.dart';
import 'package:torii_app/features/auth/views/pages/auth_success_page.dart';
import 'package:torii_app/features/course/views/pages/course_detail_design_page.dart';
import 'package:torii_app/features/course/views/pages/course_learning_curriculum_page.dart';
import 'package:torii_app/features/payment/views/payment_screen.dart';
import 'package:torii_app/features/payment/views/payos_webview_screen.dart';
import 'package:torii_app/features/payment/views/order_history_screen.dart';
import 'package:torii_app/features/payment/views/order_detail_screen.dart';
import 'package:torii_app/features/course/views/pages/my_learning_page.dart';
import 'package:torii_app/features/course/views/pages/lesson_page.dart';
import 'package:torii_app/features/course/models/lesson_model.dart';
import 'package:torii_app/features/notifications/views/pages/notifications_page.dart';
import 'package:torii_app/features/profile/views/pages/profile_page.dart';
import 'package:torii_app/features/blog/views/pages/blog_list_page.dart';
import 'package:torii_app/features/blog/views/pages/blog_article_page.dart';
import 'package:torii_app/features/blog/models/blog_model.dart';
import 'package:torii_app/features/gamification/views/pages/achievements_page.dart';
import 'package:torii_app/features/gamification/views/pages/leaderboard_page.dart';
import 'package:torii_app/features/meet/presentation/screens/landing/meet_entry_screen.dart';
import 'package:torii_app/features/meet/presentation/screens/room/meeting_room_screen.dart';
import 'package:torii_app/features/meet/presentation/screens/landing/meet_login_screen.dart';
import 'package:torii_app/features/course/views/pages/assignments_page.dart';
import 'package:torii_app/features/course/views/pages/certificates_page.dart';
import 'package:torii_app/features/dashboard/views/pages/statistics_page.dart';
import 'package:torii_app/features/sensei/views/pages/sensei_roleplay_topic_page.dart';
import 'package:torii_app/features/sensei/views/pages/sensei_roleplay_chat_page.dart';
import 'package:torii_app/features/profile/views/pages/edit_profile_page.dart';
import 'package:torii_app/features/sensei/views/pages/sensei_chat_page.dart';
import 'package:torii_app/features/sensei/views/pages/sensei_translate_page.dart';
import 'package:torii_app/features/marketplace/views/pages/marketplace_home_page.dart';
import 'package:torii_app/features/marketplace/views/pages/course_discovery_page.dart';
import 'package:torii_app/features/meet/presentation/screens/live_schedule_page.dart';
import 'package:torii_app/features/study/views/pages/study_sets_page.dart';
import 'package:torii_app/features/study/views/pages/flashcard_mode_page.dart';
import 'package:torii_app/features/study/views/pages/match_game_page.dart';
import 'package:torii_app/features/study/views/pages/review_mode_page.dart';
import 'package:torii_app/features/onboarding/views/pages/onboarding_page.dart';
import 'package:torii_app/features/onboarding/providers/onboarding_provider.dart';
import 'package:torii_app/core/widgets/app_shell.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authStateAsync = ref.read(authNotifierProvider);
  final authNotifier = ValueNotifier<AsyncValue<AuthState>>(authStateAsync);
  final onboardingNotifier = ref.read(onboardingNotifierProvider);

  ref.listen<AsyncValue<AuthState>>(authNotifierProvider, (_, next) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
       authNotifier.value = next;
    });
  });

  return GoRouter(
    navigatorKey: AppRouter.rootNavigatorKey,
    debugLogDiagnostics: kDebugMode,
    initialLocation: '/',
    refreshListenable: Listenable.merge([authNotifier, onboardingNotifier]),
    
    redirect: (context, state) {
      final onboardingCompletedStatus = onboardingNotifier.value;
      final matchedLocation = state.matchedLocation;

      // 1. First launch: show onboarding first; only after that allow home (guest) or other routes
      if (!onboardingCompletedStatus) {
        if (matchedLocation == '/onboarding') return null;
        return '/onboarding';
      }

      // 2. Auth checks
      final authAsync = ref.read(authNotifierProvider);
      if (authAsync is AsyncLoading || authAsync is AsyncError) return null;

      final authState = authAsync.asData?.value;
      if (authState == null) return null;

      final status = authState.status;
      final isLogin = matchedLocation == '/login';
      final isRegister = matchedLocation == '/register';
      final isVerifying2FA = matchedLocation == '/auth/verify-2fa';
      
      // Prevent going back to onboarding if already completed
      if (matchedLocation == '/onboarding' && onboardingCompletedStatus) {
        return '/';
      }

      if (status == AuthStatus.unauthenticated) {
        if (AppRouter.isPublicRoute(matchedLocation)) {
           return null;
        }
        return '/login';
      }

      if (status == AuthStatus.pending2FA) {
        if (!isVerifying2FA) {
           return '/auth/verify-2fa';
        }
        return null;
      }

      if (status == AuthStatus.authenticated) {
        if (isLogin || isRegister || isVerifying2FA) {
           return '/';
        }
        return null; 
      }
      
      if (status == AuthStatus.requiresOTP) {
         if (matchedLocation.startsWith('/auth/')) return null;
         return '/auth/verify-otp';
      }

      return null;
    },
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return AppShell(navigationShell: navigationShell, state: state);
        },
        branches: [
          // Branch 0: Home
          StatefulShellBranch(
            routes: [
               GoRoute(
                path: '/',
                builder: (context, state) => const RootScreenWrapper(),
              ),
            ],
          ),

          // Branch 1: My Courses / Catalog (new UI)
          StatefulShellBranch(
            initialLocation: '/my-courses',
            routes: [
              GoRoute(
                path: '/my-courses',
                builder: (context, state) => const MyLearningPage(),
              ),
              GoRoute(
                path: '/courses',
                builder: (context, state) => const CourseDiscoveryPage(),
                routes: [
                  GoRoute(
                    path: ':id',
                    parentNavigatorKey: AppRouter.rootNavigatorKey,
                    builder: (context, state) {
                      return const CourseDetailDesignPage();
                    },
                    routes: [
                      GoRoute(
                        path: 'lessons',
                        parentNavigatorKey: AppRouter.rootNavigatorKey,
                        builder: (context, state) {
                          final courseId = state.pathParameters['id'] ?? '';
                          return CourseLearningCurriculumPage(courseId: courseId);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          
          // Branch 2: Live (Member) / Community (Guest) - temporary reuse marketplace UI
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/live-schedule',
                builder: (context, state) => const LiveSchedulePage(),
              ),
              GoRoute(
                path: '/community',
                builder: (context, state) => const MarketplaceHomePage(),
              ),
            ],
          ),
          
          // Branch 3: Flashcards (Member) / Exams (Guest)
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/flashcards',
                builder: (context, state) => const StudySetsPage(),
                routes: [
                  GoRoute(
                    path: ':setId/mode/card',
                    parentNavigatorKey: AppRouter.rootNavigatorKey,
                    builder: (context, state) => FlashcardModePage(
                      setId: state.pathParameters['setId']!,
                    ),
                  ),
                  GoRoute(
                    path: ':setId/mode/match',
                    parentNavigatorKey: AppRouter.rootNavigatorKey,
                    builder: (context, state) => MatchGamePage(
                      setId: state.pathParameters['setId']!,
                    ),
                  ),
                  GoRoute(
                    path: ':setId/mode/review',
                    parentNavigatorKey: AppRouter.rootNavigatorKey,
                    builder: (context, state) => ReviewModePage(
                      setId: state.pathParameters['setId']!,
                    ),
                  ),
                ],
              ),
              GoRoute(
                path: '/exams',
                builder: (context, state) => const MyLearningPage(),
              ),
            ],
          ),

          // Branch 4: Profile (Member) / Preview (Guest)
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                builder: (context, state) => const ProfilePage(),
                routes: [
                  GoRoute(
                    path: 'edit',
                    parentNavigatorKey: AppRouter.rootNavigatorKey,
                    builder: (context, state) => const EditProfilePage(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      // Root Routes (Overlay)
      GoRoute(
        path: '/meet',
        parentNavigatorKey: AppRouter.rootNavigatorKey,
        builder: (context, state) {
          final token = state.extra is Map
              ? (state.extra as Map)['token']?.toString()
              : null;
          return MeetEntryScreen(initialToken: token);
        },
      ),
      GoRoute(
        path: '/meeting',
        parentNavigatorKey: AppRouter.rootNavigatorKey,
        builder: (context, state) => const MeetingRoomScreen(),
      ),
      GoRoute(
        path: '/meet/login',
        parentNavigatorKey: AppRouter.rootNavigatorKey,
        builder: (context, state) {
          final roomId = state.uri.queryParameters['roomId'];
          return MeetLoginScreen(
            roomId: roomId,
            onLoginSuccess: (token) {
              // After obtaining token, navigate via GoRouter to meet entry screen with token
              context.go(
                '/meet',
                extra: {'token': token},
              );
            },
          );
        },
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
          final extra = state.extra is Map<String, dynamic> 
              ? state.extra as Map<String, dynamic>
              : {'email': state.extra?.toString() ?? ''};
          return VerifyOTPPage(
            email: extra['email'] as String? ?? '',
            nextRoute: extra['nextRoute'] as String?,
            successTitle: extra['successTitle'] as String?,
            successMessage: extra['successMessage'] as String?,
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
        path: '/auth/success',
        parentNavigatorKey: AppRouter.rootNavigatorKey,
        builder: (context, state) {
          final extra = state.extra is Map<String, dynamic> 
              ? state.extra as Map<String, dynamic>
              : {};
          return AuthSuccessPage(
            title: extra['title'] as String? ?? 'Thành công!',
            message: extra['message'] as String? ?? 'Thao tác của bạn đã được thực hiện thành công.',
            nextRoute: extra['nextRoute'] as String? ?? '/login',
          );
        },
      ),
      GoRoute(
        path: '/marketplace',
        parentNavigatorKey: AppRouter.rootNavigatorKey,
        builder: (context, state) => const MarketplaceHomePage(),
        routes: [
          GoRoute(
            path: 'discovery',
            parentNavigatorKey: AppRouter.rootNavigatorKey,
            builder: (context, state) => const CourseDiscoveryPage(),
          ),
        ],
      ),
      GoRoute(
        path: '/payment',
        parentNavigatorKey: AppRouter.rootNavigatorKey,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>? ?? {};
          return PaymentScreen(
            courseId: extra['courseId'] as String? ?? '',
            amount: (extra['amount'] as num?)?.toDouble() ?? 0.0,
            courseTitle: extra['courseTitle'] as String?,
          );
        },
        routes: [
          GoRoute(
            path: 'webview',
            parentNavigatorKey: AppRouter.rootNavigatorKey,
            builder: (context, state) {
              final extra = state.extra as Map<String, dynamic>? ?? {};
              return PayOSWebViewScreen(
                checkoutUrl: extra['checkoutUrl'] as String? ?? '',
                orderId: extra['orderId'] as String? ?? '',
              );
            },
          ),
        ],
      ),
      GoRoute(
        path: '/payment/history',
        parentNavigatorKey: AppRouter.rootNavigatorKey,
        builder: (context, state) => const OrderHistoryScreen(),
      ),
      GoRoute(
        path: '/payment/order/:id',
        parentNavigatorKey: AppRouter.rootNavigatorKey,
        builder: (context, state) {
          final orderId = state.pathParameters['id'] ?? '';
          return OrderDetailScreen(orderId: orderId);
        },
      ),
      GoRoute(
        path: '/assignments',
        parentNavigatorKey: AppRouter.rootNavigatorKey,
        builder: (context, state) => const AssignmentsPage(),
      ),
      GoRoute(
        path: '/certificates',
        parentNavigatorKey: AppRouter.rootNavigatorKey,
        builder: (context, state) => const CertificatesPage(),
      ),
      GoRoute(
        path: '/statistics',
        parentNavigatorKey: AppRouter.rootNavigatorKey,
        builder: (context, state) => const StatisticsPage(),
      ),
      GoRoute(
        path: '/sensei/roleplay-topics',
        parentNavigatorKey: AppRouter.rootNavigatorKey,
        builder: (context, state) => const SenseiRoleplayTopicPage(),
      ),
      GoRoute(
        path: '/sensei/roleplay-chat',
        parentNavigatorKey: AppRouter.rootNavigatorKey,
        builder: (context, state) {
          final topic = state.extra as String? ?? 'Chủ đề ngẫu nhiên';
          return SenseiRoleplayChatPage(topic: topic);
        },
      ),
      GoRoute(
        path: '/sensei/chat',
        parentNavigatorKey: AppRouter.rootNavigatorKey,
        builder: (context, state) => const SenseiChatPage(),
      ),
      GoRoute(
        path: '/sensei/translate',
        parentNavigatorKey: AppRouter.rootNavigatorKey,
        builder: (context, state) => const SenseiTranslatePage(),
      ),
      GoRoute(
        path: '/notifications',
        parentNavigatorKey: AppRouter.rootNavigatorKey,
        builder: (context, state) => const NotificationsPage(),
      ),
      GoRoute(
        path: '/achievements',
        parentNavigatorKey: AppRouter.rootNavigatorKey,
        builder: (context, state) => const AchievementsPage(),
      ),
      GoRoute(
        path: '/leaderboard',
        parentNavigatorKey: AppRouter.rootNavigatorKey,
        builder: (context, state) => const LeaderboardPage(),
      ),
      GoRoute(
        path: '/blog',
        parentNavigatorKey: AppRouter.rootNavigatorKey,
        builder: (context, state) => const BlogListPage(),
        routes: [
          GoRoute(
            path: 'detail',
            parentNavigatorKey: AppRouter.rootNavigatorKey,
            builder: (context, state) {
              final extra = state.extra;
              final blog = extra is Blog ? extra : null;
              return BlogArticlePage(blog: blog);
            },
          ),
        ],
      ),
      GoRoute(
        path: '/learning/:id',
        parentNavigatorKey: AppRouter.rootNavigatorKey,
        builder: (context, state) {
          final courseId = state.pathParameters['id'] ?? '';
          return CourseLearningCurriculumPage(courseId: courseId);
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
      GoRoute(
        path: '/onboarding',
        parentNavigatorKey: AppRouter.rootNavigatorKey,
        builder: (context, state) => const OnboardingPage(),
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
    '/my-courses',
    '/live-schedule',
    '/flashcards',
    '/notifications',
    '/downloads',
    '/achievements',
    '/leaderboard',
    '/payment',
    '/payment/history',
    '/profile',
    '/profile/settings',
    '/profile/settings/edit',
    '/profile/settings/security',
    '/learning/:courseId/:lessonId',
    '/courses/:id/lessons',
  ];

  static const publicRoutes = [
    '/',
    '/login',
    '/register',
    '/courses',
    '/auth/forgot-password',
    '/auth/verify-otp',
    '/auth/reset-password',
    '/auth/verify-2fa',
    '/auth/success',
    '/marketplace',
    '/community',
    '/exams',
    '/achievements',
    '/blog',
    '/blog/detail',
    '/meet',
    '/meeting',
    '/sensei/roleplay-topics',
    '/sensei/roleplay-chat',
  ];

  /// Helper to check if a route is public (supports parameters)
  static bool isPublicRoute(String location) {
    // 1. Check exact matches
    if (publicRoutes.contains(location)) return true;

    // 2. Check pattern/prefix matches
    final publicPrefixes = [
      '/courses/',
      '/community/',
      '/instructor/',
      '/blog',
      '/blog/',
    ];

    for (final prefix in publicPrefixes) {
      if (location.startsWith(prefix)) return true;
    }

    return false;
  }
}

class RootScreenWrapper extends ConsumerWidget {
  const RootScreenWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Both guest and authenticated users default to marketplace
    return const MarketplaceHomePage();
  }
}
