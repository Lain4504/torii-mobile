import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../core/widgets/zen_background.dart';
import '../../../auth/providers/auth_providers.dart';

/// Settings Page - App Preferences
/// 
/// A clean settings page for managing app preferences.
class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: ZenBackground(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              floating: true,
              pinned: true,
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
                onPressed: () => context.pop(),
              ),
              title: const Text(
                'CÀI ĐẶT',
                style: TextStyle(
                  fontFamily: AppTypography.fontFamilySerif,
                  fontWeight: AppTypography.black,
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  letterSpacing: 2.0,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.xl,
                  vertical: AppSpacing.lg,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Profile Section
                    _buildProfileSection(context, ref),
                    const SizedBox(height: AppSpacing.xxxl),

                    // Payment Section
                    _buildPaymentSection(context),
                    const SizedBox(height: AppSpacing.xxxl),
      
                    // Security Section
                    _buildSecuritySection(context, ref),
                    const SizedBox(height: AppSpacing.xxxl),

                    // Support Section
                    _buildSupportSection(context, ref),
                    const SizedBox(height: AppSpacing.xxxl),
      
                    // Danger Zone
                    _buildDangerZone(context, ref),
                    const SizedBox(height: 60),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'THANH TOÁN',
          style: TextStyle(
            fontSize: 10, 
            fontWeight: AppTypography.black, 
            letterSpacing: 3.0, 
            color: AppColors.textTertiary,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.8),
            borderRadius: BorderRadius.circular(AppRadius.xxl),
            border: Border.all(color: AppColors.grey300.withValues(alpha: 0.3)),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => context.push('/payment/history'),
              borderRadius: BorderRadius.circular(AppRadius.xxl),
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.receipt_long_rounded, color: AppColors.primary, size: 20),
                    ),
                    const SizedBox(width: 16),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Lịch sử đơn hàng', style: TextStyle(fontSize: 16, fontWeight: AppTypography.bold)),
                          Text('Xem lịch sử mua khóa học và bài thi', style: TextStyle(fontSize: 12, color: AppColors.textTertiary)),
                        ],
                      ),
                    ),
                    Icon(Icons.chevron_right_rounded, color: AppColors.textTertiary.withValues(alpha: 0.5)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSecuritySection(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'BẢO MẬT',
          style: TextStyle(
            fontSize: 10, 
            fontWeight: AppTypography.black, 
            letterSpacing: 3.0, 
            color: AppColors.textTertiary,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.8),
            borderRadius: BorderRadius.circular(AppRadius.xxl),
            border: Border.all(color: AppColors.grey300.withValues(alpha: 0.3)),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => context.push('/settings/security'),
              borderRadius: BorderRadius.circular(AppRadius.xxl),
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.security_rounded, color: AppColors.primary, size: 20),
                    ),
                    const SizedBox(width: 16),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Xác thực 2 yếu tố', style: TextStyle(fontSize: 16, fontWeight: AppTypography.bold)),
                          Text('Bảo mật tài khoản của bạn với TOTP', style: TextStyle(fontSize: 12, color: AppColors.textTertiary)),
                        ],
                      ),
                    ),
                    Icon(Icons.chevron_right_rounded, color: AppColors.textTertiary.withValues(alpha: 0.5)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProfileSection(BuildContext context, WidgetRef ref) {
    final asyncAuth = ref.watch(authStateProvider);
    final isAuthenticated = asyncAuth.asData?.value.isAuthenticated ?? false;
    final user = asyncAuth.asData?.value.user;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isAuthenticated ? 'CẤU HÌNH CÁ NHÂN' : 'BẮT ĐẦU',
          style: const TextStyle(
            fontSize: 10,
            fontWeight: AppTypography.black,
            letterSpacing: 3.0,
            color: AppColors.textTertiary,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(AppSpacing.lg),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.8),
            borderRadius: BorderRadius.circular(AppRadius.xxl),
            border: Border.all(color: AppColors.grey300.withValues(alpha: 0.3)),
          ),
          child: isAuthenticated
              ? Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: AppColors.primarySurface,
                      child: Text(
                        (user != null && user.displayName.isNotEmpty) ? user.displayName[0].toUpperCase() : 'U',
                        style: const TextStyle(color: AppColors.primary, fontWeight: AppTypography.black, fontSize: 24),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(user?.displayName ?? 'Người dùng', style: const TextStyle(fontSize: 18, fontWeight: AppTypography.extraBold)),
                          Text(user?.email ?? '', style: const TextStyle(fontSize: 12, color: AppColors.textTertiary)),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () => context.push('/settings/profile/edit'),
                      icon: const Icon(Icons.edit_note_rounded, color: AppColors.primary),
                    ),
                  ],
                )
              : Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.auto_awesome_rounded, color: AppColors.primary, size: 24),
                    ),
                    const SizedBox(width: 16),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Sẵn sàng bắt đầu?', style: TextStyle(fontSize: 16, fontWeight: AppTypography.extraBold)),
                          Text('Tham gia Torii để theo dõi tiến độ của bạn', style: TextStyle(fontSize: 12, color: AppColors.textTertiary)),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () => context.push('/login'),
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.full)),
                      ),
                      child: const Text('ĐĂNG NHẬP', style: TextStyle(fontSize: 10, fontWeight: AppTypography.black, letterSpacing: 1.0)),
                    ),
                  ],
                ),
        ),
      ],
    );
  }

  Widget _buildDangerZone(BuildContext context, WidgetRef ref) {
    final asyncAuth = ref.read(authStateProvider);
    final isAuthenticated = asyncAuth.asData?.value.isAuthenticated ?? false;
    if (!isAuthenticated) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'TÀI KHOẢN',
          style: TextStyle(
            fontSize: 10, 
            fontWeight: AppTypography.black, 
            letterSpacing: 3.0, 
            color: Color(0xFFE63946),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFFE63946).withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(AppRadius.xxl),
            border: Border.all(color: const Color(0xFFE63946).withValues(alpha: 0.1)),
          ),
          child: TextButton(
            onPressed: () => _showLogoutConfirm(context, ref),
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 20),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.xxl)),
            ),
            child: const Text(
              'ĐĂNG XUẤT',
              style: TextStyle(
                color: Color(0xFFE63946), 
                fontWeight: AppTypography.black, 
                fontSize: 11, 
                letterSpacing: 2.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showLogoutConfirm(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.xxl)),
        title: const Text(
          'ĐĂNG XUẤT',
          style: TextStyle(fontSize: 16, fontWeight: AppTypography.black, letterSpacing: 1.0),
        ),
        content: const Text(
          'Bạn có chắc chắn muốn đăng xuất khỏi Torii?',
          style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('HỦY', style: TextStyle(color: AppColors.textTertiary, fontWeight: AppTypography.black, fontSize: 11)),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ref.read(authStateProvider.notifier).logout();
            },
            child: const Text('ĐĂNG XUẤT', style: TextStyle(color: Color(0xFFE63946), fontWeight: AppTypography.black, fontSize: 11)),
          ),
        ],
      ),
    );
  }

  Widget _buildSupportSection(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'HỖ TRỢ',
          style: TextStyle(
            fontSize: 10, 
            fontWeight: AppTypography.black, 
            letterSpacing: 3.0, 
            color: AppColors.textTertiary,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.8),
            borderRadius: BorderRadius.circular(AppRadius.xxl),
            border: Border.all(color: AppColors.grey300.withValues(alpha: 0.3)),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => context.push('/settings/tickets'),
              borderRadius: BorderRadius.circular(AppRadius.xxl),
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.blue.withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.confirmation_number_outlined, color: Colors.blue, size: 20),
                    ),
                    const SizedBox(width: 16),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Yêu cầu của tôi', style: TextStyle(fontSize: 16, fontWeight: AppTypography.bold)),
                          Text('Quản lý các yêu cầu hỗ trợ và hoàn tiền', style: TextStyle(fontSize: 12, color: AppColors.textTertiary)),
                        ],
                      ),
                    ),
                    Icon(Icons.chevron_right_rounded, color: AppColors.textTertiary.withValues(alpha: 0.5)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
