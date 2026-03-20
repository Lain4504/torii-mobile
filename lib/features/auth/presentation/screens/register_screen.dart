import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/features/auth/providers/auth_providers.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  String? _selectedGoal;
  bool _agreeToTerms = false;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _isLoading = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final List<String> _goals = [
    'Giao tiếp cơ bản',
    'Thi JLPT N5',
    'Thi JLPT N4',
    'Làm việc tại Nhật',
    'Du học Nhật Bản',
  ];

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
                        color: AppColors.primary,
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
                      color: AppColors.grey700,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Form fields
                  _buildLabel('Họ và tên'),
              _buildTextField(
                controller: _nameController,
                hint: 'Nhập họ và tên của bạn',
                icon: Icons.person_outline,
              ),
              
                  _buildLabel('Email'),
                  _buildTextField(
                controller: _emailController,
                hint: 'Nhập email của bạn',
                icon: Icons.email_outlined,
              ),

                  _buildLabel('Mật khẩu'),
                  _buildTextField(
                controller: _passwordController,
                hint: 'Nhập mật khẩu', 
                icon: Icons.lock_outline, 
                isPassword: true,
                obscureText: _obscurePassword,
                onToggle: () => setState(() => _obscurePassword = !_obscurePassword),
              ),

                  _buildLabel('Xác nhận mật khẩu'),
                  _buildTextField(
                controller: _confirmPasswordController,
                hint: 'Nhập lại mật khẩu', 
                icon: Icons.lock_reset_outlined, 
                isPassword: true,
                obscureText: _obscureConfirmPassword,
                onToggle: () => setState(() => _obscureConfirmPassword = !_obscureConfirmPassword),
              ),

                  _buildLabel('Mục tiêu học tiếng Nhật'),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: AppColors.grey300),
                      color: AppColors.surface,
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: _selectedGoal,
                        hint: const Text('Chọn mục tiêu của bạn'),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedGoal = newValue;
                          });
                        },
                        items: _goals
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
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
                          activeColor: AppColors.primary,
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
                          final name = _nameController.text.trim();
                          final email = _emailController.text.trim();
                          final password = _passwordController.text;
                          final confirm = _confirmPasswordController.text;

                          if (name.isEmpty ||
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
                              await notifier.register(email, password, name);
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
                      const Expanded(
                        child: Divider(color: AppColors.grey300),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          'hoặc',
                          style: TextStyle(color: AppColors.textTertiary),
                        ),
                      ),
                      const Expanded(
                        child: Divider(color: AppColors.grey300),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),

                  _buildSocialButton(
                    'Đăng ký với Facebook',
                    Icons.facebook,
                    iconColor: const Color(0xFF1877F2),
                    onPressed: () =>
                        ref.read(authNotifierProvider.notifier).signInWithFacebook(),
                  ),
                  const SizedBox(height: 10),
                  _buildSocialButton('Đăng ký với Google', Icons.g_mobiledata),
                  const SizedBox(height: 10),
                  _buildSocialButton('Đăng ký với Apple', Icons.apple),

                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Đã có tài khoản? '),
                      GestureDetector(
                        onTap: () {
                          context.go('/login');
                        },
                        child: const Text(
                          'Đăng nhập',
                          style: TextStyle(
                            color: AppColors.primary,
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

  Widget _buildTextField({
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
          borderSide: const BorderSide(color: AppColors.grey300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.grey300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.primary),
        ),
      ),
    );
  }

  Widget _buildSocialButton(
    String label,
    IconData icon, {
    VoidCallback? onPressed,
    Color? iconColor,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 46,
      child: OutlinedButton.icon(
        onPressed: onPressed ?? () {},
        icon: Icon(icon, color: iconColor ?? AppColors.textPrimary, size: 22),
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
