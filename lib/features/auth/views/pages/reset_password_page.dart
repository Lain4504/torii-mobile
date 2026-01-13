import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../services/auth/auth_service.dart';
import '../../../../data/api/api_client.dart';
import '../../../../core/widgets/zen_background.dart';
import '../../../../core/widgets/animations/entry_animation.dart';

/// Reset Password Page - Final Recovery Step
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
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _resetPassword() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final authService = AuthService(ApiClient());
      await authService.resetPassword(
        widget.token,
        _passwordController.text.trim(),
      );
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Password reset successfully! You can now login.'),
            backgroundColor: AppColors.success,
            duration: Duration(seconds: 3),
          ),
        );
        
        Future.delayed(const Duration(milliseconds: 500), () {
          if (mounted) {
            context.go('/login');
          }
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
          _errorMessage = e.toString().replaceAll('Exception: ', '');
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
                        onPressed: () => context.pop(),
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
                        if (_errorMessage != null) ...[
                          EntryAnimation(
                            index: 3,
                            child: _buildErrorMessage(_errorMessage!),
                          ),
                          const SizedBox(height: AppSpacing.lg),
                        ],
                        
                        // Form Fields
                        EntryAnimation(
                          index: 4,
                          verticalOffset: 30,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildTextField(
                                label: 'NEW PASSWORD',
                                controller: _passwordController,
                                hintText: 'Enter your new password',
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
                                hintText: 'Re-enter your new password',
                                icon: Icons.check_circle_outline_rounded,
                                obscureText: _obscureConfirmPassword,
                                textInputAction: TextInputAction.done,
                                onSubmitted: (_) => _resetPassword(),
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
                        
                        // Action Button
                        EntryAnimation(
                          index: 5,
                          child: _buildPrimaryButton(
                            text: 'RESET CREDENTIALS',
                            onPressed: _resetPassword,
                            isLoading: _isLoading,
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
                Icons.lock_reset_rounded,
                color: Colors.white,
                size: 40,
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
                'ACCESS RESTORATION',
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
        const SizedBox(height: AppSpacing.xl),
        EntryAnimation(
          index: 2,
          child: Column(
            children: [
              Text(
                'Security Protocol for',
                style: TextStyle(
                  fontSize: AppTypography.fontSizeSm,
                  fontWeight: AppTypography.medium,
                  color: AppColors.textSecondary.withOpacity(0.6),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                widget.email,
                style: const TextStyle(
                  fontSize: AppTypography.fontSizeMd,
                  fontWeight: AppTypography.bold,
                  color: AppColors.textPrimary,
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
                  const Icon(Icons.security_rounded, size: 20),
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
}

