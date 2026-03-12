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
    final errorMessage = _googleError ?? asyncAuth.error?.toString();

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
                  const SizedBox(height: AppSpacing.xxl),
                  // Logo Section
                  const EntryAnimation(
                    index: 0,
                    child: Column(
                      children: [
                        ToriiIcon(size: 80),
                        SizedBox(height: AppSpacing.md),
                        Text(
                          'Torii Nihongo',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: AppTypography.bold,
                            color: AppColors.secondary,
                            letterSpacing: -0.5,
                          ),
                        ),
                        Text(
                          'Professional Education Platform',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.textSecondary,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xxxl),

                  // Login Card
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
                              label: 'Email',
                              controller: _emailController,
                              hintText: 'Enter your email',
                              keyboardType: TextInputType.emailAddress,
                              validator: (val) => (val == null || !val.contains('@')) ? 'Invalid email' : null,
                            ),
                            const SizedBox(height: AppSpacing.md),
                            AppTextField(
                              label: 'Password',
                              controller: _passwordController,
                              hintText: '••••••••',
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
                            const SizedBox(height: AppSpacing.sm),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () => context.push('/auth/forgot-password'),
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: const Size(0, 30),
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                ),
                                child: const Text(
                                  'Forgot password?',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: AppTypography.semiBold,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: AppSpacing.lg),
                            AppButton(
                              text: 'Login',
                              onPressed: _login,
                              isLoading: isLoading,
                              backgroundColor: AppColors.secondary,
                              borderRadius: AppRadius.md,
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
                          icon: Icons.g_mobiledata_rounded, // Should use a proper Google logo
                          onPressed: _loginWithGoogle,
                        ),
                        const SizedBox(width: AppSpacing.md),
                        _SocialButton(
                          icon: Icons.apple_rounded,
                          onPressed: () {}, // Apple login logic
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: AppSpacing.xxxl),

                  // Bottom Text
                  EntryAnimation(
                    index: 4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(color: AppColors.textSecondary),
                        ),
                        TextButton(
                          onPressed: () => context.push('/register'),
                          child: const Text(
                            'Sign up',
                            style: TextStyle(
                              fontWeight: AppTypography.bold,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ],
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

class _SocialButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _SocialButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MinimalCard(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl, vertical: AppSpacing.sm),
      onTap: onPressed,
      borderRadius: BorderRadius.circular(AppRadius.md),
      child: Icon(icon, size: 28, color: AppColors.secondary),
    );
  }
}
