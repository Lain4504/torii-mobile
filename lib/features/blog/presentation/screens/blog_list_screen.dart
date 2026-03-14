import 'package:flutter/material.dart';

class BlogListScreen extends StatelessWidget {
  const BlogListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryRed = Color(0xFFE53935);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Blog học tiếng Nhật', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Tìm bài viết...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
              ),
            ),
          ),

          // Blog List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: 4,
              itemBuilder: (context, index) {
                return _buildBlogCard(primaryRed, index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBlogCard(Color primaryRed, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 15, offset: const Offset(0, 5)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.network(
              'https://picsum.photos/seed/blog$index/600/300',
              height: 160,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(color: primaryRed.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                      child: const Text('Kinh nghiệm', style: TextStyle(color: primaryRed, fontSize: 11, fontWeight: FontWeight.bold)),
                    ),
                    Text('14/03/2026', style: TextStyle(color: Colors.grey[400], fontSize: 11)),
                  ],
                ),
                const SizedBox(height: 12),
                const Text(
                  'Lộ trình tự học tiếng Nhật từ N5 lên N3 trong 6 tháng hiệu quả',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  'Bạn đang bối rối không biết bắt đầu từ đâu? Bài viết này sẽ giúp bạn có một cái nhìn tổng quan nhất...',
                  style: TextStyle(color: Colors.grey[600], fontSize: 13, height: 1.5),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
