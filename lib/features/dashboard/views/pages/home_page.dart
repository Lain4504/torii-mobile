import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../auth/providers/auth_providers.dart';
import '../../../auth/models/auth_state_sealed.dart';
import '../../../course/providers/course_providers.dart';
import '../../../course/views/widgets/course_card.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(courseListProvider.notifier).loadCourses();
    });
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authStateProvider);
    final user = authState is AuthAuthenticated ? authState.user : null;
    final courseState = ref.watch(courseListProvider);

    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: CustomScrollView(
        slivers: [
          // 1. App Bar / Header
          SliverAppBar(
            pinned: true,
            expandedHeight: 70.0,
            toolbarHeight: 70.0,
            backgroundColor: Colors.transparent, 
            foregroundColor: AppColors.textOnPrimary,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.primary,
                    AppColors.primaryDark,
                  ],
                ),
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _getGreeting(),
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.9),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  user != null 
                    ? (user.displayName.isNotEmpty ? user.displayName : 'Learner') 
                    : 'Guest',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.notifications_none_rounded),
                onPressed: () {}, 
              ),
              if (user == null)
                TextButton(
                  onPressed: () => context.push('/login'),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  child: const Text('Login'),
                ),
            ],
          ),

          // 1.5 Stats Bar
          if (user != null)
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.sm),
                color: Theme.of(context).cardColor,
                child: Row(
                  children: [
                    _buildStatBadge(Icons.local_fire_department, '3 Day Streak', isDark: true),
                    const SizedBox(width: AppSpacing.md),
                    _buildStatBadge(Icons.star, '120 XP', isDark: true),
                  ],
                ),
              ),
            ),

          // 2. Quick Actions Grid
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: AppSpacing.md,
                    crossAxisSpacing: AppSpacing.md,
                    childAspectRatio: 1.5,
                    children: [
                      _buildQuickActionCard(
                        context,
                        title: 'Courses',
                        icon: Icons.school_rounded,
                        color: Colors.blueAccent,
                        onTap: () => context.go('/courses'),
                      ),
                      _buildQuickActionCard(
                        context,
                        title: 'Live Classes',
                        icon: Icons.missed_video_call_rounded,
                        color: Colors.purpleAccent,
                        onTap: () => context.go('/live-classes'),
                      ),
                      _buildQuickActionCard(
                        context,
                        title: 'Flashcards',
                        icon: Icons.style_rounded,
                        color: Colors.orangeAccent,
                        onTap: () => context.go('/flashcards'),
                      ),
                      _buildQuickActionCard(
                        context,
                        title: 'Exams',
                        icon: Icons.quiz_rounded,
                        color: Colors.tealAccent,
                        onTap: () => context.go('/exams'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // 3. Featured / Recent Courses
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular Courses',
                    style: TextStyle(
                      fontSize: AppTypography.fontSizeLg,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.titleLarge?.color,
                    ),
                  ),
                  TextButton(
                    onPressed: () => context.go('/courses'),
                    child: const Text('See All'),
                  ),
                ],
              ),
            ),
          ),
          
          if (courseState.isLoading)
             const SliverToBoxAdapter(
              child: Center(child: Padding(
                padding: EdgeInsets.all(20.0),
                child: CircularProgressIndicator(),
              )),
            )
          else 
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.sm),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    // Show top 3 courses
                    if (index >= 3 || index >= courseState.courses.length) return null;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: AppSpacing.md),
                      child: CourseCard(course: courseState.courses[index]),
                    );
                  },
                  childCount: courseState.courses.length > 3 ? 3 : courseState.courses.length,
                ),
              ),
            ),

          // Bottom padding
          const SliverToBoxAdapter(child: SizedBox(height: 80)),
        ],
      ),
    );
  }

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Ohayou gozaimasu 🌅';
    if (hour < 18) return 'Konnichiwa ☀️';
    return 'Konbanwa 🌙';
  }

  Widget _buildStatBadge(IconData icon, String label, {bool isDark = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: isDark ? AppColors.grey50 : Colors.white.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(AppRadius.full),
        border: Border.all(
          color: isDark ? AppColors.grey200 : Colors.white.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: isDark ? Colors.orange : Colors.amberAccent, size: 16),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              color: isDark ? AppColors.textPrimary : Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActionCard(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        child: Container(
          decoration: BoxDecoration(
            color: theme.cardColor,
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(color: theme.dividerColor),
            boxShadow: [
              BoxShadow(
                color: isDark ? Colors.black.withValues(alpha: 0.3) : Colors.black.withValues(alpha: 0.03),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: color, size: 24),
              ),
              const Spacer(),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: AppTypography.fontSizeMd,
                  color: theme.textTheme.bodyLarge?.color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
