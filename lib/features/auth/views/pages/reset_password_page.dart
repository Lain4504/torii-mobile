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
    final authState = asyncAuth.value;
    final errorMessage = authState?.error;

    return Scaffold(
      backgroundColor: AppColors.grey50,
      body: AppBackground(
        pattern: BackgroundPattern.checkerboard,
        child: SafeArea(
          child: Column(
            children: [
              // Top Navigation
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton.icon(
                    onPressed: () => context.go('/login'),
                    icon: const Icon(Icons.arrow_back, size: 18),
                    label: const Text('Back to Sign In'),
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.textSecondary,
                      textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: AppTypography.semiBold,
                      ),
                    ),
                  ),
                ),
              ),

              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Header Section
                        const EntryAnimation(
                          index: 0,
                          child: Column(
                            children: [
                              ToriiIcon(size: 64),
                              SizedBox(height: AppSpacing.lg),
                              Text(
                                'New Password',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: AppTypography.black,
                                  color: AppColors.secondary,
                                  letterSpacing: -0.5,
                                ),
                              ),
                              SizedBox(height: AppSpacing.sm),
                              Text(
                                'Create a secure password for your account.',
                                style: TextStyle(
                                  color: AppColors.textTertiary,
                                  fontSize: 15,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: AppSpacing.xl),

                        // Form Section
                        EntryAnimation(
                          index: 1,
                          child: Container(
                            padding: const EdgeInsets.all(AppSpacing.lg),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(AppRadius.sm),
                              border: Border.all(color: AppColors.borderLight),
                              boxShadow: AppElevation.softShadow,
                            ),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  if (errorMessage != null) ...[
                                    _buildErrorBanner(errorMessage),
                                    const SizedBox(height: AppSpacing.md),
                                  ],
                                  const Text(
                                    'New Password',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: AppTypography.bold,
                                      color: AppColors.textPrimary,
                                    ),
                                  ),
                                  const SizedBox(height: AppSpacing.xs),
                                  AppTextField(
                                    label: 'New password',
                                    controller: _passwordController,
                                    hintText: 'Enter new password',
                                    icon: Icons.lock_outline,
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
                                  const SizedBox(height: AppSpacing.sm),
                                  // Password Strength Indicator
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(2),
                                    child: LinearProgressIndicator(
                                      value: _passwordStrength,
                                      backgroundColor: AppColors.grey50,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        _passwordStrength < 0.5 ? AppColors.error : (_passwordStrength < 0.8 ? AppColors.warning : AppColors.accent),
                                      ),
                                      minHeight: 6,
                                    ),
                                  ),
                                  const SizedBox(height: AppSpacing.lg),
                                  const Text(
                                    'Confirm Password',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: AppTypography.bold,
                                      color: AppColors.textPrimary,
                                    ),
                                  ),
                                  const SizedBox(height: AppSpacing.xs),
                                  AppTextField(
                                    label: 'Confirm password',
                                    controller: _confirmPasswordController,
                                    hintText: 'Repeat new password',
                                    icon: Icons.lock_outline,
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
                                  const SizedBox(height: AppSpacing.xl),
                                  AppButton(
                                    text: 'RESET PASSWORD',
                                    onPressed: _resetPassword,
                                    isLoading: isLoading,
                                    padding: const EdgeInsets.symmetric(vertical: 16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: AppSpacing.lg),
                        Text(
                          'Account: ${widget.email}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.textTertiary,
                            fontWeight: AppTypography.medium,
                          ),
                        ),

                        const SizedBox(height: AppSpacing.xxxl),

                        // Bottom Text
                        EntryAnimation(
                          index: 2,
                          child: TextButton(
                            onPressed: () => context.go('/'),
                            child: const Text(
                              'Back to Home',
                              style: TextStyle(
                                fontSize: 13,
                                color: AppColors.textSecondary,
                                fontWeight: AppTypography.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: AppSpacing.lg),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildErrorBanner(String message) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        color: AppColors.errorLight,
        borderRadius: BorderRadius.circular(AppRadius.xs),
        border: Border.all(color: AppColors.error.withValues(alpha: 0.1)),
      ),
      child: Row(
        children: [
          const Icon(Icons.error_outline, color: AppColors.error, size: 16),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(color: AppColors.errorDark, fontSize: 12, fontWeight: AppTypography.bold),
            ),
          ),
        ],
      ),
    );
  }
}
