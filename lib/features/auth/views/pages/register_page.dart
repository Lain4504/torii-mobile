import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:torii_app/features/auth/providers/auth_providers.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/widgets/widgets.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final _displayNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  double _passwordStrength = 0;

  @override
  void dispose() {
    _displayNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onPasswordChanged(String value) {
    setState(() {
      if (value.isEmpty) {
        _passwordStrength = 0;
      } else if (value.length < 6) {
        _passwordStrength = 0.25;
      } else if (value.length < 10) {
        _passwordStrength = 0.6;
      } else {
        _passwordStrength = 1.0;
      }
    });
  }

  Future<void> _register() async {
    if (!_formKey.currentState!.validate()) return;
    
    final success = await ref.read(authStateProvider.notifier).register(
      _emailController.text.trim(),
      _passwordController.text.trim(),
      _displayNameController.text.trim(),
    );

    if (success && mounted) {
      // Navigate to verification page
      context.push('/auth/verify-otp', extra: _emailController.text.trim());
    }
  }

  @override
  Widget build(BuildContext context) {
    final asyncAuth = ref.watch(authStateProvider);
    final isLoading = asyncAuth.isLoading;
    final authState = asyncAuth.value;
    final errorMessage = authState?.error;

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
                                'Create Account',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: AppTypography.black,
                                  color: AppColors.secondary,
                                  letterSpacing: -0.5,
                                ),
                              ),
                              SizedBox(height: AppSpacing.xs),
                              Text(
                                'Begin your professional Japanese masters journey',
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
                                    'Full Name',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: AppTypography.bold,
                                      color: AppColors.textPrimary,
                                    ),
                                  ),
                                  const SizedBox(height: AppSpacing.xs),
                                  AppTextField(
                                    label: 'Name',
                                    controller: _displayNameController,
                                    hintText: 'Your name',
                                    icon: Icons.person_outline,
                                    validator: (val) => (val == null || val.isEmpty) ? 'Name is required' : null,
                                  ),
                                  const SizedBox(height: AppSpacing.md),
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
                                    onChanged: _onPasswordChanged,
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                                        size: 20,
                                        color: AppColors.textTertiary,
                                      ),
                                      onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                                    ),
                                    validator: (val) => (val == null || val.length < 8) ? 'Minimum 8 characters' : null,
                                  ),
                                  const SizedBox(height: AppSpacing.xs),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(AppRadius.xs),
                                    child: LinearProgressIndicator(
                                      value: _passwordStrength,
                                      backgroundColor: AppColors.grey200,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        _passwordStrength < 0.5 ? AppColors.error : (_passwordStrength < 0.8 ? AppColors.warning : AppColors.accent),
                                      ),
                                      minHeight: 4,
                                    ),
                                  ),
                                  const SizedBox(height: AppSpacing.lg),
                                  AppButton(
                                    text: 'CREATE ACCOUNT',
                                    onPressed: _register,
                                    isLoading: isLoading,
                                    padding: const EdgeInsets.symmetric(vertical: 16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: AppSpacing.lg),

                        // Agreement
                        const EntryAnimation(
                          index: 2,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
                            child: Text(
                              'By creating an account, you agree to our Terms of service and privacy policy.',
                              style: TextStyle(fontSize: 11, color: AppColors.textTertiary),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),

                        const SizedBox(height: AppSpacing.xxxl),

                        // Bottom Text
                        EntryAnimation(
                          index: 3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Already have an account?",
                                style: TextStyle(color: AppColors.textSecondary, fontSize: 14),
                              ),
                              TextButton(
                                onPressed: () => context.go('/login'),
                                child: const Text(
                                  'Sign in',
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
