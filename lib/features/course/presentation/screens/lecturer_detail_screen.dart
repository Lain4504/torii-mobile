import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';

import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/providers/api_providers.dart';
import 'package:torii_app/data/models/academy_models.dart';
import 'package:torii_app/data/models/instructor_model.dart';

class LecturerDetailScreen extends ConsumerWidget {
  const LecturerDetailScreen({
    super.key,
    required this.instructorId,
    this.fallbackName,
  });

  final String instructorId;
  final String? fallbackName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final profileAsync = ref.watch(instructorProfileProvider(instructorId));
    final coursesAsync = ref.watch(instructorCoursesProvider(instructorId));

    // Hiển thị tên từ fallback hoặc profile (nếu có)
    final displayName = profileAsync.valueOrNull?.displayName ?? 
                       (fallbackName != null && fallbackName != 'Giảng viên' ? fallbackName! : 'Hồ sơ Giảng viên');

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: CustomScrollView(
        slivers: [
          _buildAppBar(context, theme, displayName, profileAsync.valueOrNull),
          SliverToBoxAdapter(
            child: profileAsync.when(
              data: (profile) => _buildProfileContent(context, theme, profile, coursesAsync),
              loading: () => _buildProfileContent(context, theme, profileAsync.valueOrNull, coursesAsync, isLoading: true),
              error: (e, _) => Center(child: Padding(
                padding: const EdgeInsets.all(40),
                child: Text('Lỗi tải dữ liệu: $e'),
              )),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context, ThemeData theme, String name, Instructor? profile) {
    return SliverAppBar(
      expandedHeight: 140,
      pinned: true,
      elevation: 0,
      backgroundColor: theme.colorScheme.primary,
      surfaceTintColor: theme.colorScheme.primary,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          backgroundColor: Colors.black.withValues(alpha: 0.1),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white, size: 20),
            onPressed: () => context.pop(),
          ),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                theme.colorScheme.primary,
                theme.colorScheme.primary.withValues(alpha: 0.8),
              ],
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                right: -20,
                top: -20,
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.white.withValues(alpha: 0.1),
                ),
              ),
              Positioned(
                left: 40,
                bottom: -30,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white.withValues(alpha: 0.05),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileContent(
    BuildContext context, 
    ThemeData theme, 
    Instructor? profile, 
    AsyncValue<List<AcademyProductModel>> coursesAsync,
    {bool isLoading = false}
  ) {
    return Transform.translate(
      offset: const Offset(0, -24),
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            // Avatar và Tên
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary.withValues(alpha: 0.2),
                          shape: BoxShape.circle,
                        ),
                        child: CircleAvatar(
                          radius: 42,
                          backgroundColor: theme.colorScheme.primaryContainer,
                          backgroundImage: (profile?.avatarUrl != null) ? NetworkImage(profile!.avatarUrl!) : null,
                          child: (profile?.avatarUrl == null) ? Icon(Icons.person, size: 40, color: theme.colorScheme.primary) : null,
                        ),
                      ),
                      if (profile?.stats?.rating != null)
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
                            child: const Icon(Icons.star, color: Colors.white, size: 12),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          profile?.displayName ?? fallbackName ?? 'Đang tải...',
                          style: theme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w900,
                            letterSpacing: -0.5,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(Icons.verified, size: 14, color: theme.colorScheme.primary),
                            const SizedBox(width: 4),
                            Text(
                              'Giảng viên Torii Nihongo',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Stats Row
            if (profile?.stats != null || isLoading)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    _buildStatCard(theme, profile?.stats?.courseCount.toString() ?? '0', 'Khóa học', Icons.book_outlined),
                    const SizedBox(width: 12),
                    _buildStatCard(theme, profile?.stats?.studentCount.toString() ?? '0', 'Học viên', Icons.people_outline),
                  ],
                ),
              ),

            const SizedBox(height: 24),

            // Bio Section
            if (profile?.bio != null && profile!.bio!.isNotEmpty) ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: _buildSectionTitle(theme, 'Giới thiệu'),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  profile!.bio!,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    height: 1.5,
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                ),
              ),
              const SizedBox(height: 32),
            ],

            // Courses
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: _buildSectionTitle(theme, 'Khóa học đang dạy'),
            ),
            const SizedBox(height: 16),
            coursesAsync.when(
              data: (courses) => courses.isEmpty 
                ? const Padding(padding: EdgeInsets.all(24), child: Text('Chưa có khóa học nào.'))
                : ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    itemCount: courses.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) => _buildCourseItem(context, theme, courses[index]),
                  ),
              loading: () => const Center(child: Padding(padding: EdgeInsets.all(24), child: CircularProgressIndicator())),
              error: (e, _) => Padding(padding: const EdgeInsets.all(24), child: Text('Lỗi: $e')),
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(ThemeData theme, String value, String label, IconData icon) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: theme.colorScheme.outlineVariant.withValues(alpha: 0.5)),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 18, color: theme.colorScheme.primary),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(value, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w900, color: theme.colorScheme.primary)),
                Text(label, style: theme.textTheme.bodySmall?.copyWith(fontSize: 10, fontWeight: FontWeight.bold, color: theme.colorScheme.onSurfaceVariant)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(ThemeData theme, String title) {
    return Text(
      title,
      style: theme.textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.w900,
        color: theme.colorScheme.onSurface,
      ),
    );
  }

  Widget _buildCourseItem(BuildContext context, ThemeData theme, AcademyProductModel course) {
    final priceStr = NumberFormat.currency(locale: 'vi_VN', symbol: 'đ', decimalDigits: 0).format(course.displayPrice);
    
    return GestureDetector(
      onTap: () {
        final classSlug = course.liveClassId != null ? '&liveClassId=${course.liveClassId}' : '';
        context.push('/course-detail/${course.id}?mode=${course.mode}$classSlug');
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: theme.colorScheme.outlineVariant.withValues(alpha: 0.5)),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                course.thumbnailUrl ?? 'https://picsum.photos/seed/${course.id}/200/200',
                width: 70, height: 70, fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(width: 70, height: 70, color: theme.colorScheme.primaryContainer, child: const Icon(Icons.school)),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(course.name, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 13), maxLines: 2, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: (course.isLive ? Colors.orange : theme.colorScheme.primary).withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(course.mode, style: TextStyle(color: course.isLive ? Colors.orange : theme.colorScheme.primary, fontSize: 9, fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(width: 8),
                      Text(priceStr, style: TextStyle(color: theme.colorScheme.primary, fontWeight: FontWeight.w700, fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 12, color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.5)),
          ],
        ),
      ),
    );
  }
}
