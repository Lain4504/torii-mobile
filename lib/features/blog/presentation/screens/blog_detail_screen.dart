import 'package:flutter/material.dart';
import 'package:torii_app/core/constants/app_design_system.dart';

class BlogDetailScreen extends StatelessWidget {
  const BlogDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                'https://picsum.photos/seed/blog_detail/800/600',
                fit: BoxFit.cover,
              ),
            ),
            backgroundColor: AppColors.primary,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: AppColors.surface,
                child: IconButton(icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary, size: 20), onPressed: () => Navigator.pop(context)),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Lộ trình tự học tiếng Nhật từ N5 lên N3 trong 6 tháng hiệu quả',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, height: 1.3),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const CircleAvatar(radius: 12, backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=admin')),
                      const SizedBox(width: 8),
                      const Text('Admin Torii', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                      const SizedBox(width: 16),
                      Text('14/03/2026', style: TextStyle(color: AppColors.grey700, fontSize: 13)),
                    ],
                  ),
                  const Divider(height: 48),

                  const Text('1. Xác định mục tiêu', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  Text(
                    'Trước khi bắt đầu, bạn cần xác định rõ mục tiêu của mình là gì. Học để thi JLPT, để giao tiếp hay để du học Nhật Bản? Mỗi mục tiêu sẽ có một lộ trình học tập khác nhau.',
                    style: TextStyle(fontSize: 16, height: 1.7, color: AppColors.textPrimary),
                  ),
                  const SizedBox(height: 24),
                  Image.network('https://picsum.photos/seed/blog_img1/600/300'),
                  const SizedBox(height: 24),

                  const Text('2. Lựa chọn tài liệu', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  Text(
                    'Bộ giáo trình Minna no Nihongo vẫn là lựa chọn hàng đầu cho cấp độ N5-N4. Tuy nhiên, bạn nên kết hợp thêm các ứng dụng học tập như Torii Nihongo để luyện tập từ vựng và Kanji hàng ngày.',
                    style: TextStyle(fontSize: 16, height: 1.7, color: AppColors.textPrimary),
                  ),
                  const SizedBox(height: 48),

                  const Text('Bài viết liên quan', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  _buildRelatedPost('Cách học 2000 Kanji trong 1 năm'),
                  _buildRelatedPost('Phân biệt thể lịch sự và thể thông thường'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRelatedPost(String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(border: Border.all(color: AppColors.grey200), borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          ClipRRect(borderRadius: BorderRadius.circular(8), child: Image.network('https://picsum.photos/100/100', width: 60, height: 60, fit: BoxFit.cover)),
          const SizedBox(width: 12),
          Expanded(child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14), maxLines: 2, overflow: TextOverflow.ellipsis)),
          const Icon(Icons.chevron_right, color: AppColors.textTertiary),
        ],
      ),
    );
  }
}
