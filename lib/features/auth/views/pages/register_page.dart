import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../providers/auth_providers.dart';
import '../../models/auth_state_sealed.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../core/widgets/zen_background.dart';
import '../../../../core/widgets/animations/entry_animation.dart';

/// Register Page - Premium Zen UI Rebuild
class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final _displayNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _displayNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _register() async {
    if (!_formKey.currentState!.validate()) return;

    final displayName = _displayNameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    await ref.read(authStateProvider.notifier).register(
      email,
      displayName,
      password,
    );

    final authState = ref.read(authStateProvider);
    if (authState is AuthAuthenticated) {
      if (mounted) {
        context.go('/');
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
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      body: ZenBackground(
        child: SafeArea(
          child: Column(
            children: [
              // Custom Bar
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
                        
                        // Form Fields
                        EntryAnimation(
                          index: 3,
                          verticalOffset: 30,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildTextField(
                                label: 'DISPLAY NAME',
                                controller: _displayNameController,
                                hintText: 'How should we call you?',
                                icon: Icons.person_outline_rounded,
                                validator: (value) {
                                  if (value == null || value.isEmpty) return 'Please enter your name';
                                  return null;
                                },
                              ),
                              const SizedBox(height: AppSpacing.md),
                              _buildTextField(
                                label: 'EMAIL ADDRESS',
                                controller: _emailController,
                                hintText: 'your.email@example.com',
                                icon: Icons.mail_outline_rounded,
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value == null || value.isEmpty) return 'Please enter your email';
                                  if (!value.contains('@')) return 'Please enter a valid email';
                                  return null;
                                },
                              ),
                              const SizedBox(height: AppSpacing.md),
                              _buildTextField(
                                label: 'PASSWORD',
                                controller: _passwordController,
                                hintText: 'Create a password',
                                icon: Icons.lock_outline_rounded,
                                obscureText: _obscurePassword,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                                    size: 18,
                                    color: AppColors.textTertiary,
                                  ),
                                  onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) return 'Please enter a password';
                                  if (value.length < 8) return 'Password must be at least 8 characters';
                                  return null;
                                },
                              ),
                              const SizedBox(height: AppSpacing.md),
                              _buildTextField(
                                label: 'CONFIRM PASSWORD',
                                controller: _confirmPasswordController,
                                hintText: 'Re-enter your password',
                                icon: Icons.check_circle_outline_rounded,
                                obscureText: _obscureConfirmPassword,
                                textInputAction: TextInputAction.done,
                                onSubmitted: (_) => _register(),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscureConfirmPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                                    size: 18,
                                    color: AppColors.textTertiary,
                                  ),
                                  onPressed: () => setState(() => _obscureConfirmPassword = !_obscureConfirmPassword),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) return 'Please confirm your password';
                                  if (value != _passwordController.text) return 'Passwords do not match';
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                        
                        const SizedBox(height: AppSpacing.xl),
                        
                        // Register Button
                        EntryAnimation(
                          index: 4,
                          child: _buildPrimaryButton(
                            text: 'CREATE ACCOUNT',
                            onPressed: _register,
                            isLoading: isLoading,
                          ),
                        ),
                        
                        const SizedBox(height: AppSpacing.lg),
                        
                        // Terms
                        EntryAnimation(
                          index: 5,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                            child: Text(
                              'By creating an account, you agree to our terms of service and privacy protocols within the Torii ecosystem.',
                              style: TextStyle(
                                fontSize: 11,
                                color: AppColors.textTertiary.withOpacity(0.6),
                                height: 1.5,
                                fontWeight: AppTypography.medium,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        
                        const SizedBox(height: AppSpacing.xxl),
                        
                        // Footer
                        EntryAnimation(
                          index: 6,
                          child: _buildFooterSection(context),
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
                Icons.person_add_alt_1_outlined,
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
                    color: AppColors.textPrimary),
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                'INITIALIZE LEARNING PROTOCOL',
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
    TextInputAction textInputAction = TextInputAction.next,
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
            textInputAction: textInputAction,
            onFieldSubmitted: onSubmitted,
            style: const TextStyle(
              fontSize: AppTypography.fontSizeMd,
              fontWeight: AppTypography.bold,
              color: AppColors.textPrimary,
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                color: AppColors.textTertiary.withOpacity(0.4),
                fontWeight: AppTypography.medium,
              ),
              prefixIcon: Icon(icon, size: 20, color: AppColors.primary.withOpacity(0.7)),
              suffixIcon: suffixIcon,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 16),
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
                  const Icon(Icons.arrow_forward_rounded, size: 20),
                ],
              ),
      ),
    );
  }

  Widget _buildErrorMessage(String? message) {
    if (message == null) return const SizedBox.shrink();
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

  Widget _buildFooterSection(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ALREADY A LEARNER?',
              style: TextStyle(
                fontSize: 10,
                fontWeight: AppTypography.black,
                letterSpacing: 1.0,
                color: AppColors.textTertiary.withOpacity(0.6),
              ),
            ),
            const SizedBox(width: AppSpacing.xs),
            TextButton(
              onPressed: () => context.push('/login'),
              child: const Text(
                'SIGN IN',
                style: TextStyle(
                  fontWeight: AppTypography.black,
                  fontSize: 11,
                  letterSpacing: 1.0,
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
