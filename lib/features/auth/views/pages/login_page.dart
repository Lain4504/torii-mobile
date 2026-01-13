import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:torii_app/features/auth/providers/auth_providers.dart';
import 'package:torii_app/features/auth/models/auth_state.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/localization/l10n/app_localizations.dart';
import 'package:torii_app/core/widgets/widgets.dart';

/// Login Page - Zen UI Pro Max - Premium Rebuild
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

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;

    await ref.read(authStateProvider.notifier).login(
      _emailController.text.trim(), 
      _passwordController.text.trim()
   );
  }

  @override
  Widget build(BuildContext context) {
    final asyncAuth = ref.watch(authStateProvider);
    final isLoading = asyncAuth.isLoading;
    final errorMessage = asyncAuth.error?.toString(); // or extract from value if needed

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
                        const SizedBox(height: AppSpacing.xl),
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
                                label: AppLocalizations.of(context)!.email,
                                controller: _emailController,
                                hintText: 'your.email@example.com',
                                icon: Icons.alternate_email_rounded,
                                keyboardType: TextInputType.emailAddress,
                                validator: (val) => (val == null || !val.contains('@')) ? 'Please enter a valid email' : null,
                              ),
                              const SizedBox(height: AppSpacing.md),
                              ZenTextField(
                                label: AppLocalizations.of(context)!.password,
                                controller: _passwordController,
                                hintText: '••••••••',
                                icon: Icons.fingerprint_rounded,
                                obscureText: _obscureText,
                                textInputAction: TextInputAction.done,
                                onSubmitted: (_) => _login(),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                                    size: 18, color: AppColors.textTertiary,
                                  ),
                                  onPressed: () => setState(() => _obscureText = !_obscureText),
                                ),
                                validator: (val) => (val == null || val.length < 6) ? 'Password too short' : null,
                              ),
                            ],
                          ),
                        ),
                        
                        const SizedBox(height: AppSpacing.lg),
                        
                        EntryAnimation(
                          index: 4,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () => context.push('/auth/forgot-password'),
                              child: Text(
                                AppLocalizations.of(context)!.forgotPassword,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: AppTypography.bold,
                                  color: AppColors.primary.withValues(alpha: 0.7),
                                ),
                              ),
                            ),
                          ),
                        ),
                        
                        const SizedBox(height: AppSpacing.xl),
                        
                        EntryAnimation(
                          index: 5,
                          child: ZenButton(
                            text: AppLocalizations.of(context)!.signIn,
                            onPressed: _login,
                            isLoading: isLoading,
                            isFullWidth: true,
                            icon: Icons.login_rounded,
                          ),
                        ),
                        
                        const SizedBox(height: AppSpacing.xxxl),
                        
                        EntryAnimation(
                          index: 6,
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          EntryAnimation(
            delay: const Duration(milliseconds: 200),
            child: IconButton(
              icon: const Icon(Icons.close_rounded, size: 20),
              onPressed: () {
                if (context.canPop()) {
                  context.pop();
                } else {
                  context.go('/');
                }
              },
              color: AppColors.textPrimary.withValues(alpha: 0.4),
            ),
          ),
          EntryAnimation(
            delay: const Duration(milliseconds: 400),
            child: TextButton(
              onPressed: () => context.go('/register'),
              child: Text(
                'SIGN UP',
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
                  color: AppColors.primary.withValues(alpha: 0.2),
                  blurRadius: 25, offset: const Offset(0, 8),
                ),
              ],
            ),
            child: const Icon(Icons.waves_rounded, color: Colors.white, size: 36),
          ),
        ),
        const SizedBox(height: AppSpacing.xl),
        EntryAnimation(
          index: 1,
          child: Column(
            children: [
              Text(
                'TORII APP',
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
                'NEURAL LEARNING PROTOCOL',
                style: TextStyle(
                  fontSize: 9,
                  fontWeight: AppTypography.black,
                  letterSpacing: 5.0,
                  color: AppColors.primary.withValues(alpha: 0.5),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(width: 40, height: 1, color: AppColors.grey300.withValues(alpha: 0.4)),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
              child: Text(
                'GENETIC ACCESS',
                style: TextStyle(fontSize: 8, fontWeight: AppTypography.black, letterSpacing: 2.0, color: AppColors.textTertiary),
              ),
            ),
            Container(width: 40, height: 1, color: AppColors.grey300.withValues(alpha: 0.4)),
          ],
        ),
        const SizedBox(height: AppSpacing.xl),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _SocialLoginButton(icon: Icons.g_mobiledata_rounded, onPressed: () {}),
            const SizedBox(width: AppSpacing.lg),
            _SocialLoginButton(icon: Icons.apple_rounded, onPressed: () {}),
          ],
        ),
      ],
    );
  }
}

class _SocialLoginButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _SocialLoginButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(AppRadius.full),
      child: Container(
        width: 56, height: 56,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.6),
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.grey300.withValues(alpha: 0.3)),
        ),
        child: Icon(icon, color: AppColors.textPrimary, size: 32),
      ),
    );
  }
}
