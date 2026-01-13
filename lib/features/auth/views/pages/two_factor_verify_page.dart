import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/features/auth/providers/auth_providers.dart';
import 'package:torii_app/features/auth/models/auth_state_sealed.dart';
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
    // Auto-focus logic
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
    final state = ref.read(authStateProvider);
    if (state is! AuthTwoFactorRequired) return;

    if (_isBackupCode) {
      ref.read(authStateProvider.notifier).verify2FA(state.tempToken, code, isBackupCode: true);
    } else {
      ref.read(authStateProvider.notifier).verify2FA(state.tempToken, code);
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(authStateProvider, (previous, next) {
      if (next is AuthAuthenticated) {
        context.go('/');
      }
    });

    final authState = ref.watch(authStateProvider);
    final isLoading = authState is AuthLoading;
    String? errorMessage;
    String? helpMessage;

    if (authState is AuthTwoFactorRequired) {
      helpMessage = authState.message;
    } else if (authState is AuthError) {
      errorMessage = authState.message;
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      body: ZenBackground(
        child: SafeArea(
          child: Column(
            children: [
              _buildAppBar(context),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
                  child: Column(
                    children: [
                      const SizedBox(height: AppSpacing.lg),
                      _buildHeader(context),
                      const SizedBox(height: AppSpacing.xxxl),
                      
                      if (errorMessage != null) ...[
                        EntryAnimation(
                          index: 2,
                          child: _buildErrorBanner(errorMessage),
                        ),
                        const SizedBox(height: AppSpacing.lg),
                      ],
                      
                      if (!_isBackupCode)
                        EntryAnimation(
                          index: 3,
                          verticalOffset: 20,
                          child: _buildSingleInputField(
                            controller: _otpController,
                            focusNode: _otpFocusNode,
                            hintText: '••••••',
                            maxLength: 6,
                            letterSpacing: 16.0,
                            onChanged: (val) {
                              if (val.length == 6) _verify(val);
                            },
                          ),
                        )
                      else
                        EntryAnimation(
                          index: 3,
                          child: _buildSingleInputField(
                            controller: _backupController,
                            focusNode: _backupFocusNode,
                            hintText: '••••••••',
                            maxLength: 8,
                            letterSpacing: 12.0, // Slightly tighter for 8 digits
                            onChanged: (val) {
                              if (val.length == 8) _verify(val);
                            },
                          ),
                        ),

                      if (helpMessage != null && !_isBackupCode) ...[
                        const SizedBox(height: AppSpacing.xl),
                        Text(
                          helpMessage,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.textSecondary.withOpacity(0.5),
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                      
                      const SizedBox(height: AppSpacing.xxxl),
                      
                      EntryAnimation(
                        index: 4,
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              _isBackupCode = !_isBackupCode;
                              _otpController.clear();
                              _backupController.clear();
                            });
                            // Re-focus after frame
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
                            _isBackupCode ? 'USE AUTHENTICATOR APP' : 'USE BACKUP CODE',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: AppTypography.black,
                              letterSpacing: 1.0,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.all(AppSpacing.xl),
                child: ZenButton(
                  text: 'CANCEL LOGISTICS',
                  onPressed: () => ref.read(authStateProvider.notifier).logout(),
                  isFullWidth: true,
                  isPrimary: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.lg),
      child: Row(
        children: [
          EntryAnimation(
            delay: const Duration(milliseconds: 200),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
              onPressed: () => ref.read(authStateProvider.notifier).logout(),
              color: AppColors.textPrimary.withOpacity(0.4),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      children: [
        EntryAnimation(
          index: 0,
          verticalOffset: -20,
          child: Container(
            width: 72, height: 72,
            decoration: BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.2),
                  blurRadius: 25, offset: const Offset(0, 8),
                ),
              ],
            ),
            child: const Icon(Icons.vibration_rounded, color: Colors.white, size: 36),
          ),
        ),
        const SizedBox(height: AppSpacing.xl),
        EntryAnimation(
          index: 1,
          child: Column(
            children: [
              Text(
                '2FA VERIFICATION',
                style: TextStyle(
                  fontFamily: AppTypography.fontFamilySerif,
                  fontSize: AppTypography.fontSize2xl,
                  letterSpacing: -1.0,
                  fontWeight: AppTypography.bold,
                  fontStyle: FontStyle.italic,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'MULTI-FACTOR AUTHENTICATION',
                style: TextStyle(
                  fontSize: 9,
                  fontWeight: AppTypography.black,
                  letterSpacing: 4.0,
                  color: AppColors.primary.withOpacity(0.5),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Refactored to match VerifyOTPPage style but reusable
  Widget _buildSingleInputField({
    required TextEditingController controller,
    required FocusNode focusNode,
    required String hintText,
    required int maxLength,
    required double letterSpacing,
    required ValueChanged<String> onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.6),
        borderRadius: BorderRadius.circular(AppRadius.full),
        border: Border.all(color: AppColors.borderLight.withOpacity(0.3)),
      ),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        keyboardType: TextInputType.number,
        maxLength: maxLength,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 32,
          fontWeight: AppTypography.bold,
          letterSpacing: letterSpacing,
          color: AppColors.primary,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          counterText: "",
          hintText: hintText,
          hintStyle: TextStyle(
            color: AppColors.textTertiary.withOpacity(0.15),
            letterSpacing: letterSpacing,
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildErrorBanner(String message) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.errorLight.withOpacity(0.6),
        borderRadius: BorderRadius.circular(AppRadius.full),
        border: Border.all(color: AppColors.error.withOpacity(0.1)),
      ),
      child: Row(
        children: [
          const Icon(Icons.error_outline_rounded, color: AppColors.error, size: 18),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                color: AppColors.errorDark,
                fontSize: 12,
                fontWeight: AppTypography.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
