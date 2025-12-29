import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'exam_state.dart';

/// Provider for exam list state
final examListProvider = NotifierProvider<ExamListNotifier, ExamListState>(
  ExamListNotifier.new,
);

// TODO: Add more exam-related providers
// Example:
// final examDetailProvider = FutureProvider.family<Exam, String>((ref, examId) async {
//   return await examRepository.getExamById(examId);
// });
