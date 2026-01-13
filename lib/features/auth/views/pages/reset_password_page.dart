import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/features/auth/providers/auth_providers.dart';
import 'package:torii_app/features/auth/models/auth_state_sealed.dart';
import 'package:torii_app/core/widgets/widgets.dart';

class ResetPasswordPage extends ConsumerStatefulWidget {
  final String email;
  final String token;

  const ResetPasswordPage({
    super.key,
    required this.email,
    required this.token,
  });

  @override
  ConsumerState<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends ConsumerState<ResetPasswordPage> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    await ref.read(authStateProvider.notifier).resetPassword(
      widget.token,
      _passwordController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(authStateProvider, (previous, next) {
      if (next is AuthUnauthenticated) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Password updated successfully. Please login.')),
        );
        context.go('/login');
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
                          child: Column(
                            children: [
                              ZenTextField(
                                label: 'NEW PASSWORD',
                                controller: _passwordController,
                                hintText: '••••••••',
                                icon: Icons.fingerprint_rounded,
                                obscureText: _obscurePassword,
                                validator: (val) => (val == null || val.length < 8) ? 'Minimum 8 characters' : null,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                                    size: 18, color: AppColors.textTertiary,
                                  ),
                                  onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                                ),
                              ),
                              const SizedBox(height: AppSpacing.md),
                              ZenTextField(
                                label: 'CONFIRM NEW PASSWORD',
                                controller: _confirmController,
                                hintText: '••••••••',
                                icon: Icons.verified_user_outlined,
                                obscureText: _obscurePassword,
                                textInputAction: TextInputAction.done,
                                onSubmitted: (_) => _submit(),
                                validator: (val) => (val != _passwordController.text) ? 'Passwords do not match' : null,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: AppSpacing.xl),
                        EntryAnimation(
                          index: 4,
                          child: ZenButton(
                            text: 'UPGRADE CREDENTIALS',
                            onPressed: _submit,
                            isLoading: isLoading,
                            isFullWidth: true,
                            icon: Icons.security_update_good_rounded,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.xl),
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
            child: const Icon(Icons.lock_reset_rounded, color: Colors.white, size: 36),
          ),
        ),
        const SizedBox(height: AppSpacing.xl),
        EntryAnimation(
          index: 1,
          child: Column(
            children: [
              Text(
                'RESET PASSWORD',
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
                'DEFENSE PERIMETER UPDATE',
                style: TextStyle(
                  fontSize: 9,
                  fontWeight: AppTypography.black,
                  letterSpacing: 4.0,
                  color: AppColors.primary.withOpacity(0.5),
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              Text(
                'Define your new security phrase for\n${widget.email}',
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
}
