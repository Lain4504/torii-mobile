import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/auth/presentation/screens/welcome_screen.dart';
import '../../features/auth/providers/auth_providers.dart';
import '../../features/auth/models/auth_state.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/register_screen.dart';
import '../../features/auth/presentation/screens/forgot_password_screen.dart';
import '../../features/auth/presentation/screens/reset_password_screen.dart';
import '../../features/auth/presentation/screens/email_verification_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/course/presentation/screens/discovery_screen.dart';
import '../../features/course/presentation/screens/course_detail_screen.dart';
import '../../features/course/presentation/screens/course_live_detail_screen.dart';
import '../../features/course/presentation/screens/checkout_screen.dart';
import '../../features/course/presentation/screens/payment_webview_screen.dart';
import '../../features/course/presentation/screens/payment_result_screen.dart';
import '../../features/course/presentation/screens/my_courses_screen.dart';
import '../../features/course/presentation/screens/curriculum_screen.dart';
import '../../features/course/presentation/screens/lesson_screen.dart';
import '../../features/blog/presentation/screens/blog_list_screen.dart';
import '../../features/blog/presentation/screens/blog_detail_screen.dart';
import '../../features/profile/presentation/screens/settings_screen.dart';
import '../../features/profile/presentation/screens/change_password_screen.dart';
import '../../features/profile/presentation/screens/profile_screen.dart';
import '../../features/profile/presentation/screens/edit_profile_screen.dart';
import '../../features/profile/presentation/screens/linked_accounts_screen.dart';
import '../../features/home/presentation/screens/live_schedule_screen.dart';
import '../../features/profile/presentation/screens/order_list_screen.dart';
import '../../features/profile/presentation/screens/order_detail_screen.dart';
import '../../features/profile/presentation/screens/leaderboard_screen.dart';
import '../../features/profile/presentation/screens/notifications_screen.dart';
import '../../features/profile/presentation/screens/achievements_screen.dart';
import '../../features/profile/presentation/screens/rewards_store_screen.dart';
import '../../features/profile/presentation/screens/coupons_screen.dart';
import '../../features/profile/presentation/screens/two_factor_settings_screen.dart';
import '../../features/sensei/views/pages/sensei_dashboard_page.dart';
import '../../features/sensei/views/pages/sensei_chat_page.dart';
import '../../features/sensei/views/pages/sensei_translate_page.dart';
import '../../features/sensei/views/pages/sensei_roleplay_topic_page.dart';
import '../../features/sensei/views/pages/sensei_roleplay_chat_page.dart';
import '../../features/sensei/views/pages/sensei_drill_page.dart';
import '../../features/sensei/views/pages/sensei_voice_agent_page.dart';
import '../../features/practice/presentation/screens/practice_home_screen.dart';
import '../../features/practice/presentation/screens/study_sets_dashboard_screen.dart';
import '../../features/practice/presentation/screens/study_set_practice_screen.dart';
import '../../features/practice/presentation/screens/study_set_test_screen.dart';
import '../../features/practice/presentation/screens/study_set_match_screen.dart';
import '../../features/onboarding/providers/onboarding_provider.dart';
import '../widgets/app_shell.dart';
import '../../features/meet/presentation/screens/landing/meet_entry_screen.dart';
import '../../features/onboarding/presentation/screens/onboarding_survey_screen.dart';

class RouterNotifier extends ChangeNotifier {
  final Ref _ref;

  RouterNotifier(this._ref) {
    _ref.listen(authStateProvider, (_, __) => notifyListeners());
    _ref.listen(onboardingNotifierProvider, (_, __) => notifyListeners());
  }
}

final routerNotifierProvider = Provider<RouterNotifier>((ref) {
  return RouterNotifier(ref);
});

