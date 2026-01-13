import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../auth/providers/auth_providers.dart';
import '../../../auth/models/auth_state_sealed.dart';
import '../../../course/providers/my_learning_provider.dart';
import '../../../course/views/widgets/course_card.dart';
import '../../../../core/theme/theme_provider.dart';
import '../../../../core/widgets/zen_background.dart';
import '../../../../core/widgets/animations/entry_animation.dart';

/// Dashboard Page - Focused Learning Matrix for Authenticated Users
class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  ConsumerState<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(myLearningProvider.notifier).loadData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authStateProvider);
    final user = authState is AuthAuthenticated ? authState.user : null;
    final myLearning = ref.watch(myLearningProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: ZenBackground(
        child: RefreshIndicator(
          onRefresh: () => ref.read(myLearningProvider.notifier).loadData(),
          color: AppColors.primary,
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              _buildAppBar(context, user, isDark),
              
              // Welcome & Focus Tag
              SliverToBoxAdapter(
                child: EntryAnimation(
                  index: 0,
                  child: _buildGreeting(user),
                ),
              ),

              // Zen Stats Capsule
              SliverToBoxAdapter(
                child: EntryAnimation(
                  index: 1,
                  verticalOffset: 20,
                  child: _buildStatsOverview(myLearning.stats),
                ),
              ),

              // Active Protocol (Resume Last Lesson)
              SliverToBoxAdapter(
                child: EntryAnimation(
                  index: 2,
                  child: _buildActiveProtocol(context, myLearning.myCourses),
                ),
              ),

              // Neural Banks (My Courses)
              SliverToBoxAdapter(
                child: EntryAnimation(
                  index: 3,
                  child: _buildNeuralBanks(context, myLearning),
                ),
              ),

              // Terminal Shortcuts
              SliverToBoxAdapter(
                child: EntryAnimation(
                  index: 4,
                  child: _buildShortcuts(context),
                ),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: 100)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context, dynamic user, bool isDark) {
    return SliverAppBar(
      floating: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'LOGGED_IN: ${DateTime.now().hour}:${DateTime.now().minute}',
            style: TextStyle(
              fontFamily: 'Courier',
              fontSize: 10,
              color: AppColors.primary.withOpacity(0.5),
              fontWeight: AppTypography.bold,
            ),
          ),
          Text(
            'TORII_MATRIX',
            style: TextStyle(
              fontFamily: AppTypography.fontFamilySerif,
              fontWeight: AppTypography.black,
              fontSize: 20,
              fontStyle: FontStyle.italic,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
      actions: [
        _HeaderAction(
          icon: Icons.notifications_none_rounded,
          onPressed: () {},
        ),
        _HeaderAction(
          icon: isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
          onPressed: () => ref.read(themeModeProvider.notifier).toggleTheme(),
        ),
        const SizedBox(width: AppSpacing.md),
      ],
    );
  }

  Widget _buildGreeting(dynamic user) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(AppRadius.chip),
            ),
            child: Text(
              'ACTIVE LEARNING PROTOCOL',
              style: TextStyle(
                fontSize: 8,
                fontWeight: AppTypography.black,
                letterSpacing: 1.5,
                color: AppColors.primary,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Okaeri, ${user?.displayName ?? 'Learner'}',
            style: const TextStyle(
              fontSize: 32,
              fontWeight: AppTypography.extraBold,
              letterSpacing: -1.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsOverview(Map<String, dynamic> stats) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 24),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.7),
          borderRadius: BorderRadius.circular(AppRadius.xxl),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.05),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
          ],
          border: Border.all(color: Colors.white.withOpacity(0.2)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _StatItem(label: 'STREAK', value: '${stats['streak'] ?? 0}', icon: Icons.local_fire_department_rounded, color: Colors.orange),
            _buildDivider(),
            _StatItem(label: 'ZEN XP', value: '${stats['totalXp'] ?? 0}', icon: Icons.bolt_rounded, color: AppColors.primary),
            _buildDivider(),
            _StatItem(label: 'MASTERY', value: '${stats['masteryLevel'] ?? 'N5'}', icon: Icons.auto_awesome_rounded, color: AppColors.accent),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() => Container(width: 1, height: 40, color: AppColors.grey200.withOpacity(0.5));

  Widget _buildActiveProtocol(BuildContext context, List<dynamic> courses) {
    if (courses.isEmpty) return const SizedBox.shrink();
    
    final lastCourse = courses.first;

    return Padding(
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'NEURAL CONTINUITY',
            style: TextStyle(fontSize: 10, fontWeight: AppTypography.black, letterSpacing: 2.0, color: AppColors.textTertiary),
          ),
          const SizedBox(height: 16),
          _GlassContainer(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Row(
              children: [
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(AppRadius.lg),
                  ),
                  child: const Icon(Icons.play_arrow_rounded, color: Colors.white, size: 32),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        lastCourse.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: AppTypography.extraBold, fontSize: 16),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'RESUME MODULE 3: PARTICLES',
                        style: TextStyle(fontSize: 10, fontWeight: AppTypography.bold, color: AppColors.primary),
                      ),
                      const SizedBox(height: 12),
                      const ProgressBar(progress: 0.65, height: 6),
                    ],
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNeuralBanks(BuildContext context, MyLearningState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'NEURAL MEMORY BANKS',
                style: TextStyle(fontSize: 10, fontWeight: AppTypography.black, letterSpacing: 2.0, color: AppColors.textTertiary),
              ),
              TextButton(
                onPressed: () => context.push('/my-learning'),
                child: const Text('ALL SYNCED', style: TextStyle(fontSize: 10, fontWeight: AppTypography.black, color: AppColors.primary)),
              ),
            ],
          ),
        ),
        if (state.isLoading)
           const Center(child: CircularProgressIndicator())
        else if (state.myCourses.isEmpty)
           _buildEmptyLearning(context)
        else
          SizedBox(
            height: 280,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
              scrollDirection: Axis.horizontal,
              itemCount: state.myCourses.length,
              itemBuilder: (context, index) {
                final course = state.myCourses[index];
                return Container(
                  width: 280,
                  margin: const EdgeInsets.only(right: AppSpacing.lg),
                  child: CourseCard(course: course),
                );
              },
            ),
          ),
      ],
    );
  }

  Widget _buildEmptyLearning(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: _GlassContainer(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          children: [
            const Icon(Icons.auto_stories_rounded, size: 48, color: AppColors.textTertiary),
            const SizedBox(height: 16),
            const Text(
              'NO NEURAL SYNC DETECTED',
              style: TextStyle(fontWeight: AppTypography.black, letterSpacing: 1.0),
            ),
            const SizedBox(height: 8),
            const Text(
              'Your learning matrix is currently void. Connect to a protocol to begin.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
            ),
            const SizedBox(height: 24),
            ZenButton(
              text: 'EXPLORE CATALOG', 
              onPressed: () => context.go('/courses'),
              isFullWidth: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShortcuts(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'QUICK PROTOCOLS',
            style: TextStyle(fontSize: 10, fontWeight: AppTypography.black, letterSpacing: 2.0, color: AppColors.textTertiary),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _ShortcutTile(Icons.psychology_rounded, 'Review', () => context.push('/flashcards'))),
              const SizedBox(width: AppSpacing.md),
              Expanded(child: _ShortcutTile(Icons.assignment_turned_in_rounded, 'Exams', () => context.push('/exams'))),
              const SizedBox(width: AppSpacing.md),
              Expanded(child: _ShortcutTile(Icons.groups_rounded, 'Community', () => context.push('/community'))),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color color;

  const _StatItem({required this.label, required this.value, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(height: 8),
        Text(value, style: const TextStyle(fontSize: 20, fontWeight: AppTypography.black)),
        Text(label, style: TextStyle(fontSize: 8, fontWeight: AppTypography.black, color: AppColors.textTertiary, letterSpacing: 1.0)),
      ],
    );
  }
}

class _GlassContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;

  const _GlassContainer({required this.child, required this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.6),
        borderRadius: BorderRadius.circular(AppRadius.xxl),
        border: Border.all(color: Colors.white.withOpacity(0.3)),
      ),
      child: child,
    );
  }
}

class _ShortcutTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ShortcutTile(this.icon, this.label, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(AppRadius.xl),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadius.xl),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppRadius.xl),
            border: Border.all(color: AppColors.grey200.withOpacity(0.5)),
          ),
          child: Column(
            children: [
              Icon(icon, color: AppColors.primary, size: 24),
              const SizedBox(height: 8),
              Text(label.toUpperCase(), style: const TextStyle(fontSize: 8, fontWeight: AppTypography.black, letterSpacing: 1.0)),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeaderAction extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _HeaderAction({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.grey200.withOpacity(0.3)),
      ),
      child: IconButton(
        icon: Icon(icon, size: 20, color: AppColors.textPrimary),
        onPressed: onPressed,
      ),
    );
  }
}
