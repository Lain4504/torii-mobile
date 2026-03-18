import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:torii_app/core/constants/app_design_system.dart';

class CurriculumScreen extends StatelessWidget {
  const CurriculumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Demo curriculum data với quan hệ "bài tiếp theo"
    final Map<String, dynamic> lesson1 = {
      'title': 'Lesson 1: Giới thiệu Hiragana',
      'subtitle': 'Video bài học',
      'duration': '15:00',
      'type': 'video',
      'thumbnailUrl': 'https://picsum.photos/seed/lesson1/800/450',
      'videoUrl': 'https://example.com/video.mp4',
    };
    final Map<String, dynamic> lesson2 = {
      'title': 'Lesson 2: Luyện đọc các nguyên âm',
      'subtitle': 'Bài học + tài liệu',
      'duration': '20:00',
      'type': 'video',
      'thumbnailUrl': 'https://picsum.photos/seed/lesson2/800/450',
      'videoUrl': 'https://example.com/video.mp4',
    };
    final Map<String, dynamic> lesson3 = {
      'title': 'Lesson 3: Bài tập trắc nghiệm 1',
      'subtitle': 'Quiz',
      'duration': '10:00',
      'type': 'quiz',
    };
    final Map<String, dynamic> lesson4 = {
      'title': 'Lesson 4: Giới thiệu Katakana',
      'subtitle': 'Article',
      'duration': '15:00',
      'type': 'article',
      'article': {
        'title': 'Giới thiệu Katakana',
        'content': 'Katakana là một trong ba hệ chữ viết tiếng Nhật.\n\n'
            'Trong bài này bạn sẽ học:\n'
            '- Vai trò của Katakana\n'
            '- Cách đọc và cách viết cơ bản\n\n'
            'Gợi ý: hãy luyện viết mỗi ký tự 5 lần.',
      },
    };
    final Map<String, dynamic> lesson5 = {
      'title': 'Lesson 5: Luyện viết Katakana',
      'subtitle': 'Video bài học',
      'duration': '25:00',
      'type': 'video',
      'thumbnailUrl': 'https://picsum.photos/seed/lesson5/800/450',
      'videoUrl': 'https://example.com/video.mp4',
    };

    // Thiết lập quan hệ "bài tiếp theo"
    lesson1['nextLesson'] = lesson2;
    lesson2['nextLesson'] = lesson3;
    lesson4['nextLesson'] = lesson5;

    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Lộ trình khóa học', style: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.bold)),
        backgroundColor: AppColors.surface,
        elevation: 0,
        leading: IconButton(icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary), onPressed: () => Navigator.pop(context)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCourseHeaderCard(theme),
            const SizedBox(height: 28),

            _buildModuleItem('Module 1: Bảng chữ cái Hiragana', [
              _buildLessonItem(
                context,
                title: lesson1['title'] as String,
                duration: lesson1['duration'] as String,
                icon: Icons.play_circle_fill,
                status: 'Hoàn thành',
                statusColor: AppColors.success,
                lesson: lesson1,
              ),
              _buildLessonItem(
                context,
                title: lesson2['title'] as String,
                duration: lesson2['duration'] as String,
                icon: Icons.play_circle_fill,
                status: 'Đang học',
                statusColor: AppColors.primary,
                lesson: lesson2,
              ),
              _buildLessonItem(
                context,
                title: lesson3['title'] as String,
                duration: lesson3['duration'] as String,
                icon: Icons.quiz_rounded,
                status: 'Chưa học',
                statusColor: AppColors.textTertiary,
                lesson: lesson3,
              ),
            ]),
            const SizedBox(height: 16),
            _buildModuleItem('Module 2: Bảng chữ cái Katakana', [
              _buildLessonItem(
                context,
                title: lesson4['title'] as String,
                duration: lesson4['duration'] as String,
                icon: Icons.article_outlined,
                status: 'Chưa học',
                statusColor: AppColors.textTertiary,
                lesson: lesson4,
              ),
              _buildLessonItem(
                context,
                title: lesson5['title'] as String,
                duration: lesson5['duration'] as String,
                icon: Icons.play_circle_fill,
                status: 'Chưa học',
                statusColor: AppColors.textTertiary,
                lesson: lesson5,
              ),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseHeaderCard(ThemeData theme) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.textPrimary.withOpacity(0.04),
            blurRadius: 18,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tiếng Nhật N5 cho người mới',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w800,
              letterSpacing: 0.1,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Lộ trình học từ bảng chữ cái tới những mẫu câu cơ bản.',
            style: theme.textTheme.bodySmall?.copyWith(
              color: AppColors.grey700,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Tiến độ học tập', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
              Text('45%', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 13)),
            ],
          ),
          const SizedBox(height: 10),
          LinearProgressIndicator(
            value: 0.45,
            backgroundColor: AppColors.grey200,
            valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
            minHeight: 8,
            borderRadius: BorderRadius.circular(4),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Icon(Icons.menu_book_outlined, size: 16, color: AppColors.grey700),
              const SizedBox(width: 4),
              Text('5 bài học • 2 module', style: TextStyle(color: AppColors.grey700, fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildModuleItem(String title, List<Widget> lessons) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.grey200),
        boxShadow: [
          BoxShadow(
            color: AppColors.textPrimary.withOpacity(0.04),
            blurRadius: 14,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      margin: const EdgeInsets.only(bottom: 16),
      child: ExpansionTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        initiallyExpanded: true,
        childrenPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        children: lessons,
      ),
    );
  }

  Widget _buildLessonItem(
    BuildContext context, {
    required String title,
    required String duration,
    required IconData icon,
    required String status,
    required Color statusColor,
    required Map<String, dynamic> lesson,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => context.push('/lesson', extra: lesson),
        child: Row(
          children: [
            Icon(icon, color: AppColors.textTertiary, size: 24),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 4),
                  Text(duration, style: TextStyle(color: AppColors.grey700, fontSize: 13)),
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
            const SizedBox(width: 6),
            const Icon(Icons.chevron_right, color: AppColors.textTertiary),
          ],
        ),
      ),
    );
  }
}
