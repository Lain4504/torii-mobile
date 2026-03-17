import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/providers/api_providers.dart';
import 'package:torii_app/features/auth/providers/auth_providers.dart';
import 'package:torii_app/data/models/academy_models.dart';
import 'package:torii_app/data/models/live_schedule_model.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final authState = ref.watch(authStateProvider);
    final isLoggedIn = authState.valueOrNull?.isAuthenticated == true;
    final user = authState.valueOrNull?.user;
    final displayName = user?.displayName ?? 'Bạn';
    final enrollmentsAsync = isLoggedIn ? ref.watch(myEnrollmentsProvider) : null;
    final liveSchedulesAsync = isLoggedIn ? ref.watch(liveSchedulesProvider) : null;

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
                    if (isLoggedIn) ...[
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
                          if (isLoggedIn)
                            Text(
                              'Hôm nay bạn muốn học gì?',
                              style: theme.textTheme.bodySmall?.copyWith(color: AppColors.textTertiary),
                            ),
                        ],
                      ),
                    ),
                    if (isLoggedIn)
                      IconButton(
                        icon: const Icon(Icons.notifications_none_rounded, size: 26),
                        onPressed: () => context.push('/notifications'),
                      )
                    else
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
                      ),
                  ],
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
              _buildSectionHeader(context, 'Chọn cấp độ', null),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildLevelIcon('N5', AppColors.primary, Icons.auto_awesome),
                    _buildLevelIcon('N4', AppColors.success, Icons.psychology),
                    _buildLevelIcon('N3', AppColors.accent, Icons.translate),
                    _buildLevelIcon('N2', AppColors.detail, Icons.school),
                    _buildLevelIcon('N1', AppColors.error, Icons.workspace_premium),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              _buildSectionHeader(
                context,
                'Lịch học live sắp tới',
                isLoggedIn ? () => context.push('/live-schedule') : null,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: isLoggedIn
                    ? liveSchedulesAsync!.when(
                        data: (list) {
                          if (list.isEmpty) {
                            return const Padding(
                              padding: EdgeInsets.all(12),
                              child: Text('Chưa có lịch live', style: TextStyle(color: AppColors.textTertiary)),
                            );
                          }
                          return Column(
                            children: list
                                .take(2)
                                .map(
                                  (s) => Padding(
                                    padding: const EdgeInsets.only(bottom: 16),
                                    child: _buildLiveCard(s),
                                  ),
                                )
                                .toList(),
                          );
                        },
                        loading: () => const SizedBox(
                          height: 80,
                          child: Center(child: CircularProgressIndicator()),
                        ),
                        error: (error, _) => const Padding(
                          padding: EdgeInsets.all(12),
                          child: Text('Không tải được lịch live', style: TextStyle(color: AppColors.textTertiary)),
                        ),
                      )
                    : _loginRequiredInline(
                        context,
                        text: 'Đăng nhập để xem lịch học live và nhắc lịch.',
                        onLogin: () => context.push('/login'),
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

  Widget _loginRequiredInline(
    BuildContext context, {
    required String text,
    required VoidCallback onLogin,
  }) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
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
      child: Row(
        children: [
          const Icon(Icons.lock_outline, color: AppColors.textTertiary, size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: theme.textTheme.bodySmall?.copyWith(color: AppColors.textTertiary, height: 1.35),
            ),
          ),
          const SizedBox(width: 10),
          TextButton(
            onPressed: onLogin,
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: const Text(
              'Đăng nhập',
              style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w700),
            ),
          ),
        ],
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

  Widget _buildLevelIcon(String level, Color color, IconData icon) {
    return Column(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            shape: BoxShape.circle,
            border: Border.all(color: color.withValues(alpha: 0.2), width: 2),
          ),
          child: Icon(icon, color: color, size: 22),
        ),
        const SizedBox(height: 8),
        Text(level, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 12.5)),
      ],
    );
  }

  Widget _buildLiveCard(LiveScheduleModel s) {
    return Container(
      padding: const EdgeInsets.all(12),
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
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.10),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.videocam_rounded, color: AppColors.primary),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  s.title ?? s.courseTitle ?? 'Live',
                  style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14.5),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  '${s.senseiLabel} • ${s.timeRange.isNotEmpty ? s.timeRange : "Sắp diễn ra"}',
                  style: TextStyle(color: AppColors.textTertiary, fontSize: 12.5),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.textOnPrimary,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 0,
            ),
            child: const Text('Vào học', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
