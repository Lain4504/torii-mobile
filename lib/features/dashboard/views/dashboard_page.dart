import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: ListView(
        children: const [
          ListTile(title: Text('Courses')), // TODO: navigate to CourseListPage
          ListTile(title: Text('Live Classes')), // TODO: navigate to LiveClassPage
          ListTile(title: Text('Exams')), // TODO: navigate to ExamPage
          ListTile(title: Text('Flashcards')), // TODO: navigate to FlashcardPage
          ListTile(title: Text('Payments')), // TODO: navigate to PaymentPage
        ],
      ),
    );
  }
}

