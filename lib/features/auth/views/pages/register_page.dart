import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../providers/auth_providers.dart';
import '../../models/auth_state_sealed.dart';
import '../../../../core/constants/app_design_system.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _register() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      return;
    }

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Passwords do not match'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    // Only send email and password to backend (fullName = empty string)
    final success = await ref.read(authStateProvider.notifier).register(email, '', password);

    if (success && mounted) {
      // Registration success, show message and go to login
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Registration successful! Please login.'),
          backgroundColor: AppColors.success,
        ),
      );
      context.go('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authStateProvider);
    final isLoading = authState is AuthLoading;
    String? errorMessage;

    if (authState is AuthError) {
      errorMessage = authState.message;
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Header / Branding
                Icon(
                  Icons.auto_stories,
                  size: AppSpacing.xxxl,
                  color: AppColors.primary,
                ),
                const SizedBox(height: AppSpacing.lg),
                Text(
                  'Create Account',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  'Sign up to start your Japanese learning journey',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    height: AppTypography.lineHeightNormal,
                  ),
                ),
                const SizedBox(height: AppSpacing.xxl),

                // Error Message
                if (errorMessage != null) ...[
                  Container(
                    padding: const EdgeInsets.all(AppSpacing.md),
                    decoration: BoxDecoration(
                      color: AppColors.errorLight,
                      borderRadius: BorderRadius.circular(AppRadius.md),
                      border: Border.all(color: AppColors.error.withOpacity(0.3)),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.error_outline, color: AppColors.error, size: 20),
                        const SizedBox(width: AppSpacing.md),
                        Expanded(
                          child: Text(
                            errorMessage,
                            style: TextStyle(
                              color: AppColors.error,
                              fontSize: AppTypography.fontSizeXs,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                ],

                // Email Field
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email Address',
                    hintText: 'name@example.com',
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: AppSpacing.md),

                // Password Field
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password (min 8 characters)',
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                  obscureText: _obscurePassword,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: AppSpacing.md),

                // Confirm Password Field
                TextField(
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    hintText: 'Re-enter your password',
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureConfirmPassword = !_obscureConfirmPassword;
                        });
                      },
                    ),
                  ),
                  obscureText: _obscureConfirmPassword,
                  textInputAction: TextInputAction.done,
                  onSubmitted: (_) => _register(),
                ),

                const SizedBox(height: AppSpacing.xl),

                // Register Button
                SizedBox(
                  height: 56,
                  child: ElevatedButton(
                    onPressed: isLoading ? null : _register,
                    child: isLoading
                        ? SizedBox(
                            height: AppSpacing.lg,
                            width: AppSpacing.lg,
                            child: CircularProgressIndicator(
                              color: AppColors.textOnPrimary,
                              strokeWidth: 2.5,
                            ),
                          )
                        : const Text('Create Account'),
                  ),
                ),

                const SizedBox(height: AppSpacing.xl),

                // Footer
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    TextButton(
                      onPressed: () => context.go('/login'),
                      child: const Text('Sign In'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
