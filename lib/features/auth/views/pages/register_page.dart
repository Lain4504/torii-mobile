import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:torii_app/features/auth/providers/auth_providers.dart';
import 'package:torii_app/features/auth/models/auth_state.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/widgets/widgets.dart';
import 'package:torii_app/core/localization/l10n/app_localizations.dart';

/// Register Page - Zen UI Pro Max - Premium Rebuild
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
    await ref.read(authStateProvider.notifier).register(
      _emailController.text.trim(),
      _passwordController.text.trim(),
      _displayNameController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final asyncAuth = ref.watch(authStateProvider);
    final l10n = AppLocalizations.of(context)!;
    
    // Listen for registration completion
    ref.listen<AsyncValue<AuthState>>(authStateProvider, (previous, next) {
       final prevStatus = previous?.asData?.value.status;
       final nextState = next.asData?.value;

      if (nextState != null && prevStatus != nextState.status) {
        if (nextState.status == AuthStatus.unauthenticated && prevStatus != null) { 
           // Technically if we were loading/unauth before, and now unauth?
           // The logic for "success" in registration is tricky because both start and end might be unauth unless we have a specific "loading" STATE inside AuthState too, or we infer from AsyncLoading -> AsyncData(Unauth).
           // But AsyncNotifier handles AsyncLoading.
           
           if (!next.isLoading && !next.hasError && previous!.isLoading) {
              // Completed loading successfully
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${l10n.success}! ${l10n.signInToContinue}')),
              );
              WidgetsBinding.instance.addPostFrameCallback((_) {
                 if (mounted) context.go('/login');
              });
           }
        }
      }
    });

    final isLoading = asyncAuth.isLoading;
    final errorMessage = asyncAuth.error?.toString() ?? asyncAuth.asData?.value.error;

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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(height: AppSpacing.lg),
                        _buildHeader(context, l10n),
                        const SizedBox(height: AppSpacing.xxl),
                        
                        if (errorMessage != null) ...[
                          EntryAnimation(
                            index: 2,
                            child: _buildErrorBanner(errorMessage),
                          ),
                          const SizedBox(height: AppSpacing.lg),
                        ],
                        
                        EntryAnimation(
                          index: 3,
                          verticalOffset: 20,
                          child: Column(
                            children: [
                              ZenTextField(
                                label: l10n.displayName.toUpperCase(),
                                controller: _displayNameController,
                                hintText: 'How should we call you?',
                                icon: Icons.face_retouching_natural_rounded,
                                validator: (val) => (val == null || val.isEmpty) ? l10n.nameRequired : null,
                              ),
                              const SizedBox(height: AppSpacing.md),
                              ZenTextField(
                                label: l10n.email.toUpperCase(),
                                controller: _emailController,
                                hintText: 'your.email@example.com',
                                icon: Icons.alternate_email_rounded,
                                keyboardType: TextInputType.emailAddress,
                                validator: (val) => (val == null || !val.contains('@')) ? l10n.pleaseEnterValidEmail : null,
                              ),
                              const SizedBox(height: AppSpacing.md),
                              ZenTextField(
                                label: l10n.password.toUpperCase(),
                                controller: _passwordController,
                                hintText: '••••••••',
                                icon: Icons.fingerprint_rounded,
                                obscureText: _obscurePassword,
                                validator: (val) => (val == null || val.length < 8) ? l10n.passwordTooShort : null,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                                    size: 18, color: AppColors.textTertiary,
                                  ),
                                  onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                                ),
                              ),
                              const SizedBox(height: AppSpacing.md),
                              ZenTextField(
                                label: l10n.confirmPassword.toUpperCase(),
                                controller: _confirmPasswordController,
                                hintText: '••••••••',
                                icon: Icons.verified_user_outlined,
                                obscureText: _obscureConfirmPassword,
                                validator: (val) => (val != _passwordController.text) ? l10n.passwordMismatch : null,
                                textInputAction: TextInputAction.done,
                                onSubmitted: (_) => _register(),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscureConfirmPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                                    size: 18, color: AppColors.textTertiary,
                                  ),
                                  onPressed: () => setState(() => _obscureConfirmPassword = !_obscureConfirmPassword),
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                        const SizedBox(height: AppSpacing.xl),
                        
                        EntryAnimation(
                          index: 4,
                          child: ZenButton(
                            text: l10n.createAccount.toUpperCase(),
                            onPressed: _register,
                            isLoading: isLoading,
                            isFullWidth: true,
                            icon: Icons.person_add_rounded,
                          ),
                        ),
                        
                        const SizedBox(height: AppSpacing.lg),
                        
                        EntryAnimation(
                          index: 5,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                            child: Text(
                              l10n.termsAndConditions,
                              style: TextStyle(
                                fontSize: 10,
                                color: AppColors.textTertiary.withValues(alpha: 0.5),
                                height: 1.6,
                                fontWeight: AppTypography.medium,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        
                        const SizedBox(height: AppSpacing.xxl),
                        EntryAnimation(
                          index: 6,
                          child: _buildFooter(context, l10n),
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

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Row(
        children: [
          EntryAnimation(
            delay: const Duration(milliseconds: 200),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
              onPressed: () => context.go('/login'),
              color: AppColors.textPrimary.withValues(alpha: 0.4),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, AppLocalizations l10n) {
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
                  color: AppColors.primary.withValues(alpha: 0.2),
                  blurRadius: 25, offset: const Offset(0, 8),
                ),
              ],
            ),
            child: const Icon(Icons.waves_rounded, color: Colors.white, size: 36),
          ),
        ),
        const SizedBox(height: AppSpacing.xl),
        EntryAnimation(
          index: 1,
          child: Column(
            children: [
              Text(
                l10n.appTitle.toUpperCase(),
                style: const TextStyle(
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
                l10n.initializeLearning.toUpperCase(),
                style: TextStyle(
                  fontSize: 9,
                  fontWeight: AppTypography.black,
                  letterSpacing: 5.0,
                  color: AppColors.primary.withValues(alpha: 0.5),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildErrorBanner(String message) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.errorLight.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(AppRadius.full),
        border: Border.all(color: AppColors.error.withValues(alpha: 0.1)),
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

  Widget _buildFooter(BuildContext context, AppLocalizations l10n) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              l10n.alreadyLearner.toUpperCase(),
              style: TextStyle(
                fontSize: 12,
                color: AppColors.textSecondary.withValues(alpha: 0.5),
                fontWeight: AppTypography.medium,
              ),
            ),
            const SizedBox(width: 8),
            InkWell(
              onTap: () => context.go('/login'),
              borderRadius: BorderRadius.circular(4),
              child: Text(
                l10n.signIn.toUpperCase(),
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: AppTypography.black,
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
