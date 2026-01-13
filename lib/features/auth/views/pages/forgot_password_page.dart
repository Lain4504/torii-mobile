import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:torii_app/features/auth/providers/auth_providers.dart';
import 'package:torii_app/features/auth/models/auth_state_sealed.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/widgets/widgets.dart';

class ForgotPasswordPage extends ConsumerStatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  ConsumerState<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends ConsumerState<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    await ref.read(authStateProvider.notifier).forgotPassword(_emailController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(authStateProvider, (previous, next) {
      if (next is AuthVerifyOTPRequired) {
        context.push('/auth/verify-otp', extra: {
          'email': next.email,
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
                  child: Form(
                    key: _formKey,
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
                          child: ZenTextField(
                            label: 'EMAIL ADDRESS',
                            controller: _emailController,
                            hintText: 'your.email@example.com',
                            icon: Icons.alternate_email_rounded,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.done,
                            onSubmitted: (_) => _submit(),
                            validator: (val) => (val == null || !val.contains('@')) ? 'Please enter a valid email' : null,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.xl),
                        EntryAnimation(
                          index: 4,
                          child: ZenButton(
                            text: 'SEND RESET CODE',
                            onPressed: _submit,
                            isLoading: isLoading,
                            isFullWidth: true,
                            icon: Icons.send_rounded,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.xxxl),
                        EntryAnimation(
                          index: 5,
                          child: _buildFooter(context),
                        ),
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
            child: const Icon(Icons.key_rounded, color: Colors.white, size: 36),
          ),
        ),
        const SizedBox(height: AppSpacing.xl),
        EntryAnimation(
          index: 1,
          child: Column(
            children: [
              Text(
                'RECOVER ACCESS',
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
                'CREDENTIAL RESET PROTOCOL',
                style: TextStyle(
                  fontSize: 9,
                  fontWeight: AppTypography.black,
                  letterSpacing: 4.0,
                  color: AppColors.primary.withOpacity(0.5),
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              Text(
                'Enter your verified email to receive\na unique access decryption code.',
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

  Widget _buildFooter(BuildContext context) {
    return Column(
      children: [
        Text(
          'REMEMBERED YOUR KEY?',
          style: TextStyle(
            fontSize: 10,
            color: AppColors.textSecondary.withOpacity(0.5),
            fontWeight: AppTypography.black,
            letterSpacing: 1.0,
          ),
        ),
        const SizedBox(height: 12),
        InkWell(
          onTap: () => context.pop(),
          borderRadius: BorderRadius.circular(4),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: const Text(
              'RETURN TO LOGIN',
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
