import 'package:flutter/material.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryRed = Color(0xFFE53935);
    const Color gold = Color(0xFFFFD700);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Bảng xếp hạng', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.black), onPressed: () => Navigator.pop(context)),
          bottom: const TabBar(
            labelColor: primaryRed,
            unselectedLabelColor: Colors.grey,
            indicatorColor: primaryRed,
            tabs: [
              Tab(text: 'Tuần này'),
              Tab(text: 'Tháng này'),
              Tab(text: 'Toàn thời gian'),
            ],
          ),
        ),
        body: Column(
          children: [
            // Top 3 Section
            Container(
              padding: const EdgeInsets.fromLTRB(24, 40, 24, 24),
              decoration: BoxDecoration(
                color: primaryRed.withOpacity(0.05),
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(40)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _buildTopUser('Huy Nguyen', '520 XP', 'https://i.pravatar.cc/150?u=2', 2, Colors.grey[400]!),
                  _buildTopUser('Minh Tran', '840 XP', 'https://i.pravatar.cc/150?u=1', 1, gold),
                  _buildTopUser('Linh Pham', '480 XP', 'https://i.pravatar.cc/150?u=3', 3, Colors.brown[300]!),
                ],
              ),
            ),
            
            // List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                itemCount: 10,
                itemBuilder: (context, index) {
                  int rank = index + 4;
                  bool isMe = rank == 6; // Mocking current user at rank 6
                  return _buildLeaderboardRow(rank, isMe, primaryRed);
                },
              ),
            ),

            // Footer
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -5))],
              ),
              child: const Text(
                'Hoàn thành bài học để kiếm thêm XP và leo bảng xếp hạng!',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 13, fontStyle: FontStyle.italic),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopUser(String name, String xp, String avatarUrl, int rank, Color color) {
    double size = rank == 1 ? 80 : 65;
    return Column(
      children: [
        if (rank == 1) const Icon(Icons.workspace_premium, color: Color(0xFFFFD700), size: 32),
        const SizedBox(height: 8),
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: color, width: 3)),
              child: CircleAvatar(radius: size / 2, backgroundImage: NetworkImage(avatarUrl)),
            ),
            Container(
              transform: Matrix4.translationValues(0, 10, 0),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
              child: Text('#$rank', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        Text(xp, style: const TextStyle(color: Color(0xFFE53935), fontWeight: FontWeight.bold, fontSize: 12)),
      ],
    );
  }

  Widget _buildLeaderboardRow(int rank, bool isMe, Color primaryRed) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isMe ? primaryRed.withOpacity(0.1) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: isMe ? primaryRed.withOpacity(0.2) : Colors.grey[100]!),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 30,
            child: Text('#$rank', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[600])),
          ),
          const CircleAvatar(radius: 20, backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=user')),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(isMe ? 'Bạn (Tiên Vũ)' : 'Học viên Torii', style: const TextStyle(fontWeight: FontWeight.bold)),
                Text('Cấp độ N5', style: TextStyle(color: Colors.grey[600], fontSize: 11)),
              ],
            ),
          ),
          Text('420 XP', style: TextStyle(fontWeight: FontWeight.bold, color: isMe ? primaryRed : Colors.black)),
        ],
      ),
    );
  }
}
