import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:torii_app/features/auth/providers/auth_providers.dart';
import 'package:torii_app/core/config/app_config.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/widgets/widgets.dart';

/// Login Page - Zen UI Pro Max - Premium Rebuild
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

  // Create a GoogleSignIn instance
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

  static bool _isGoogleSignInInitialized = false;

  Future<void> _loginWithGoogle() async {
    try {
      setState(() => _googleError = null);

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final idToken = googleAuth.idToken;

      if (idToken != null) {
        await ref.read(authStateProvider.notifier).googleLogin(idToken);
      } else {
        debugPrint('Google Login: idToken is null');
      }
    } catch (e) {
      debugPrint('Google Login Error: $e');
      setState(() {
        _googleError = e.toString().contains('10')
            ? 'Cấu hình Google không khớp (Lỗi 10). Vui lòng kiểm tra mã SHA-1.'
            : 'Lỗi đăng nhập Google: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final asyncAuth = ref.watch(authStateProvider);
    final isLoading = asyncAuth.isLoading;
    final errorMessage = _googleError ?? asyncAuth.error?.toString();

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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: AppSpacing.xl),
                        _buildHeader(context),
                        const SizedBox(height: 48),

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
                              AppTextField(
                                label: 'Email',
                                controller: _emailController,
                                hintText: 'email.cua.ban@example.com',
                                icon: Icons.alternate_email_rounded,
                                keyboardType: TextInputType.emailAddress,
                                validator: (val) =>
                                    (val == null || !val.contains('@'))
                                    ? 'Vui lòng nhập email hợp lệ'
                                    : null,
                              ),
                              const SizedBox(height: AppSpacing.lg),
                              AppTextField(
                                label: 'Mật khẩu',
                                controller: _passwordController,
                                hintText: '••••••••',
                                icon: Icons.fingerprint_rounded,
                                obscureText: _obscurePassword,
                                textInputAction: TextInputAction.done,
                                onSubmitted: (_) => _login(),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscurePassword
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility_outlined,
                                    size: 18,
                                    color: AppColors.mutedForeground,
                                  ),
                                  onPressed: () => setState(
                                    () => _obscurePassword = !_obscurePassword,
                                  ),
                                ),
                                validator: (val) =>
                                    (val == null || val.length < 6)
                                    ? 'Mật khẩu quá ngắn'
                                    : null,
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: AppSpacing.md),

                        EntryAnimation(
                          index: 4,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () => context.push('/auth/forgot-password'),
                              style: TextButton.styleFrom(
                                minimumSize: Size.zero,
                                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: const Text(
                                'Quên mật khẩu?',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: AppTypography.bold,
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: AppSpacing.xl),

                        EntryAnimation(
                          index: 5,
                          child: AppButton(
                            text: 'Đăng nhập',
                            onPressed: _login,
                            isLoading: isLoading,
                            isFullWidth: true,
                            icon: Icons.login_rounded,
                          ),
                        ),

                        const SizedBox(height: AppSpacing.xxxl),
                        EntryAnimation(index: 6, child: _buildFooter(context)),
                        const SizedBox(height: AppSpacing.xxl),
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
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.close_rounded, size: 22),
            onPressed: () => context.canPop() ? context.pop() : context.go('/'),
            color: AppColors.mutedForeground,
          ),
          TextButton(
            onPressed: () => context.go('/register'),
            child: const Text(
              'ĐĂNG KÝ',
              style: TextStyle(
                fontSize: 11,
                fontWeight: AppTypography.black,
                letterSpacing: 2.0,
                color: AppColors.primary,
              ),
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
          verticalOffset: -10,
          child: Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.2),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: const Icon(
              Icons.auto_awesome_rounded,
              color: Colors.white,
              size: 32,
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.xl),
        EntryAnimation(
          index: 1,
          child: Column(
            children: [
              Text(
                'Chào mừng trở lại',
                style: TextStyle(
                  fontFamily: AppTypography.fontFamilySerif,
                  fontSize: 28,
                  fontWeight: AppTypography.bold,
                  letterSpacing: -0.5,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'TORII EDUCATIONAL SYSTEM',
                style: TextStyle(
                  fontSize: 9,
                  fontWeight: AppTypography.black,
                  letterSpacing: 3.0,
                  color: AppColors.mutedForeground,
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
        color: AppColors.destructive.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(AppRadius.card),
        border: Border.all(color: AppColors.destructive.withValues(alpha: 0.1)),
      ),
      child: Row(
        children: [
          const Icon(Icons.error_outline_rounded, color: AppColors.destructive, size: 18),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                color: AppColors.destructive,
                fontSize: 12,
                fontWeight: AppTypography.semiBold,
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
          children: [
            Expanded(child: Divider(color: AppColors.border.withValues(alpha: 0.5))),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
              child: Text(
                'HOẶC TIẾP TỤC VỚI',
                style: TextStyle(
                  fontSize: 9,
                  fontWeight: AppTypography.black,
                  letterSpacing: 1.5,
                  color: AppColors.mutedForeground,
                ),
              ),
            ),
            Expanded(child: Divider(color: AppColors.border.withValues(alpha: 0.5))),
          ],
        ),
        const SizedBox(height: AppSpacing.xl),
        _SocialLoginButton(
          label: 'Đăng nhập bằng Google',
          icon: Icons.g_mobiledata_rounded,
          onPressed: _loginWithGoogle,
        ),
      ],
    );
  }
}

class _SocialLoginButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  const _SocialLoginButton({
    required this.label,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(AppRadius.card),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppRadius.card),
            border: Border.all(color: AppColors.border),
            color: Colors.white.withValues(alpha: 0.5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: AppColors.textPrimary, size: 28),
              const SizedBox(width: 12),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: AppTypography.bold,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
