import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:torii_app/features/auth/providers/auth_providers.dart';
import 'package:torii_app/features/auth/models/auth_state.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/widgets/widgets.dart';

class VerifyOTPPage extends ConsumerStatefulWidget {
  final String email;

  const VerifyOTPPage({super.key, required this.email});

  @override
  ConsumerState<VerifyOTPPage> createState() => _VerifyOTPPageState();
}

class _VerifyOTPPageState extends ConsumerState<VerifyOTPPage> {
  final TextEditingController _otpController = TextEditingController();
  final FocusNode _otpFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _otpFocusNode.addListener(() {
      if (mounted) setState(() {});
    });
    // Auto-focus logic
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
      ref.read(authStateProvider.notifier).verifyOTP(widget.email, code);
    }
  }

  void _resendOTP() {
    ref.read(authStateProvider.notifier).resendOTP(widget.email);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('OTP code resent!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final asyncAuth = ref.watch(authStateProvider);
    final isLoading = asyncAuth.isLoading;
    final errorMessage = asyncAuth.error?.toString() ?? asyncAuth.asData?.value.error;

    // Navigate to reset password when OTP verified (AuthStatus.requiresOTP -> with tempToken)
    ref.listen<AsyncValue<AuthState>>(authStateProvider, (previous, next) {
      final nextState = next.asData?.value;
      if (nextState != null && nextState.status == AuthStatus.requiresOTP && nextState.tempToken != null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
               context.go('/auth/reset-password', extra: {
                 'email': nextState.email ?? widget.email,
                 'tempToken': nextState.tempToken,
               });
            }
          });
      }
    });

    return Scaffold(
      backgroundColor: AppColors.background,
      body: AppBackground(
        child: SafeArea(
          child: Column(
            children: [
              _buildAppBar(context),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
                  child: Column(
                    children: [
                      const SizedBox(height: AppSpacing.xxxl),
                      Icon(
                        Icons.mark_email_unread_rounded,
                        size: 72,
                        color: AppColors.primary,
                      ),
                      const SizedBox(height: AppSpacing.xl),
                      Text(
                        'VERIFY REQUEST',
                        style: TextStyle(
                            fontFamily: AppTypography.fontFamilySerif,
                            fontSize: AppTypography.fontSize2xl,
                            letterSpacing: -1.0,
                            fontWeight: AppTypography.bold,
                            fontStyle: FontStyle.italic,
                            color: AppColors.textPrimary,
                        ),
                      ),
                       const SizedBox(height: 4),
                       Text(
                        'CHECK YOUR INBOX',
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: AppTypography.black,
                          letterSpacing: 4.0,
                          color: AppColors.primary.withValues(alpha: 0.5),
                        ),
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      Text(
                        'Please enter the 6-digit code sent to\n${widget.email}',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.xxxl),
                      
                      EntryAnimation(
                        index: 1,
                        verticalOffset: 20,
                        child: _buildSingleInputField(
                          controller: _otpController,
                          focusNode: _otpFocusNode,
                          maxLength: 6,
                          letterSpacing: 16.0,
                          onChanged: (val) {
                            // Manual submit only
                          },
                        ),
                      ),

                      if (errorMessage != null) ...[
                        const SizedBox(height: AppSpacing.lg),
                        EntryAnimation(
                          index: 2,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            decoration: BoxDecoration(
                              color: AppColors.errorLight.withValues(alpha: 0.6),
                              borderRadius: BorderRadius.circular(AppRadius.full),
                              border: Border.all(color: AppColors.error.withValues(alpha: 0.1)),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.error_outline_rounded, color: AppColors.error, size: 18),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    errorMessage,
                                    style: const TextStyle(
                                      color: AppColors.errorDark,
                                      fontSize: 12,
                                      fontWeight: AppTypography.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],

                      const SizedBox(height: AppSpacing.xxxl),
                      
                      AppButton(
                        onPressed: isLoading ? null : _verifyOTP,
                        isLoading: isLoading,
                        text: 'VERIFY OTP',
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      TextButton(
                        onPressed: isLoading ? null : _resendOTP,
                        child: Text(
                          'Didn\'t receive code? RESEND',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: AppTypography.semiBold,
                            fontSize: 12,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSingleInputField({
    required TextEditingController controller,
    required FocusNode focusNode,
    required int maxLength,
    required double letterSpacing,
    required ValueChanged<String> onChanged,
  }) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.white.withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(AppRadius.full),
        border: Border.all(
          color: focusNode.hasFocus 
            ? AppColors.primary.withValues(alpha: 0.6) 
            : AppColors.grey300.withValues(alpha: 0.4),
          width: focusNode.hasFocus ? 1.5 : 1.0,
        ),
        boxShadow: [
          BoxShadow(
             color: Colors.black.withValues(alpha: 0.01),
             blurRadius: 10,
             offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: TextField(
          controller: controller,
          focusNode: focusNode,
          keyboardType: TextInputType.number,
          maxLength: maxLength,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: AppTypography.bold,
            letterSpacing: letterSpacing,
            color: AppColors.textPrimary,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            filled: false,
            counterText: "",
            hintText: '••••••',
            hintStyle: TextStyle(
              color: AppColors.textTertiary.withValues(alpha: 0.15),
              letterSpacing: letterSpacing,
            ),
            contentPadding: EdgeInsets.zero,
            isDense: true,
          ),
          onChanged: onChanged,
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.lg),
      child: Row(
        children: [
          EntryAnimation(
            delay: const Duration(milliseconds: 200),
            child: IconButton(
              onPressed: () => context.go('/auth/forgot-password'),
              icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
              style: IconButton.styleFrom(
                foregroundColor: AppColors.textPrimary.withValues(alpha: 0.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
