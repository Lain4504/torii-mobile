import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:torii_app/features/auth/providers/auth_providers.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/widgets/widgets.dart';

class LoginPage extends ConsumerStatefulWidget {
  final String? redirectTo;

  const LoginPage({super.key, this.redirectTo});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  String? _googleError;

  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email', 'profile']);

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;

    await ref
        .read(authStateProvider.notifier)
        .login(_emailController.text.trim(), _passwordController.text.trim());
  }

  Future<void> _loginWithGoogle() async {
    try {
      setState(() => _googleError = null);
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return;

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final idToken = googleAuth.idToken;

      if (idToken != null) {
        await ref.read(authStateProvider.notifier).googleLogin(idToken);
      }
    } catch (e) {
      setState(() => _googleError = 'Google Login Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final asyncAuth = ref.watch(authStateProvider);
    final isLoading = asyncAuth.isLoading;
    final authState = asyncAuth.value;
    final errorMessage = _googleError ?? authState?.error;

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
                    onPressed: () => context.go('/'),
                    icon: const Icon(Icons.arrow_back, size: 18),
                    label: const Text('Back to Home'),
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
                                'Welcome Back',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: AppTypography.black,
                                  color: AppColors.secondary,
                                  letterSpacing: -0.5,
                                ),
                              ),
                              SizedBox(height: AppSpacing.xs),
                              Text(
                                'Login to continue your Japanese journey',
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
                                    'Email Address',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: AppTypography.bold,
                                      color: AppColors.textPrimary,
                                    ),
                                  ),
                                  const SizedBox(height: AppSpacing.xs),
                                  AppTextField(
                                    label: 'Email',
                                    controller: _emailController,
                                    hintText: 'name@example.com',
                                    icon: Icons.email_outlined,
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (val) => (val == null || !val.contains('@')) ? 'Invalid email' : null,
                                  ),
                                  const SizedBox(height: AppSpacing.md),
                                  const Text(
                                    'Password',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: AppTypography.bold,
                                      color: AppColors.textPrimary,
                                    ),
                                  ),
                                  const SizedBox(height: AppSpacing.xs),
                                  AppTextField(
                                    label: 'Password',
                                    controller: _passwordController,
                                    hintText: '••••••••',
                                    icon: Icons.lock_outline,
                                    obscureText: _obscurePassword,
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                                        size: 20,
                                        color: AppColors.textTertiary,
                                      ),
                                      onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                                    ),
                                    validator: (val) => (val == null || val.length < 6) ? 'Password too short' : null,
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: TextButton(
                                      onPressed: () => context.push('/auth/forgot-password'),
                                      child: const Text(
                                        'Forgot password?',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: AppTypography.bold,
                                          color: AppColors.primary,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: AppSpacing.md),
                                  AppButton(
                                    text: 'LOGIN',
                                    onPressed: _login,
                                    isLoading: isLoading,
                                    padding: const EdgeInsets.symmetric(vertical: 16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: AppSpacing.xl),

                        // Divider
                        const EntryAnimation(
                          index: 2,
                          child: Row(
                            children: [
                              Expanded(child: Divider()),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
                                child: Text(
                                  'or continue with',
                                  style: TextStyle(fontSize: 12, color: AppColors.textTertiary),
                                ),
                              ),
                              Expanded(child: Divider()),
                            ],
                          ),
                        ),

                        const SizedBox(height: AppSpacing.xl),

                        // Social Login
                        EntryAnimation(
                          index: 3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _SocialButton(
                                icon: Icons.g_mobiledata_rounded,
                                label: 'Google',
                                onPressed: _loginWithGoogle,
                              ),
                              const SizedBox(width: AppSpacing.md),
                              _SocialButton(
                                icon: Icons.apple_rounded,
                                label: 'Apple',
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: AppSpacing.xxl),

                        // Bottom Text
                        EntryAnimation(
                          index: 4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Don't have an account?",
                                style: TextStyle(color: AppColors.textSecondary, fontSize: 14),
                              ),
                              TextButton(
                                onPressed: () => context.push('/register'),
                                child: const Text(
                                  'Sign up',
                                  style: TextStyle(
                                    fontWeight: AppTypography.black,
                                    color: AppColors.primary,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
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

class _SocialButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const _SocialButton({required this.icon, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, color: AppColors.textPrimary, size: 24),
        label: Text(
          label,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontWeight: AppTypography.bold,
            fontSize: 13,
          ),
        ),
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 12),
          side: const BorderSide(color: AppColors.borderLight),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.xs),
          ),
          backgroundColor: AppColors.white,
        ),
      ),
    );
  }
}
