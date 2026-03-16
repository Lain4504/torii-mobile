import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/features/auth/providers/auth_providers.dart';

class ResetPasswordScreen extends ConsumerStatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  ConsumerState<ResetPasswordScreen> createState() =>
      _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends ConsumerState<ResetPasswordScreen> {
  bool _isSuccess = false;
  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;

  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.textPrimary, size: 20),
          onPressed: () => context.go('/login'),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 480),
              child: _isSuccess
                  ? _buildSuccessState(theme)
                  : _buildFormState(theme),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormState(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            'Torii Nihongo',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w800,
              color: AppColors.primary,
              letterSpacing: 0.4,
            ),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Đặt lại mật khẩu',
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w700,
            letterSpacing: 0.2,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Tạo mật khẩu mới để tiếp tục học tiếng Nhật.',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: AppColors.grey700,
          ),
        ),
        const SizedBox(height: 20),

        const Text('Mật khẩu mới', style: TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 6),
        TextField(
          controller: _newPasswordController,
          obscureText: _obscureNewPassword,
          decoration: InputDecoration(
            hintText: 'Nhập mật khẩu mới',
            prefixIcon: const Icon(Icons.lock_outline),
            suffixIcon: IconButton(
              icon: Icon(_obscureNewPassword
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined),
              onPressed: () =>
                  setState(() => _obscureNewPassword = !_obscureNewPassword),
            ),
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: AppColors.grey300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: AppColors.grey300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: AppColors.primary),
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Text('Xác nhận mật khẩu mới',
            style: TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 6),
        TextField(
          controller: _confirmPasswordController,
          obscureText: _obscureConfirmPassword,
          decoration: InputDecoration(
            hintText: 'Nhập lại mật khẩu mới',
            prefixIcon: const Icon(Icons.lock_reset_outlined),
            suffixIcon: IconButton(
              icon: Icon(_obscureConfirmPassword
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined),
              onPressed: () => setState(
                  () => _obscureConfirmPassword = !_obscureConfirmPassword),
            ),
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: AppColors.grey300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: AppColors.grey300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: AppColors.primary),
            ),
          ),
        ),
        const SizedBox(height: 20),

        const Text('Quy định mật khẩu:',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
        const SizedBox(height: 12),
        _buildRuleItem('Ít nhất 8 ký tự'),
        _buildRuleItem('Có chữ và số'),

        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            onPressed: () async {
              final newPassword = _newPasswordController.text;
              final confirmPassword = _confirmPasswordController.text;

              if (newPassword.isEmpty || confirmPassword.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Vui lòng nhập đầy đủ mật khẩu mới'),
                  ),
                );
                return;
              }
              if (newPassword != confirmPassword) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Mật khẩu xác nhận không khớp'),
                  ),
                );
                return;
              }
              if (newPassword.length < 8) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content:
                        Text('Mật khẩu phải có ít nhất 8 ký tự'),
                  ),
                );
                return;
              }

              final authState = ref.read(authNotifierProvider);
              final tempToken = authState.valueOrNull?.tempToken;
              if (tempToken == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Thiếu token đặt lại mật khẩu, vui lòng thực hiện lại bước OTP',
                    ),
                  ),
                );
                return;
              }

              final notifier =
                  ref.read(authNotifierProvider.notifier);
              final ok =
                  await notifier.resetPassword(tempToken, newPassword);

              if (!mounted) return;

              if (ok) {
                setState(() {
                  _isSuccess = true;
                });
              } else {
                final state = ref.read(authNotifierProvider).valueOrNull;
                final message =
                    state?.error ?? 'Cập nhật mật khẩu thất bại';
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(message)),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.textOnPrimary,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: const Text('Cập nhật mật khẩu',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildRuleItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          const Icon(Icons.check_circle_outline, color: AppColors.success, size: 18),
          const SizedBox(width: 8),
          Text(text, style: TextStyle(color: AppColors.grey700, fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildSuccessState(ThemeData theme) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Torii Nihongo',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w800,
            color: AppColors.primary,
            letterSpacing: 0.4,
          ),
        ),
        const SizedBox(height: 32),
        const Icon(Icons.check_circle_rounded,
            color: AppColors.success, size: 96),
        const SizedBox(height: 20),
        const Text(
          'Thành công!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        const Text(
          'Mật khẩu đã được cập nhật thành công.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15, color: AppColors.textTertiary),
        ),
        const SizedBox(height: 40),
        SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            onPressed: () {
              context.go('/login');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.textOnPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: const Text('Đăng nhập ngay',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
          ),
        ),
      ],
    );
  }
}
