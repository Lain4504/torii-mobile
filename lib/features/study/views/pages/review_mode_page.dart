import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../core/widgets/widgets.dart';

class ReviewModePage extends ConsumerWidget {
  final String setId;
  const ReviewModePage({super.key, required this.setId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close_rounded),
          onPressed: () => context.pop(),
        ),
        title: const Text('Trắc nghiệm'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.construction_rounded, size: 64, color: AppColors.textTertiary),
            const SizedBox(height: 16),
            const Text(
              'Chế độ Trắc nghiệm đang được phát triển',
              style: TextStyle(fontWeight: AppTypography.bold, color: AppColors.textSecondary),
            ),
            const SizedBox(height: 24),
            AppButton(
              onPressed: () => context.pop(),
              text: 'QUAY LẠI',
              width: 150,
            ),
          ],
        ),
      ),
    );
  }
}
