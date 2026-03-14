import 'package:flutter/material.dart';

class MyCoursesScreen extends StatelessWidget {
  const MyCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryRed = Color(0xFFE53935);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Khóa học của tôi', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: TabBar(
            labelColor: primaryRed,
            unselectedLabelColor: Colors.grey,
            indicatorColor: primaryRed,
            indicatorWeight: 3,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            tabs: const [
              Tab(text: 'Đang học'),
              Tab(text: 'Đã hoàn thành'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildCourseList(primaryRed, isCompleted: false),
            _buildCourseList(primaryRed, isCompleted: true),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseList(Color primaryRed, {required bool isCompleted}) {
    return ListView.builder(
      padding: const EdgeInsets.all(24),
      itemCount: isCompleted ? 1 : 3,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                child: Image.network(
                  'https://picsum.photos/seed/mycourse$index/600/300',
                  height: 140,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Luyện thi JLPT N5 Cấp Tốc',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: LinearProgressIndicator(
                            value: isCompleted ? 1.0 : 0.45,
                            backgroundColor: Colors.grey[200],
                            valueColor: AlwaysStoppedAnimation<Color>(isCompleted ? Colors.green : primaryRed),
                            minHeight: 8,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          isCompleted ? '100%' : '45%',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: isCompleted ? Colors.green : Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isCompleted ? Colors.grey[100] : primaryRed,
                          foregroundColor: isCompleted ? Colors.black87 : Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        child: Text(
                          isCompleted ? 'Xem lại bài học' : 'Tiếp tục học',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
