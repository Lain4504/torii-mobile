import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:torii_app/core/constants/app_design_system.dart';

class LessonScreen extends StatefulWidget {
  const LessonScreen({super.key, this.lesson});
  final Map<String, dynamic>? lesson;

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
    final theme = Theme.of(context);
    final lesson = widget.lesson ?? const <String, dynamic>{};
    final title = (lesson['title'] ?? 'Bài học').toString();
    final subtitle = (lesson['subtitle'] ?? '').toString();
    final duration = (lesson['duration'] ?? '').toString();
    final type = (lesson['type'] ?? 'video').toString();
    final thumbnailUrl = lesson['thumbnailUrl'] as String?;
    final videoUrl = lesson['videoUrl'] as String?;
    final article = lesson['article'] as Map<String, dynamic>?;
    final nextLesson = lesson['nextLesson'] as Map<String, dynamic>?;

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        title: Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w800,
          ),
        ),
        backgroundColor: AppColors.surface,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            tooltip: 'Lộ trình',
            icon: const Icon(Icons.list_alt_outlined, color: AppColors.textPrimary),
            onPressed: () => context.push('/curriculum'),
          ),
        ],
      ),
      body: Column(
        children: [
          _buildHero(
            type: type,
            thumbnailUrl: thumbnailUrl,
            title: title,
            subtitle: subtitle,
            duration: duration,
            videoUrl: videoUrl,
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
                _buildContentTab(type: type, article: article),
                _buildPlaceholderTab('Tài liệu sẽ được cập nhật'),
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
                    onPressed: nextLesson == null
                        ? null
                        : () => context.pushReplacement('/lesson', extra: nextLesson),
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

  Widget _buildHero({
    required String type,
    required String? thumbnailUrl,
    required String title,
    required String subtitle,
    required String duration,
    required String? videoUrl,
  }) {
    final heroTitle = subtitle.isNotEmpty ? subtitle : (type == 'article' ? 'Bài đọc' : 'Video bài học');
    final meta = [
      if (duration.isNotEmpty) duration,
      if (type.isNotEmpty) type.toUpperCase(),
    ].join(' • ');

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          color: AppColors.textPrimary,
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Stack(
              fit: StackFit.expand,
              children: [
                if (thumbnailUrl != null && thumbnailUrl.isNotEmpty)
                  Image.network(
                    thumbnailUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(color: AppColors.grey200),
                  )
                else
                  Container(color: AppColors.grey200),
                Container(color: Colors.black.withOpacity(0.35)),
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.16),
                          borderRadius: BorderRadius.circular(999),
                          border: Border.all(color: Colors.white.withOpacity(0.18)),
                        ),
                        child: Text(
                          heroTitle,
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 12),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 16, height: 1.2),
                      ),
                      const SizedBox(height: 6),
                      if (meta.isNotEmpty)
                        Text(
                          meta,
                          style: TextStyle(color: Colors.white.withOpacity(0.85), fontSize: 12, fontWeight: FontWeight.w600),
                        ),
                    ],
                  ),
                ),
                Positioned(
                  right: 14,
                  bottom: 14,
                  child: _PrimaryPillButton(
                    icon: type == 'article' ? Icons.menu_book_rounded : Icons.play_arrow_rounded,
                    label: type == 'article' ? 'Đọc ngay' : 'Xem ngay',
                    enabled: type == 'article' || (videoUrl != null && videoUrl.isNotEmpty),
                    onPressed: () {
                      if (!mounted) return;
                      _tabController.animateTo(0);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContentTab({required String type, required Map<String, dynamic>? article}) {
    if (type == 'article') {
      final articleTitle = (article?['title'] ?? 'Bài đọc').toString();
      final content = (article?['content'] ?? 'Nội dung bài đọc đang được cập nhật.').toString();

      return ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(articleTitle, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
          const SizedBox(height: 10),
          Text(content, style: TextStyle(height: 1.7, color: AppColors.textPrimary)),
        ],
      );
    }

    if (type == 'quiz') {
      return _buildPlaceholderTab('Bài quiz chưa được tích hợp trong bản demo này.');
    }

    // video (default)
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Text('Nội dung bài học', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
        const SizedBox(height: 10),
        Text(
          'Trang xem video/lesson trước đây đang được thay bằng màn hình Lesson hợp nhất. '
          'Nếu bạn đã có API lesson (videoUrl, transcript, attachments), mình sẽ nối dữ liệu thật vào đây.',
          style: TextStyle(height: 1.7, color: AppColors.textPrimary),
        ),
        const SizedBox(height: 20),
        _buildSectionCard(
          title: 'Gợi ý học nhanh',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _bullet('Xem hết video một lượt để nắm ý chính'),
              _bullet('Xem lại đoạn khó và ghi chú'),
              _bullet('Làm bài tập/quiz (nếu có) để củng cố'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSectionCard({required String title, required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.grey200),
        boxShadow: [
          BoxShadow(color: AppColors.textPrimary.withOpacity(0.04), blurRadius: 14, offset: const Offset(0, 6)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w800)),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }

  Widget _bullet(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 6),
            child: Icon(Icons.circle, size: 6, color: AppColors.primary),
          ),
          const SizedBox(width: 10),
          Expanded(child: Text(text, style: TextStyle(height: 1.6, color: AppColors.textPrimary))),
        ],
      ),
    );
  }

  Widget _buildPlaceholderTab(String text) {
    return Center(child: Text(text, style: TextStyle(color: AppColors.textTertiary)));
  }
}

class _PrimaryPillButton extends StatelessWidget {
  const _PrimaryPillButton({
    required this.icon,
    required this.label,
    required this.enabled,
    required this.onPressed,
  });

  final IconData icon;
  final String label;
  final bool enabled;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: enabled ? 1 : 0.6,
      child: InkWell(
        onTap: enabled ? onPressed : null,
        borderRadius: BorderRadius.circular(999),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(999),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.25), blurRadius: 10, offset: const Offset(0, 6)),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: AppColors.textOnPrimary, size: 18),
              const SizedBox(width: 8),
              Text(label, style: const TextStyle(color: AppColors.textOnPrimary, fontWeight: FontWeight.w800)),
            ],
          ),
        ),
      ),
    );
  }
}
