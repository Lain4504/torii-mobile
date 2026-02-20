import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/widgets/widgets.dart';
import 'package:torii_app/features/course/models/certificate_model.dart';
import 'package:torii_app/features/course/providers/course_providers.dart';

class CertificatesPage extends ConsumerWidget {
  const CertificatesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final certificatesAsync = ref.watch(certificatesProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: AppBackground(
        child: RefreshIndicator(
          onRefresh: () => ref.refresh(certificatesProvider.future),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              _buildAppBar(context),
              certificatesAsync.when(
                data: (certificates) {
                  if (certificates.isEmpty) {
                    return _buildEmptyState();
                  }
                  return SliverPadding(
                    padding: const EdgeInsets.all(AppSpacing.xl),
                    sliver: SliverGrid(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 16,
                        childAspectRatio: 2.2,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final cert = certificates[index];
                          return _CertificateItem(certificate: cert);
                        },
                        childCount: certificates.length,
                      ),
                    ),
                  );
                },
                loading: () => const SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator()),
                ),
                error: (err, _) => SliverFillRemaining(
                  child: Center(child: Text('Lỗi: $err')),
                ),
              ),
            ],
          ),
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
        'CHỨNG CHỈ CỦA TÔI',
        style: TextStyle(
          fontSize: 12,
          fontWeight: AppTypography.black,
          letterSpacing: 2.0,
        ),
      ),
      centerTitle: true,
    );
  }

  Widget _buildEmptyState() {
     return const SliverFillRemaining(
       child: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Icon(Icons.workspace_premium_outlined, size: 64, color: AppColors.textTertiary),
             SizedBox(height: 16),
             Text('CHƯA CÓ CHỨNG CHỈ', style: TextStyle(fontWeight: AppTypography.black, letterSpacing: 1.0)),
             SizedBox(height: 8),
             Text('Hoàn thành khóa học để nhận chứng chỉ nhé!', style: TextStyle(fontSize: 12, color: AppColors.textSecondary)),
           ],
         ),
       )
     );
  }
}

class _CertificateItem extends StatelessWidget {
  final Certificate certificate;

  const _CertificateItem({required this.certificate});

  @override
  Widget build(BuildContext context) {
    final date = '${certificate.issueDate.day}/${certificate.issueDate.month}/${certificate.issueDate.year}';
    
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.card),
        border: Border.all(color: AppColors.grey200.withValues(alpha: 0.8), width: 1.5),
        boxShadow: AppElevation.softShadow,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppRadius.card),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                color: AppColors.primary.withValues(alpha: 0.05),
                child: const Center(
                  child: Icon(Icons.workspace_premium_rounded, size: 32, color: AppColors.primary),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(certificate.courseTitle, style: const TextStyle(fontWeight: AppTypography.bold, fontSize: 13)),
                        const SizedBox(height: 4),
                        Text('ID: ${certificate.certificateCode} • Cấp ngày $date', style: const TextStyle(fontSize: 10, color: AppColors.textTertiary)),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // Logic to open URL or download
                    },
                    icon: const Icon(Icons.download_rounded, size: 20, color: AppColors.primary),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
