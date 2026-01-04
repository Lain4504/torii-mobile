import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../auth/providers/auth_providers.dart';
import '../../../auth/models/auth_state_sealed.dart';
import '../../../course/providers/course_providers.dart';
import '../../../course/views/widgets/course_card.dart';
import '../../../../core/theme/theme_provider.dart';

/// Home Page - Minimalist Dashboard
/// 
/// A clean, zen-inspired home page emphasizing focus and calm.
/// Features generous whitespace, subtle animations, and clear hierarchy.
class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> 
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: AppDuration.slow,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: AppCurves.easeOut,
    );
    _animationController.forward();
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(courseListProvider.notifier).loadCourses();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authStateProvider);
    final user = authState is AuthAuthenticated ? authState.user : null;
    final courseState = ref.watch(courseListProvider);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // Header
            _buildHeader(context, user, isDark),
            
            // Greeting Section
            _buildGreetingSection(context, user),
            
            // Learning Progress (if authenticated)
            if (user != null) _buildProgressSection(context, isDark),
            
            // Quick Actions
            _buildQuickActions(context, user, isDark),
            
            // Continue Learning
            if (user != null) _buildContinueLearning(context),
            
            // Recommended Courses
            _buildRecommendedCourses(context, courseState, isDark),
            
            // Bottom Spacing
            const SliverToBoxAdapter(
              child: SizedBox(height: AppSpacing.xxxl),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, dynamic user, bool isDark) {
    return SliverAppBar(
      floating: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: 64,
      title: Row(
        children: [
          // Logo
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(AppRadius.sm),
            ),
            child: const Center(
              child: Text(
                '鳥',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Text(
            'Torii',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: AppTypography.bold,
              letterSpacing: AppTypography.letterSpacingTight,
            ),
          ),
        ],
      ),
      actions: [
        // Theme Toggle
        // Theme Toggle
        IconButton(
          onPressed: () => ref.read(themeModeProvider.notifier).toggleTheme(),
          tooltip: 'Toggle Theme',
          icon: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return RotationTransition(
                turns: child.key == const ValueKey('dark') 
                    ? Tween<double>(begin: 0.75, end: 1).animate(animation)
                    : Tween<double>(begin: 0.75, end: 1).animate(animation),
                child: FadeTransition(opacity: animation, child: child),
              );
            },
            child: Icon(
              isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
              key: ValueKey(isDark ? 'light' : 'dark'),
              size: AppIconSize.md,
            ),
          ),
        ),
        // Notifications
        IconButton(
          icon: const Icon(
            Icons.notifications_none_outlined,
            size: AppIconSize.md,
          ),
          onPressed: () {},
          tooltip: 'Notifications',
        ),
        // Profile / Login
        if (user == null)
          Padding(
            padding: const EdgeInsets.only(right: AppSpacing.sm),
            child: TextButton(
              onPressed: () => context.push('/login'),
              child: const Text('Sign In'),
            ),
          )
        else
          Padding(
            padding: const EdgeInsets.only(right: AppSpacing.md),
            child: CircleAvatar(
              radius: 16,
              backgroundColor: AppColors.primarySurface,
              child: Text(
                user.displayName.isNotEmpty 
                    ? user.displayName[0].toUpperCase() 
                    : 'U',
                style: const TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildGreetingSection(BuildContext context, dynamic user) {
    final theme = Theme.of(context);
    
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.pageHorizontal,
          AppSpacing.lg,
          AppSpacing.pageHorizontal,
          AppSpacing.md,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _getGreeting(),
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: AppSpacing.xxs),
            Text(
              user != null
                  ? (user.displayName.isNotEmpty ? user.displayName : 'Learner')
                  : 'Welcome to Torii',
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: AppTypography.bold,
              ),
            ),
            if (user != null) ...[
              const SizedBox(height: AppSpacing.xs),
              Text(
                'Continue your Japanese journey',
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildProgressSection(BuildContext context, bool isDark) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.pageHorizontal,
          vertical: AppSpacing.md,
        ),
        child: MinimalCard(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            children: [
              // Stats Row
              Row(
                children: [
                  _buildStatItem(
                    context,
                    icon: Icons.local_fire_department_outlined,
                    value: '7',
                    label: 'Day Streak',
                    color: AppColors.accent,
                  ),
                  _buildDivider(),
                  _buildStatItem(
                    context,
                    icon: Icons.star_outline_rounded,
                    value: '1,240',
                    label: 'Total XP',
                    color: AppColors.primary,
                  ),
                  _buildDivider(),
                  _buildStatItem(
                    context,
                    icon: Icons.workspace_premium_outlined,
                    value: 'N4',
                    label: 'Level',
                    color: AppColors.success,
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.lg),
              // Daily Goal
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Daily Goal',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const SizedBox(height: AppSpacing.xs),
                        const ProgressBar(
                          progress: 0.7,
                          height: 8,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.sm,
                      vertical: AppSpacing.xs,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primarySurface,
                      borderRadius: BorderRadius.circular(AppRadius.chip),
                    ),
                    child: Text(
                      '7/10',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: AppTypography.fontSizeSm,
                        fontWeight: AppTypography.semiBold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem(
    BuildContext context, {
    required IconData icon,
    required String value,
    required String label,
    required Color color,
  }) {
    return Expanded(
      child: Column(
        children: [
          Icon(icon, color: color, size: AppIconSize.lg),
          const SizedBox(height: AppSpacing.sm),
          Text(
            value,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: AppTypography.bold,
            ),
          ),
          const SizedBox(height: AppSpacing.xxs),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      width: 1,
      height: 48,
      color: AppColors.borderLight,
    );
  }

  Widget _buildQuickActions(BuildContext context, dynamic user, bool isDark) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.pageHorizontal),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Quick Start',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: AppTypography.semiBold,
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            Row(
              children: [
                Expanded(
                  child: _QuickActionButton(
                    icon: Icons.school_outlined,
                    label: 'Courses',
                    onTap: () => context.go('/courses'),
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: _QuickActionButton(
                    icon: Icons.style_outlined,
                    label: 'Flashcards',
                    onTap: () {
                      if (user == null) {
                        _showLoginPrompt(context);
                      } else {
                        context.go('/flashcards');
                      }
                    },
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: _QuickActionButton(
                    icon: Icons.quiz_outlined,
                    label: 'Practice',
                    onTap: () {
                      if (user == null) {
                        _showLoginPrompt(context);
                      } else {
                        context.go('/exams');
                      }
                    },
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: _QuickActionButton(
                    icon: Icons.videocam_outlined,
                    label: 'Live',
                    onTap: () {
                      if (user == null) {
                        _showLoginPrompt(context);
                      } else {
                        context.go('/live-classes');
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContinueLearning(BuildContext context) {
    final theme = Theme.of(context);
    
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.pageHorizontal,
          vertical: AppSpacing.md,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Continue Learning',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: AppTypography.semiBold,
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            MinimalCard(
              onTap: () {},
              child: Row(
                children: [
                  // Thumbnail
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: AppColors.primarySurface,
                      borderRadius: BorderRadius.circular(AppRadius.md),
                    ),
                    child: const Icon(
                      Icons.play_arrow_rounded,
                      color: AppColors.primary,
                      size: AppIconSize.lg,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Lesson 12: Particle を',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: AppTypography.semiBold,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.xxs),
                        Text(
                          'N5 Grammar Course',
                          style: theme.textTheme.bodySmall,
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        const ProgressBar(progress: 0.45, height: 4),
                      ],
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: AppColors.textTertiary,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecommendedCourses(
    BuildContext context,
    dynamic courseState,
    bool isDark,
  ) {
    final theme = Theme.of(context);
    
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.pageHorizontal,
          vertical: AppSpacing.md,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recommended',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: AppTypography.semiBold,
                  ),
                ),
                TextButton(
                  onPressed: () => context.go('/courses'),
                  child: const Text('See All'),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            if (courseState.isLoading)
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(AppSpacing.xl),
                  child: CircularProgressIndicator(),
                ),
              )
            else if (courseState.courses.isEmpty)
              EmptyState(
                icon: Icons.school_outlined,
                title: 'No Courses Yet',
                subtitle: 'Check back later for new courses',
                action: ElevatedButton(
                  onPressed: () => ref.read(courseListProvider.notifier).loadCourses(),
                  child: const Text('Refresh'),
                ),
              )
            else
              ...courseState.courses.take(3).map((course) => Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.md),
                child: CourseCard(course: course),
              )),
          ],
        ),
      ),
    );
  }

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Good morning';
    if (hour < 18) return 'Good afternoon';
    return 'Good evening';
  }

  void _showLoginPrompt(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.xl)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 48,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.grey300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            const Icon(
              Icons.lock_outline_rounded,
              size: 48,
              color: AppColors.textTertiary,
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              'Sign in Required',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: AppTypography.semiBold,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              'Sign in to access this feature and track your progress.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: AppSpacing.lg),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  context.push('/login');
                },
                child: const Text('Sign In'),
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            const SizedBox(height: AppSpacing.md),
          ],
        ),
      ),
    );
  }
}

/// Quick Action Button - Compact action tile
class _QuickActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _QuickActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadius.card),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.sm,
            vertical: AppSpacing.md,
          ),
          decoration: BoxDecoration(
            color: isDark ? AppColors.surfaceDark : AppColors.surface,
            borderRadius: BorderRadius.circular(AppRadius.card),
            border: Border.all(
              color: isDark ? AppColors.borderDark : AppColors.borderLight,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: AppIconSize.lg,
                color: AppColors.primary,
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                label,
                style: theme.textTheme.labelMedium?.copyWith(
                  fontWeight: AppTypography.medium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
