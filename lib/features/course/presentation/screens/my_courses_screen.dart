import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/providers/api_providers.dart';
import 'package:torii_app/data/models/academy_models.dart';

class MyCoursesScreen extends ConsumerWidget {
  const MyCoursesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final enrollmentsAsync = ref.watch(myEnrollmentsProvider);
    final theme = Theme.of(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: AppBar(
          title: Text(
            'Khóa học của tôi',
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.onSurface,
              fontWeight: FontWeight.w800,
            ),
          ),
          backgroundColor: theme.colorScheme.surface,
          elevation: 0,
          bottom: TabBar(
            labelColor: theme.colorScheme.primary,
            unselectedLabelColor: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
            indicatorColor: theme.colorScheme.primary,
            indicatorWeight: 3,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            tabs: const [
              Tab(text: 'Đang học'),
              Tab(text: 'Đã hoàn thành'),
            ],
          ),
        ),
        body: enrollmentsAsync.when(
          data: (paginated) {
            final all = paginated.data;
            final inProgress = all.where((e) => e.status.toUpperCase() == 'ACTIVE' && (e.progress ?? 0) < 1).toList();
            final completed = all.where((e) => (e.progress ?? 0) >= 1 || e.status.toUpperCase() != 'ACTIVE').toList();
            return TabBarView(
              children: [
                _buildCourseList(context, inProgress, false),
                _buildCourseList(context, completed, true),
              ],
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Center(child: Text('Lỗi: $e', style: TextStyle(color: theme.colorScheme.error))),
        ),
      ),
    );
  }

  Widget _buildCourseList(BuildContext context, List<EnrollmentModel> list, bool isCompleted) {
    if (list.isEmpty) {
      return Center(child: Text(isCompleted ? 'Chưa có khóa học hoàn thành' : 'Chưa có khóa học đang học'));
    }
    return ListView.builder(
      padding: const EdgeInsets.all(24),
      itemCount: list.length,
      itemBuilder: (context, index) {
        final e = list[index];
        final progress = e.progress ?? 0.0;
        return Container(
          margin: const EdgeInsets.only(bottom: 24),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.04), blurRadius: 15, offset: const Offset(0, 5)),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                child: Image.network(
                  e.thumbnailUrl ?? 'https://picsum.photos/seed/mycourse${e.id}/600/300',
                  height: 140,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(height: 140, color: Theme.of(context).colorScheme.outlineVariant.withValues(alpha: 0.3), child: const Icon(Icons.school, size: 48)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(e.courseTitle ?? 'Khóa học', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: LinearProgressIndicator(
                            value: isCompleted ? 1.0 : progress.clamp(0.0, 1.0),
                            backgroundColor: Theme.of(context).colorScheme.outlineVariant.withValues(alpha: 0.3),
                            valueColor: AlwaysStoppedAnimation<Color>(isCompleted ? AppColors.success : Theme.of(context).colorScheme.primary),
                            minHeight: 8,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          '${(progress * 100).toInt()}%',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: isCompleted ? AppColors.success : Theme.of(context).colorScheme.onSurface),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: e.classId.isEmpty
                            ? null
                            : () {
                                final mode = (e.mode ?? '').toUpperCase();
                                if (mode == 'LIVE' && e.classId.isNotEmpty) {
                                  final t = Uri.encodeQueryComponent(e.courseTitle ?? '');
                                  context.push(
                                    '/enrolled-live/${e.classId}?productId=${e.productId}&title=$t',
                                  );
                                } else {
                                  context.push('/curriculum/${e.classId}');
                                }
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isCompleted ? Theme.of(context).colorScheme.outlineVariant.withValues(alpha: 0.3) : Theme.of(context).colorScheme.primary,
                          foregroundColor: isCompleted ? Theme.of(context).colorScheme.onSurfaceVariant : Theme.of(context).colorScheme.onPrimary,
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        child: Text(isCompleted ? 'Xem lại bài học' : 'Tiếp tục học', style: const TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
