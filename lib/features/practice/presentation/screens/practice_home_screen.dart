import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:torii_app/core/constants/app_design_system.dart';

class PracticeHomeScreen extends StatelessWidget {
  const PracticeHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'Luyện tập',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w800,
            letterSpacing: 0.2,
          ),
        ),
        backgroundColor: AppColors.surface,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
        children: [
          InkWell(
            onTap: () => context.push('/study-sets'),
            borderRadius: BorderRadius.circular(16),
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.grey300),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.textPrimary.withOpacity(0.04),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.10),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(Icons.style_rounded, color: AppColors.primary),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Thẻ ghi nhớ của tôi',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Study sets + flashcards, quản lý và luyện tập từ vựng',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: AppColors.textTertiary,
                            height: 1.35,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.chevron_right, color: AppColors.textTertiary),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          InkWell(
            onTap: () {
              // TODO: thi thử JLPT — màn hình / dữ liệu sẽ bổ sung sau
            },
            borderRadius: BorderRadius.circular(16),
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.grey300),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.textPrimary.withOpacity(0.04),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.10),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(Icons.edit_note_rounded, color: AppColors.primary),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Thi thử JLPT',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Luyện đề theo cấp độ',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: AppColors.textTertiary,
                            height: 1.35,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.chevron_right, color: AppColors.textTertiary),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

