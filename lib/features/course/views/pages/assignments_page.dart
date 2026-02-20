import 'package:flutter/material.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../core/widgets/widgets.dart';
import '../models/assignment_model.dart';

class AssignmentsPage extends StatelessWidget {
  const AssignmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final assignments = [
      Assignment(
        id: '1',
        title: 'Bài tập: Ngữ pháp N5 cơ bản',
        description: 'Hoàn thành các bài tập về trợ từ wa, ga, ni.',
        dueDate: DateTime.now().add(const Duration(days: 2)),
        status: 'pending',
        courseTitle: 'Tiếng Nhật N5 Cấp Tốc',
      ),
      Assignment(
        id: '2',
        title: 'Viết đoạn văn tự giới thiệu',
        description: 'Viết một đoạn văn khoảng 100 chữ bằng Hiragana.',
        dueDate: DateTime.now().subtract(const Duration(days: 1)),
        status: 'overdue',
        courseTitle: 'Học Hán Tự Qua Hình Ảnh',
      ),
      Assignment(
        id: '3',
        title: 'Kiểm tra từ vựng Unit 1-5',
        description: 'Bài kiểm tra trắc nghiệm trên nền tảng.',
        dueDate: DateTime.now().subtract(const Duration(days: 5)),
        status: 'graded',
        grade: 9.5,
        feedback: 'Làm tốt lắm! Tiếp tục phát huy.',
        courseTitle: 'Tiếng Nhật N5 Cấp Tốc',
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: AppBackground(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            _buildAppBar(context),
            SliverPadding(
              padding: const EdgeInsets.all(AppSpacing.xl),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final assignment = assignments[index];
                    return _AssignmentCard(assignment: assignment);
                  },
                  childCount: assignments.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      floating: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: const Text(
        'BÀI TẬP CỦA TÔI',
        style: TextStyle(
          fontSize: 12,
          fontWeight: AppTypography.black,
          letterSpacing: 2.0,
        ),
      ),
      centerTitle: true,
    );
  }
}

class _AssignmentCard extends StatelessWidget {
  final Assignment assignment;

  const _AssignmentCard({required this.assignment});

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    String statusLabel;

    switch (assignment.status) {
      case 'overdue':
        statusColor = AppColors.error;
        statusLabel = 'QUÁ HẠN';
        break;
      case 'graded':
        statusColor = Colors.green;
        statusLabel = 'ĐÃ CHẤM';
        break;
      case 'submitted':
        statusColor = Colors.blue;
        statusLabel = 'ĐÃ NỘP';
        break;
      default:
        statusColor = Colors.orange;
        statusLabel = 'CHƯA NỘP';
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.card),
        border: Border.all(color: AppColors.grey200.withValues(alpha: 0.5)),
        boxShadow: AppElevation.softShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(AppRadius.full),
                ),
                child: Text(
                  statusLabel,
                  style: TextStyle(fontSize: 8, fontWeight: AppTypography.black, color: statusColor, letterSpacing: 1.0),
                ),
              ),
              if (assignment.grade != null)
                Text(
                  'ĐIỂM: ${assignment.grade}',
                  style: const TextStyle(fontSize: 12, fontWeight: AppTypography.black, color: AppColors.primary),
                ),
            ],
          ),
          const SizedBox(height: 12),
          Text(assignment.title, style: const TextStyle(fontSize: 16, fontWeight: AppTypography.bold)),
          const SizedBox(height: 4),
          Text(
            assignment.courseTitle ?? '',
            style: const TextStyle(fontSize: 10, fontWeight: AppTypography.medium, color: AppColors.textTertiary),
          ),
          const SizedBox(height: 12),
          Text(
            assignment.description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12, color: AppColors.textSecondary),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Icon(Icons.access_time_rounded, size: 14, color: AppColors.textTertiary),
              const SizedBox(width: 8),
              Text(
                'Hạn: ${_formatDate(assignment.dueDate)}',
                style: const TextStyle(fontSize: 11, color: AppColors.textTertiary),
              ),
              const Spacer(),
              AppButton(
                text: 'CHI TIẾT',
                onPressed: () {},
                type: AppButtonType.ghost,
                size: AppButtonSize.small,
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
