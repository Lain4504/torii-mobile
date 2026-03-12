import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:torii_app/features/auth/providers/auth_providers.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/widgets/widgets.dart';

class ForgotPasswordPage extends ConsumerStatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  ConsumerState<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends ConsumerState<ForgotPasswordPage> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _requestOTP() async {
    if (!_formKey.currentState!.validate()) return;
    
    final success = await ref.read(authStateProvider.notifier).forgotPassword(
      _emailController.text.trim(),
    );

    if (success && mounted) {
      context.push('/auth/verify-otp', extra: {
        'email': _emailController.text.trim(),
        'nextRoute': '/auth/reset-password',
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
                          'Forgot Password',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: AppTypography.bold,
                            color: AppColors.secondary,
                            letterSpacing: -0.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        const Text(
                          "Enter your email and we'll send you a code to reset your password.",
                          style: TextStyle(
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
                              label: 'Email address',
                              controller: _emailController,
                              hintText: 'Enter your email',
                              keyboardType: TextInputType.emailAddress,
                              validator: (val) => (val == null || !val.contains('@')) ? 'Invalid email' : null,
                            ),
                            const SizedBox(height: AppSpacing.lg),
                            AppButton(
                              text: 'Send Reset Code',
                              onPressed: _requestOTP,
                              isLoading: isLoading,
                              backgroundColor: AppColors.secondary,
                              borderRadius: AppRadius.md,
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
                        'Back to sign in',
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
