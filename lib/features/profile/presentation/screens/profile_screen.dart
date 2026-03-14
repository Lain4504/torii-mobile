import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryRed = Color(0xFFE53935);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Trang cá nhân', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(icon: const Icon(Icons.settings_outlined, color: Colors.black), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Header
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=tienvu'),
            ),
            const SizedBox(height: 16),
            const Text('Tiên Vũ', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Text('tienvu@example.com', style: TextStyle(color: Colors.grey[600])),
            const SizedBox(height: 24),
            
            // Edit Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryRed,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 0,
                  ),
                  child: const Text('Chỉnh sửa hồ sơ', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            const SizedBox(height: 40),

            // Stats
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Thống kê học tập', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      _buildStatCard('Khóa học', '12', Icons.book_rounded, Colors.blue),
                      const SizedBox(width: 16),
                      _buildStatCard('Bài học', '145', Icons.check_circle_rounded, Colors.green),
                      const SizedBox(width: 16),
                      _buildStatCard('Streak', '15', Icons.local_fire_department_rounded, Colors.orange),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),

            // Achievement Preview
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Thành tựu', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      TextButton(onPressed: () {}, child: const Text('Xem tất cả', style: TextStyle(color: primaryRed))),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildBadge(Icons.auto_awesome, 'Người mới'),
                      _buildBadge(Icons.timer, 'Chăm chỉ'),
                      _buildBadge(Icons.workspace_premium, 'Cao thủ N5'),
                      _buildBadge(Icons.local_fire_department, 'Nhiệt huyết'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String label, String value, IconData icon, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey[100]!),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4)),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 12),
            Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(label, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget _buildBadge(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(color: Colors.amber[50], shape: BoxShape.circle),
          child: Icon(icon, color: Colors.amber[700], size: 24),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500)),
      ],
    );
  }
}
