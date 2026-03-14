import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/features/auth/providers/auth_providers.dart';
import 'package:torii_app/features/auth/models/auth_state.dart';
import 'package:torii_app/core/widgets/widgets.dart';

class TwoFactorVerifyPage extends ConsumerStatefulWidget {
  const TwoFactorVerifyPage({super.key});

  @override
  ConsumerState<TwoFactorVerifyPage> createState() => _TwoFactorVerifyPageState();
}

class _TwoFactorVerifyPageState extends ConsumerState<TwoFactorVerifyPage> {
  final TextEditingController _otpController = TextEditingController();
  final TextEditingController _backupController = TextEditingController();
  final FocusNode _otpFocusNode = FocusNode();
  final FocusNode _backupFocusNode = FocusNode();
  
  bool _isBackupCode = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        if (_isBackupCode) {
          _backupFocusNode.requestFocus();
        } else {
          _otpFocusNode.requestFocus();
        }
      }
    });
  }

  @override
  void dispose() {
    _otpController.dispose();
    _backupController.dispose();
    _otpFocusNode.dispose();
    _backupFocusNode.dispose();
    super.dispose();
  }

  void _verify(String code) {
    final asyncAuth = ref.read(authStateProvider);
    final state = asyncAuth.asData?.value;
    
    if (state == null || state.status != AuthStatus.pending2FA || state.tempToken == null) return;

    if (_isBackupCode) {
      ref.read(authStateProvider.notifier).verify2FA(state.tempToken!, code, isBackupCode: true);
    } else {
      ref.read(authStateProvider.notifier).verify2FA(state.tempToken!, code);
    }
  }

  @override
  Widget build(BuildContext context) {
    final asyncAuth = ref.watch(authStateProvider);
    final isLoading = asyncAuth.isLoading;
    final authState = asyncAuth.asData?.value;
    final errorMessage = authState?.error;
    
    if (asyncAuth.asData?.value.status == AuthStatus.authenticated) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

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
                        onPressed: () => ref.read(authStateProvider.notifier).logout(),
                        icon: const Icon(Icons.arrow_back_rounded, color: Color(0xFF1F3E72)),
                      ),
                      const Spacer(),
                      const Text(
                        'Security Check',
                        style: TextStyle(
                          color: Color(0xFF1F3E72),
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Lexend',
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
                                  color: const Color(0xFF10B981).withValues(alpha: 0.05),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: const Icon(
                                  Icons.security_rounded,
                                  size: 40,
                                  color: Color(0xFF10B981),
                                ),
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                '2FA Verification',
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
                                "Enter the security code from your authenticator app.",
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

                        // Input
                        Text(
                          _isBackupCode ? 'Backup Code' : 'Security Code',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF1F3E72),
                            fontFamily: 'Lexend',
                          ),
                        ),
                        const SizedBox(height: 12),
                        if (!_isBackupCode)
                          _buildOTPInput(
                            controller: _otpController,
                            focusNode: _otpFocusNode,
                            maxLength: 6,
                            hintText: '000000',
                          )
                        else
                          _buildOTPInput(
                            controller: _backupController,
                            focusNode: _backupFocusNode,
                            maxLength: 8,
                            hintText: '00000000',
                          ),
                        
                        const SizedBox(height: 32),
                        
                        // Verify Button
                        SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: ElevatedButton(
                            onPressed: isLoading ? null : () {
                              if (_isBackupCode) {
                                if (_backupController.text.length == 8) _verify(_backupController.text);
                              } else {
                                if (_otpController.text.length == 6) _verify(_otpController.text);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF1F3E72),
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
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
                                    'VERIFY SECURITY',
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
                            onPressed: () {
                              setState(() {
                                _isBackupCode = !_isBackupCode;
                                _otpController.clear();
                                _backupController.clear();
                              });
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                if (mounted) {
                                  if (_isBackupCode) {
                                    _backupFocusNode.requestFocus();
                                  } else {
                                    _otpFocusNode.requestFocus();
                                  }
                                }
                              });
                            },
                            child: Text(
                              _isBackupCode ? 'Use Authenticator App' : 'Use Backup Code',
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF1F3E72),
                                fontSize: 13,
                                fontFamily: 'Lexend',
                              ),
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

  Widget _buildOTPInput({
    required TextEditingController controller,
    required FocusNode focusNode,
    required int maxLength,
    required String hintText,
  }) {
    return Container(
      height: 64,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: focusNode.hasFocus ? const Color(0xFF1F3E72) : const Color(0xFFE2E8F0),
          width: 1.5,
        ),
      ),
      child: Center(
        child: TextField(
          controller: controller,
          focusNode: focusNode,
          keyboardType: TextInputType.number,
          maxLength: maxLength,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: maxLength == 6 ? 32 : 24,
            fontWeight: FontWeight.w800,
            letterSpacing: maxLength == 6 ? 16 : 8,
            color: const Color(0xFF1F3E72),
            fontFamily: 'Lexend',
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            counterText: "",
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Color(0xFFE2E8F0),
            ),
          ),
          onChanged: (val) {
            setState(() {});
            if (val.length == maxLength) {
              _verify(val);
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
