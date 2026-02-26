import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/app_design_system.dart';
import '../../../../core/widgets/widgets.dart';
import '../models/assignment_model.dart';
import '../providers/assignment_providers.dart';

class AssignmentListPage extends ConsumerStatefulWidget {
  const AssignmentListPage({super.key});

  @override
  ConsumerState<AssignmentListPage> createState() => _AssignmentListPageState();
}

class _AssignmentListPageState extends ConsumerState<AssignmentListPage> {
  final ScrollController _scrollController = ScrollController();
  String? _selectedFilter; // null means 'All'

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(assignmentListProvider.notifier).loadAssignments(refresh: true);
    });
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      final state = ref.read(assignmentListProvider);
      if (!state.isLoading && state.hasMore) {
        ref.read(assignmentListProvider.notifier).loadAssignments();
      }
    }
  }

  void _onFilterChanged(String? status) {
    setState(() {
      _selectedFilter = status;
    });
    ref.read(assignmentListProvider.notifier).updateFilter(status);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(assignmentListProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: AppBackground(
        child: SafeArea(
          child: Column(
            children: [
              _buildHeader(context),
              _buildFilterChips(),
              Expanded(
                child: state.isLoading && state.assignments.isEmpty
                    ? const Center(child: AppLoading(text: 'Đang tải bài tập...'))
                    : state.assignments.isEmpty
                        ? _buildEmptyState()
                        : RefreshIndicator(
                            onRefresh: () => ref.read(assignmentListProvider.notifier).loadAssignments(refresh: true, status: _selectedFilter),
                            child: ListView.separated(
                              controller: _scrollController,
                              padding: const EdgeInsets.all(AppSpacing.md),
                              itemCount: state.assignments.length + (state.isLoading ? 1 : 0),
                              separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.md),
                              itemBuilder: (context, index) {
                                if (index == state.assignments.length) {
                                  return const Padding(
                                    padding: EdgeInsets.all(AppSpacing.md),
                                    child: Center(child: CircularProgressIndicator()),
                                  );
                                }
                                return _AssignmentCard(assignment: state.assignments[index]);
                              },
                            ),
                          ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.md),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.textPrimary),
            onPressed: () => context.pop(),
          ),
          const SizedBox(width: AppSpacing.sm),
          const Text(
            'BÀI TẬP CỦA TÔI',
            style: TextStyle(
              fontFamily: AppTypography.fontFamilySerif,
              fontWeight: AppTypography.black,
              fontSize: 18,
              letterSpacing: 2.0,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChips() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.sm),
      child: Row(
        children: [
          _buildFilterChip('Tất cả', null),
          _buildFilterChip('Chưa nộp', 'PENDING'),
          _buildFilterChip('Đã nộp', 'SUBMITTED'),
          _buildFilterChip('Đã chấm', 'GRADED'),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, String? status) {
    final isSelected = _selectedFilter == status;
    return Padding(
      padding: const EdgeInsets.only(right: AppSpacing.sm),
      child: FilterChip(
        label: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : AppColors.textSecondary,
            fontWeight: isSelected ? AppTypography.bold : AppTypography.medium,
            fontSize: 12,
          ),
        ),
        selected: isSelected,
        onSelected: (_) => _onFilterChanged(status),
        backgroundColor: AppColors.surface,
        selectedColor: AppColors.primary,
        checkmarkColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.full),
          side: BorderSide(
            color: isSelected ? AppColors.primary : AppColors.grey300,
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.assignment_outlined, size: 64, color: AppColors.grey300),
          const SizedBox(height: AppSpacing.lg),
          const Text(
            'Chưa có bài tập nào',
            style: TextStyle(
              fontSize: 16,
              color: AppColors.textSecondary,
              fontWeight: AppTypography.medium,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          AppButton(
            text: 'TẢI LẠI',
            onPressed: () => ref.read(assignmentListProvider.notifier).loadAssignments(refresh: true, status: _selectedFilter),
            type: AppButtonType.ghost,
          ),
        ],
      ),
    );
  }
}

class _AssignmentCard extends StatelessWidget {
  final Assignment assignment;

  const _AssignmentCard({required this.assignment});

  @override
  Widget build(BuildContext context) {
    final dateFormatter = DateFormat('dd/MM/yyyy HH:mm');
    final submission = assignment.currentSubmission;

    return GestureDetector(
      onTap: () => context.push('/assignments/${assignment.id}'),
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.lg),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.8),
          borderRadius: BorderRadius.circular(AppRadius.xl),
          border: Border.all(color: AppColors.grey300.withValues(alpha: 0.5)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    assignment.courseTitle ?? 'Khóa học',
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.primary,
                      fontWeight: AppTypography.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8),
                _buildStatusBadge(submission?.status),
              ],
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              assignment.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: AppTypography.bold,
                color: AppColors.textPrimary,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: AppSpacing.md),
            Row(
              children: [
                const Icon(Icons.calendar_today_outlined, size: 14, color: AppColors.textTertiary),
                const SizedBox(width: 4),
                Text(
                  assignment.dueDate != null ? 'Hạn chót: ${dateFormatter.format(assignment.dueDate!)}' : 'Không có hạn',
                  style: TextStyle(
                    fontSize: 12,
                    color: assignment.isOverdue && !(submission?.isSubmitted ?? false) 
                        ? AppColors.error 
                        : AppColors.textSecondary,
                    fontWeight: assignment.isOverdue && !(submission?.isSubmitted ?? false)
                        ? AppTypography.bold
                        : AppTypography.medium,
                  ),
                ),
                const Spacer(),
                if (submission?.isGraded ?? false) ...[
                  const Icon(Icons.star_rounded, size: 16, color: Colors.orange),
                  const SizedBox(width: 4),
                  Text(
                    '${submission!.score}/${assignment.maxScore}',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: AppTypography.black,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ] else ...[
                  const Icon(Icons.emoji_events_outlined, size: 14, color: AppColors.textTertiary),
                  const SizedBox(width: 4),
                  Text(
                    '${assignment.maxScore} điểm',
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusBadge(SubmissionStatus? status) {
    Color color;
    String text;

    if (status == null) {
      if (assignment.isOverdue) {
        color = AppColors.error;
        text = 'Quá hạn';
      } else {
        color = AppColors.warningDark;
        text = 'Chưa nộp';
      }
    } else {
      switch (status) {
        case SubmissionStatus.submitted:
          color = AppColors.primary;
          text = 'Đã nộp';
          break;
        case SubmissionStatus.graded:
          color = AppColors.successDark;
          text = 'Đã chấm';
          break;
        case SubmissionStatus.returned:
          color = AppColors.error;
          text = 'Cần làm lại';
          break;
        case SubmissionStatus.draft:
        default:
          color = AppColors.warningDark;
          text = 'Đang soạn';
      }
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 10,
          fontWeight: AppTypography.bold,
        ),
      ),
    );
  }
}
