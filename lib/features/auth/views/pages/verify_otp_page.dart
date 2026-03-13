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
                                'Verify Email',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: AppTypography.black,
                                  color: AppColors.secondary,
                                  letterSpacing: -0.5,
                                ),
                              ),
                              SizedBox(height: AppSpacing.sm),
                              Text(
                                'Verification code has been sent to your email address.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: AppColors.textTertiary,
                                ),
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
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                if (errorMessage != null) ...[
                                  _buildErrorBanner(errorMessage),
                                  const SizedBox(height: AppSpacing.md),
                                ],
                                
                                const Text(
                                  'Authentication Code',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: AppTypography.bold,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                                const SizedBox(height: AppSpacing.sm),
                                _buildOTPInput(),
                                
                                const SizedBox(height: AppSpacing.xl),
                                
                                AppButton(
                                  text: 'VERIFY ACCOUNT',
                                  onPressed: _otpController.text.length == 6 ? _verifyOTP : null,
                                  isLoading: isLoading,
                                  borderRadius: AppRadius.xs,
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                ),
                                
                                const SizedBox(height: AppSpacing.md),
                                
                                TextButton(
                                  onPressed: isLoading ? null : _resendOTP,
                                  child: const Text(
                                    "Didn't receive code? Resend",
                                    style: TextStyle(
                                      fontWeight: AppTypography.black,
                                      color: AppColors.primary,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: AppSpacing.lg),

                        Text(
                          'Code sent to: ${widget.email}',
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

  Widget _buildOTPInput() {
    return Container(
      height: 64,
      decoration: BoxDecoration(
        color: AppColors.grey50,
        borderRadius: BorderRadius.circular(AppRadius.xs),
        border: Border.all(
          color: _otpFocusNode.hasFocus ? AppColors.primary : AppColors.borderLight,
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
          style: const TextStyle(
            fontSize: 32,
            fontWeight: AppTypography.black,
            letterSpacing: 16,
            color: AppColors.secondary,
          ),
          decoration: const InputDecoration(
            border: InputBorder.none,
            counterText: "",
            hintText: '000000',
            hintStyle: TextStyle(
              color: AppColors.grey200,
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
