import 'package:flutter/material.dart';
import '../../viewmodels/exam_vm.dart';
import '../widgets/exam_card.dart';

class ExamPage extends StatelessWidget {
  const ExamPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: connect ExamVM
    return Scaffold(
      appBar: AppBar(title: const Text('Exams')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ExamCard(title: 'JLPT N3 Mock', subtitle: '50 questions'),
        ],
      ),
    );
  }
}

