import 'package:flutter/material.dart';
import 'package:torii_app/core/constants/app_design_system.dart';

class MyCoursesScreen extends StatelessWidget {
  const MyCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.surface,
        appBar: AppBar(
          title: const Text('Khóa học của tôi', style: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.bold)),
          backgroundColor: AppColors.surface,
          elevation: 0,
          bottom: TabBar(
            labelColor: AppColors.primary,
            unselectedLabelColor: AppColors.textTertiary,
            indicatorColor: AppColors.primary,
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
            _buildCourseList(isCompleted: false),
            _buildCourseList(isCompleted: true),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseList({required bool isCompleted}) {
    return ListView.builder(
      padding: const EdgeInsets.all(24),
      itemCount: isCompleted ? 1 : 3,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 24),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: AppColors.textPrimary.withOpacity(0.04),
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
                            backgroundColor: AppColors.grey200,
                            valueColor: AlwaysStoppedAnimation<Color>(isCompleted ? AppColors.success : AppColors.primary),
                            minHeight: 8,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          isCompleted ? '100%' : '45%',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: isCompleted ? AppColors.success : AppColors.textPrimary),
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
                          backgroundColor: isCompleted ? AppColors.grey200 : AppColors.primary,
                          foregroundColor: isCompleted ? AppColors.textPrimary : AppColors.textOnPrimary,
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
