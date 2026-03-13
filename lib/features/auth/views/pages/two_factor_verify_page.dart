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
                    onPressed: () => ref.read(authStateProvider.notifier).logout(),
                    icon: const Icon(Icons.arrow_back, size: 18),
                    label: const Text('Back to Sign In'),
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
                                'Two-Factor Auth',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: AppTypography.black,
                                  color: AppColors.secondary,
                                  letterSpacing: -0.5,
                                ),
                              ),
                              SizedBox(height: AppSpacing.sm),
                              Text(
                                'Protect your account with an extra layer of security.',
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

                        // Verification Card
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
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                if (errorMessage != null) ...[
                                  _buildErrorBanner(errorMessage),
                                  const SizedBox(height: AppSpacing.md),
                                ],
                                
                                Text(
                                  _isBackupCode 
                                    ? '8-Digit Backup Code' 
                                    : '6-Digit Authenticator Code',
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: AppTypography.bold,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                                const SizedBox(height: AppSpacing.sm),
                                
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
                                  text: 'VERIFY SECURITY',
                                  onPressed: () {
                                    if (_isBackupCode) {
                                      if (_backupController.text.length == 8) _verify(_backupController.text);
                                    } else {
                                      if (_otpController.text.length == 6) _verify(_otpController.text);
                                    }
                                  },
                                  isLoading: isLoading,
                                  padding: const EdgeInsets.symmetric(vertical: 16),
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
                                      fontWeight: AppTypography.black,
                                      color: AppColors.primary,
                                      fontSize: 13,
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
                          child: TextButton(
                            onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
                            child: const Text(
                              'Back to Home',
                              style: TextStyle(
                                fontSize: 13,
                                color: AppColors.textSecondary,
                                fontWeight: AppTypography.bold,
                              ),
                            ),
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

  Widget _buildOTPInput({
    required TextEditingController controller,
    required FocusNode focusNode,
    required int maxLength,
    required String hintText,
  }) {
    return Container(
      height: 64,
      decoration: BoxDecoration(
        color: AppColors.grey50,
        borderRadius: BorderRadius.circular(AppRadius.xs),
        border: Border.all(
          color: focusNode.hasFocus ? AppColors.primary : AppColors.borderLight,
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
            fontWeight: AppTypography.black,
            letterSpacing: maxLength == 6 ? 16 : 8,
            color: AppColors.secondary,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            counterText: "",
            hintText: hintText,
            hintStyle: const TextStyle(
              color: AppColors.grey200,
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
