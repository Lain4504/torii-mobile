import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/exam_providers.dart';
import '../widgets/exam_card.dart';

class ExamPage extends ConsumerWidget {
  const ExamPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(examListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Exams'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.read(examListProvider.notifier).loadExams(),
          ),
        ],
      ),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : state.error != null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Error: ${state.error}'),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () => ref.read(examListProvider.notifier).loadExams(),
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                )
              : state.exams.isEmpty
                  ? const Center(child: Text('No exams available'))
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: state.exams.length,
                      itemBuilder: (context, index) {
                        // TODO: Use actual exam data from state.exams[index]
                        return const Padding(
                          padding: EdgeInsets.only(bottom: 12),
                          child: ExamCard(
                            title: 'JLPT N3 Mock',
                            subtitle: '50 questions',
                          ),
                        );
                      },
                    ),
    );
  }
}

