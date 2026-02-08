import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../auth/providers/auth_providers.dart';
import '../../../course/providers/my_learning_provider.dart';
import '../../../course/views/widgets/course_card.dart';
import 'package:torii_app/core/theme/theme_provider.dart';
import 'package:torii_app/features/notification/providers/notification_providers.dart';

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
    final asyncAuth = ref.watch(authStateProvider);
    final authState = asyncAuth.asData?.value;
    final user = (authState?.isAuthenticated ?? false) ? authState?.user : null;
    final myLearning = ref.watch(myLearningProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: ZenBackground(
        child: myLearning.isLoading && myLearning.myCourses.isEmpty
            ? const ZenLoadingScreen(text: 'Đang khởi tạo hệ thống...')
            : RefreshIndicator(
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
      
                    const SliverToBoxAdapter(child: SizedBox(height: 120)),
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
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      toolbarHeight: 80,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'CẬP NHẬT LÚC: ${DateTime.now().hour.toString().padLeft(2, '0')}:${DateTime.now().minute.toString().padLeft(2, '0')}',
            style: TextStyle(
              fontSize: 9,
              color: AppColors.primary.withValues(alpha: 0.4),
              fontWeight: AppTypography.black,
              letterSpacing: 2.0,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            'HỌC TẬP TORII',
            style: TextStyle(
              fontFamily: AppTypography.fontFamilySerif,
              fontWeight: AppTypography.black,
              fontSize: 22,
              fontStyle: FontStyle.italic,
              color: AppColors.textPrimary,
              letterSpacing: -0.5,
            ),
          ),
        ],
      ),
      actions: [
        _HeaderAction(
          icon: isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
          onPressed: () => ref.read(themeModeProvider.notifier).toggleTheme(),
        ),
        _HeaderAction(
          icon: Icons.search_rounded,
          onPressed: () => context.push('/search'),
        ),
        Consumer(
          builder: (context, ref, child) {
            final unreadCountAsync = ref.watch(notificationUnreadCountProvider);
            final count = unreadCountAsync.valueOrNull ?? 0;
            
            return Stack(
              clipBehavior: Clip.none,
              children: [
                _HeaderAction(
                  icon: Icons.notifications_none_rounded,
                  onPressed: () => context.push('/notifications'),
                ),
                if (count > 0)
                  Positioned(
                    right: 4,
                    top: 4,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: AppColors.error,
                        shape: BoxShape.circle,
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      child: Text(
                        count > 99 ? '99+' : '$count',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          height: 1,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
        const SizedBox(width: AppSpacing.md),
      ],
    );
  }

  Widget _buildGreeting(dynamic user) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(AppSpacing.xl, 20, AppSpacing.xl, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(AppRadius.full),
              border: Border.all(color: AppColors.primary.withValues(alpha: 0.1)),
            ),
            child: Text(
              'BÀI HỌC ĐANG HỌC',
              style: TextStyle(
                fontSize: 8,
                fontWeight: AppTypography.black,
                letterSpacing: 3.0,
                color: AppColors.primary.withValues(alpha: 0.6),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Chào mừng quay trở lại, ${user?.displayName ?? 'Học viên'}',
            style: const TextStyle(
              fontFamily: AppTypography.fontFamilySerif,
              fontSize: 34,
              fontWeight: AppTypography.bold,
              letterSpacing: -1.0,
              fontStyle: FontStyle.italic,
              height: 1.1,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _StatItem(label: 'CHUỖI', value: '${stats['streak'] ?? 0}', icon: Icons.local_fire_department_rounded, color: const Color(0xFFE63946)),
            _buildDivider(),
            _StatItem(label: 'KINH NGHIỆM', value: '${stats['totalXp'] ?? 0}', icon: Icons.bolt_rounded, color: AppColors.primary),
            _buildDivider(),
            _StatItem(label: 'TRÌNH ĐỘ', value: '${stats['masteryLevel'] ?? 'N5'}', icon: Icons.auto_awesome_rounded, color: AppColors.accent),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() => Container(width: 1, height: 40, color: AppColors.grey200.withValues(alpha: 0.5));

  Widget _buildActiveProtocol(BuildContext context, List<dynamic> courses) {
    if (courses.isEmpty) return const SizedBox.shrink();
    
    final lastCourse = courses.first;

    return Padding(
      padding: const EdgeInsets.fromLTRB(AppSpacing.xl, AppSpacing.xxl, AppSpacing.xl, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'TIẾP TỤC HỌC',
            style: TextStyle(
              fontSize: 10, 
              fontWeight: AppTypography.black, 
              letterSpacing: 3.0, 
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 16),
          _GlassContainer(
            padding: const EdgeInsets.all(AppSpacing.lg),
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
                        blurRadius: 15, offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Icon(Icons.play_arrow_rounded, color: Colors.white, size: 36),
                  ),
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
                        style: const TextStyle(fontWeight: AppTypography.extraBold, fontSize: 17),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'TIẾP TỤC: MODULE 3',
                        style: TextStyle(
                          fontSize: 9, 
                          fontWeight: AppTypography.black, 
                          color: AppColors.primary.withValues(alpha: 0.5),
                          letterSpacing: 1.5,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const ProgressBar(progress: 0.65, height: 6),
                    ],
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_forward_ios_rounded, size: 14, color: AppColors.textTertiary),
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
                'KHÓA HỌC CỦA TÔI',
                style: TextStyle(fontSize: 10, fontWeight: AppTypography.black, letterSpacing: 3.0, color: AppColors.primary),
              ),
              TextButton(
                onPressed: () => context.push('/my-learning'),
                child: const Text('XEM TẤT CẢ', style: TextStyle(fontSize: 10, fontWeight: AppTypography.black, color: AppColors.primary)),
              ),
            ],
          ),
        ),
        if (state.isLoading)
           const Center(
             child: Padding(
               padding: EdgeInsets.symmetric(vertical: AppSpacing.xxxl),
               child: ZenLoading(text: 'Đang truy cập dữ liệu...'),
             ),
           )
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
              'CHƯA ĐĂNG KÝ KHÓA HỌC',
              style: TextStyle(fontWeight: AppTypography.black, letterSpacing: 1.0),
            ),
            const SizedBox(height: 8),
            const Text(
              'Bắt đầu hành trình bằng cách đăng ký một khóa học.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
            ),
            const SizedBox(height: 24),
            ZenButton(
              text: 'KHÁM PHÁ DANH MỤC', 
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
      padding: const EdgeInsets.fromLTRB(AppSpacing.xl, AppSpacing.xxl, AppSpacing.xl, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'TRUY CẬP NHANH',
            style: TextStyle(
              fontSize: 10, 
              fontWeight: AppTypography.black, 
              letterSpacing: 4.0, 
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _ShortcutTile(Icons.psychology_rounded, 'Ôn tập', () => context.push('/flashcards'))),
              const SizedBox(width: AppSpacing.md),
              Expanded(child: _ShortcutTile(Icons.assignment_turned_in_rounded, 'Kiểm tra', () => context.push('/exams'))),
              const SizedBox(width: AppSpacing.md),
              Expanded(child: _ShortcutTile(Icons.groups_rounded, 'Cộng đồng', () => context.push('/community'))),
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
        color: Colors.white.withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(AppRadius.xxl),
        border: Border.all(color: AppColors.grey300.withValues(alpha: 0.3)),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.02),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
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
      borderRadius: BorderRadius.circular(AppRadius.lg),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 24),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.8),
            borderRadius: BorderRadius.circular(AppRadius.xxl),
            border: Border.all(color: AppColors.grey300.withValues(alpha: 0.3)),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.02),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            children: [
              Icon(icon, color: AppColors.primary, size: 26),
              const SizedBox(height: 8),
              Text(
                label.toUpperCase(), 
                style: const TextStyle(
                  fontSize: 9, 
                  fontWeight: AppTypography.black, 
                  letterSpacing: 1.5,
                ),
              ),
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
        color: Colors.white.withValues(alpha: 0.8),
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.grey200.withValues(alpha: 0.3)),
      ),
      child: IconButton(
        icon: Icon(icon, size: 20, color: AppColors.textPrimary),
        onPressed: onPressed,
      ),
    );
  }
}
