import 'package:flutter/material.dart';
import '../../../../core/constants/app_design_system.dart';

class SenseiDrillPage extends StatelessWidget {
  const SenseiDrillPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'AI Drill',
          style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
        ),
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.grey300),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sắp ra mắt',
                  style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 6),
                Text(
                  'Tính năng AI Drill đang được hoàn thiện. Bạn có thể dùng Chat / Roleplay / Dịch thuật trong lúc chờ.',
                  style: theme.textTheme.bodySmall?.copyWith(color: AppColors.textTertiary, height: 1.35),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

