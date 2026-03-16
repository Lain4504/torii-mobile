import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/features/auth/providers/auth_providers.dart';

class EmailVerificationScreen extends ConsumerStatefulWidget {
  const EmailVerificationScreen({
    super.key,
    this.email,
    this.mode = 'registration',
  });

  final String? email;
  final String mode;

  @override
  ConsumerState<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState
    extends ConsumerState<EmailVerificationScreen> {
  final List<TextEditingController> _controllers = List.generate(6, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _onOtpChanged(String value, int index) {
    if (value.length == 1 && index < 5) {
      _focusNodes[index + 1].requestFocus();
    }
    if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
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
          onPressed: () {
            final isResetFlow = widget.mode == 'reset-password';
            if (isResetFlow) {
              context.go('/forgot-password');
            } else {
              context.go('/login');
            }
          },
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 480),
              child: Column(
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
                  const Text(
                    'Xác minh email',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Chúng tôi đã gửi mã xác minh đến email của bạn.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.textTertiary,
                    ),
                  ),
                  const SizedBox(height: 32),

                  // OTP Inputs
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(6, (index) {
                      return SizedBox(
                        width: 45,
                        height: 55,
                        child: TextField(
                          controller: _controllers[index],
                          focusNode: _focusNodes[index],
                          onChanged: (value) => _onOtpChanged(value, index),
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            counterText: "",
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide:
                                  const BorderSide(color: AppColors.grey300),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: const BorderSide(
                                  color: AppColors.primary, width: 2),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),

                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () async {
                    final email = widget.email;
                    if (email == null || email.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Thiếu thông tin email để xác minh'),
                        ),
                      );
                      return;
                    }

                    final code = _controllers.map((c) => c.text).join();
                    if (code.length != 6) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Vui lòng nhập đủ 6 số mã OTP'),
                        ),
                      );
                      return;
                    }

                    final notifier =
                        ref.read(authNotifierProvider.notifier);
                    final isResetFlow = widget.mode == 'reset-password';
                    final ok = await notifier.verifyOTP(
                      email,
                      code,
                      type: isResetFlow ? 'reset-password' : 'registration',
                    );

                    if (!mounted) return;

                    if (ok) {
                      if (isResetFlow) {
                        context.go('/reset-password');
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Xác minh email thành công'),
                          ),
                        );
                        context.go('/login');
                      }
                    } else {
                      final state =
                          ref.read(authNotifierProvider).valueOrNull;
                      final message =
                          state?.error ?? 'Xác minh mã OTP thất bại';
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(message)),
                      );
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
                      child: const Text('Xác minh',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w700)),
                    ),
                  ),
                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Chưa nhận được mã? ',
                          style: TextStyle(color: AppColors.textTertiary)),
                      TextButton(
                        onPressed: () async {
                          final email = widget.email;
                          if (email == null || email.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text('Thiếu thông tin email để gửi lại mã'),
                              ),
                            );
                            return;
                          }
                          final notifier =
                              ref.read(authNotifierProvider.notifier);
                          await notifier.resendOTP(
                            email,
                            type: widget.mode == 'reset-password'
                                ? 'reset-password'
                                : 'registration',
                          );
                          if (!mounted) return;
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content:
                                  Text('Đã gửi lại mã OTP nếu email hợp lệ'),
                            ),
                          );
                        },
                        child: const Text(
                          'Gửi lại mã',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Kiểm tra hộp thư spam nếu bạn chưa nhận được email.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.textTertiary,
                    ),
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
}
