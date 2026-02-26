import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../core/widgets/widgets.dart';

class LearningHistoryPage extends StatelessWidget {
  const LearningHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: AppBackground(
        child: SafeArea(
          child: Column(
            children: [
              _buildHeader(context),
              const Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.history_rounded, size: 64, color: AppColors.textTertiary),
                      const SizedBox(height: 16),
                      const Text(
                        'LỊCH SỬ HỌC TẬP',
                        style: TextStyle(fontWeight: AppTypography.black, fontSize: 16, letterSpacing: 1.0),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Xem lại tiến trình và thời gian học tập của bạn.',
                        style: TextStyle(color: AppColors.textSecondary),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: Row(
        children: [
          IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
          ),
          const Expanded(
            child: Text(
              'LỊCH SỬ HỌC',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: AppTypography.fontFamilySerif,
                fontSize: 20,
                fontWeight: AppTypography.black,
                fontStyle: FontStyle.italic,
                letterSpacing: 1.0,
              ),
            ),
          ),
          const SizedBox(width: 48),
        ],
      ),
    );
  }
}
