import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../providers/auth_providers.dart';
import '../../models/auth_state_sealed.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../core/localization/l10n/app_localizations.dart';
import '../../../../core/widgets/zen_background.dart';
import '../../../../core/widgets/animations/entry_animation.dart';

/// Login Page - Premium Zen UI Rebuild
class LoginPage extends ConsumerStatefulWidget {
  final String? redirectTo;

  const LoginPage({super.key, this.redirectTo});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() async {
    if (!_formKey.currentState!.validate()) return;

    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    await ref.read(authStateProvider.notifier).login(email, password);

    final authState = ref.read(authStateProvider);
    if (authState is AuthAuthenticated) {
      if (mounted) {
        final destination = widget.redirectTo ?? '/';
        context.go(destination);
      }
    } else if (authState is AuthTwoFactorRequired) {
      if (mounted) {
        context.push('/auth/verify-2fa');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authStateProvider);
    final isLoading = authState is AuthLoading;
    String? errorMessage;

    if (authState is AuthError) {
      errorMessage = authState.message;
    } else if (authState is AuthExpired) {
      errorMessage = authState.message;
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      body: ZenBackground(
        child: SafeArea(
          child: Column(
            children: [
              // Navigation Bar
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.md,
                  vertical: AppSpacing.sm,
                ),
                child: Row(
                  children: [
                    EntryAnimation(
                      delay: const Duration(milliseconds: 100),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
                        onPressed: () => context.go('/'),
                        color: AppColors.textPrimary.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ),
              
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.xl,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: AppSpacing.lg),
                        
                        // Zen Header
                        _buildZenHeader(context),
                        
                        const SizedBox(height: AppSpacing.xxl),
                        
                        // Error Message
                        if (errorMessage != null) ...[
                          EntryAnimation(
                            index: 2,
                            child: _buildErrorMessage(errorMessage),
                          ),
                          const SizedBox(height: AppSpacing.lg),
                        ],
                        
                        // Form Section
                        EntryAnimation(
                          index: 3,
                          verticalOffset: 40,
                          child: Column(
                            children: [
                              _buildTextField(
                                label: AppLocalizations.of(context)!.email,
                                controller: _emailController,
                                hintText: 'your.email@example.com',
                                icon: Icons.mail_outline_rounded,
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return AppLocalizations.of(context)!.pleaseEnterEmail;
                                  }
                                  if (!value.contains('@')) {
                                    return AppLocalizations.of(context)!.pleaseEnterValidEmail;
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: AppSpacing.lg),
                              _buildTextField(
                                label: AppLocalizations.of(context)!.password,
                                controller: _passwordController,
                                hintText: 'Enter your password',
                                icon: Icons.lock_outline_rounded,
                                obscureText: _obscureText,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                                    size: 20,
                                    color: AppColors.textTertiary,
                                  ),
                                  onPressed: () => setState(() => _obscureText = !_obscureText),
                                ),
                                onSubmitted: (_) => _login(),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return AppLocalizations.of(context)!.pleaseEnterPassword;
                                  }
                                  return null;
                                },
                              ),
                              
                              const SizedBox(height: AppSpacing.md),
                              
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () => context.push('/auth/forgot-password'),
                                  child: Text(
                                    AppLocalizations.of(context)!.forgotPassword,
                                    style: const TextStyle(
                                      fontSize: AppTypography.fontSizeXs,
                                      fontWeight: AppTypography.semiBold,
                                      color: AppColors.primary,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                        const SizedBox(height: AppSpacing.xl),
                        
                        // Login Button
                        EntryAnimation(
                          index: 4,
                          child: _buildPrimaryButton(
                            text: AppLocalizations.of(context)!.signIn,
                            onPressed: _login,
                            isLoading: isLoading,
                          ),
                        ),
                        
                        const SizedBox(height: AppSpacing.xxl),
                        
                        // Footer
                        EntryAnimation(
                          index: 5,
                          child: _buildFooter(context),
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

  Widget _buildZenHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        EntryAnimation(
          index: 0,
          verticalOffset: -20,
          child: Container(
            width: 80,
            height: 80,
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(AppRadius.xl),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.2),
                  blurRadius: 30,
                  offset: const Offset(0, 10),
                ),
              ],
              border: Border.all(color: Colors.white.withOpacity(0.1)),
            ),
            child: const Center(
              child: Icon(
                Icons.auto_awesome_rounded,
                color: Colors.white,
                size: 36,
              ),
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.xl),
        EntryAnimation(
          index: 1,
          child: Column(
            children: [
              Text(
                'TORII NIHONGO',
                style: TextStyle(
                  fontFamily: AppTypography.fontFamilySerif,
                  fontSize: AppTypography.fontSize3xl,
                  letterSpacing: -1.5,
                  fontWeight: AppTypography.bold,
                  fontStyle: FontStyle.italic,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                'LEARNING SOLUTIONS CENTER',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: AppTypography.black,
                  letterSpacing: 4.0,
                  color: AppColors.primary.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.xxl),
        EntryAnimation(
          index: 2,
          child: Column(
            children: [
              Text(
                AppLocalizations.of(context)!.welcomeBack,
                style: const TextStyle(
                  fontSize: AppTypography.fontSizeXl,
                  fontWeight: AppTypography.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                AppLocalizations.of(context)!.signInToContinue,
                style: TextStyle(
                  fontSize: AppTypography.fontSizeSm,
                  fontWeight: AppTypography.medium,
                  color: AppColors.textSecondary.withOpacity(0.6),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    bool obscureText = false,
    Widget? suffixIcon,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
    void Function(String)? onSubmitted,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            label.toUpperCase(),
            style: TextStyle(
              fontSize: 10,
              fontWeight: AppTypography.black,
              letterSpacing: 2.0,
              color: AppColors.textTertiary,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.6),
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(color: AppColors.borderLight.withOpacity(0.5)),
          ),
          child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            keyboardType: keyboardType,
            onFieldSubmitted: onSubmitted,
            style: const TextStyle(
              fontSize: AppTypography.fontSizeMd,
              fontWeight: AppTypography.semiBold,
              color: AppColors.textPrimary,
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                color: AppColors.textTertiary.withOpacity(0.4),
                fontWeight: AppTypography.medium,
              ),
              prefixIcon: Icon(icon, size: 20, color: AppColors.textTertiary.withOpacity(0.6)),
              suffixIcon: suffixIcon,
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.lg),
                borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
              ),
            ),
            validator: validator,
          ),
        ),
      ],
    );
  }

  Widget _buildPrimaryButton({
    required String text,
    required VoidCallback onPressed,
    bool isLoading = false,
  }) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.lg),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.25),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.lg),
          ),
          elevation: 0,
        ),
        child: isLoading
            ? const SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2.5,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text.toUpperCase(),
                    style: const TextStyle(
                      fontSize: AppTypography.fontSizeSm,
                      fontWeight: AppTypography.black,
                      letterSpacing: 2.0,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  const Icon(Icons.arrow_forward_rounded, size: 18),
                ],
              ),
      ),
    );
  }

  Widget _buildErrorMessage(String message) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.errorLight.withOpacity(0.5),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: AppColors.error.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          const Icon(Icons.error_outline_rounded, color: AppColors.error, size: 20),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                color: AppColors.errorDark,
                fontSize: AppTypography.fontSizeSm,
                fontWeight: AppTypography.medium,
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.dontHaveAccount,
              style: TextStyle(
                fontSize: AppTypography.fontSizeSm,
                color: AppColors.textSecondary.withOpacity(0.6),
                fontWeight: AppTypography.medium,
              ),
            ),
            const SizedBox(width: 4),
            TextButton(
              onPressed: () => context.push('/register'),
              child: const Text(
                'JOIN NOW',
                style: TextStyle(
                  fontSize: AppTypography.fontSizeSm,
                  fontWeight: AppTypography.black,
                  letterSpacing: 1.0,
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.lg),
        Text(
          '© 2026 TORII NIHONGO CENTER',
          style: TextStyle(
            fontSize: 8,
            fontWeight: AppTypography.black,
            letterSpacing: 2.0,
            color: AppColors.textTertiary.withOpacity(0.4),
          ),
        ),
      ],
    );
  }
}

