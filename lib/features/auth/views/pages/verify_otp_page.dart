import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../services/auth/auth_service.dart';
import '../../../../data/api/api_client.dart';
import '../../../../core/widgets/zen_background.dart';
import '../../../../core/widgets/animations/entry_animation.dart';

/// Verify OTP Page - Premium Zen UI Rebuild
class VerifyOTPPage extends ConsumerStatefulWidget {
  final String email;
  final String type; // 'reset-password' or 'registration'

  const VerifyOTPPage({
    super.key,
    required this.email,
    this.type = 'reset-password',
  });

  @override
  ConsumerState<VerifyOTPPage> createState() => _VerifyOTPPageState();
}

class _VerifyOTPPageState extends ConsumerState<VerifyOTPPage> {
  final List<TextEditingController> _otpControllers = List.generate(
    6,
    (_) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());
  bool _isLoading = false;
  bool _isResending = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNodes[0].requestFocus();
    });
  }

  @override
  void dispose() {
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _onOTPChanged(int index, String value) {
    if (value.length == 1 && index < 5) {
      _focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }

    if (index == 5 && value.isNotEmpty) {
      final allFilled = _otpControllers.every((c) => c.text.isNotEmpty);
      if (allFilled) {
        _verifyOTP();
      }
    }
  }

  Future<void> _verifyOTP() async {
    final otp = _otpControllers.map((c) => c.text).join();
    
    if (otp.length != 6) {
      setState(() {
        _errorMessage = 'Please enter the complete 6-digit code';
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final authService = AuthService(ApiClient());
      final result = await authService.verifyOTP(widget.email, otp, type: widget.type);
      
      if (mounted) {
        if (widget.type == 'reset-password') {
          final tempToken = result['tempToken'] as String?;
          if (tempToken != null) {
            context.push('/auth/reset-password', extra: {
              'email': widget.email,
              'token': tempToken,
            });
          } else {
            setState(() {
              _isLoading = false;
              _errorMessage = 'Failed to get reset token. Please try again.';
            });
          }
        } else {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Email verified successfully!'),
                backgroundColor: AppColors.success,
              ),
            );
            context.pop();
          }
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
          _errorMessage = e.toString().replaceAll('Exception: ', '');
        });
        for (var controller in _otpControllers) {
          controller.clear();
        }
        _focusNodes[0].requestFocus();
      }
    }
  }

  Future<void> _resendOTP() async {
    setState(() {
      _isResending = true;
      _errorMessage = null;
    });

    try {
      final authService = AuthService(ApiClient());
      await authService.resendOTP(widget.email, type: widget.type);
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('New code has been sent to your email'),
            backgroundColor: AppColors.success,
          ),
        );
        for (var controller in _otpControllers) {
          controller.clear();
        }
        _focusNodes[0].requestFocus();
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _errorMessage = e.toString().replaceAll('Exception: ', '');
        });
      }
    } finally {
      if (mounted) {
        setState(() {
          _isResending = false;
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
                      
                      // OTP Section
                      EntryAnimation(
                        index: 4,
                        verticalOffset: 40,
                        child: Column(
                          children: [
                            _buildOTPFields(),
                            const SizedBox(height: AppSpacing.xxl),
                          ],
                        ),
                      ),
                      
                      // Verify Button
                      EntryAnimation(
                        index: 5,
                        child: _buildPrimaryButton(
                          text: 'VERIFY IDENTIFICATION',
                          onPressed: _verifyOTP,
                          isLoading: _isLoading,
                        ),
                      ),
                      
                      const SizedBox(height: AppSpacing.xxl),
                      
                      // Resend Section
                      EntryAnimation(
                        index: 6,
                        child: _buildResendSection(),
                      ),
                      
                      const SizedBox(height: AppSpacing.xl),
                    ],
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
              child: Icon(Icons.mark_email_read_outlined, color: Colors.white, size: 36),
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.xl),
        EntryAnimation(
          index: 1,
          child: Column(
            children: [
              const Text(
                'SECURITY VERIFICATION',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: AppTypography.black,
                  letterSpacing: 4.0,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                'Identity Protocol',
                style: TextStyle(
                  fontFamily: AppTypography.fontFamilySerif,
                  fontSize: AppTypography.fontSize3xl,
                  letterSpacing: -1.0,
                  fontWeight: AppTypography.bold,
                  fontStyle: FontStyle.italic,
                  color: AppColors.textPrimary,
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
                'A 6-digit access code was sent to',
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

  Widget _buildOTPFields() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(6, (index) {
        return Container(
          width: 50,
          height: 65,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.6),
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(color: AppColors.borderLight.withOpacity(0.5)),
          ),
          child: Center(
            child: TextField(
              controller: _otpControllers[index],
              focusNode: _focusNodes[index],
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              maxLength: 1,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: AppTypography.black,
                color: AppColors.primary,
              ),
              decoration: const InputDecoration(
                counterText: '',
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onChanged: (value) => _onOTPChanged(index, value),
            ),
          ),
        );
      }),
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
                  const Icon(Icons.verified_user_outlined, size: 20),
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

  Widget _buildResendSection() {
    return Column(
      children: [
        Text(
          'DID NOT RECEIVE THE PROTOCOL CODE?',
          style: TextStyle(
            fontSize: 9,
            fontWeight: AppTypography.black,
            letterSpacing: 2.0,
            color: AppColors.textTertiary.withOpacity(0.6),
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        TextButton(
          onPressed: _isResending ? null : _resendOTP,
          child: _isResending
              ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.primary))
              : const Text(
                  'RESEND VERIFICATION',
                  style: TextStyle(
                    fontSize: AppTypography.fontSizeSm,
                    fontWeight: AppTypography.black,
                    letterSpacing: 1.0,
                    color: AppColors.primary,
                  ),
                ),
        ),
      ],
    );
  }
}

