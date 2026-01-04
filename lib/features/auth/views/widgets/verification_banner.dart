import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/auth_providers.dart';
import '../../models/auth_state_sealed.dart';

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

    return Container(
      width: double.infinity,
      color: Colors.amber[100],
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(Icons.mail_outline, color: Colors.amber[900], size: 24),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Verify your email',
                      style: TextStyle(
                        color: Colors.amber[900],
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'We sent a magic link to your email. Click it to activate your account.',
                      style: TextStyle(
                        color: Colors.amber[900],
                        fontSize: 13,
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton.icon(
              onPressed: _cooldown > 0 ? null : _resendMagicLink,
              style: TextButton.styleFrom(
                foregroundColor: Colors.amber[900],
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                backgroundColor: Colors.amber[200]!.withValues(alpha: 0.5),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
              icon: _cooldown > 0 
                  ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2, valueColor: AlwaysStoppedAnimation(Colors.amber))) 
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
