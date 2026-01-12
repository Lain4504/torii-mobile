import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../providers/auth_providers.dart';
import '../../models/auth_state_sealed.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../core/localization/l10n/app_localizations.dart';

/// Login Page - Minimalist Authentication
/// 
/// A clean, focused login experience with emphasis on simplicity.
class LoginPage extends ConsumerStatefulWidget {
  final String? redirectTo;

  const LoginPage({super.key, this.redirectTo});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> 
    with SingleTickerProviderStateMixin {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: AppDuration.slow,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: AppCurves.easeOut,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _login() async {
    if (!_formKey.currentState!.validate()) return;

    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    await ref.read(authStateProvider.notifier).login(email, password);

    final authState = ref.read(authStateProvider);
    if (authState is AuthAuthenticated) {
      if (mounted) {
        final destination = widget.redirectTo ?? '/';
        context.go(destination);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authStateProvider);
    final isLoading = authState is AuthLoading;
    final theme = Theme.of(context);
    String? errorMessage;

    if (authState is AuthError) {
      errorMessage = authState.message;
    } else if (authState is AuthExpired) {
      errorMessage = authState.message;
    }

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: SafeArea(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.pageHorizontal,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: AppSpacing.xl),
                  
                  // Header
                  _buildHeader(context),
                  
                  const SizedBox(height: AppSpacing.xxl),
                  
                  // Error Message
                  if (errorMessage != null) ...[
                    _buildErrorMessage(errorMessage),
                    const SizedBox(height: AppSpacing.lg),
                  ],
                  
                  // Email Field
                  _buildEmailField(theme),
                  
                  const SizedBox(height: AppSpacing.md),
                  
                  // Password Field
                  _buildPasswordField(theme),
                  
                  const SizedBox(height: AppSpacing.sm),
                  
                  // Forgot Password
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => context.push('/auth/forgot-password'),
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        AppLocalizations.of(context)!.forgotPassword,
                        style: TextStyle(
                          fontSize: AppTypography.fontSizeSm,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: AppSpacing.xl),
                  
                  // Login Button
                  _buildLoginButton(isLoading),
                  
                  const SizedBox(height: AppSpacing.xxl),
                  
                  // Divider
                  _buildDivider(theme),
                  
                  const SizedBox(height: AppSpacing.lg),
                  
                  // Social Login
                  _buildSocialLogin(theme),
                  
                  const SizedBox(height: AppSpacing.xxl),
                  
                  // Footer
                  _buildFooter(theme),
                  
                  const SizedBox(height: AppSpacing.xl),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final theme = Theme.of(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Logo
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
          child: const Center(
            child: Text(
              '鳥',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        Text(
          AppLocalizations.of(context)!.welcomeBack,
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: AppTypography.bold,
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          AppLocalizations.of(context)!.signInToContinue,
          style: theme.textTheme.bodyLarge?.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildErrorMessage(String message) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.errorLight,
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(color: AppColors.error.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.error_outline_rounded,
            color: AppColors.error,
            size: AppIconSize.sm,
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                color: AppColors.errorDark,
                fontSize: AppTypography.fontSizeSm,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmailField(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.email,
          style: theme.textTheme.labelLarge,
        ),
        const SizedBox(height: AppSpacing.sm),
        TextFormField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          style: theme.textTheme.bodyLarge,
          decoration: const InputDecoration(
            hintText: 'your.email@example.com',
            prefixIcon: Icon(Icons.email_outlined, size: AppIconSize.sm),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return AppLocalizations.of(context)!.pleaseEnterEmail;
            }
            if (!value.contains('@')) {
              return AppLocalizations.of(context)!.pleaseEnterValidEmail;
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildPasswordField(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.password,
          style: theme.textTheme.labelLarge,
        ),
        const SizedBox(height: AppSpacing.sm),
        TextFormField(
          controller: _passwordController,
          obscureText: _obscureText,
          textInputAction: TextInputAction.done,
          onFieldSubmitted: (_) => _login(),
          style: theme.textTheme.bodyLarge,
          decoration: InputDecoration(
            hintText: 'Enter your password',
            prefixIcon: const Icon(Icons.lock_outline_rounded, size: AppIconSize.sm),
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText 
                    ? Icons.visibility_off_outlined 
                    : Icons.visibility_outlined,
                size: AppIconSize.sm,
              ),
              onPressed: () => setState(() => _obscureText = !_obscureText),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return AppLocalizations.of(context)!.pleaseEnterPassword;
            }
            if (value.length < 6) {
              return AppLocalizations.of(context)!.passwordMinLength;
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildLoginButton(bool isLoading) {
    return SizedBox(
      height: 52,
      child: ElevatedButton(
        onPressed: isLoading ? null : _login,
        child: isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
            : Text(AppLocalizations.of(context)!.signIn),
      ),
    );
  }

  Widget _buildDivider(ThemeData theme) {
    return Row(
      children: [
        Expanded(child: Divider(color: theme.dividerColor)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          child: Text(
            AppLocalizations.of(context)!.orContinueWith,
            style: theme.textTheme.bodySmall,
          ),
        ),
        Expanded(child: Divider(color: theme.dividerColor)),
      ],
    );
  }

  Widget _buildSocialLogin(ThemeData theme) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.apple, size: AppIconSize.md),
            label: const Text('Apple'),
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.g_mobiledata_rounded, size: AppIconSize.lg),
            label: const Text('Google'),
          ),
        ),
      ],
    );
  }

  Widget _buildFooter(ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppLocalizations.of(context)!.dontHaveAccount,
          style: theme.textTheme.bodyMedium,
        ),
        TextButton(
          onPressed: () => context.push('/register'),
          child: Text(
            AppLocalizations.of(context)!.signUp,
            style: TextStyle(
              fontWeight: AppTypography.semiBold,
              color: theme.colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}
