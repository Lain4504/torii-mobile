import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../services/auth/auth_service.dart';
import '../../../../data/api/api_client.dart';
import '../../../../core/widgets/zen_background.dart';
import '../../../../core/widgets/animations/entry_animation.dart';

/// Forgot Password Page - Premium Zen UI Rebuild
class ForgotPasswordPage extends ConsumerStatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  ConsumerState<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends ConsumerState<ForgotPasswordPage> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String? _errorMessage;
  String? _successMessage;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _sendOTP() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _successMessage = null;
    });

    try {
      final authService = AuthService(ApiClient());
      final email = _emailController.text.trim();
      
      final result = await authService.forgotPassword(email);
      
      if (mounted) {
        setState(() {
          _isLoading = false;
          _successMessage = result['message'] ?? 'OTP code has been sent to your email';
        });

        Future.delayed(const Duration(seconds: 1), () {
          if (mounted) {
            context.push(
              '/auth/verify-otp',
              extra: {
                'email': email,
                'type': 'reset-password',
              },
            );
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
                        
                        // Success Message
                        if (_successMessage != null) ...[
                          EntryAnimation(
                            index: 2,
                            child: _buildSuccessMessage(_successMessage!),
                          ),
                          const SizedBox(height: AppSpacing.lg),
                        ],
                        
                        // Error Message
                        if (_errorMessage != null) ...[
                          EntryAnimation(
                            index: 2,
                            child: _buildErrorMessage(_errorMessage!),
                          ),
                          const SizedBox(height: AppSpacing.lg),
                        ],
                        
                        // Form Field
                        EntryAnimation(
                          index: 3,
                          verticalOffset: 30,
                          child: _buildTextField(
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
                            onSubmitted: (_) => _sendOTP(),
                          ),
                        ),
                        
                        const SizedBox(height: AppSpacing.xl),
                        
                        // Send Button
                        EntryAnimation(
                          index: 4,
                          child: _buildPrimaryButton(
                            text: 'SEND RECOVERY CODE',
                            onPressed: _sendOTP,
                            isLoading: _isLoading,
                          ),
                        ),
                        
                        const SizedBox(height: AppSpacing.xxl),
                        
                        // Footer
                        EntryAnimation(
                          index: 5,
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
                Icons.vpn_key_outlined,
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
                'RECOVERY PROTOCOL',
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
            child: Text(
              'Enter your registered email address to receive an experimental recovery code for your neural link.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary.withOpacity(0.7),
                height: 1.6,
                fontWeight: AppTypography.medium,
              ),
            ),
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
            keyboardType: keyboardType,
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
                  const Icon(Icons.send_rounded, size: 20),
                  const SizedBox(width: AppSpacing.sm),
                  Text(
                    text.toUpperCase(),
                    style: const TextStyle(
                      fontSize: AppTypography.fontSizeSm,
                      fontWeight: AppTypography.black,
                      letterSpacing: 2.0,
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildSuccessMessage(String message) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.successLight.withOpacity(0.5),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: AppColors.success.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          const Icon(Icons.check_circle_outline_rounded, color: AppColors.success, size: 20),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                color: AppColors.successDark,
                fontSize: AppTypography.fontSizeSm,
                fontWeight: AppTypography.medium,
              ),
            ),
          ),
        ],
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

  Widget _buildFooterSection(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'REMEMBER YOUR LINK?',
              style: TextStyle(
                fontSize: 10,
                fontWeight: AppTypography.black,
                letterSpacing: 2.0,
                color: AppColors.textTertiary.withOpacity(0.6),
              ),
            ),
            const SizedBox(width: AppSpacing.xs),
            TextButton(
              onPressed: () => context.pop(),
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

