import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:torii_app/features/auth/models/auth_state.dart';
import 'package:torii_app/features/auth/providers/auth_providers.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  bool _rememberMe = false;
  bool _obscurePassword = true;
  bool _isLoading = false;
  bool _pendingNavigateHome = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Navigate ONLY after auth state is truly authenticated.
    // This prevents HomeScreen flashing "guest" UI for a moment.
    ref.listenManual(authStateProvider, (previous, next) {
      if (!_pendingNavigateHome) return;
      final authed = next.valueOrNull?.status == AuthStatus.authenticated;
      if (authed && mounted) {
        _pendingNavigateHome = false;
        context.go('/');
      }
    });
  }

  /// Sau khi [AuthNotifier.login] trả về true, state có thể đã là [AuthStatus.authenticated]
  /// *trước* khi [setState] gán [_pendingNavigateHome] — listener lúc đó bỏ qua và UI kẹt "Đang xử lý".
  void _completeLoginNavigationAfterOk() {
    if (!mounted) return;
    final auth = ref.read(authStateProvider).valueOrNull;
    if (auth?.status == AuthStatus.authenticated) {
      _pendingNavigateHome = false;
      context.go('/');
      return;
    }
    if (auth?.status == AuthStatus.pending2FA) {
      setState(() {
        _pendingNavigateHome = false;
        _isLoading = false;
      });
      return;
    }
    setState(() {
      _pendingNavigateHome = true;
      _isLoading = true;
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final a = ref.read(authStateProvider).valueOrNull;
      if (a?.status == AuthStatus.authenticated && _pendingNavigateHome) {
        setState(() => _pendingNavigateHome = false);
        context.go('/');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.textPrimary, size: 20),
          onPressed: () => context.go('/'),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 480),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Torii Nihongo',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: AppColors.primary,
                        letterSpacing: 0.4,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Đăng nhập',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.2,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Tiếp tục hành trình học tiếng Nhật của bạn',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: AppColors.grey700,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Email',
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 6),
                  TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Nhập email của bạn',
                      prefixIcon: const Icon(Icons.email_outlined),
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide:
                            const BorderSide(color: AppColors.grey300),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide:
                            const BorderSide(color: AppColors.grey300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide:
                            const BorderSide(color: AppColors.primary),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    'Mật khẩu',
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 6),
                  TextField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      hintText: 'Nhập mật khẩu',
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: AppColors.textTertiary,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide:
                            const BorderSide(color: AppColors.grey300),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide:
                            const BorderSide(color: AppColors.grey300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide:
                            const BorderSide(color: AppColors.primary),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 22,
                            height: 22,
                            child: Checkbox(
                              value: _rememberMe,
                              onChanged: (val) {
                                setState(() {
                                  _rememberMe = val ?? false;
                                });
                              },
                              activeColor: AppColors.primary,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Ghi nhớ đăng nhập',
                            style: theme.textTheme.bodySmall,
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          context.go('/forgot-password');
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: const Size(0, 32),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: const Text(
                          'Quên mật khẩu?',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: _isLoading
                          ? null
                          : () async {
                              final email = _emailController.text.trim();
                              final password = _passwordController.text;
                              if (email.isEmpty || password.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Vui lòng nhập email và mật khẩu',
                                    ),
                                  ),
                                );
                                return;
                              }
                              if (mounted) setState(() => _isLoading = true);
                              final notifier =
                                  ref.read(authNotifierProvider.notifier);
                              final ok =
                                  await notifier.login(email, password);
                              if (!mounted) return;
                              if (ok) {
                                _completeLoginNavigationAfterOk();
                              } else {
                                setState(() => _isLoading = false);
                                final asyncAuth =
                                    ref.read(authNotifierProvider);
                                final message = asyncAuth.when(
                                  data: (s) =>
                                      s.error ?? 'Đăng nhập thất bại',
                                  error: (e, _) => e.toString(),
                                  loading: () => 'Đang xử lý...',
                                );
                                if (mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(message)),
                                  );
                                }
                              }
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.textOnPrimary,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        _isLoading ? 'Đang xử lý...' : 'Đăng nhập',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      const Expanded(
                        child: Divider(color: AppColors.grey300),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text(
                          'Hoặc',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: AppColors.textTertiary,
                          ),
                        ),
                      ),
                      const Expanded(
                        child: Divider(color: AppColors.grey300),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  _buildSocialButton(
                    icon: Icons.facebook,
                    label: 'Đăng nhập với Facebook',
                    iconColor: const Color(0xFF1877F2),
                    onPressed: () async {
                      setState(() => _isLoading = true);
                      await ref
                          .read(authNotifierProvider.notifier)
                          .signInWithFacebook();
                      setState(() => _isLoading = false);

                      if (!mounted) return;

                      final authState =
                          ref.read(authNotifierProvider).valueOrNull;
                      if (authState?.status == AuthStatus.authenticated) {
                        context.go('/');
                      } else if (authState?.error != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(authState!.error!),
                            backgroundColor: AppColors.error,
                          ),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  _buildSocialButton(
                    leading: const FaIcon(
                      FontAwesomeIcons.google,
                      size: 20,
                      color: Color(0xFF4285F4),
                    ),
                    label: 'Đăng nhập với Google',
                    onPressed: () async {
                      final notifier =
                          ref.read(authNotifierProvider.notifier);
                      await notifier.signInWithGoogle();

                      if (!mounted) return;

                      final authState =
                          ref.read(authNotifierProvider).valueOrNull;
                      if (authState?.status == AuthStatus.authenticated) {
                        context.go('/');
                      } else if (authState?.error != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(authState!.error!),
                            backgroundColor: AppColors.error,
                          ),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Chưa có tài khoản? ',
                        style: theme.textTheme.bodyMedium,
                      ),
                      GestureDetector(
                        onTap: () {
                          context.go('/register');
                        },
                        child: const Text(
                          'Đăng ký ngay',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton({
    IconData? icon,
    Widget? leading,
    required String label,
    required VoidCallback onPressed,
    Color? iconColor,
  }) {
    assert(icon != null || leading != null);
    final Widget prefix = leading ??
        Icon(icon!, color: iconColor ?? AppColors.textPrimary, size: 22);
    return SizedBox(
      width: double.infinity,
      height: 46,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: prefix,
        label: Text(
          label,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: AppColors.grey300),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
