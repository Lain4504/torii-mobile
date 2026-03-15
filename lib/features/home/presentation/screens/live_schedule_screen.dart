import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/providers/api_providers.dart';
import 'package:torii_app/data/models/live_schedule_model.dart';

class LiveScheduleScreen extends ConsumerWidget {
  const LiveScheduleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final liveSchedulesAsync = ref.watch(liveSchedulesProvider);

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        title: const Text('Lịch học Live', style: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.bold)),
        backgroundColor: AppColors.surface,
        elevation: 0,
        actions: [
          IconButton(icon: const Icon(Icons.calendar_month_outlined, color: AppColors.textPrimary), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 90,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: List.generate(7, (i) {
                final d = DateTime.now().add(Duration(days: i));
                final isSelected = i == 0;
                return _buildDayItem(
                  ['T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'CN'][d.weekday - 1],
                  d.day.toString(),
                  isSelected,
                  isSelected ? AppColors.primary : null,
                );
              }),
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: liveSchedulesAsync.when(
              data: (list) {
                if (list.isEmpty) return const Center(child: Text('Chưa có lịch live trong khoảng thời gian này'));
                return ListView(
                  padding: const EdgeInsets.all(24),
                  children: list.map((s) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: _buildLiveCard(s),
                  )).toList(),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Lỗi: $e', style: TextStyle(color: AppColors.error))),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: AppColors.primary,
        icon: const Icon(Icons.add, color: AppColors.textOnPrimary),
        label: const Text('Đăng ký lớp live', style: TextStyle(color: AppColors.textOnPrimary, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildDayItem(String day, String date, bool isSelected, [Color? color]) {
    return Container(
      width: 60,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: isSelected ? (color ?? AppColors.primary) : Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        border: isSelected ? null : Border.all(color: AppColors.grey200),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(day, style: TextStyle(color: isSelected ? AppColors.textOnPrimary : AppColors.grey700, fontSize: 12)),
          const SizedBox(height: 4),
          Text(date, style: TextStyle(color: isSelected ? AppColors.textOnPrimary : AppColors.textPrimary, fontWeight: FontWeight.bold, fontSize: 16)),
        ],
      ),
    );
  }

  Widget _buildLiveCard(LiveScheduleModel s) {
    final isLive = (s.status ?? '').toUpperCase() == 'LIVE' || (s.status ?? '').toUpperCase() == 'ONGOING';
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isLive ? AppColors.primary.withOpacity(0.05) : AppColors.background,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: isLive ? AppColors.primary.withOpacity(0.2) : AppColors.grey200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (isLive)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(8)),
                  child: const Text('Đang LIVE', style: TextStyle(color: AppColors.textOnPrimary, fontSize: 10, fontWeight: FontWeight.bold)),
                ),
              const Spacer(),
              const Icon(Icons.more_horiz, color: AppColors.textTertiary),
            ],
          ),
          const SizedBox(height: 12),
          Text(s.title ?? s.courseTitle ?? 'Live', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.person_outline, size: 14, color: AppColors.textTertiary),
              const SizedBox(width: 4),
              Text(s.senseiLabel.isNotEmpty ? s.senseiLabel : 'Live class', style: const TextStyle(color: AppColors.textTertiary, fontSize: 13)),
              const SizedBox(width: 12),
              const Icon(Icons.access_time, size: 14, color: AppColors.textTertiary),
              const SizedBox(width: 4),
              Text(s.timeRange.isNotEmpty ? s.timeRange : 'Sắp diễn ra', style: const TextStyle(color: AppColors.textTertiary, fontSize: 13)),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Text(
                  s.courseTitle ?? s.title ?? '',
                  style: TextStyle(color: AppColors.primary.withOpacity(0.7), fontSize: 12, fontWeight: FontWeight.w600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 12),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: isLive ? AppColors.primary : AppColors.surface,
                  foregroundColor: isLive ? AppColors.textOnPrimary : AppColors.primary,
                  side: isLive ? null : const BorderSide(color: AppColors.primary),
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: Text(isLive ? 'Tham gia lớp' : 'Đặt nhắc nhở', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
