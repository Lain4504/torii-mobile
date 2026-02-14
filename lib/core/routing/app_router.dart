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
import 'package:torii_app/features/course/views/pages/course_list_page.dart';
import 'package:torii_app/features/course/views/pages/course_detail_page.dart';
import 'package:torii_app/features/course/views/pages/course_lessons_page.dart';
import 'package:torii_app/features/payment/views/payment_screen.dart';
import 'package:torii_app/features/payment/views/payos_webview_screen.dart';
import 'package:torii_app/features/payment/views/order_history_screen.dart';
import 'package:torii_app/features/dashboard/views/pages/home_page.dart';
import 'package:torii_app/features/dashboard/views/pages/dashboard_page.dart';
import 'package:torii_app/features/course/views/pages/my_learning_page.dart';
import 'package:torii_app/features/exam/views/pages/exam_list_page.dart';
import 'package:torii_app/features/exam/views/pages/exam_taking_page.dart';
import 'package:torii_app/features/exam/models/exam_model.dart';
import 'package:torii_app/features/flashcard/views/pages/flashcard_list_page.dart';
import 'package:torii_app/features/flashcard/views/pages/flashcard_practice_page.dart';
import 'package:torii_app/features/flashcard/views/pages/deck_detail_page.dart';
import 'package:torii_app/features/flashcard/views/pages/add_deck_page.dart';
import 'package:torii_app/features/flashcard/views/pages/add_flashcard_page.dart';
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
import 'package:torii_app/features/ticket/views/pages/ticket_list_page.dart';
import 'package:torii_app/features/ticket/views/pages/ticket_detail_page.dart';
import 'package:torii_app/features/meet/presentation/screens/landing/meet_entry_screen.dart';
import 'package:torii_app/features/meet/presentation/screens/landing/join_meeting_screen.dart';
import 'package:torii_app/features/meet/presentation/screens/room/meeting_room_screen.dart';
import 'package:torii_app/core/widgets/app_shell.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authStateAsync = ref.read(authNotifierProvider);
  final authNotifier = ValueNotifier<AsyncValue<AuthState>>(authStateAsync);

  ref.listen<AsyncValue<AuthState>>(authNotifierProvider, (_, next) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
       authNotifier.value = next;
    });
  });

  return GoRouter(
    navigatorKey: AppRouter.rootNavigatorKey,
    debugLogDiagnostics: kDebugMode,
    initialLocation: '/',
    refreshListenable: authNotifier,
    
    redirect: (context, state) {
      final authAsync = ref.read(authNotifierProvider);
      
      if (authAsync is AsyncLoading || authAsync is AsyncError) return null;

      final authState = authAsync.asData?.value;
      if (authState == null) return null;

      final status = authState.status;
      final matchedLocation = state.matchedLocation;
      final isLogin = matchedLocation == '/login';
      final isRegister = matchedLocation == '/register';
      final isVerifying2FA = matchedLocation == '/auth/verify-2fa';
      
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
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingPage(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return AppShell(navigationShell: navigationShell, state: state);
        },
        branches: [
          // Branch 0: Learning / Courses
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/my-learning',
                builder: (context, state) => const MyLearningPage(),
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
                    routes: [
                      GoRoute(
                        path: 'lessons',
                        parentNavigatorKey: AppRouter.rootNavigatorKey,
                        builder: (context, state) {
                          final courseId = state.pathParameters['id'] ?? '';
                          return CourseLessonsPage(courseId: courseId);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          
          // Branch 1: Live (Member) / Community (Guest)
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/live-schedule',
                builder: (context, state) => const LiveClassSchedulePage(),
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
            ],
          ),

          // Branch 2: Home
          StatefulShellBranch(
            routes: [
               GoRoute(
                path: '/',
                builder: (context, state) => const RootScreenWrapper(),
              ),
            ],
          ),

          // Branch 3: Flashcards (Member) / Exams (Guest)
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/flashcards',
                builder: (context, state) => const FlashcardListPage(),
              ),
              GoRoute(
                path: '/exams',
                builder: (context, state) => const ExamListPage(),
              ),
            ],
          ),

          // Branch 4: Profile (Member) / Preview (Guest)
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/settings',
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
                  GoRoute(
                    path: 'tickets',
                    parentNavigatorKey: AppRouter.rootNavigatorKey,
                    builder: (context, state) => const TicketListPage(),
                    routes: [
                      GoRoute(
                        path: ':id',
                        parentNavigatorKey: AppRouter.rootNavigatorKey,
                        builder: (context, state) {
                          final id = state.pathParameters['id'] ?? '';
                          return TicketDetailPage(ticketId: id);
                        },
                      ),
                    ],
                  ),
                ],
              ),
              // Use /flashcards/preview path for guest to avoid duplication errors if any,
              // or just reuse /flashcards if router allows in different branches.
              GoRoute(
                path: '/flashcards-preview',
                builder: (context, state) => const FlashcardListPage(),
              ),
              GoRoute(
                path: '/live-schedule',
                builder: (context, state) => const LiveClassSchedulePage(),
              ),
            ],
          ),

          // Branch 5: Meet Explorer
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/meet',
                builder: (context, state) {
                  final token = state.extra is Map
                      ? state.extra['token']?.toString()
                      : null;
                  return MeetEntryScreen(initialToken: token);
                },
              ),
            ],
          ),
        ],
      ),
      // Root Routes (Overlay)
      GoRoute(
        path: '/meeting',
        parentNavigatorKey: AppRouter.rootNavigatorKey,
        builder: (context, state) => const MeetingRoomScreen(),
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
        path: '/flashcards/add-deck',
        parentNavigatorKey: AppRouter.rootNavigatorKey,
        builder: (context, state) {
           final deckToEdit = state.extra as FlashcardDeck?;
           return AddDeckPage(deckToEdit: deckToEdit);
        },
      ),
      GoRoute(
        path: '/flashcards/deck-detail',
        parentNavigatorKey: AppRouter.rootNavigatorKey,
        builder: (context, state) {
          final deck = state.extra as FlashcardDeck;
          // Must import DeckDetailPage. I'll add import at top next.
          return DeckDetailPage(deck: deck);
        },
      ),
      GoRoute(
        path: '/flashcards/add-card',
        parentNavigatorKey: AppRouter.rootNavigatorKey,
        builder: (context, state) {
          if (state.extra is FlashcardDeck) {
             return AddFlashcardPage(deck: state.extra as FlashcardDeck);
          }
          final map = state.extra as Map;
          return AddFlashcardPage(
             deck: map['deck'] as FlashcardDeck,
             cardToEdit: map['card'] as Flashcard?,
          );
        },
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
    '/settings/profile/edit',
    '/settings/security',
    '/achievements',
    '/wishlist',
    '/notifications',
    '/downloads',
    '/exams/take',
    '/flashcards/practice',
    '/payment',
    '/payment/history',
    '/learning/:courseId/:lessonId',
    '/courses/:id/lessons',
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
    '/achievements',
    '/community',
    '/search',
    '/flashcards',
    '/flashcards-preview',
    '/settings',
    '/exams',
    '/meet',
    '/meeting',
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
    final asyncAuth = ref.watch(authStateProvider);
    if (asyncAuth.value?.isAuthenticated == true) {
      return const DashboardPage();
    }
    return const HomePage();
  }
}
