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
    final authState = ref.watch(authStateProvider);
    final displayName = authState.valueOrNull?.user?.displayName ?? 'Bạn';
    final enrollmentsAsync = ref.watch(myEnrollmentsProvider);
    final liveSchedulesAsync = ref.watch(liveSchedulesProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  children: [
                    const CircleAvatar(radius: 28, backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=tienvu')),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Chào $displayName 👋',
                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis),
                          Text('Hôm nay bạn muốn học gì?', style: TextStyle(fontSize: 14, color: AppColors.grey700)),
                        ],
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.notifications_none_rounded, size: 28),
                      onPressed: () => context.push('/notifications'),
                    ),
                  ],
                ),
              ),
              _buildSectionHeader(context, 'Khóa học của bạn', () => context.push('/my-courses')),
              SizedBox(
                height: 220,
                child: enrollmentsAsync.when(
                  data: (paginated) {
                    final list = paginated.data.take(5).toList();
                    if (list.isEmpty) return _emptyCourseHint(context);
                    return ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      scrollDirection: Axis.horizontal,
                      itemCount: list.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 16),
                      itemBuilder: (context, index) => _buildCourseCard(list[index]),
                    );
                  },
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (_, __) => _emptyCourseHint(context),
                ),
              ),
              const SizedBox(height: 32),
              _buildSectionHeader(context, 'Chọn cấp độ', null),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
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
              _buildSectionHeader(context, 'Lịch học live sắp tới', () => context.push('/live-schedule')),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: liveSchedulesAsync.when(
                  data: (list) {
                    if (list.isEmpty) return const Padding(padding: EdgeInsets.all(16), child: Text('Chưa có lịch live'));
                    return Column(
                      children: list.take(2).map((s) => Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: _buildLiveCard(s),
                      )).toList(),
                    );
                  },
                  loading: () => const SizedBox(height: 80, child: Center(child: CircularProgressIndicator())),
                  error: (_, __) => const Padding(padding: EdgeInsets.all(16), child: Text('Không tải được lịch live')),
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

  Widget _buildSectionHeader(BuildContext context, String title, VoidCallback? onMore) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          if (onMore != null) TextButton(onPressed: onMore, child: const Text('Xem thêm', style: TextStyle(color: AppColors.primary))),
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
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: AppColors.textPrimary.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.network(
              e.thumbnailUrl ?? 'https://picsum.photos/seed/jp1/400/200',
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(height: 100, color: AppColors.grey200, child: const Icon(Icons.school)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
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
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
            border: Border.all(color: color.withOpacity(0.2), width: 2),
          ),
          child: Icon(icon, color: color, size: 28),
        ),
        const SizedBox(height: 8),
        Text(level, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
      ],
    );
  }

  Widget _buildLiveCard(LiveScheduleModel s) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.grey200),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
            child: const Icon(Icons.videocam_rounded, color: AppColors.primary),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(s.title ?? s.courseTitle ?? 'Live', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 4),
                Text('${s.senseiLabel} • ${s.timeRange.isNotEmpty ? s.timeRange : "Sắp diễn ra"}', style: TextStyle(color: AppColors.grey700, fontSize: 13)),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.textOnPrimary,
              padding: const EdgeInsets.symmetric(horizontal: 12),
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
