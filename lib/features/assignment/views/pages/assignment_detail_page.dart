import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/app_design_system.dart';
import '../../../../core/widgets/widgets.dart';
import '../models/assignment_model.dart';
import '../providers/assignment_providers.dart';

class AssignmentDetailPage extends ConsumerStatefulWidget {
  final String assignmentId;

  const AssignmentDetailPage({super.key, required this.assignmentId});

  @override
  ConsumerState<AssignmentDetailPage> createState() => _AssignmentDetailPageState();
}

class _AssignmentDetailPageState extends ConsumerState<AssignmentDetailPage> {
  final _textAnswerController = TextEditingController();
  bool _isSubmitting = false;

  @override
  void dispose() {
    _textAnswerController.dispose();
    super.dispose();
  }

  Future<void> _submitAssignment(bool isDraft) async {
    final textAnswer = _textAnswerController.text.trim();
    if (textAnswer.isEmpty && !isDraft) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vui lòng nhập câu trả lời trước khi nộp.')),
      );
      return;
    }

    setState(() => _isSubmitting = true);
    try {
      final repository = ref.read(assignmentRepositoryProvider);
      await repository.submitAssignment(
        assignmentId: widget.assignmentId,
        textAnswer: textAnswer,
        isDraft: isDraft,
      );
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(isDraft ? 'Đã lưu nháp' : 'Đã nộp bài thành công!')),
      );
      
      // Refresh assignment details
      ref.invalidate(assignmentDetailProvider(widget.assignmentId));
      ref.invalidate(assignmentListProvider);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Lỗi: $e')),
      );
    } finally {
      setState(() => _isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final asyncAssignment = ref.watch(assignmentDetailProvider(widget.assignmentId));

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.textPrimary),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'CHI TIẾT BÀI TẬP',
          style: TextStyle(
            fontFamily: AppTypography.fontFamilySerif,
            fontWeight: AppTypography.black,
            fontSize: 16,
            letterSpacing: 2.0,
            color: AppColors.textPrimary,
          ),
        ),
      ),
      body: asyncAssignment.when(
        data: (assignment) {
          final submission = assignment.currentSubmission;
          
          if (submission != null && _textAnswerController.text.isEmpty && submission.textAnswer != null) {
            _textAnswerController.text = submission.textAnswer!;
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.xl),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeaderInfo(assignment, submission),
                const SizedBox(height: AppSpacing.xl),
                _buildDescription(assignment),
                if (assignment.attachmentUrls.isNotEmpty) ...[
                  const SizedBox(height: AppSpacing.xl),
                  _buildAttachments(assignment.attachmentUrls),
                ],
                const SizedBox(height: AppSpacing.xxl),
                if (submission?.isGraded ?? false) ...[
                  _buildFeedback(submission!),
                  const SizedBox(height: AppSpacing.xxl),
                ],
                _buildSubmissionSection(assignment, submission),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline_rounded, size: 48, color: AppColors.error),
              const SizedBox(height: 16),
              Text('Không thể tải dữ liệu: $err'),
              const SizedBox(height: 16),
              AppButton(
                text: 'THỬ LẠI',
                onPressed: () => ref.invalidate(assignmentDetailProvider(widget.assignmentId)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderInfo(Assignment assignment, Submission? submission) {
    final dateFormatter = DateFormat('dd/MM/yyyy HH:mm');
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                assignment.courseTitle ?? 'Khóa học',
                style: const TextStyle(
                  color: AppColors.primary,
                  fontWeight: AppTypography.bold,
                  fontSize: 12,
                ),
              ),
            ),
            _buildStatusBadge(submission?.status),
          ],
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          assignment.title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: AppTypography.black,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(color: AppColors.grey200),
          ),
          child: Column(
            children: [
              _buildInfoRow('Hạn nộp', assignment.dueDate != null ? dateFormatter.format(assignment.dueDate!) : 'Không có hạn', Icons.event_rounded),
              const Divider(height: 16),
              _buildInfoRow('Điểm tối đa', '${assignment.maxScore}', Icons.star_rounded),
              if (submission?.score != null) ...[
                const Divider(height: 16),
                _buildInfoRow('Điểm của bạn', '${submission!.score}', Icons.military_tech_rounded, color: AppColors.primary),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value, IconData icon, {Color? color}) {
    return Row(
      children: [
        Icon(icon, size: 16, color: color ?? AppColors.textTertiary),
        const SizedBox(width: 8),
        Text(
          label,
          style: const TextStyle(color: AppColors.textSecondary, fontSize: 14),
        ),
        const Spacer(),
        Text(
          value,
          style: TextStyle(fontWeight: AppTypography.bold, color: color ?? AppColors.textPrimary, fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildDescription(Assignment assignment) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'MÔ TẢ BÀI TẬP',
          style: TextStyle(
            fontWeight: AppTypography.black,
            fontSize: 12,
            letterSpacing: 1.5,
            color: AppColors.textTertiary,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          assignment.description,
          style: const TextStyle(
            fontSize: 15,
            height: 1.5,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildAttachments(List<String> urls) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'TÀI LIỆU ĐÍNH KÈM',
          style: TextStyle(
            fontWeight: AppTypography.black,
            fontSize: 12,
            letterSpacing: 1.5,
            color: AppColors.textTertiary,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        ...urls.map((url) => Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.sm),
          child: InkWell(
            onTap: () => launchUrl(Uri.parse(url)),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(AppRadius.md),
                border: Border.all(color: AppColors.primary.withValues(alpha: 0.2)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.attach_file_rounded, color: AppColors.primary, size: 18),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      url.split('/').last,
                      style: const TextStyle(color: AppColors.primary, fontWeight: AppTypography.medium, fontSize: 14),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )),
      ],
    );
  }

  Widget _buildFeedback(Submission submission) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.successDark.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: AppColors.successDark.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.feedback_rounded, color: AppColors.successDark, size: 20),
              SizedBox(width: 8),
              Text(
                'NHẬN XÉT CỦA GIÁO VIÊN',
                style: TextStyle(
                  fontWeight: AppTypography.black,
                  fontSize: 12,
                  letterSpacing: 1.5,
                  color: AppColors.successDark,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            submission.feedback ?? 'Tốt lắm, tiếp tục phát huy!',
            style: const TextStyle(
              fontSize: 15,
              height: 1.5,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubmissionSection(Assignment assignment, Submission? submission) {
    final canSubmit = assignment.canSubmit && !(submission?.isGraded ?? false);
    final isReadOnly = !canSubmit;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'BÀI LÀM CỦA BẠN',
          style: TextStyle(
            fontWeight: AppTypography.black,
            fontSize: 12,
            letterSpacing: 1.5,
            color: AppColors.textTertiary,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        if (assignment.type == AssignmentType.text || assignment.type == AssignmentType.both)
          TextField(
            controller: _textAnswerController,
            maxLines: 8,
            readOnly: isReadOnly,
            decoration: InputDecoration(
              hintText: isReadOnly ? 'Không có câu trả lời' : 'Nhập câu trả lời của bạn ở đây...',
              filled: true,
              fillColor: isReadOnly ? AppColors.grey200.withValues(alpha: 0.5) : AppColors.surface,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.lg),
                borderSide: const BorderSide(color: AppColors.grey300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.lg),
                borderSide: const BorderSide(color: AppColors.grey300),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.lg),
                borderSide: const BorderSide(color: AppColors.primary),
              ),
            ),
          ),
        const SizedBox(height: AppSpacing.xl),
        if (canSubmit)
          Row(
            children: [
              Expanded(
                child: AppButton(
                  text: 'LƯU NHÁP',
                  type: AppButtonType.outline,
                  isLoading: _isSubmitting,
                  onPressed: () => _submitAssignment(true),
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: AppButton(
                  text: 'NỘP BÀI',
                  isLoading: _isSubmitting,
                  onPressed: () => _submitAssignment(false),
                ),
              ),
            ],
          ),
      ],
    );
  }

  Widget _buildStatusBadge(SubmissionStatus? status) {
    Color color;
    String text;

    if (status == null) {
      color = AppColors.warningDark;
      text = 'Chưa nộp';
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
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppRadius.full),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: AppTypography.bold,
        ),
      ),
    );
  }
}
