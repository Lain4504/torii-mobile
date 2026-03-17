import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/providers/api_providers.dart';

class AchievementsScreen extends ConsumerWidget {
  const AchievementsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final achievementsAsync = ref.watch(gamificationAchievementsProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20, color: AppColors.textPrimary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Thành tựu học tập',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
            letterSpacing: 0.2,
          ),
        ),
        backgroundColor: AppColors.surface,
        elevation: 0,
      ),
      body: achievementsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(
          child: Text('Lỗi: $e', style: const TextStyle(color: AppColors.error)),
        ),
        data: (items) {
          if (items.isEmpty) {
            return const Center(
              child: Text(
                'Bạn chưa có thành tựu nào.\nHãy tiếp tục học để mở khóa huy hiệu!',
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.textTertiary),
              ),
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
            itemCount: items.length,
            separatorBuilder: (_, __) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              final a = items[index];
              final unlocked = a.isUnlocked;
              return Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.grey300),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.textPrimary.withOpacity(0.03),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: unlocked ? AppColors.primary.withOpacity(0.12) : AppColors.grey200,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Icon(
                        unlocked ? Icons.emoji_events_rounded : Icons.lock_outline,
                        color: unlocked ? AppColors.primary : AppColors.textTertiary,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            a.title,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            a.description,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: AppColors.textTertiary,
                              height: 1.35,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: unlocked ? AppColors.success.withOpacity(0.12) : AppColors.grey200,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            unlocked ? 'Đã mở khóa' : 'Chưa đạt',
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ),
                        if (a.unlockedAt != null) ...[
                          const SizedBox(height: 4),
                          Text(
                            '${a.unlockedAt!.day}/${a.unlockedAt!.month}/${a.unlockedAt!.year}',
                            style: const TextStyle(fontSize: 10, color: AppColors.textTertiary),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

