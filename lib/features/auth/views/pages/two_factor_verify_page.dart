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
    
    // Prevent flash of content when authenticated
    if (asyncAuth.asData?.value.status == AuthStatus.authenticated) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
          body: AppBackground(
        pattern: BackgroundPattern.checkerboard,
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: AppSpacing.xl),
                  // Header Section
                  EntryAnimation(
                    index: 0,
                    child: Column(
                      children: [
                        const ToriiIcon(size: 64),
                        const SizedBox(height: AppSpacing.md),
                        Text(
                          '2FA Verification',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: AppTypography.bold,
                            color: AppColors.secondary,
                            letterSpacing: -0.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        Text(
                          _isBackupCode 
                            ? 'Enter your 8-digit backup code' 
                            : 'Enter the code from your authenticator app',
                          style: const TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xxl),

                  // Verification Card
                  EntryAnimation(
                    index: 1,
                    verticalOffset: 20,
                    child: ElevatedCard(
                      borderRadius: BorderRadius.circular(AppRadius.md),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          if (errorMessage != null) ...[
                            _buildErrorBanner(errorMessage),
                            const SizedBox(height: AppSpacing.md),
                          ],
                          
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
                          
                          const SizedBox(height: AppSpacing.xl),
                          
                          AppButton(
                            text: 'Verify Security',
                            onPressed: () {
                              if (_isBackupCode) {
                                if (_backupController.text.length == 8) _verify(_backupController.text);
                              } else {
                                if (_otpController.text.length == 6) _verify(_otpController.text);
                              }
                            },
                            isLoading: isLoading,
                          ),
                          
                          const SizedBox(height: AppSpacing.md),
                          
                          TextButton(
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
                                fontWeight: AppTypography.bold,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: AppSpacing.xxxl),

                  // Bottom Text
                  EntryAnimation(
                    index: 2,
                    child: Column(
                      children: [
                        TextButton(
                          onPressed: () => ref.read(authStateProvider.notifier).logout(),
                          child: const Text(
                            'Cancel and sign out',
                            style: TextStyle(
                              fontWeight: AppTypography.bold,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
                          child: const Text(
                            'Về trang chủ',
                            style: TextStyle(
                              fontSize: 13,
                              color: AppColors.textSecondary,
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
        color: AppColors.grey100.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(
          color: focusNode.hasFocus ? AppColors.primary : AppColors.grey200,
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
            fontSize: maxLength == 6 ? 32 : 28,
            fontWeight: AppTypography.bold,
            letterSpacing: maxLength == 6 ? 16 : 8,
            color: AppColors.secondary,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            counterText: "",
            hintText: hintText,
            hintStyle: const TextStyle(
              color: AppColors.grey300,
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
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        color: AppColors.errorLight.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(color: AppColors.error.withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          const Icon(Icons.error_outline, color: AppColors.error, size: 16),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(color: AppColors.errorDark, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
