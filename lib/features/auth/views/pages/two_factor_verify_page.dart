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
  final List<TextEditingController> _controllers = List.generate(6, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());
  bool _isBackupCode = false;
  final TextEditingController _backupController = TextEditingController();

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    _backupController.dispose();
    super.dispose();
  }

  void _onType(int index, String value) {
    if (value.isNotEmpty && index < 5) {
      _focusNodes[index + 1].requestFocus();
    }
    _checkAndVerify();
  }

  void _checkAndVerify() {
    final code = _controllers.map((e) => e.text).join();
    if (code.length == 6) {
      _verify(code);
    }
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
                          child: _buildCodeInput(),
                        )
                      else
                        EntryAnimation(
                          index: 3,
                          child: ZenTextField(
                            label: 'BACKUP CODE',
                            controller: _backupController,
                            hintText: 'Enter 8-digit backup code',
                            icon: Icons.restore_page_rounded,
                            textInputAction: TextInputAction.done,
                            onSubmitted: (val) => _verify(val),
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
                          onPressed: () => setState(() => _isBackupCode = !_isBackupCode),
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

  Widget _buildCodeInput() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(6, (index) {
        return SizedBox(
          width: 45,
          child: TextField(
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            maxLength: 1,
            style: const TextStyle(fontSize: 24, fontWeight: AppTypography.bold, color: AppColors.primary),
            decoration: InputDecoration(
              counterText: "",
              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.borderLight)),
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.primary, width: 2)),
            ),
            onChanged: (value) => _onType(index, value),
          ),
        );
      }),
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
