import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:torii_app/core/providers/api_providers.dart';
import 'package:torii_app/data/models/academy_models.dart';
import 'package:intl/intl.dart';

class AssignmentListScreen extends ConsumerStatefulWidget {
  const AssignmentListScreen({super.key});

  @override
  ConsumerState<AssignmentListScreen> createState() => _AssignmentListScreenState();
}

class _AssignmentListScreenState extends ConsumerState<AssignmentListScreen> {
  final Map<String, List<AssignmentModel>> _assignmentsByClass = {};
  final Map<String, String> _classTitles = {};
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadAllAssignments();
  }

  Future<void> _loadAllAssignments() async {
    setState(() => _loading = true);
    try {
      final enrollmentsPaginated = await ref.read(myEnrollmentsProvider.future);
      final liveEnrollments = enrollmentsPaginated.data.where((e) => e.isLive).toList();
      
      final repo = ref.read(academyRepositoryProvider);
      
      for (final enrollment in liveEnrollments) {
        final assignments = await repo.getAssignments(enrollment.classId);
        _assignmentsByClass[enrollment.classId] = assignments;
        _classTitles[enrollment.classId] = enrollment.courseTitle;
      }
    } catch (_) {
      // Handle error
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final allAssignments = _assignmentsByClass.entries.expand((e) {
      return e.value.map((a) => {'classId': e.key, 'assignment': a, 'courseTitle': _classTitles[e.key] ?? ''});
    }).toList();

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('Bài tập của tôi', style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
        backgroundColor: theme.colorScheme.surface,
        actions: [
          IconButton(onPressed: _loadAllAssignments, icon: const Icon(Icons.refresh)),
        ],
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : allAssignments.isEmpty
              ? _buildEmptyState(context)
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: allAssignments.length,
                  itemBuilder: (context, index) {
                    final item = allAssignments[index];
                    final assignment = item['assignment'] as AssignmentModel;
                    final courseTitle = item['courseTitle'] as String;
                    final classId = item['classId'] as String;
                    return _buildAssignmentCard(context, assignment, courseTitle, classId);
                  },
                ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.assignment_turned_in_outlined, size: 80, color: theme.colorScheme.outlineVariant),
          const SizedBox(height: 16),
          Text('Tuyệt vời!', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text('Bạn không có bài tập nào cần hoàn thành.', style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
        ],
      ),
    );
  }

  Widget _buildAssignmentCard(BuildContext context, AssignmentModel assignment, String courseTitle, String classId) {
    final theme = Theme.of(context);
    final isSubmitted = assignment.status == 'SUBMITTED' || assignment.status == 'GRADED';
    final isGraded = assignment.status == 'GRADED';
    
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.03), blurRadius: 10, offset: const Offset(0, 4))],
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      child: InkWell(
        onTap: () => _showSubmitDialog(context, assignment, classId),
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      courseTitle,
                      style: theme.textTheme.labelSmall?.copyWith(color: theme.colorScheme.primary, fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  _buildStatusBadge(assignment),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                assignment.title,
                style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              if (assignment.description != null && assignment.description!.isNotEmpty) ...[
                const SizedBox(height: 4),
                Text(
                  assignment.description!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                ),
              ],
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (assignment.deadline != null)
                    Row(
                      children: [
                        Icon(Icons.calendar_today_outlined, size: 14, color: assignment.isOverdue && !isSubmitted ? theme.colorScheme.error : theme.colorScheme.outline),
                        const SizedBox(width: 4),
                        Text(
                          'Hạn: ${DateFormat('dd/MM/yyyy').format(assignment.deadline!)}',
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: assignment.isOverdue && !isSubmitted ? theme.colorScheme.error : theme.colorScheme.onSurfaceVariant,
                            fontWeight: assignment.isOverdue && !isSubmitted ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                      ],
                    )
                  else
                    const SizedBox.shrink(),
                  if (isGraded)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(color: Colors.green.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(4)),
                      child: Text('Điểm: ${assignment.grade}', style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 12)),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusBadge(AssignmentModel assignment) {
    Color color;
    String text;
    
    switch (assignment.status) {
      case 'GRADED':
        color = Colors.green;
        text = 'Đã chấm';
        break;
      case 'SUBMITTED':
        color = Colors.blue;
        text = 'Đã nộp';
        break;
      default:
        if (assignment.isOverdue) {
          color = Colors.red;
          text = 'Quá hạn';
        } else {
          color = Colors.orange;
          text = 'Chưa nộp';
        }
    }
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(color: color.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(4)),
      child: Text(text, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 10)),
    );
  }

  void _showSubmitDialog(BuildContext context, AssignmentModel assignment, String classId) {
    if (assignment.status == 'GRADED') {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(assignment.title),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Điểm: ${assignment.grade}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.green)),
              if (assignment.feedback != null) ...[
                const SizedBox(height: 12),
                const Text('Nhận xét:', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(assignment.feedback!),
              ],
            ],
          ),
          actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('Đóng'))],
        ),
      );
      return;
    }

    final contentController = TextEditingController();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        ),
        padding: EdgeInsets.fromLTRB(20, 20, 20, MediaQuery.of(context).viewInsets.bottom + 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(2)))),
            const SizedBox(height: 20),
            Text('Nộp bài tập', style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(assignment.title, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 20),
            Expanded(
              child: TextField(
                controller: contentController,
                maxLines: null,
                expands: true,
                textAlignVertical: TextAlignVertical.top,
                decoration: InputDecoration(
                  hintText: 'Nhập nội dung bài làm của bạn...',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  alignLabelWithHint: true,
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () async {
                  if (contentController.text.trim().isEmpty) return;
                  final repo = ref.read(academyRepositoryProvider);
                  final success = await repo.submitAssignment(
                    classId: classId,
                    assignmentId: assignment.id,
                    content: contentController.text,
                  );
                  if (success) {
                    if (context.mounted) {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Nộp bài thành công!')));
                      _loadAllAssignments();
                    }
                  }
                },
                child: const Text('Gửi bài làm', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
