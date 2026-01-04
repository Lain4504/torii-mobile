import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/auth_providers.dart';
import '../../models/auth_state_sealed.dart';
import '../../../../core/constants/app_design_system.dart';

/// Verification Banner - Minimalist Alert
class VerificationBanner extends ConsumerStatefulWidget {
  const VerificationBanner({super.key});

  @override
  ConsumerState<VerificationBanner> createState() => _VerificationBannerState();
}

class _VerificationBannerState extends ConsumerState<VerificationBanner> {
  int _cooldown = 0;
  Timer? _timer;

  void _startCooldown() {
    setState(() {
      _cooldown = 60;
    });
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_cooldown == 0) {
        timer.cancel();
      } else {
        setState(() {
          _cooldown--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _resendMagicLink() async {
    if (_cooldown > 0) return;

    final success = await ref.read(authStateProvider.notifier).resendVerification();
    
    if (mounted) {
      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Verification link sent! Check your email.')),
        );
        _startCooldown();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to send verification link.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authStateProvider);
    
    // Only show when authenticated but pending
    final isPending = authState is AuthAuthenticated && authState.user.status == 'pending';

    if (!isPending) return const SizedBox.shrink();

    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      color: isDark ? AppColors.warning.withValues(alpha: 0.15) : AppColors.warningLight,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.pageHorizontal,
        vertical: AppSpacing.md,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(
                Icons.mark_email_unread_outlined, 
                color: AppColors.warningDark, 
                size: AppIconSize.md,
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Verify your email',
                      style: theme.textTheme.titleSmall?.copyWith(
                        color: AppColors.warningDark,
                        fontWeight: AppTypography.bold,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'We sent a magic link to your email. Click it to activate your account.',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: AppColors.warningDark,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton.icon(
              onPressed: _cooldown > 0 ? null : _resendMagicLink,
              style: TextButton.styleFrom(
                foregroundColor: AppColors.warningDark,
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
                backgroundColor: isDark 
                    ? AppColors.warning.withValues(alpha: 0.2) 
                    : AppColors.white.withValues(alpha: 0.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppRadius.full),
                ),
              ),
              icon: _cooldown > 0 
                  ? SizedBox(
                      width: 14, 
                      height: 14, 
                      child: CircularProgressIndicator(
                        strokeWidth: 2, 
                        valueColor: AlwaysStoppedAnimation(AppColors.warningDark),
                      ),
                    ) 
                  : const Icon(Icons.refresh, size: 16),
              label: Text(
                _cooldown > 0 ? 'Resend in ${_cooldown}s' : 'Resend Email',
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
