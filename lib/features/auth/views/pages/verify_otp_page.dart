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
  final List<TextEditingController> _controllers = List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _verifyOTP() {
    final code = _controllers.map((c) => c.text).join();
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
    final authState = ref.watch(authStateProvider);
    
    // Navigate to reset password when OTP verified
    ref.listen<AuthState>(authStateProvider, (previous, next) {
      if (previous?.status != next.status) {
        if (next.status == AuthStatus.requiresOTP && next.tempToken != null) {
          // OTP verified - navigate to reset password
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted && next.email != null && next.tempToken != null) {
              context.go('/auth/reset-password', extra: {
                'email': next.email,
                'tempToken': next.tempToken,
              });
            }
          });
        }
      }
    });

    final isLoading = authState.isLoading;
    final errorMessage = authState.error;

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
                      const SizedBox(height: AppSpacing.xxxl),
                      Icon(
                        Icons.mail_outline_rounded,
                        size: 80,
                        color: AppColors.primary.withValues(alpha: 0.8),
                      ),
                      const SizedBox(height: AppSpacing.xl),
                      Text(
                        'VERIFY CODE',
                        style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          fontWeight: AppTypography.bold,
                          letterSpacing: -1.2,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      Text(
                        'Enter the 6-digit code sent to\n${widget.email}',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.xxxl),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(6, (index) => _buildOTPBox(index)),
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      if (errorMessage != null && errorMessage.isNotEmpty) ...[
                        Container(
                          padding: const EdgeInsets.all(AppSpacing.md),
                          decoration: BoxDecoration(
                            color: AppColors.error.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(AppRadius.md),
                            border: Border.all(color: AppColors.error.withValues(alpha: 0.3)),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.error_outline, color: AppColors.error, size: 20),
                              const SizedBox(width: AppSpacing.sm),
                              Expanded(
                                child: Text(
                                  errorMessage,
                                  style: TextStyle(color: AppColors.error, fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: AppSpacing.lg),
                      ],
                      ZenButton(
                        onPressed: isLoading ? null : _verifyOTP,
                        isLoading: isLoading,
                        text: 'VERIFY CODE',
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      TextButton(
                        onPressed: isLoading ? null : _resendOTP,
                        child: Text(
                          'Didn\'t receive code? RESEND',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: AppTypography.semiBold,
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

  Widget _buildOTPBox(int index) {
    return SizedBox(
      width: 50,
      height: 60,
      child: TextField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
          fontWeight: AppTypography.bold,
        ),
        decoration: InputDecoration(
          counterText: '',
          filled: true,
          fillColor: AppColors.surface,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
            borderSide: BorderSide(color: AppColors.grey300),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
            borderSide: BorderSide(color: AppColors.grey300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
            borderSide: BorderSide(color: AppColors.primary, width: 2),
          ),
        ),
        onChanged: (value) {
          if (value.length == 1 && index < 5) {
            _focusNodes[index + 1].requestFocus();
          }
          if (index == 5 && _controllers.every((c) => c.text.isNotEmpty)) {
            _verifyOTP();
          }
        },
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Row(
        children: [
          IconButton(
            onPressed: () => context.go('/auth/forgot-password'),
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            style: IconButton.styleFrom(
              backgroundColor: AppColors.surface,
              foregroundColor: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
