import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
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
        height: 56, // Fixed height for consistency
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: _otpFocus.hasFocus 
                ? theme.colorScheme.primary 
                : theme.colorScheme.outlineVariant, 
            width: _otpFocus.hasFocus ? 2 : 1,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: Row(
          children: List.generate(6, (i) {
            final isActive = active == i;
            final isFilled = i < text.length;
            final char = isFilled ? text[i] : '';
            
            return Expanded(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border(
                    right: i < 5
                        ? BorderSide(color: theme.colorScheme.outlineVariant, width: 1)
                        : BorderSide.none,
                  ),
                  color: isActive
                      ? theme.colorScheme.primary.withValues(alpha: 0.05)
                      : Colors.transparent,
                ),
                child: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      if (char.isNotEmpty)
                        Text(
                          char,
                          style: theme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.onSurface,
                          ),
                        )
                      else if (isActive)
                        // Cursor animation or static bar
                        Container(
                          width: 2,
                          height: 24,
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primary,
                            borderRadius: BorderRadius.circular(1),
                          ),
                        )
                      else
                        // Empty dot/placeholder
                        Container(
                          width: 4,
                          height: 4,
                          decoration: BoxDecoration(
                            color: theme.colorScheme.outlineVariant,
                            shape: BoxShape.circle,
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
    return Stack(
      alignment: Alignment.center,
      children: [
        _buildGroupedOtpSlots(theme),
        // Hidden TextField but fully interactive
        Opacity(
          opacity: 0.0,
          child: TextField(
            controller: _otpController,
            focusNode: _otpFocus,
            autofocus: true,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            maxLength: 6,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            style: const TextStyle(fontSize: 24), // Large area
            decoration: const InputDecoration(
              border: InputBorder.none,
              counterText: '',
              contentPadding: EdgeInsets.symmetric(vertical: 8),
            ),
            onChanged: (_) => setState(() {}),
            onSubmitted: (_) {
              if (_otp.length == 6) {
                FocusScope.of(context).unfocus();
                _submit();
              }
            },
          ),
        ),
      ],
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
        SnackBar(
          content: Text(message),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.surface,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: theme.colorScheme.onSurface,
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
                        color: theme.colorScheme.primary,
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
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  if (widget.email != null && widget.email!.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Text(
                      widget.email!,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: theme.colorScheme.onSurface,
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
                        color: theme.colorScheme.onSurface,
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
                        backgroundColor: theme.colorScheme.primary,
                        foregroundColor: theme.colorScheme.onPrimary,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        'Xác minh',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: theme.colorScheme.onPrimary,
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
                          color: theme.colorScheme.onSurfaceVariant,
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
                        child: Text(
                          'Gửi lại mã',
                          style: TextStyle(
                            color: theme.colorScheme.primary,
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
                      color: theme.colorScheme.onSurfaceVariant,
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
