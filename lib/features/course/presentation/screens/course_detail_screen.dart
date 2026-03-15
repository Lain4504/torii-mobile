import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/providers/api_providers.dart';
import 'package:torii_app/data/models/academy_models.dart';

class CourseDetailScreen extends ConsumerWidget {
  const CourseDetailScreen({super.key, required this.courseId});
  final String courseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courseAsync = ref.watch(courseOfferingDetailProvider(courseId));

    return Scaffold(
      backgroundColor: AppColors.surface,
      body: courseAsync.when(
        data: (course) {
          if (course == null) return const Center(child: Text('Không tìm thấy khóa học'));
          return _buildContent(context, course);
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Lỗi: $e', style: TextStyle(color: AppColors.error))),
      ),
    );
  }

  Widget _buildContent(BuildContext context, CourseOfferingModel course) {
    final priceStr = '${course.displayPrice.toInt().toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]}.')}đ';
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 250,
              pinned: true,
              backgroundColor: AppColors.primary,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  course.thumbnailUrl ?? 'https://picsum.photos/seed/course_detail/800/600',
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(color: AppColors.grey200, child: const Icon(Icons.school, size: 64)),
                ),
              ),
              leading: CircleAvatar(
                backgroundColor: AppColors.surface,
                child: IconButton(icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary), onPressed: () => Navigator.pop(context)),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(course.title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildInfoItem(Icons.signal_cellular_alt, course.mode),
                        _buildInfoItem(Icons.list_alt, 'Khóa học'),
                        Text(priceStr, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primary)),
                      ],
                    ),
                    const Divider(height: 48),
                    const Text('Mô tả khóa học', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    Text(course.description ?? 'Không có mô tả.', style: TextStyle(height: 1.6, color: AppColors.textPrimary)),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            decoration: BoxDecoration(
              color: AppColors.surface,
              boxShadow: [BoxShadow(color: AppColors.textPrimary.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -5))],
            ),
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.textOnPrimary,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  elevation: 0,
                ),
                child: const Text('Đăng ký học ngay', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: AppColors.grey700),
        const SizedBox(width: 4),
        Text(text, style: TextStyle(color: AppColors.grey700, fontSize: 13, fontWeight: FontWeight.w600)),
      ],
    );
  }
}
