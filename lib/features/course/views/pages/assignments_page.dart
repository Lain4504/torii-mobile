import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../core/widgets/widgets.dart';
import '../models/assignment_model.dart';
import '../providers/course_providers.dart';

class AssignmentsPage extends ConsumerWidget {
  const AssignmentsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assignmentsAsync = ref.watch(assignmentsProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: AppBackground(
        child: RefreshIndicator(
          onRefresh: () => ref.refresh(assignmentsProvider.future),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              _buildAppBar(context),
              assignmentsAsync.when(
                data: (assignments) {
                  if (assignments.isEmpty) {
                    return const SliverFillRemaining(
                      child: Center(child: Text('Chưa có bài tập nào')),
                    );
                  }
                  return SliverPadding(
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
                  );
                },
                loading: () => const SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator()),
                ),
                error: (err, _) => SliverFillRemaining(
                  child: Center(child: Text('Lỗi: $err')),
                ),
              ),
            ],
          ),
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

    final subStatus = assignment.userSubmissionStatus?.toUpperCase();
    final isOverdue = assignment.dueDate != null && assignment.dueDate!.isBefore(DateTime.now()) && subStatus == null;

    if (isOverdue) {
      statusColor = AppColors.error;
      statusLabel = 'QUÁ HẠN';
    } else {
      switch (subStatus) {
        case 'GRADED':
          statusColor = Colors.green;
          statusLabel = 'ĐÃ CHẤM';
          break;
        case 'SUBMITTED':
          statusColor = Colors.blue;
          statusLabel = 'ĐÃ NỘP';
          break;
        case 'RETURNED':
          statusColor = Colors.purple;
          statusLabel = 'ĐÃ TRẢ';
          break;
        default:
          statusColor = Colors.orange;
          statusLabel = 'CHƯA NỘP';
      }
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
              // We don't have grade in the basic Assignment model from backend yet?
              // Let's assume passed maxScore/passingScore or similar if needed.
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
