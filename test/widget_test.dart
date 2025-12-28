import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_app/data/course_service.dart';
import 'package:mobile_app/data/models/course.dart';
import 'package:mobile_app/viewmodels/course_view_model.dart';
import 'package:mobile_app/views/course/course_view.dart';
import 'package:provider/provider.dart';

class FakeCourseService implements CourseService {
  FakeCourseService({List<Course>? courses})
      : courses = courses ?? const [];

  final List<Course> courses;

  @override
  Future<List<Course>> fetchCourses() async {
    return courses;
  }

  @override
  Future<void> createCourse(CreateCourseInput input) async {}

  @override
  Future<void> updateCourse(int id, UpdateCourseInput input) async {}

  @override
  Future<void> deleteCourse(int id) async {}
}

void main() {
  testWidgets('renders course view with provided data', (tester) async {
    final fakeService = FakeCourseService();
    final viewModel = CourseViewModel(service: fakeService);

    await tester.pumpWidget(
      ChangeNotifierProvider<CourseViewModel>.value(
        value: viewModel,
        child: const MaterialApp(home: CourseView()),
      ),
    );

    await tester.runAsync(() => viewModel.load());
    await tester.pump();

    expect(find.text('Courses'), findsOneWidget);
    expect(find.text('Create'), findsOneWidget);
  });
}
