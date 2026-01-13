import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/features/auth/providers/auth_providers.dart';
import 'package:torii_app/features/auth/models/auth_state_sealed.dart';
import 'package:torii_app/core/widgets/widgets.dart';

class VerifyOTPPage extends ConsumerStatefulWidget {
  final String email;

  const VerifyOTPPage({
    super.key,
    required this.email,
  });

  @override
  ConsumerState<VerifyOTPPage> createState() => _VerifyOTPPageState();
}

class _VerifyOTPPageState extends ConsumerState<VerifyOTPPage> {
  final TextEditingController _otpController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _otpController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _verify() {
    final otp = _otpController.text.trim();
    if (otp.length == 6) {
      ref.read(authStateProvider.notifier).verifyOTP(widget.email, otp);
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(authStateProvider, (previous, next) {
      if (next is AuthResetPasswordRequired) {
        context.push('/auth/reset-password', extra: {
          'email': next.email,
          'token': next.tempToken,
        });
      }
    });

    final authState = ref.watch(authStateProvider);
    final isLoading = authState is AuthLoading;
    String? errorMessage;

    if (authState is AuthError) {
      errorMessage = authState.message;
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      body: ZenBackground(
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
                      const SizedBox(height: AppSpacing.lg),
                      _buildHeader(context),
                      const SizedBox(height: AppSpacing.xxxl),
                      if (errorMessage != null) ...[
                        EntryAnimation(
                          index: 2,
                          child: _buildErrorBanner(errorMessage),
                        ),
                        const SizedBox(height: AppSpacing.lg),
                      ],
                      EntryAnimation(
                        index: 3,
                        verticalOffset: 20,
                        child: _buildOTPField(),
                      ),
                      const SizedBox(height: AppSpacing.xl),
                      EntryAnimation(
                        index: 4,
                        child: ZenButton(
                          text: 'VERIFY IDENTIFICATION',
                          onPressed: _verify,
                          isLoading: isLoading,
                          isFullWidth: true,
                          icon: Icons.verified_user_rounded,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.xxxl),
                      EntryAnimation(
                        index: 5,
                        child: _buildResendSection(context),
                      ),
                      const SizedBox(height: AppSpacing.xl),
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

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Row(
        children: [
          EntryAnimation(
            delay: const Duration(milliseconds: 200),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
              onPressed: () => context.pop(),
              color: AppColors.textPrimary.withOpacity(0.4),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      children: [
        EntryAnimation(
          index: 0,
          verticalOffset: -20,
          child: Container(
            width: 72, height: 72,
            decoration: BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.2),
                  blurRadius: 25, offset: const Offset(0, 8),
                ),
              ],
            ),
            child: const Icon(Icons.security_rounded, color: Colors.white, size: 36),
          ),
        ),
        const SizedBox(height: AppSpacing.xl),
        EntryAnimation(
          index: 1,
          child: Column(
            children: [
              Text(
                'VERIFICATION',
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
                'IDENTITY AUTHENTICATION',
                style: TextStyle(
                  fontSize: 9,
                  fontWeight: AppTypography.black,
                  letterSpacing: 4.0,
                  color: AppColors.primary.withOpacity(0.5),
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              Text(
                'Neural link established with\n${widget.email}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: AppTypography.medium,
                  color: AppColors.textSecondary.withOpacity(0.6),
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildOTPField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.6),
        borderRadius: BorderRadius.circular(AppRadius.full),
        border: Border.all(color: AppColors.borderLight.withOpacity(0.3)),
      ),
      child: TextField(
        controller: _otpController,
        focusNode: _focusNode,
        keyboardType: TextInputType.number,
        maxLength: 6,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 32,
          fontWeight: AppTypography.bold,
          letterSpacing: 16.0, 
          color: AppColors.primary,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          counterText: "",
          hintText: "••••••",
          hintStyle: TextStyle(
            color: AppColors.textTertiary.withOpacity(0.15),
            letterSpacing: 16.0,
          ),
        ),
        onChanged: (val) {
          if (val.length == 6) _verify();
        },
      ),
    );
  }

  Widget _buildErrorBanner(String message) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.errorLight.withOpacity(0.6),
        borderRadius: BorderRadius.circular(AppRadius.full),
        border: Border.all(color: AppColors.error.withOpacity(0.1)),
      ),
      child: Row(
        children: [
          const Icon(Icons.error_outline_rounded, color: AppColors.error, size: 18),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                color: AppColors.errorDark,
                fontSize: 12,
                fontWeight: AppTypography.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResendSection(BuildContext context) {
    return Column(
      children: [
        Text(
          "HAVEN'T RECEIVED THE CODE?",
          style: TextStyle(
            fontSize: 10,
            color: AppColors.textSecondary.withOpacity(0.5),
            fontWeight: AppTypography.black,
            letterSpacing: 1.0,
          ),
        ),
        const SizedBox(height: 12),
        InkWell(
          onTap: () {
            ref.read(authStateProvider.notifier).forgotPassword(widget.email);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Verification code resent.')),
            );
          },
          borderRadius: BorderRadius.circular(AppRadius.full),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: const Text(
              'RESEND PROTOCOL',
              style: TextStyle(
                fontSize: 12,
                fontWeight: AppTypography.black,
                letterSpacing: 1.0,
                color: AppColors.primary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
