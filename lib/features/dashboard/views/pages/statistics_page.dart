import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../core/widgets/widgets.dart';

class StatisticsPage extends ConsumerWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: AppBackground(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            _buildAppBar(context),
            SliverPadding(
              padding: const EdgeInsets.all(AppSpacing.xl),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                   _buildMainStatsCard(),
                   const SizedBox(height: AppSpacing.xxl),
                   _buildSectionTitle('HOẠT ĐỘNG HÀNG TUẦN'),
                   const SizedBox(height: AppSpacing.lg),
                   _buildWeeklyChart(),
                   const SizedBox(height: AppSpacing.xxl),
                   _buildSectionTitle('TIẾN ĐỘ KHÓA HỌC'),
                   const SizedBox(height: AppSpacing.lg),
                   _buildCourseProgressList(),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      floating: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: const Text(
        'THỐNG KÊ CHI TIẾT',
        style: TextStyle(
          fontSize: 12,
          fontWeight: AppTypography.black,
          letterSpacing: 2.0,
        ),
      ),
      centerTitle: true,
    );
  }

  Widget _buildMainStatsCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.card),
        border: Border.all(color: AppColors.grey200.withValues(alpha: 0.8), width: 1.5),
        boxShadow: AppElevation.cardShadow,
      ),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _MiniStat(label: 'TỔNG XP', value: '12,450', icon: Icons.bolt_rounded, color: AppColors.primary),
              _MiniStat(label: 'GIỜ HỌC', value: '48.5h', icon: Icons.timer_rounded, color: AppColors.accent),
              _MiniStat(label: 'BÀI HỌC', value: '124', icon: Icons.menu_book_rounded, color: Colors.blue),
            ],
          ),
          const SizedBox(height: 24),
          const Divider(),
          const SizedBox(height: 24),
          _buildStreakInfo(),
        ],
      ),
    );
  }

  Widget _buildStreakInfo() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFFE63946).withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.local_fire_department_rounded, color: Color(0xFFE63946), size: 32),
        ),
        const SizedBox(width: 16),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'CHUỖI 15 NGÀY',
                style: TextStyle(fontSize: 10, fontWeight: AppTypography.black, letterSpacing: 1.0, color: Color(0xFFE63946)),
              ),
              Text(
                'Bạn đang rất chăm chỉ! Đừng bỏ lỡ ngày nào nhé.',
                style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 10,
        fontWeight: AppTypography.black,
        letterSpacing: 2.0,
        color: AppColors.textTertiary,
      ),
    );
  }

  Widget _buildWeeklyChart() {
    // Placeholder for a bar chart
    return Container(
      height: 200,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.card),
        border: Border.all(color: AppColors.grey200.withValues(alpha: 0.5)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _Bar(height: 0.4, label: 'T2'),
          _Bar(height: 0.7, label: 'T3'),
          _Bar(height: 1.0, label: 'T4', isActive: true),
          _Bar(height: 0.5, label: 'T5'),
          _Bar(height: 0.8, label: 'T6'),
          _Bar(height: 0.2, label: 'T7'),
          _Bar(height: 0.0, label: 'CN'),
        ],
      ),
    );
  }

  Widget _buildCourseProgressList() {
    final courses = [
      {'title': 'Tiếng Nhật N5 Cấp Tốc', 'progress': 0.85},
      {'title': 'Học Hán Tự Qua Hình Ảnh', 'progress': 0.42},
      {'title': 'Luyện Nghe Chủ Đề Đời Sống', 'progress': 0.15},
    ];

    return Column(
      children: courses.map((c) => Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(color: AppColors.grey200.withValues(alpha: 0.5)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(c['title'] as String, style: const TextStyle(fontWeight: AppTypography.bold)),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: ProgressBar(progress: c['progress'] as double, height: 6)),
                  const SizedBox(width: 12),
                  Text('${((c['progress'] as double) * 100).toInt()}%', style: const TextStyle(fontSize: 12, fontWeight: AppTypography.bold)),
                ],
              ),
            ],
          ),
        ),
      )).toList(),
    );
  }
}

class _MiniStat extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color color;

  const _MiniStat({required this.label, required this.value, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: color, size: 24),
        const SizedBox(height: 8),
        Text(value, style: const TextStyle(fontSize: 18, fontWeight: AppTypography.black)),
        Text(label, style: const TextStyle(fontSize: 8, fontWeight: AppTypography.black, color: AppColors.textTertiary, letterSpacing: 0.5)),
      ],
    );
  }
}

class _Bar extends StatelessWidget {
  final double height;
  final String label;
  final bool isActive;

  const _Bar({required this.height, required this.label, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 30,
          height: (140 * height).clamp(4.0, 140.0),
          decoration: BoxDecoration(
            color: isActive ? AppColors.primary : AppColors.primary.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(height: 8),
        Text(label, style: TextStyle(fontSize: 10, fontWeight: isActive ? FontWeight.bold : FontWeight.normal)),
      ],
    );
  }
}
