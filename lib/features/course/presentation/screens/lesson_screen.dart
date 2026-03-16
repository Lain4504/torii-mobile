import 'package:flutter/material.dart';
import 'package:torii_app/core/constants/app_design_system.dart';

class LessonScreen extends StatefulWidget {
  const LessonScreen({super.key});

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        title: const Text('Bài 2: Nguyên âm Hiragana', style: TextStyle(color: AppColors.textPrimary, fontSize: 18)),
        backgroundColor: AppColors.surface,
        elevation: 0,
        leading: IconButton(icon: const Icon(Icons.close, color: AppColors.textPrimary), onPressed: () => Navigator.pop(context)),
      ),
      body: Column(
        children: [
          // Video Player Placeholder
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              color: AppColors.textPrimary,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.network('https://picsum.photos/seed/video/800/450', fit: BoxFit.cover, opacity: const AlwaysStoppedAnimation(0.5)),
                  const Icon(Icons.play_circle_fill, size: 64, color: AppColors.textOnPrimary),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.transparent, AppColors.textPrimary.withOpacity(0.7)])),
                      child: Row(
                        children: [
                          const Text('10:24 / 20:00', style: TextStyle(color: AppColors.textOnPrimary, fontSize: 12)),
                          const Spacer(),
                          const Icon(Icons.settings, color: AppColors.textOnPrimary, size: 20),
                          const SizedBox(width: 12),
                          const Icon(Icons.fullscreen, color: AppColors.textOnPrimary, size: 20),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Tabs
          TabBar(
            controller: _tabController,
            labelColor: AppColors.primary,
            unselectedLabelColor: AppColors.textTertiary,
            indicatorColor: AppColors.primary,
            tabs: const [
              Tab(text: 'Nội dung'),
              Tab(text: 'Tài liệu'),
              Tab(text: 'Thảo luận'),
            ],
          ),

          // Tab View
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildContentTab(),
                _buildPlaceholderTab('Danh sách tài liệu dự phòng'),
                _buildPlaceholderTab('Khu vực thảo luận bài học'),
              ],
            ),
          ),

          // Bottom Bar
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: AppColors.surface, border: Border(top: BorderSide(color: AppColors.grey200))),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text('Đánh dấu hoàn thành', style: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.textOnPrimary,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 0,
                    ),
                    child: const Text('Bài tiếp theo', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContentTab() {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        const Text('Giới thiệu bài học', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        Text(
          'Trong bài học này, chúng ta sẽ làm quen với 5 nguyên âm cơ bản trong tiếng Nhật: あ (a), い (i), う (u), え (e), お (o). Đây là nền tảng cho toàn bộ bảng chữ cái Hiragana.',
          style: TextStyle(height: 1.6, color: AppColors.textPrimary),
        ),
        const SizedBox(height: 32),
        const Text('Từ vựng quan trọng', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        _buildVocabItem('あ', 'A', 'Mặt trời'),
        _buildVocabItem('い', 'I', 'Dạ dày'),
        _buildVocabItem('う', 'U', 'Con thỏ (U-sagi)'),
      ],
    );
  }

  Widget _buildVocabItem(String char, String romaji, String meaning) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppColors.background, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Text(char, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.primary)),
          const SizedBox(width: 16),
          Text(romaji, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const Spacer(),
          Text(meaning, style: TextStyle(color: AppColors.grey700)),
        ],
      ),
    );
  }

  Widget _buildPlaceholderTab(String text) {
    return Center(child: Text(text, style: TextStyle(color: AppColors.textTertiary)));
  }
}
