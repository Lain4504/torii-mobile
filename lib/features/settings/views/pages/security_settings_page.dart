import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/widgets/widgets.dart';
import 'package:torii_app/features/auth/providers/two_factor_provider.dart';

class SecuritySettingsPage extends ConsumerStatefulWidget {
  const SecuritySettingsPage({super.key});

  @override
  ConsumerState<SecuritySettingsPage> createState() => _SecuritySettingsPageState();
}

class _SecuritySettingsPageState extends ConsumerState<SecuritySettingsPage> {
  final _otpController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(twoFactorProvider.notifier).fetchStatus();
    });
  }

  @override
  void dispose() {
    _otpController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(twoFactorProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'THIẾT LẬP BẢO MẬT',
          style: TextStyle(
            fontFamily: AppTypography.fontFamilySerif,
            fontWeight: AppTypography.black,
            fontSize: 18,
            fontStyle: FontStyle.italic,
            letterSpacing: 2.0,
            color: AppColors.textPrimary,
          ),
        ),
      ),
      body: AppBackground(
        child: state.isLoading && state.status == null
            ? const Center(child: AppLoading(text: 'Đang tải...'))
            : SingleChildScrollView(
                padding: const EdgeInsets.all(AppSpacing.xl),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildStatusCard(state),
                    const SizedBox(height: 32),
                    if (state.status?.isEnabled == true) ...[
                       _buildBackupCodesSection(state),
                       const SizedBox(height: 32),
                       _buildDisableSection(state),
                    ] else ...[
                       _buildSetupSection(state),
                    ],
                  ],
                ),
              ),
      ),
    );
  }

  Widget _buildStatusCard(TwoFactorState state) {
    final isEnabled = state.status?.isEnabled ?? false;
    return EntryAnimation(
      index: 0,
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.xl),
        decoration: BoxDecoration(
          color: isEnabled ? AppColors.primary.withValues(alpha: 0.02) : Colors.white.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(AppRadius.card),
          border: Border.all(color: (isEnabled ? AppColors.primary : AppColors.grey300).withValues(alpha: 0.2)),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.03),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isEnabled ? AppColors.primary : AppColors.grey400,
                shape: BoxShape.circle,
              ),
              child: Icon(
                isEnabled ? Icons.verified_user_rounded : Icons.gpp_maybe_rounded,
                color: Colors.white,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isEnabled ? 'ĐÃ BẢO VỆ 2FA' : 'CHƯA BẬT 2FA',
                    style: const TextStyle(fontWeight: AppTypography.black, fontSize: 14, letterSpacing: 0.5),
                  ),
                  Text(
                    isEnabled 
                      ? 'Tài khoản của bạn đã được bảo vệ bằng xác thực hai yếu tố.' 
                      : 'Thêm một lớp bảo mật bổ sung cho tài khoản của bạn.',
                    style: TextStyle(fontSize: 12, color: AppColors.textTertiary),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSetupSection(TwoFactorState state) {
    return EntryAnimation(
      index: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'XÁC THỰC HAI YẾU TỐ (2FA)',
            style: TextStyle(fontSize: 10, fontWeight: AppTypography.black, letterSpacing: 3.0, color: AppColors.primary),
          ),
          const SizedBox(height: 16),
          if (state.setupData == null)
            AppButton(
              text: 'Bật xác thực hai yếu tố',
              onPressed: () => ref.read(twoFactorProvider.notifier).startSetup(),
              isLoading: state.isLoading,
              isFullWidth: true,
            )
          else
            _buildSetupFlow(state),
        ],
      ),
    );
  }

  Widget _buildSetupFlow(TwoFactorState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(AppSpacing.lg),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AppRadius.card),
            border: Border.all(color: AppColors.grey200),
          ),
          child: Column(
            children: [
              const Text(
                'Quét mã QR',
                style: TextStyle(fontWeight: AppTypography.bold, fontSize: 12),
              ),
              const SizedBox(height: 16),
              QrImageView(
                data: state.setupData!.otpauthUrl,
                version: QrVersions.auto,
                size: 200.0,
                eyeStyle: const QrEyeStyle(eyeShape: QrEyeShape.square, color: AppColors.primary),
                dataModuleStyle: const QrDataModuleStyle(dataModuleShape: QrDataModuleShape.square, color: AppColors.primary),
              ),
              const SizedBox(height: 16),
              const Text(
                'Hoặc nhập thủ công',
                style: TextStyle(fontSize: 10, fontWeight: AppTypography.extraBold, color: AppColors.textTertiary),
              ),
              const SizedBox(height: 8),
              SelectableText(
                state.setupData!.secret,
                style: const TextStyle(fontFamily: 'Courier', fontWeight: AppTypography.bold, fontSize: 16),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'MÃ XÁC THỰC',
          style: TextStyle(fontWeight: AppTypography.black, fontSize: 10, letterSpacing: 2.0),
        ),
        const SizedBox(height: 16),
        AppTextField(
          label: 'Mã xác thực',
          hintText: '000000',
          controller: _otpController,
          icon: Icons.lock_outline_rounded,
          keyboardType: TextInputType.number,
          onSubmitted: (val) {
             if (val.length == 6) {
                ref.read(twoFactorProvider.notifier).enable(val);
             }
          },
        ),
        const SizedBox(height: 24),
        AppButton(
          text: 'KÍCH HOẠT 2FA',
          onPressed: () => ref.read(twoFactorProvider.notifier).enable(_otpController.text),
          isLoading: state.isLoading,
          isFullWidth: true,
        ),
        if (state.error != null) ...[
          const SizedBox(height: 12),
          Text(state.error!, style: const TextStyle(color: Colors.red, fontSize: 12)),
        ],
      ],
    );
  }

  Widget _buildBackupCodesSection(TwoFactorState state) {
    return EntryAnimation(
      index: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'MÃ PHỤC HỒI',
            style: TextStyle(fontSize: 10, fontWeight: AppTypography.black, letterSpacing: 2.0, color: AppColors.textTertiary),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(AppSpacing.xl),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.8),
              borderRadius: BorderRadius.circular(AppRadius.card),
              border: Border.all(color: AppColors.grey300.withValues(alpha: 0.3)),
            ),
            child: Column(
              children: [
                const Text(
                    'Hãy giữ các mã này cẩn thận. Đây là cách duy nhất để bạn truy cập lại tài khoản nếu mất thiết bị.',
                    style: TextStyle(fontSize: 12, height: 1.5),
                ),
                const SizedBox(height: 16),
                AppButton(
                  text: 'TẠO LẠI MÃ SAO LƯU',
                  onPressed: () => _showRegenerateDialog(state),
                  isPrimary: false,
                  isFullWidth: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDisableSection(TwoFactorState state) {
    return EntryAnimation(
      index: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'PROTOCOL HỦY BỎ',
            style: TextStyle(fontSize: 10, fontWeight: AppTypography.black, letterSpacing: 2.0, color: Color(0xFFE63946)),
          ),
          const SizedBox(height: 16),
          AppButton(
            text: 'TẤT XÁC THỰC 2FA',
            onPressed: () => _showDisableDialog(),
            isPrimary: false,
            isFullWidth: true,
          ),
        ],
      ),
    );
  }

  void _showDisableDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Xác nhận tắt 2FA'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Nhập mật khẩu của bạn để tắt bảo mật 2FA.'),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(hintText: 'Mật khẩu'),
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Hủy bỏ')),
          TextButton(
            onPressed: () {
              ref.read(twoFactorProvider.notifier).disable(_passwordController.text);
              Navigator.pop(context);
            },
            child: const Text('Tắt 2FA', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _showRegenerateDialog(TwoFactorState state) {
     showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Mã sao lưu'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Mã sao lưu mới đã được tạo. HÃY LƯU CHÚNG NGAY BÂY GIỜ.'),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: (state.backupCodes ?? []).map((code) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(AppRadius.full),
                  border: Border.all(color: AppColors.primary.withValues(alpha: 0.1)),
                ),
                child: Text(code, style: const TextStyle(fontFamily: 'Courier', fontWeight: AppTypography.black, letterSpacing: 1.0)),
              )).toList(),
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Xong')),
        ],
      ),
    );
  }
}
