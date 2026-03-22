import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/providers/api_providers.dart';
import 'package:torii_app/features/auth/providers/auth_providers.dart';
import 'package:torii_app/data/models/academy_models.dart';
import 'package:torii_app/data/models/blog_model.dart';
import 'package:torii_app/features/home/presentation/widgets/streak_calendar_sheet.dart';
import 'package:torii_app/features/home/presentation/widgets/streak_welcome_dialog.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  bool _streakModalShownThisSession = false;
  late final PageController _blogPageController;

  @override
  void initState() {
    super.initState();
    _blogPageController = PageController(viewportFraction: 0.88);
  }

  @override
  void dispose() {
    _blogPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final authAsync = ref.watch(authStateProvider);
    final authValue = authAsync.valueOrNull;
    final isLoggedIn = authValue?.isAuthenticated == true;
    final isAuthLoading = authAsync.isLoading;
    final user = authValue?.user;
    final loadPersonalized = isLoggedIn && user?.isOnboarded == true;
    final displayName = isAuthLoading ? 'Đang tải...' : (user?.displayName ?? 'Bạn');
    final enrollmentsAsync = loadPersonalized ? ref.watch(myEnrollmentsProvider) : null;
    final blogListAsync = ref.watch(blogListProvider);
    final unreadCountAsync = loadPersonalized ? ref.watch(notificationsUnreadCountProvider) : null;
    final streakAsync = loadPersonalized ? ref.watch(streakProvider) : null;

    if (loadPersonalized) {
      ref.listen(streakProvider, (previous, next) async {
        if (_streakModalShownThisSession) return;
        final streak = next.valueOrNull;
        if (streak == null) return;
        if (streak.shouldShowToast != true) return;

        _streakModalShownThisSession = true;

        // Mark shown on server immediately (cross-device once/day)
        try {
          await ref.read(gamificationRepositoryProvider).markToastShown();
          ref.invalidate(streakProvider);
        } catch (_) {}

        if (!mounted) return;
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          if (!mounted) return;

          final activeDates = <String>{
            ...streak.recentActiveDates,
            if ((streak.lastActiveDate ?? '').isNotEmpty) streak.lastActiveDate!,
          };

          await showDialog<void>(
            context: context,
            barrierDismissible: true,
            builder: (_) => StreakWelcomeDialog(
              currentStreak: streak.currentStreak,
              activeDates: activeDates,
              isActiveToday: streak.isActiveToday,
              onViewDetail: () {
                Navigator.of(context).pop();
                showModalBottomSheet<void>(
                  context: context,
                  useRootNavigator: true,
                  isScrollControlled: true,
                  backgroundColor: AppColors.background,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  builder: (_) => const StreakCalendarSheet(),
                );
              },
            ),
          );
        });
      });
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                child: Row(
                  children: [
                    if (isLoggedIn && !isAuthLoading) ...[
                      InkWell(
                        onTap: () => context.push('/profile'),
                        borderRadius: BorderRadius.circular(999),
                        child: CircleAvatar(
                          radius: 22,
                          backgroundColor: AppColors.grey200,
                          backgroundImage: (user?.avatarUrl != null && user!.avatarUrl!.isNotEmpty)
                              ? NetworkImage(user.avatarUrl!)
                              : null,
                          child: (user?.avatarUrl == null || user!.avatarUrl!.isEmpty)
                              ? Text(
                                  (displayName.isNotEmpty ? displayName.characters.first : 'T').toUpperCase(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w800,
                                    color: AppColors.textPrimary,
                                  ),
                                )
                              : null,
                        ),
                      ),
                      const SizedBox(width: 12),
                    ],
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            displayName,
                            style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          if (isLoggedIn && !isAuthLoading)
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    showModalBottomSheet<void>(
                                      context: context,
                                      useRootNavigator: true,
                                      isScrollControlled: true,
                                      backgroundColor: AppColors.background,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                                      ),
                                      builder: (_) => const StreakCalendarSheet(),
                                    );
                                  },
                                  borderRadius: BorderRadius.circular(999),
                                  child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Icon(
                                          Icons.local_fire_department_rounded,
                                          size: 18,
                                          color: AppColors.primary,
                                        ),
                                        const SizedBox(width: 6),
                                        streakAsync == null
                                            ? const SizedBox.shrink()
                                            : streakAsync.when(
                                                data: (s) => Text(
                                                  '${s?.currentStreak ?? 0}',
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w800,
                                                    color: AppColors.textSecondary,
                                                  ),
                                                ),
                                                loading: () => const Text(
                                                  '…',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w800,
                                                    color: AppColors.textTertiary,
                                                  ),
                                                ),
                                                error: (_, __) => const SizedBox.shrink(),
                                              ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                    if (isLoggedIn && !isAuthLoading)
                      IconButton(
                        onPressed: () => context.push('/notifications'),
                        icon: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            const Icon(Icons.notifications_none_rounded, size: 26),
                            if (unreadCountAsync != null)
                              unreadCountAsync.when(
                                data: (count) {
                                  if (count <= 0) return const SizedBox.shrink();

                                  final label = count > 99 ? '99+' : '$count';
                                  return Positioned(
                                    top: -4,
                                    right: -6,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                      decoration: BoxDecoration(
                                        color: AppColors.error,
                                        borderRadius: BorderRadius.circular(999),
                                        border: Border.all(color: AppColors.background, width: 2),
                                      ),
                                      constraints: const BoxConstraints(minWidth: 18),
                                      child: Text(
                                        label,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w800,
                                          height: 1.0,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                loading: () => const SizedBox.shrink(),
                                error: (error, _) => const SizedBox.shrink(),
                              ),
                          ],
                        ),
                      )
                    else if (!isAuthLoading)
                      SizedBox(
                        height: 32,
                        child: OutlinedButton(
                          onPressed: () => context.push('/login'),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            textStyle: const TextStyle(fontSize: 12),
                          ),
                          child: const Text(
                            'Đăng nhập ngay',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ),
                      )
                    else
                      const SizedBox(
                        width: 32,
                        height: 32,
                        child: Center(
                          child: SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2)),
                        ),
                      ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                child: _HomeBanner(
                  isLoggedIn: isLoggedIn,
                  onPrimaryAction: () => context.push('/discovery'),
                  onSecondaryAction: () => context.push(isLoggedIn ? '/my-courses' : '/login'),
                ),
              ),
              _buildSectionHeader(
                context,
                'Khóa học của bạn',
                isLoggedIn ? () => context.push('/my-courses') : null,
              ),
              SizedBox(
                height: 220,
                child: isLoggedIn
                    ? enrollmentsAsync!.when(
                        data: (paginated) {
                          final list = paginated.data.take(5).toList();
                          if (list.isEmpty) return _emptyCourseHint(context);
                          return ListView.separated(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            scrollDirection: Axis.horizontal,
                            itemCount: list.length,
                            separatorBuilder: (context, _) => const SizedBox(width: 12),
                            itemBuilder: (context, index) => _buildCourseCard(list[index]),
                          );
                        },
                        loading: () => const Center(child: CircularProgressIndicator()),
                        error: (error, _) => _emptyCourseHint(context),
                      )
                    : _loginRequiredHint(
                        context,
                        title: 'Đăng nhập để xem khóa học của bạn',
                        subtitle: 'Bạn sẽ thấy tiến độ, bài học đang học và gợi ý phù hợp.',
                      ),
              ),
              const SizedBox(height: AppSpacing.xl),
              _buildSectionHeader(context, 'Cấp độ JLPT', null),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: _buildJlptLevelStrip(context),
              ),
              const SizedBox(height: 28),
              _buildSectionHeader(
                context,
                'Blog',
                () => context.push('/blog'),
              ),
              blogListAsync.when(
                data: (paginated) {
                  final items = paginated.data.take(8).toList();
                  if (items.isEmpty) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      child: Text(
                        'Chưa có bài viết',
                        style: TextStyle(color: AppColors.textTertiary),
                      ),
                    );
                  }
                  return SizedBox(
                    height: 268,
                    child: PageView.builder(
                      controller: _blogPageController,
                      padEnds: true,
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(6, 0, 6, 8),
                          child: _buildBlogSwiperCard(context, items[index]),
                        );
                      },
                    ),
                  );
                },
                loading: () => const Padding(
                  padding: EdgeInsets.symmetric(vertical: 32),
                  child: Center(child: CircularProgressIndicator()),
                ),
                error: (error, _) => const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Text(
                    'Không tải được blog',
                    style: TextStyle(color: AppColors.textTertiary, fontSize: 13),
                  ),
                ),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  Widget _emptyCourseHint(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () => context.push('/discovery'),
        child: const Text('Khám phá khóa học', style: TextStyle(color: AppColors.primary)),
      ),
    );
  }

  Widget _loginRequiredHint(
    BuildContext context, {
    required String title,
    required String subtitle,
  }) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.grey300),
          boxShadow: [
            BoxShadow(
              color: AppColors.textPrimary.withOpacity(0.04),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 6),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodySmall?.copyWith(color: AppColors.textTertiary, height: 1.35),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              height: 44,
              child: ElevatedButton(
                onPressed: () => context.push('/login'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.textOnPrimary,
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: const Text('Đăng nhập ngay', style: TextStyle(fontWeight: FontWeight.w800)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title, VoidCallback? onMore) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w800,
              letterSpacing: 0.2,
              color: AppColors.textSecondary,
            ),
          ),
          if (onMore != null)
            TextButton(
              onPressed: onMore,
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: const Size(0, 32),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: const Text('Xem thêm', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w700)),
            ),
        ],
      ),
    );
  }

  Widget _buildCourseCard(EnrollmentModel e) {
    final progress = e.progress ?? 0.0;
    return Container(
      width: 280,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.grey300),
        boxShadow: [
          BoxShadow(
            color: AppColors.textPrimary.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(AppRadius.xl)),
            child: Image.network(
              e.thumbnailUrl ?? 'https://picsum.photos/seed/jp1/400/200',
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 100,
                color: AppColors.grey200,
                child: const Icon(Icons.school),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(e.courseTitle ?? 'Khóa học', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14), maxLines: 1, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: LinearProgressIndicator(
                        value: progress.clamp(0.0, 1.0),
                        backgroundColor: AppColors.grey200,
                        valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
                        minHeight: 6,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text('${(progress * 100).toInt()}%', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0), minimumSize: Size.zero, tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                    child: const Text('Tiếp tục học', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 12)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Một hàng pill cuộn ngang — gọn, đúng kiểu mobile.
  Widget _buildJlptLevelStrip(BuildContext context) {
    const levels = ['N5', 'N4', 'N3', 'N2', 'N1'];
    return SizedBox(
      height: 42,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(right: 16),
        itemCount: levels.length,
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemBuilder: (context, i) {
          final level = levels[i];
          return Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => context.go('/discovery?level=$level'),
              borderRadius: BorderRadius.circular(999),
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(color: AppColors.grey300),
                ),
                child: Text(
                  level,
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 14,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  /// Thẻ blog cho PageView (swiper).
  Widget _buildBlogSwiperCard(BuildContext context, BlogModel blog) {
    final theme = Theme.of(context);
    final excerpt = (blog.excerpt ?? '').trim();
    final rawContent = blog.content.trim();
    final preview = excerpt.isNotEmpty
        ? excerpt
        : (rawContent.length > 100 ? '${rawContent.substring(0, 100)}…' : rawContent);

    return Material(
      color: AppColors.surface,
      elevation: 0,
      borderRadius: BorderRadius.circular(18),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => context.push('/blog-detail/${blog.slug}'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 3,
              child: blog.coverImageUrl != null && blog.coverImageUrl!.isNotEmpty
                  ? Image.network(
                      blog.coverImageUrl!,
                      fit: BoxFit.cover,
                      errorBuilder: (_, _, _) => ColoredBox(
                        color: AppColors.grey200,
                        child: Icon(Icons.article_rounded, color: AppColors.primary.withValues(alpha: 0.45), size: 40),
                      ),
                    )
                  : ColoredBox(
                      color: AppColors.primary.withValues(alpha: 0.08),
                      child: const Icon(Icons.article_rounded, color: AppColors.primary, size: 40),
                    ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(14, 10, 14, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      blog.title,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w800,
                        height: 1.2,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    Expanded(
                      child: Text(
                        preview,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: AppColors.textTertiary,
                          height: 1.35,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.calendar_today_outlined, size: 12, color: AppColors.textTertiary.withValues(alpha: 0.85)),
                        const SizedBox(width: 4),
                        Text(
                          blog.formattedDate,
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: AppColors.textTertiary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeBanner extends StatelessWidget {
  const _HomeBanner({
    required this.isLoggedIn,
    required this.onPrimaryAction,
    required this.onSecondaryAction,
  });

  final bool isLoggedIn;
  final VoidCallback onPrimaryAction;
  final VoidCallback onSecondaryAction;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.primary.withOpacity(0.20)),
        gradient: LinearGradient(
          colors: [
            AppColors.primary.withOpacity(0.10),
            AppColors.surface,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.textPrimary.withOpacity(0.05),
            blurRadius: 14,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.12),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColors.primary.withOpacity(0.18)),
            ),
            child: const Icon(Icons.explore_rounded, color: AppColors.primary),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Gợi ý khóa học',
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.2,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  isLoggedIn
                      ? 'Khám phá thêm khóa học phù hợp với bạn và tiếp tục học theo lộ trình.'
                      : 'Khám phá khóa học và đăng nhập để lưu tiến độ học tập của bạn.',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: AppColors.textTertiary,
                    height: 1.35,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 40,
                        child: ElevatedButton(
                          onPressed: onPrimaryAction,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: AppColors.textOnPrimary,
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                          ),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'Khám phá ngay',
                              maxLines: 1,
                              softWrap: false,
                              style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 12.5),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: SizedBox(
                        height: 40,
                        child: OutlinedButton(
                          onPressed: onSecondaryAction,
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColors.primary,
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            side: BorderSide(color: AppColors.primary.withOpacity(0.45)),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                          ),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              isLoggedIn ? 'Khóa học của tôi' : 'Đăng nhập',
                              maxLines: 1,
                              softWrap: false,
                              style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 12.5),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
