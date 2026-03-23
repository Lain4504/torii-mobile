import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:torii_app/features/auth/providers/auth_providers.dart';
import 'package:torii_app/features/auth/models/auth_state.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  bool _agreeToTerms = false;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _isLoading = false;

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.surface,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: theme.colorScheme.onSurface, size: 20),
          onPressed: () => context.go('/login'),
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
                        color: theme.colorScheme.primary,
                        letterSpacing: 0.4,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Tạo tài khoản',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.2,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Bắt đầu hành trình chinh phục tiếng Nhật',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Form fields
                  _buildLabel('Họ và tên (full name)'),
              _buildTextField(
                theme,
                controller: _fullNameController,
                hint: 'Nhập họ và tên đầy đủ của bạn',
                icon: Icons.person_outline,
              ),
              
                  _buildLabel('Email'),
                  _buildTextField(
                theme,
                controller: _emailController,
                hint: 'Nhập email của bạn',
                icon: Icons.email_outlined,
              ),

                  _buildLabel('Mật khẩu'),
                  _buildTextField(
                theme,
                controller: _passwordController,
                hint: 'Nhập mật khẩu', 
                icon: Icons.lock_outline, 
                isPassword: true,
                obscureText: _obscurePassword,
                onToggle: () => setState(() => _obscurePassword = !_obscurePassword),
              ),

                  _buildLabel('Xác nhận mật khẩu'),
                  _buildTextField(
                theme,
                controller: _confirmPasswordController,
                hint: 'Nhập lại mật khẩu', 
                icon: Icons.lock_reset_outlined, 
                isPassword: true,
                obscureText: _obscureConfirmPassword,
                onToggle: () => setState(() => _obscureConfirmPassword = !_obscureConfirmPassword),
              ),

                  const SizedBox(height: 14),
                  Row(
                    children: [
                      SizedBox(
                        width: 22,
                        height: 22,
                        child: Checkbox(
                          value: _agreeToTerms,
                          onChanged: (val) {
                            setState(() {
                              _agreeToTerms = val ?? false;
                            });
                          },
                          activeColor: theme.colorScheme.primary,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Expanded(
                        child: Text(
                          'Tôi đồng ý với Điều khoản sử dụng',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: _isLoading
                          ? null
                          : () async {
                          final fullName = _fullNameController.text.trim();
                          final email = _emailController.text.trim();
                          final password = _passwordController.text;
                          final confirm = _confirmPasswordController.text;

                          if (fullName.isEmpty ||
                              email.isEmpty ||
                              password.isEmpty ||
                              confirm.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text('Vui lòng nhập đầy đủ thông tin bắt buộc'),
                              ),
                            );
                            return;
                          }
                          if (fullName.length < 2) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'Họ và tên phải có ít nhất 2 ký tự',
                                ),
                              ),
                            );
                            return;
                          }
                          if (password != confirm) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text('Mật khẩu và xác nhận mật khẩu không khớp'),
                              ),
                            );
                            return;
                          }
                          if (!_agreeToTerms) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'Bạn cần đồng ý với Điều khoản sử dụng'),
                              ),
                            );
                            return;
                          }

                          setState(() => _isLoading = true);
                          final notifier =
                              ref.read(authNotifierProvider.notifier);
                          final ok =
                              await notifier.register(email, password, fullName);
                          setState(() => _isLoading = false);
                          if (ok) {
                            if (mounted) {
                              context.go(
                                '/verify-email',
                                extra: {
                                  'email': email,
                                  'mode': 'registration',
                                },
                              );
                            }
                          } else {
                            if (mounted) {
                              final authState = ref.read(authNotifierProvider).valueOrNull;
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(authState?.error ?? 'Đăng ký thất bại. Vui lòng thử lại.'),
                                  backgroundColor: theme.colorScheme.error,
                                ),
                              );
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: theme.colorScheme.primary,
                          foregroundColor: theme.colorScheme.onPrimary,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      child: Text(
                        _isLoading ? 'Đang xử lý...' : 'Tạo tài khoản',
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
                      Expanded(
                        child: Divider(color: theme.colorScheme.outlineVariant),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          'hoặc',
                          style: TextStyle(color: theme.colorScheme.onSurfaceVariant),
                        ),
                      ),
                      Expanded(
                        child: Divider(color: theme.colorScheme.outlineVariant),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  _buildSocialButton(
                    'Đăng ký với Facebook',
                    icon: Icons.facebook,
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
                            backgroundColor: theme.colorScheme.error,
                          ),
                        );
                      }
                    },
                    iconColor: const Color(0xFF1877F2),
                  ),
                  const SizedBox(height: 10),
                  _buildSocialButton(
                    'Đăng ký với Google',
                    leading: const FaIcon(
                      FontAwesomeIcons.google,
                      size: 20,
                      color: Color(0xFF4285F4),
                    ),
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
                            backgroundColor: theme.colorScheme.error,
                          ),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Đã có tài khoản? '),
                      GestureDetector(
                        onTap: () {
                          context.go('/login');
                        },
                        child: Text(
                          'Đăng nhập',
                          style: TextStyle(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, top: 16.0),
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.w600)),
    );
  }

  Widget _buildTextField(
    ThemeData theme, {
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    bool isPassword = false,
    bool obscureText = false,
    VoidCallback? onToggle,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  obscureText
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                ),
                onPressed: onToggle,
              )
            : null,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 10,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: theme.colorScheme.outlineVariant),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: theme.colorScheme.outlineVariant),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: theme.colorScheme.primary),
        ),
      ),
    );
  }

  Widget _buildSocialButton(
    String label, {
    IconData? icon,
    Widget? leading,
    required VoidCallback onPressed,
    Color? iconColor,
  }) {
    final theme = Theme.of(ref.context);
    final Widget prefix = leading ??
        Icon(icon!, color: iconColor ?? theme.colorScheme.onSurface, size: 22);
    return SizedBox(
      width: double.infinity,
      height: 46,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: prefix,
        label: Text(
          label,
          style: TextStyle(
            color: theme.colorScheme.onSurface,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: theme.colorScheme.outlineVariant),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
