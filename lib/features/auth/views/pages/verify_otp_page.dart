import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:torii_app/features/auth/providers/auth_providers.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/widgets/widgets.dart';

class VerifyOTPPage extends ConsumerStatefulWidget {
  final String email;
  final String? nextRoute;
  final String? successTitle;
  final String? successMessage;

  const VerifyOTPPage({
    super.key,
    required this.email,
    this.nextRoute,
    this.successTitle,
    this.successMessage,
  });

  @override
  ConsumerState<VerifyOTPPage> createState() => _VerifyOTPPageState();
}

class _VerifyOTPPageState extends ConsumerState<VerifyOTPPage> {
  final TextEditingController _otpController = TextEditingController();
  final FocusNode _otpFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _otpFocusNode.requestFocus();
      }
    });
  }

  @override
  void dispose() {
    _otpController.dispose();
    _otpFocusNode.dispose();
    super.dispose();
  }

  void _verifyOTP() {
    final code = _otpController.text;
    if (code.length == 6) {
      ref.read(authStateProvider.notifier).verifyOTP(widget.email, code).then((success) {
        if (success && mounted) {
          if (widget.nextRoute != null) {
            context.go(widget.nextRoute!, extra: {'email': widget.email});
          } else {
            context.go('/auth/success', extra: {
              'title': widget.successTitle ?? 'Email Verified!',
              'message': widget.successMessage ?? 'Your account has been successfully verified. Now you can dive into learning Japanese.',
              'nextRoute': '/login',
            });
          }
        }
      });
    }
  }

  void _resendOTP() {
    ref.read(authStateProvider.notifier).resendOTP(widget.email);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Verification code resent!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final asyncAuth = ref.watch(authStateProvider);
    final isLoading = asyncAuth.isLoading;
    final authState = asyncAuth.value;
    final errorMessage = authState?.error;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: Stack(
        children: [
          // Background Pattern
          Positioned.fill(
            child: Opacity(
              opacity: 0.03,
              child: Image.network(
                "https://www.transparenttextures.com/patterns/pinstripe-light.png",
                repeat: ImageRepeat.repeat,
                errorBuilder: (context, error, stackTrace) => const SizedBox.shrink(),
              ),
            ),
          ),
          
          SafeArea(
            child: Column(
              children: [
                // Top Navigation
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => context.go('/login'),
                        icon: const Icon(Icons.arrow_back_rounded, color: Color(0xFF1F3E72)),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () => context.go('/'),
                        child: const Text(
                          'Back to Home',
                          style: TextStyle(
                            color: Color(0xFF1F3E72),
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Lexend',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 24),
                        // Header
                        Center(
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF1F3E72).withValues(alpha: 0.05),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: const ToriiIcon(
                                  size: 40,
                                  color: Color(0xFF1F3E72),
                                ),
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                'Verify Code',
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xFF1F3E72),
                                  fontFamily: 'Lexend',
                                  letterSpacing: -0.5,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                "Enter the 6-digit code we sent to your email.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF64748B),
                                  fontFamily: 'Lexend',
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                        const SizedBox(height: 48),

                        if (errorMessage != null) ...[
                          _buildErrorBanner(errorMessage),
                          const SizedBox(height: 24),
                        ],

                        // OTP Input
                        const Text(
                          'Verification Code',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF1F3E72),
                            fontFamily: 'Lexend',
                          ),
                        ),
                        const SizedBox(height: 12),
                        _buildOTPInput(),
                        
                        const SizedBox(height: 32),
                        
                        // Verify Button
                        SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: ElevatedButton(
                            onPressed: (_otpController.text.length == 6 && !isLoading) ? _verifyOTP : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF1F3E72),
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              disabledBackgroundColor: const Color(0xFF1F3E72).withValues(alpha: 0.5),
                            ),
                            child: isLoading
                                ? const SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2.5,
                                    ),
                                  )
                                : const Text(
                                    'VERIFY ACCOUNT',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 14,
                                      letterSpacing: 1.0,
                                      fontFamily: 'Lexend',
                                    ),
                                  ),
                          ),
                        ),

                        const SizedBox(height: 24),
                        Center(
                          child: TextButton(
                            onPressed: isLoading ? null : _resendOTP,
                            child: const Text(
                              "Didn't receive code? Resend",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF1F3E72),
                                fontSize: 13,
                                fontFamily: 'Lexend',
                              ),
                            ),
                          ),
                        ),
                        
                        const SizedBox(height: 24),
                        Center(
                          child: Text(
                            'Code sent to: ${widget.email}',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFF94A3B8),
                              fontFamily: 'Lexend',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOTPInput() {
    return Container(
      height: 64,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: _otpFocusNode.hasFocus ? const Color(0xFF1F3E72) : const Color(0xFFE2E8F0),
          width: 1.5,
        ),
      ),
      child: Center(
        child: TextField(
          controller: _otpController,
          focusNode: _otpFocusNode,
          keyboardType: TextInputType.number,
          maxLength: 6,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w800,
            letterSpacing: 16,
            color: Color(0xFF1F3E72),
            fontFamily: 'Lexend',
          ),
          decoration: const InputDecoration(
            border: InputBorder.none,
            counterText: "",
            hintText: '000000',
            hintStyle: TextStyle(
              color: Color(0xFFE2E8F0),
            ),
          ),
          onChanged: (val) {
            setState(() {});
            if (val.length == 6) {
              _verifyOTP();
            }
          },
        ),
      ),
    );
  }

  Widget _buildErrorBanner(String message) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.redAccent.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.redAccent.withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          const Icon(Icons.error_outline_rounded, color: Colors.redAccent, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(color: Colors.redAccent, fontSize: 13, fontWeight: FontWeight.w600, fontFamily: 'Lexend'),
            ),
          ),
        ],
      ),
    );
  }
}