final routerProvider = Provider<GoRouter>((ref) {
  final routerNotifier = ref.watch(routerNotifierProvider);
  
  return GoRouter(
    initialLocation: '/',
    refreshListenable: routerNotifier,
    redirect: (context, state) {
      final onboardingNotifier = ref.read(onboardingNotifierProvider);
      final hasCompletedOnboarding = onboardingNotifier.value;
      final authAsync = ref.read(authStateProvider);
      final isAuthenticated = authAsync.asData?.value.status == AuthStatus.authenticated;

      final path = state.uri.path;
      final auth = authAsync.asData?.value;
      final user = auth?.user;

      if (isAuthenticated && user != null && !user.isOnboarded && path != '/onboarding-survey') {
        return '/onboarding-survey';
      }

      // Primary redirect: Onboarding
      if (!hasCompletedOnboarding && path != '/welcome') {
        return '/welcome';
      }

      // Secondary redirect: Auth gating
      final requiresAuth = path.startsWith('/practice') || path.startsWith('/study-sets');
      if (requiresAuth && !isAuthenticated) {
        return '/login';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/welcome',
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/forgot-password',
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
      GoRoute(
        path: '/change-password',
        builder: (context, state) => const ChangePasswordScreen(),
      ),
      GoRoute(
        path: '/reset-password',
        builder: (context, state) => const ResetPasswordScreen(),
      ),
      GoRoute(
        path: '/verify-email',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          final email = extra?['email'] as String?;
          final mode = extra?['mode'] as String? ?? 'registration';
          return EmailVerificationScreen(
            email: email,
            mode: mode,
          );
        },
      ),

      GoRoute(
        path: '/onboarding-survey',
        builder: (context, state) => const OnboardingSurveyScreen(),
      ),

      GoRoute(
        path: '/meet',
        builder: (context, state) {
          final roomId = state.uri.queryParameters['roomId'];
          final token = state.uri.queryParameters['access_token'];
          return MeetEntryScreen(roomId: roomId, initialToken: token);
        },
      ),

      // Shell với AppShell làm layout chung + bottom nav
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            AppShell(navigationShell: navigationShell, state: state),
        branches: [
          // Branch 0: Home
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/',
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          // Branch 1: Discovery / course browsing
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/discovery',
                builder: (context, state) => const CourseDiscoveryScreen(),
              ),
              GoRoute(
                path: '/course-detail/:id',
                builder: (context, state) {
                  final id = state.pathParameters['id'] ?? '';
                  return CourseDetailScreen(courseId: id);
                },
              ),
              GoRoute(
                path: '/course-live/:id',
                builder: (context, state) {
                  final id = state.pathParameters['id'] ?? '';
                  return CourseLiveDetailScreen(courseId: id);
                },
              ),
              GoRoute(
                path: '/checkout/:id',
                builder: (context, state) {
                  final id = state.pathParameters['id'] ?? '';
                  final classId = state.uri.queryParameters['classId'];
                  return CheckoutScreen(offeringId: id, classId: classId);
                },
              ),
              GoRoute(
                path: '/payment',
                builder: (context, state) {
                  final extra = state.extra as Map<String, dynamic>? ?? const {};
                  final paymentUrl = (extra['paymentUrl'] as String?) ?? '';
                  final orderCode = (extra['orderCode'] as String?) ?? '';
                  return PaymentWebViewScreen(paymentUrl: paymentUrl, orderCode: orderCode);
                },
              ),
              GoRoute(
                path: '/payment-result/:orderCode',
                builder: (context, state) {
                  final code = state.pathParameters['orderCode'] ?? '';
                  return PaymentResultScreen(orderCode: code);
                },
              ),
              GoRoute(
                path: '/curriculum',
                builder: (context, state) => const CurriculumScreen(),
              ),
              GoRoute(
                path: '/lesson',
                builder: (context, state) {
                  final extra = state.extra;
                  return LessonScreen(
                    lesson: (extra is Map<String, dynamic>) ? extra : null,
                  );
                },
              ),
            ],
          ),
          // Branch 2: AI Sensei (available for both guest & user)
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/sensei',
                builder: (context, state) => const SenseiDashboardPage(),
              ),
              GoRoute(
                path: '/sensei/chat',
                builder: (context, state) => const SenseiChatPage(),
              ),
              GoRoute(
                path: '/sensei/translate',
                builder: (context, state) => const SenseiTranslatePage(),
              ),
              GoRoute(
                path: '/sensei/voice',
                builder: (context, state) => const SenseiVoiceAgentPage(),
              ),
              GoRoute(
                path: '/sensei/roleplay-topics',
                builder: (context, state) => const SenseiRoleplayTopicPage(),
              ),
              GoRoute(
                path: '/sensei/roleplay-chat',
                builder: (context, state) {
                  final topic = (state.extra is String) ? state.extra as String : '';
                  return SenseiRoleplayChatPage(topic: topic.isNotEmpty ? topic : 'Roleplay');
                },
              ),
              // Placeholder route to avoid navigation errors from menu items
              GoRoute(
                path: '/sensei/drill',
                builder: (context, state) => const SenseiDrillPage(),
              ),
            ],
          ),
          // Branch 3: Blog (guest) / My courses (user)
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/blog',
                builder: (context, state) => const BlogListScreen(),
              ),
              GoRoute(
                path: '/blog-detail/:slug',
                builder: (context, state) {
                  final slug = state.pathParameters['slug'] ?? '';
                  return BlogDetailScreen(slug: slug);
                },
              ),
              GoRoute(
                path: '/my-courses',
                builder: (context, state) => const MyCoursesScreen(),
              ),
              GoRoute(
                path: '/orders',
                builder: (context, state) => const OrderListScreen(),
              ),
              GoRoute(
                path: '/order-detail/:id',
                builder: (context, state) {
                  final id = state.pathParameters['id'] ?? '';
                  return OrderDetailScreen(orderId: id);
                },
              ),
            ],
          ),
          // Branch 4: Live schedule & profile-related
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/live-schedule',
                builder: (context, state) => const LiveScheduleScreen(),
              ),
              GoRoute(
                path: '/profile',
                builder: (context, state) => const ProfileScreen(),
              ),
              // Edit profile
              // Điều hướng từ settings và nút "Chỉnh sửa" trên trang hồ sơ
              GoRoute(
                path: '/profile/edit',
                builder: (context, state) => const EditProfileScreen(),
              ),
              GoRoute(
                path: '/settings',
                builder: (context, state) => const SettingsScreen(),
              ),
              GoRoute(
                path: '/linked-accounts',
                builder: (context, state) => const LinkedAccountsScreen(),
              ),
              GoRoute(
                path: '/achievements',
                builder: (context, state) => const AchievementsScreen(),
              ),
              GoRoute(
                path: '/rewards-store',
                builder: (context, state) => const RewardsStoreScreen(),
              ),
              GoRoute(
                path: '/my-coupons',
                builder: (context, state) => const CouponsScreen(),
              ),
              GoRoute(
                path: '/security-2fa',
                builder: (context, state) => const TwoFactorSettingsScreen(),
              ),
              GoRoute(
                path: '/leaderboard',
                builder: (context, state) => const LeaderboardScreen(),
              ),
              GoRoute(
                path: '/notifications',
                builder: (context, state) => const NotificationsScreen(),
              ),
            ],
          ),
          // Branch 5: Practice (authenticated-only entry via bottom nav)
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/practice',
                builder: (context, state) => const PracticeHomeScreen(),
              ),
              GoRoute(
                path: '/study-sets',
                builder: (context, state) => const StudySetsDashboardScreen(),
              ),
              GoRoute(
                path: '/study-sets/:id/study',
                builder: (context, state) {
                  final id = state.pathParameters['id'] ?? '';
                  return StudySetPracticeScreen(setId: id);
                },
              ),
              // Web-learner parity routes
              GoRoute(
                path: '/study-sets/:id/review',
                builder: (context, state) {
                  final id = state.pathParameters['id'] ?? '';
                  return StudySetPracticeScreen(setId: id);
                },
              ),
              GoRoute(
                path: '/study-sets/:id/test',
                builder: (context, state) {
                  final id = state.pathParameters['id'] ?? '';
                  return StudySetTestScreen(setId: id);
                },
              ),
              GoRoute(
                path: '/study-sets/:id/match',
                builder: (context, state) {
                  final id = state.pathParameters['id'] ?? '';
                  return StudySetMatchScreen(setId: id);
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
});
