import 'package:flutter/material.dart';

class CourseDetailScreen extends StatelessWidget {
  const CourseDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryRed = Color(0xFFE53935);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 250,
                pinned: true,
                backgroundColor: primaryRed,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                    'https://picsum.photos/seed/course_detail/800/600',
                    fit: BoxFit.cover,
                  ),
                ),
                leading: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => Navigator.pop(context),
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
                        'Mastering Kanji N4 trong 3 tháng',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildInfoItem(Icons.signal_cellular_alt, 'N4'),
                          _buildInfoItem(Icons.list_alt, '40 bài'),
                          _buildInfoItem(Icons.access_time, '20 giờ'),
                          const Text(
                            '899.000đ',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: primaryRed),
                          ),
                        ],
                      ),
                      const Divider(height: 48),

                      const Text('Giảng viên', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=sensei'),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Yuki-sensei', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                Text('Chuyên gia JLPT với 10 năm kinh nghiệm tại Tokyo.', style: TextStyle(color: Colors.grey[600], fontSize: 13)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),

                      const Text('Mô tả khóa học', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 12),
                      Text(
                        'Khóa học này tập trung vào 300 chữ Kanji N4 quan trọng nhất. Bạn sẽ được học thông qua phương thức liên tưởng hình ảnh, giúp nhớ lâu và hiểu sâu ý nghĩa từ vựng.',
                        style: TextStyle(height: 1.6, color: Colors.grey[800]),
                      ),
                      const SizedBox(height: 32),

                      const Text('Nội dung khóa học', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 16),
                      _buildCurriculumItem('Module 1: Kanji về Thiên nhiên', '5 bài học'),
                      _buildCurriculumItem('Module 2: Kanji về Gia đình & Bạn bè', '6 bài học'),
                      _buildCurriculumItem('Module 3: Kanji về Công việc & Trường học', '8 bài học'),
                      
                      const SizedBox(height: 32),
                      const Text('Đánh giá (4.9)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 16),
                      _buildReview('Tiên Vũ', 'Khóa học rất hay, giáo viên dạy dễ hiểu lắm ạ!'),
                      
                      const SizedBox(height: 100), // Space for button
                    ],
                  ),
                ),
              ),
            ],
          ),
          
          // Sticky Bottom Button
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -5)),
                ],
              ),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryRed,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    elevation: 0,
                  ),
                  child: const Text('Đăng ký học ngay', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey[600]),
        const SizedBox(width: 4),
        Text(text, style: TextStyle(color: Colors.grey[600], fontSize: 13, fontWeight: FontWeight.w600)),
      ],
    );
  }

  Widget _buildCurriculumItem(String title, String subtitle) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(subtitle, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
            ],
          ),
          const Icon(Icons.add, size: 20),
        ],
      ),
    );
  }

  Widget _buildReview(String name, String comment) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const CircleAvatar(radius: 12, backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=user')),
            const SizedBox(width: 8),
            Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            const Spacer(),
            const Icon(Icons.star, color: Colors.amber, size: 14),
            const Icon(Icons.star, color: Colors.amber, size: 14),
            const Icon(Icons.star, color: Colors.amber, size: 14),
            const Icon(Icons.star, color: Colors.amber, size: 14),
            const Icon(Icons.star, color: Colors.amber, size: 14),
          ],
        ),
        const SizedBox(height: 8),
        Text(comment, style: TextStyle(color: Colors.grey[700], fontSize: 13)),
        const SizedBox(height: 16),
      ],
    );
  }
}
