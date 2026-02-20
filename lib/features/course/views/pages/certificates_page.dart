import 'package:flutter/material.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../core/widgets/widgets.dart';

class CertificatesPage extends StatelessWidget {
  const CertificatesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final certificates = [
      {
        'title': 'Tiếng Nhật N5 Cấp Tốc',
        'date': '20/01/2026',
        'id': 'TR-50281',
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: AppBackground(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            _buildAppBar(context),
            if (certificates.isEmpty)
              _buildEmptyState()
            else
              SliverPadding(
                padding: const EdgeInsets.all(AppSpacing.xl),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1.6,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final cert = certificates[index];
                      return _CertificateItem(
                        title: cert['title']!,
                        date: cert['date']!,
                        certId: cert['id']!,
                      );
                    },
                    childCount: certificates.length,
                  ),
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
  final String title;
  final String date;
  final String certId;

  const _CertificateItem({required this.title, required this.date, required this.certId});

  @override
  Widget build(BuildContext context) {
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
              flex: 3,
              child: Container(
                width: double.infinity,
                color: AppColors.primary.withValues(alpha: 0.05),
                child: const Center(
                  child: Icon(Icons.workspace_premium_rounded, size: 48, color: AppColors.primary),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(title, style: const TextStyle(fontWeight: AppTypography.bold, fontSize: 13)),
                          const SizedBox(height: 4),
                          Text('ID: $certId • Cấp ngày $date', style: const TextStyle(fontSize: 10, color: AppColors.textTertiary)),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.download_rounded, size: 20, color: AppColors.primary),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
