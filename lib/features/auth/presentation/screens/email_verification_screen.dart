import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/features/auth/providers/auth_providers.dart';

/// OTP 6 số — layout nhóm ô liền nhau (giống [InputOTPGroup] trên web-learner),
/// một [TextField] ẩn để tránh cắt chữ / overflow trên màn hình nhỏ.
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
  final TextEditingController _otpController = TextEditingController();
  final FocusNode _otpFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    _otpFocus.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _otpController.dispose();
    _otpFocus.dispose();
    super.dispose();
  }

  String get _otp => _otpController.text;

  int get _activeSlotIndex {
    if (!_otpFocus.hasFocus) return -1;
    final len = _otp.length;
    if (len >= 6) return 5;
    return len;
  }

  Widget _buildGroupedOtpSlots(ThemeData theme) {
    final text = _otp;
    final active = _activeSlotIndex;

    return Material(
      color: Colors.transparent,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.input, width: 1),
        ),
        clipBehavior: Clip.antiAlias,
        child: Row(
          children: List.generate(6, (i) {
            final isActive = active == i;
            final char = i < text.length ? text[i] : '';
            return Expanded(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border(
                    right: i < 5
                        ? const BorderSide(color: AppColors.input, width: 1)
                        : BorderSide.none,
                  ),
                  color: isActive
                      ? AppColors.primary.withValues(alpha: 0.08)
                      : Colors.transparent,
                ),
                child: SizedBox(
                  height: 52,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        char,
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                          height: 1.1,
                          fontFeatures: const [FontFeature.tabularFigures()],
                          color: AppColors.textPrimary,
                        ),
                      ),
                      if (isActive && char.isEmpty)
                        Container(
                          width: 2,
                          height: 22,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(1),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _buildOtpInputStack(ThemeData theme) {
    return SizedBox(
      height: 52,
      child: Stack(
        alignment: Alignment.center,
        children: [
          _buildGroupedOtpSlots(theme),
          // Ô nhập thật: trong suốt, full vùng chạm — tránh cắt số do ô hẹp.
          Positioned.fill(
            child: TextField(
              controller: _otpController,
              focusNode: _otpFocus,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              maxLength: 6,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.transparent.withValues(alpha: 0),
                fontSize: 1,
                height: 0.01,
              ),
              cursorColor: Colors.transparent,
              showCursor: false,
              decoration: const InputDecoration(
                border: InputBorder.none,
                counterText: '',
                contentPadding: EdgeInsets.zero,
                isDense: true,
              ),
              onChanged: (_) => setState(() {}),
              onSubmitted: (_) {
                if (_otp.length == 6) FocusScope.of(context).unfocus();
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _submit() async {
    final email = widget.email;
    if (email == null || email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Thiếu thông tin email để xác minh'),
        ),
      );
      return;
    }

    final code = _otp;
    if (code.length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Vui lòng nhập đủ 6 số mã OTP'),
        ),
      );
      return;
    }

    final notifier = ref.read(authNotifierProvider.notifier);
    final isResetFlow = widget.mode == 'reset-password';
    final ok = await notifier.verifyOTP(
      email,
      code,
      type: isResetFlow ? 'reset-password' : 'registration',
    );

    if (!mounted) return;
    if (!context.mounted) return;
    final router = GoRouter.of(context);
    final messenger = ScaffoldMessenger.of(context);

    if (ok) {
      if (isResetFlow) {
        router.go('/reset-password');
      } else {
        messenger.showSnackBar(
          const SnackBar(
            content: Text('Xác minh email thành công'),
          ),
        );
        router.go('/login');
      }
    } else {
      final asyncAuth = ref.read(authNotifierProvider);
      final message = asyncAuth.when(
        data: (s) => s.error ?? 'Xác minh mã OTP thất bại',
        error: (e, _) => e.toString(),
        loading: () => 'Đang xử lý...',
      );
      messenger.showSnackBar(
        SnackBar(content: Text(message)),
      );
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
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.textPrimary,
            size: 20,
          ),
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
                  Text(
                    'Xác minh email',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Chúng tôi đã gửi mã 6 chữ số đến email của bạn.',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: AppColors.textTertiary,
                    ),
                  ),
                  if (widget.email != null && widget.email!.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Text(
                      widget.email!,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                  const SizedBox(height: 28),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Mã xác minh (6 chữ số)',
                      style: theme.textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => _otpFocus.requestFocus(),
                    child: _buildOtpInputStack(theme),
                  ),
                  const SizedBox(height: 28),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: _submit,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.textOnPrimary,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        'Xác minh',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Chưa nhận được mã? ',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: AppColors.textTertiary,
                        ),
                      ),
                      TextButton(
                        onPressed: () async {
                          final email = widget.email;
                          if (email == null || email.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Thiếu thông tin email để gửi lại mã',
                                ),
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
                          if (!context.mounted) return;
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Đã gửi lại mã OTP nếu email hợp lệ',
                              ),
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
                  const SizedBox(height: 8),
                  Text(
                    'Kiểm tra hộp thư spam nếu bạn chưa nhận được email.',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: AppColors.textTertiary,
                      fontSize: 12,
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
