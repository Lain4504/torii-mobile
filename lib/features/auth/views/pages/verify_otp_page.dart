import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:torii_app/features/auth/providers/auth_providers.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/widgets/widgets.dart';

class VerifyOTPPage extends ConsumerStatefulWidget {
  final String email;
  final String? nextRoute;
  final String? successTitle;
  final String? successMessage;

  const VerifyOTPPage({
    super.key,
    required this.email,
    this.nextRoute,
    this.successTitle,
    this.successMessage,
  });

  @override
  ConsumerState<VerifyOTPPage> createState() => _VerifyOTPPageState();
}

class _VerifyOTPPageState extends ConsumerState<VerifyOTPPage> {
  final TextEditingController _otpController = TextEditingController();
  final FocusNode _otpFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _otpFocusNode.requestFocus();
      }
    });
  }

  @override
  void dispose() {
    _otpController.dispose();
    _otpFocusNode.dispose();
    super.dispose();
  }

  void _verifyOTP() {
    final code = _otpController.text;
    if (code.length == 6) {
      ref.read(authStateProvider.notifier).verifyOTP(widget.email, code).then((success) {
        if (success && mounted) {
          if (widget.nextRoute != null) {
            context.go(widget.nextRoute!, extra: {'email': widget.email});
          } else {
            context.go('/auth/success', extra: {
              'title': widget.successTitle ?? 'Email Verified!',
              'message': widget.successMessage ?? 'Your account has been successfully verified. Now you can dive into learning Japanese.',
              'nextRoute': '/login',
            });
          }
        }
      });
    }
  }

  void _resendOTP() {
    ref.read(authStateProvider.notifier).resendOTP(widget.email);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Verification code resent!')),
    );
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
                          'Verify your email',
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
                          'We sent a 6-digit code to ${widget.email}',
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

                  // OTP Card
                  EntryAnimation(
                    index: 1,
                    verticalOffset: 20,
                    child: ElevatedCard(
                      borderRadius: BorderRadius.circular(AppRadius.md),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          if (errorMessage != null) ...[
                            _buildErrorBanner(errorMessage),
                            const SizedBox(height: AppSpacing.md),
                          ],
                          
                          // Custom OTP Style
                          _buildOTPInput(),
                          
                          const SizedBox(height: AppSpacing.xl),
                          
                          AppButton(
                            text: 'Verify Account',
                            onPressed: _otpController.text.length == 6 ? _verifyOTP : null,
                            isLoading: isLoading,
                          ),
                          
                          const SizedBox(height: AppSpacing.md),
                          
                          TextButton(
                            onPressed: isLoading ? null : _resendOTP,
                            child: const Text(
                              "Didn't receive code? Resend",
                              style: TextStyle(
                                fontWeight: AppTypography.bold,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                        ],
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

  Widget _buildOTPInput() {
    return Container(
      height: 64,
      decoration: BoxDecoration(
        color: AppColors.grey100.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(
          color: _otpFocusNode.hasFocus ? AppColors.primary : AppColors.grey200,
          width: 1.5,
        ),
      ),
      child: Center(
        child: TextField(
          controller: _otpController,
          focusNode: _otpFocusNode,
          keyboardType: TextInputType.number,
          maxLength: 6,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 32,
            fontWeight: AppTypography.bold,
            letterSpacing: 16,
            color: AppColors.secondary,
          ),
          decoration: const InputDecoration(
            border: InputBorder.none,
            counterText: "",
            hintText: '000000',
            hintStyle: TextStyle(
              color: AppColors.grey300,
            ),
          ),
          onChanged: (val) {
            setState(() {});
            if (val.length == 6) {
              _verifyOTP();
            }
          },
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
