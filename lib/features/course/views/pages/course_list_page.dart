import 'package:flutter/material.dart';
import '../../viewmodels/course_list_vm.dart';
import '../widgets/course_card.dart';
import '../widgets/course_filter_bar.dart';

class CourseListPage extends StatelessWidget {
  const CourseListPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: wire ViewModel via Provider/Riverpod
    return Scaffold(
      appBar: AppBar(title: const Text('Courses')),
      body: Column(
        children: const [
          CourseFilterBar(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: CourseCard(title: 'Sample Course', description: 'Overview here'),
            ),
          ),
        ],
      ),
    );
  }
}

