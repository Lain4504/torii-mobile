import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:torii_app/features/auth/providers/auth_providers.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/widgets/widgets.dart';

class ResetPasswordPage extends ConsumerStatefulWidget {
  final String email;
  final String tempToken;

  const ResetPasswordPage({
    super.key,
    required this.email,
    required this.tempToken,
  });

  @override
  ConsumerState<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends ConsumerState<ResetPasswordPage> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  double _passwordStrength = 0;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onPasswordChanged(String value) {
    setState(() {
      if (value.isEmpty) {
        _passwordStrength = 0;
      } else if (value.length < 6) {
        _passwordStrength = 0.25;
      } else if (value.length < 10) {
        _passwordStrength = 0.6;
      } else {
        _passwordStrength = 1.0;
      }
    });
  }

  Future<void> _resetPassword() async {
    if (!_formKey.currentState!.validate()) return;
    
    final success = await ref.read(authStateProvider.notifier).resetPassword(
      widget.tempToken,
      _passwordController.text.trim(),
    );

    if (success && mounted) {
      context.go('/auth/success', extra: {
        'title': 'Password Updated!',
        'message': 'Your password has been reset successfully. Please sign in with your new credentials.',
        'nextRoute': '/login',
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final asyncAuth = ref.watch(authStateProvider);
    final isLoading = asyncAuth.isLoading;
    final errorMessage = asyncAuth.error?.toString();

    return Scaffold(
      body: AppBackground(
        pattern: BackgroundPattern.checkerboard,
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: AppSpacing.xl),
                  // Header Section
                  EntryAnimation(
                    index: 0,
                    child: Column(
                      children: [
                        const ToriiIcon(size: 64),
                        const SizedBox(height: AppSpacing.md),
                        Text(
                          'New Password',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: AppTypography.bold,
                            color: AppColors.secondary,
                            letterSpacing: -0.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        Text(
                          'Create a secure password for ${widget.email}',
                          style: const TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xxl),

                  // Form Card
                  EntryAnimation(
                    index: 1,
                    verticalOffset: 20,
                    child: ElevatedCard(
                      borderRadius: BorderRadius.circular(AppRadius.md),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            if (errorMessage != null) ...[
                              _buildErrorBanner(errorMessage),
                              const SizedBox(height: AppSpacing.md),
                            ],
                            AppTextField(
                              label: 'New Password',
                              controller: _passwordController,
                              hintText: 'Minimum 8 characters',
                              icon: Icons.lock_outline_rounded,
                              obscureText: _obscurePassword,
                              onChanged: _onPasswordChanged,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                                  size: 20,
                                  color: AppColors.textTertiary,
                                ),
                                onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                              ),
                              validator: (val) => (val == null || val.length < 8) ? 'Password must be at least 8 characters' : null,
                            ),
                            const SizedBox(height: AppSpacing.xs),
                            // Password Strength Indicator
                            ClipRRect(
                              borderRadius: BorderRadius.circular(2),
                              child: LinearProgressIndicator(
                                value: _passwordStrength,
                                backgroundColor: AppColors.grey200,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  _passwordStrength < 0.5 ? AppColors.error : (_passwordStrength < 0.8 ? AppColors.warning : AppColors.accent),
                                ),
                                minHeight: 4,
                              ),
                            ),
                            const SizedBox(height: AppSpacing.md),
                            AppTextField(
                              label: 'Confirm Password',
                              controller: _confirmPasswordController,
                              hintText: 'Repeat your password',
                              icon: Icons.lock_outline_rounded,
                              obscureText: _obscureConfirmPassword,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscureConfirmPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                                  size: 20,
                                  color: AppColors.textTertiary,
                                ),
                                onPressed: () => setState(() => _obscureConfirmPassword = !_obscureConfirmPassword),
                              ),
                              validator: (val) => (val != _passwordController.text) ? 'Passwords do not match' : null,
                            ),
                            const SizedBox(height: AppSpacing.lg),
                            AppButton(
                              text: 'Reset Password',
                              onPressed: _resetPassword,
                              isLoading: isLoading,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: AppSpacing.xxxl),

                  // Bottom Text
                  EntryAnimation(
                    index: 2,
                    child: TextButton(
                      onPressed: () => context.go('/login'),
                      child: const Text(
                        'Cancel and return to sign in',
                        style: TextStyle(
                          fontWeight: AppTypography.bold,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xxl),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildErrorBanner(String message) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        color: AppColors.errorLight.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(color: AppColors.error.withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          const Icon(Icons.error_outline, color: AppColors.error, size: 16),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(color: AppColors.errorDark, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
