import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/widgets/widgets.dart';
import 'package:torii_app/features/auth/providers/auth_providers.dart';
import 'package:torii_app/features/course/providers/course_providers.dart';
import 'package:torii_app/features/course/views/widgets/course_card.dart';
import 'package:torii_app/core/theme/theme_provider.dart';
import 'package:torii_app/core/localization/l10n/app_localizations.dart';

/// Home Page - Premium Zen UI Rebuild
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
      if (mounted) {
        ref.read(courseListProvider.notifier).loadCourses();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authStateProvider);
    final user = authState.isAuthenticated ? authState.user : null;
    final courseState = ref.watch(courseListProvider);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: ZenBackground(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // Premium Header
            _buildHeader(context, user, isDark),
            
            // Greeting & AI Stats
            SliverToBoxAdapter(
              child: EntryAnimation(
                index: 0,
                child: _buildGreetingSection(context, user),
              ),
            ),
            
            // Learning Progress Terminal
            if (user != null) 
              SliverToBoxAdapter(
                child: EntryAnimation(
                  index: 1,
                  verticalOffset: 30,
                  child: _buildProgressSection(context),
                ),
              ),
            
            // Path to Mastery Section
            SliverToBoxAdapter(
              child: EntryAnimation(
                index: 2,
                child: _buildQuickActions(context, user),
              ),
            ),
            
            // Continue Journey
            if (user != null) 
              SliverToBoxAdapter(
                child: EntryAnimation(
                  index: 3,
                  child: _buildContinueLearning(context),
                ),
              ),
            
            // Global Catalog / Recommended
            SliverToBoxAdapter(
              child: EntryAnimation(
                index: 4,
                child: _buildRecommendedCourses(context, courseState),
              ),
            ),
            
            // Zen Spacing
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
      pinned: false,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: 90,
      title: Row(
        children: [
          // Logo Box matching Web
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.2),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
              border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
            ),
            child: const Center(
              child: Icon(Icons.auto_awesome_rounded, color: Colors.white, size: 24),
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'TORII',
                style: TextStyle(
                  fontFamily: AppTypography.fontFamilySerif,
                  fontWeight: AppTypography.extraBold,
                  fontSize: 22,
                  letterSpacing: -1.0,
                  fontStyle: FontStyle.italic,
                  color: AppColors.textPrimary,
                  height: 1.0,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                'NIHONGO CENTER',
                style: TextStyle(
                  fontSize: 8,
                  fontWeight: AppTypography.black,
                  letterSpacing: 2.0,
                  color: AppColors.primary.withValues(alpha: 0.6),
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        // Theme Logic
        _HeaderIconButton(
          icon: isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
          onPressed: () => ref.read(themeModeProvider.notifier).toggleTheme(),
        ),
        // Access Profile
        if (user == null)
          Padding(
            padding: const EdgeInsets.only(right: AppSpacing.md),
            child: TextButton(
              onPressed: () => context.go('/login'),
              child: Text(
                AppLocalizations.of(context)!.signIn.toUpperCase(),
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: AppTypography.black,
                  letterSpacing: 1.0,
                  color: AppColors.primary,
                ),
              ),
            ),
          )
        else
          Padding(
            padding: const EdgeInsets.only(right: AppSpacing.md),
            child: GestureDetector(
              onTap: () => context.push('/settings'),
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.primary.withValues(alpha: 0.1), width: 1.5),
                ),
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: AppColors.primarySurface,
                  child: Text(
                    user.displayName.isNotEmpty 
                        ? user.displayName[0].toUpperCase() 
                        : 'U',
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontWeight: AppTypography.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildGreetingSection(BuildContext context, dynamic user) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(AppSpacing.xl, AppSpacing.lg, AppSpacing.xl, AppSpacing.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                _getGreeting(context).toUpperCase(),
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: AppTypography.black,
                  letterSpacing: 3.0,
                  color: AppColors.textTertiary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            user != null
                ? (user.displayName.isNotEmpty ? user.displayName : AppLocalizations.of(context)!.learner)
                : AppLocalizations.of(context)!.welcomeToTorii,
            style: const TextStyle(
              fontSize: 38,
              fontWeight: AppTypography.extraBold,
              color: AppColors.textPrimary,
              letterSpacing: -1.5,
              height: 1.1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.8),
          borderRadius: BorderRadius.circular(AppRadius.xxl),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.04),
              blurRadius: 40,
              offset: const Offset(0, 15),
            ),
          ],
          border: Border.all(color: AppColors.grey300.withValues(alpha: 0.3)),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppRadius.xxl),
          child: Column(
            children: [
              // Stats Bar
              Container(
                padding: const EdgeInsets.all(AppSpacing.xl),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.01),
                  border: Border(bottom: BorderSide(color: AppColors.grey300.withValues(alpha: 0.3))),
                ),
                child: Row(
                  children: [
                    _buildStatItem(Icons.local_fire_department_rounded, '7', 'STREAK', const Color(0xFFE63946)),
                    _buildVerticalDivider(),
                    _buildStatItem(Icons.bolt_rounded, '1.2k', 'ZEN XP', AppColors.primary),
                    _buildVerticalDivider(),
                    _buildStatItem(Icons.emoji_events_rounded, 'N4', 'JLPT', AppColors.accent),
                  ],
                ),
              ),
              // Progress Terminal
              Padding(
                padding: const EdgeInsets.all(AppSpacing.xl),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'DAILY FOCUS GOAL',
                          style: TextStyle(
                            fontSize: 9,
                            fontWeight: AppTypography.black,
                            letterSpacing: 2.5,
                            color: AppColors.textTertiary,
                          ),
                        ),
                        Text(
                          '70%',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: AppTypography.black,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.md),
                    const ProgressBar(progress: 0.7, height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem(IconData icon, String value, String label, Color color) {
    return Expanded(
      child: Column(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: AppTypography.black,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              fontSize: 8,
              fontWeight: AppTypography.black,
              letterSpacing: 1.0,
              color: AppColors.textTertiary.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVerticalDivider() {
    return Container(width: 1, height: 40, color: AppColors.grey300.withValues(alpha: 0.4));
  }

  Widget _buildQuickActions(BuildContext context, dynamic user) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'PATH TO MASTERY',
            style: TextStyle(
              fontSize: 11,
              fontWeight: AppTypography.black,
              letterSpacing: 2.5,
              color: AppColors.textTertiary,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: AppSpacing.md,
            crossAxisSpacing: AppSpacing.md,
            childAspectRatio: 1.25,
            children: [
              _QuickActionTile(Icons.map_outlined, 'Global Catalog', AppColors.primary, () => context.go('/courses')),
              _QuickActionTile(Icons.psychology_outlined, 'Active Recall', AppColors.accent, () => user == null ? _showLoginPrompt(context) : context.go('/flashcards')),
              _QuickActionTile(Icons.assignment_turned_in_outlined, 'Assessment', const Color(0xFF7D58A1), () => user == null ? _showLoginPrompt(context) : context.go('/exams')),
              _QuickActionTile(Icons.videocam_outlined, 'Live Protocol', const Color(0xFFE63946), () => user == null ? _showLoginPrompt(context) : context.go('/live-classes')),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContinueLearning(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'OPTIMIZE FOCUS',
            style: TextStyle(
              fontSize: 11,
              fontWeight: AppTypography.black,
              letterSpacing: 2.5,
              color: AppColors.textTertiary,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(AppRadius.xxl),
              border: Border.all(color: AppColors.grey300.withValues(alpha: 0.5)),
            ),
            child: Row(
              children: [
                Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(AppRadius.lg),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: 0.2),
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Icon(Icons.play_circle_outline_rounded, color: Colors.white, size: 36),
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Particle を & に',
                        style: TextStyle(fontSize: 16, fontWeight: AppTypography.extraBold),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Curriculum Unit • JLPT N5',
                        style: TextStyle(fontSize: 11, fontWeight: AppTypography.bold, color: AppColors.textTertiary),
                      ),
                      const SizedBox(height: AppSpacing.md),
                      const ProgressBar(progress: 0.45, height: 8),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.chevron_right_rounded, color: AppColors.primary),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendedCourses(BuildContext context, dynamic courseState) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'NEURAL MEMORY BANKS',
                style: TextStyle(fontSize: 11, fontWeight: AppTypography.black, letterSpacing: 2.5, color: AppColors.textTertiary),
              ),
              TextButton(
                onPressed: () => context.go('/courses'),
                child: const Text('FULL ACCESS', style: TextStyle(fontSize: 10, fontWeight: AppTypography.black, letterSpacing: 1.0, color: AppColors.primary)),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          if (courseState.isLoading)
            const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: AppSpacing.xxxl),
                child: ZenLoading(text: 'Accessing Matrix Logs...'),
              ),
            )
          else
            ...courseState.courses.take(3).map((course) => Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.lg),
              child: CourseCard(course: course),
            )),
        ],
      ),
    );
  }

  String _getGreeting(BuildContext context) {
    final hour = DateTime.now().hour;
    if (hour < 5) return 'Good night';
    if (hour < 12) return 'Good Morning';
    if (hour < 18) return 'Good Afternoon';
    return 'Good Evening';
  }

  void _showLoginPrompt(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.xxxl))),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(width: 40, height: 4, decoration: BoxDecoration(color: AppColors.grey200, borderRadius: BorderRadius.circular(10))),
            const SizedBox(height: 40),
            const Icon(Icons.lock_outline_rounded, size: 50, color: AppColors.primary),
            const SizedBox(height: 24),
            const Text('A MOMENT OF ZEN', style: TextStyle(fontSize: 20, fontWeight: AppTypography.black, letterSpacing: 2.0)),
            const SizedBox(height: 12),
            const Text(
              'Please sign in to access your neural progress across the Torii Learning Matrix.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, height: 1.6, fontWeight: AppTypography.medium, color: AppColors.textSecondary),
            ),
            const SizedBox(height: 40),
            ZenButton(
              text: 'INITIATE ACCESS',
              onPressed: () {
                Navigator.pop(context);
                context.go('/login');
              },
              isFullWidth: true,
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () => Navigator.pop(context), 
              child: const Text(
                'REMAIN ANONYMOUS', 
                style: TextStyle(
                  color: AppColors.textTertiary, 
                  fontSize: 10, 
                  fontWeight: AppTypography.black, 
                  letterSpacing: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeaderIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  const _HeaderIconButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: AppSpacing.sm),
      decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.8), shape: BoxShape.circle, border: Border.all(color: AppColors.grey300.withValues(alpha: 0.5))),
      child: IconButton(icon: Icon(icon, size: 20, color: AppColors.textPrimary), onPressed: onPressed),
    );
  }
}

class _QuickActionTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _QuickActionTile(this.icon, this.label, this.color, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(AppRadius.lg),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        child: Container(
          padding: const EdgeInsets.all(AppSpacing.xl),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(color: AppColors.grey300.withValues(alpha: 0.3)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: color, size: 28),
              const Spacer(),
              Text(
                label.toUpperCase(),
                style: const TextStyle(
                  fontWeight: AppTypography.black, 
                  fontSize: 10, 
                  letterSpacing: 1.0, 
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

