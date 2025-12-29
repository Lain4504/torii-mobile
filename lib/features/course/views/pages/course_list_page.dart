import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/course_providers.dart';
import '../widgets/course_card.dart';
import '../widgets/course_filter_bar.dart';

class CourseListPage extends ConsumerWidget {
  const CourseListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(courseListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Courses'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.read(courseListProvider.notifier).loadCourses(),
          ),
        ],
      ),
      body: Column(
        children: [
          const CourseFilterBar(),
          Expanded(
            child: state.isLoading
                ? const Center(child: CircularProgressIndicator())
                : state.error != null
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Error: ${state.error}'),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () => ref.read(courseListProvider.notifier).loadCourses(),
                              child: const Text('Retry'),
                            ),
                          ],
                        ),
                      )
                    : state.courses.isEmpty
                        ? const Center(child: Text('No courses available'))
                        : ListView.builder(
                            padding: const EdgeInsets.all(16),
                            itemCount: state.courses.length,
                            itemBuilder: (context, index) {
                              // TODO: Use actual course data from state.courses[index]
                              return const Padding(
                                padding: EdgeInsets.only(bottom: 12),
                                child: CourseCard(
                                  title: 'Sample Course',
                                  description: 'Overview here',
                                ),
                              );
                            },
                          ),
          ),
        ],
      ),
    );
  }
}

