import 'package:flutter/material.dart';

class CurriculumScreen extends StatelessWidget {
  const CurriculumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryRed = Color(0xFFE53935);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Lộ trình khóa học', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.black), onPressed: () => Navigator.pop(context)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Tiếng Nhật N5 cho người mới',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            
            // Progress Bar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Tiến độ học tập', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('45%', style: TextStyle(color: primaryRed, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 12),
            LinearProgressIndicator(
              value: 0.45,
              backgroundColor: Colors.grey[200],
              valueColor: const AlwaysStoppedAnimation<Color>(primaryRed),
              minHeight: 10,
              borderRadius: BorderRadius.circular(5),
            ),
            const SizedBox(height: 40),

            _buildModuleItem('Module 1: Bảng chữ cái Hiragana', [
              _buildLessonItem('Lesson 1: Giới thiệu Hiragana', '15:00', Icons.play_circle_fill, 'Hoàn thành', Colors.green),
              _buildLessonItem('Lesson 2: Luyện đọc các nguyên âm', '20:00', Icons.play_circle_fill, 'Đang học', primaryRed),
              _buildLessonItem('Lesson 3: Bài tập trắc nghiệm 1', '10:00', Icons.quiz_rounded, 'Chưa học', Colors.grey),
            ]),
            const SizedBox(height: 16),
            _buildModuleItem('Module 2: Bảng chữ cái Katakana', [
              _buildLessonItem('Lesson 4: Giới thiệu Katakana', '15:00', Icons.play_circle_fill, 'Chưa học', Colors.grey),
              _buildLessonItem('Lesson 5: Luyện viết Katakana', '25:00', Icons.play_circle_fill, 'Chưa học', Colors.grey),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildModuleItem(String title, List<Widget> lessons) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: ExpansionTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        initiallyExpanded: true,
        childrenPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        children: lessons,
      ),
    );
  }

  Widget _buildLessonItem(String title, String duration, IconData icon, String status, Color statusColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey[400], size: 24),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
                const SizedBox(height: 4),
                Text(duration, style: TextStyle(color: Colors.grey[600], fontSize: 13)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              status,
              style: TextStyle(color: statusColor, fontSize: 11, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
