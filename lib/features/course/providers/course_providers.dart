import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'course_state.dart';

/// Provider for course list state
final courseListProvider = NotifierProvider<CourseListNotifier, CourseListState>(
  CourseListNotifier.new,
);

// TODO: Add more course-related providers here
// Example:
// final courseDetailProvider = FutureProvider.family<Course, String>((ref, courseId) async {
//   return await courseRepository.getCourseById(courseId);
// });
