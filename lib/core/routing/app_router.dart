import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/auth/presentation/screens/welcome_screen.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/register_screen.dart';
import '../../features/auth/presentation/screens/forgot_password_screen.dart';
import '../../features/auth/presentation/screens/reset_password_screen.dart';
import '../../features/auth/presentation/screens/email_verification_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/course/presentation/screens/discovery_screen.dart';
import '../../features/course/presentation/screens/course_detail_screen.dart';
import '../../features/course/presentation/screens/my_courses_screen.dart';
import '../../features/course/presentation/screens/curriculum_screen.dart';
import '../../features/course/presentation/screens/lesson_screen.dart';
import '../../features/blog/presentation/screens/blog_list_screen.dart';
import '../../features/blog/presentation/screens/blog_detail_screen.dart';
import '../../features/profile/presentation/screens/settings_screen.dart';
import '../../features/profile/presentation/screens/profile_screen.dart';
import '../../features/home/presentation/screens/live_schedule_screen.dart';
import '../../features/profile/presentation/screens/order_list_screen.dart';
import '../../features/profile/presentation/screens/order_detail_screen.dart';
import '../../features/profile/presentation/screens/leaderboard_screen.dart';
import '../../features/profile/presentation/screens/notifications_screen.dart';
import '../../features/onboarding/providers/onboarding_provider.dart';
import '../widgets/app_shell.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final onboardingNotifier = ref.watch(onboardingNotifierProvider);
  final hasCompletedOnboarding = onboardingNotifier.value;

  final initialLocation = hasCompletedOnboarding ? '/' : '/welcome';

  return GoRouter(
    initialLocation: initialLocation,
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
                path: '/curriculum',
                builder: (context, state) => const CurriculumScreen(),
              ),
              GoRoute(
                path: '/lesson',
                builder: (context, state) => const LessonScreen(),
              ),
            ],
          ),
          // Branch 2: Blog (guest) / My courses (user)
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
          // Branch 3: Live schedule & profile-related
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
              GoRoute(
                path: '/settings',
                builder: (context, state) => const SettingsScreen(),
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
        ],
      ),
    ],
  );
});
