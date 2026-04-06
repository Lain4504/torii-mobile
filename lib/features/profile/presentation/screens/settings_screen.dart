import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/features/auth/providers/auth_providers.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, size: 20, color: theme.colorScheme.onSurface),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/profile');
            }
          },
        ),
        title: Text(
          'Cài đặt',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w800,
            letterSpacing: 0.2,
          ),
        ),
        backgroundColor: theme.colorScheme.surface,
        elevation: 0,
      ),
      body: SafeArea(
        top: false,
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
          children: [
          _SectionCard(
            children: [
              _SettingsTile(
                icon: Icons.person_outline,
                title: 'Hồ sơ cá nhân',
                onTap: () => context.push('/profile/edit'),
              ),
              _SettingsTile(
                icon: Icons.folder_copy_outlined,
                title: 'Thư mục tài nguyên',
                onTap: () => context.push('/academy/folders'),
              ),
              _SettingsTile(
                icon: Icons.link_rounded,
                title: 'Liên kết tài khoản',
                onTap: () => context.push('/linked-accounts'),
              ),
              _SettingsTile(
                icon: Icons.lock_outline,
                title: 'Đổi mật khẩu',
                onTap: () => context.push('/change-password'),
              ),
              _SettingsTile(
                icon: Icons.military_tech_outlined,
                title: 'Thành tựu học tập',
                onTap: () => context.push('/achievements'),
              ),
              _SettingsTile(
                icon: Icons.credit_card_outlined,
                title: 'Thông tin thanh toán',
                onTap: () => context.push('/orders'),
              ),
              _SettingsTile(
                icon: Icons.card_giftcard_outlined,
                title: 'Cửa hàng quà tặng',
                onTap: () => context.push('/rewards-store'),
              ),
              _SettingsTile(
                icon: Icons.local_offer_outlined,
                title: 'Mã giảm giá của tôi',
                onTap: () => context.push('/my-coupons'),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _SectionCard(
            children: [
              _SettingsTile(
                icon: Icons.security_rounded,
                title: 'Bảo mật & 2FA',
                onTap: () => context.push('/security-2fa'),
              ),
              _SettingsTile(
                icon: Icons.notifications_none_rounded,
                title: 'Thông báo',
                onTap: () => context.push('/notifications'),
              ),
              _SettingsTile(
                icon: Icons.help_outline_rounded,
                title: 'Trợ giúp',
                onTap: () => context.push('/support'),
              ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _SectionCard(
            children: [
              _SettingsTile(
                icon: Icons.logout_rounded,
                title: 'Đăng xuất',
                isDestructive: true,
                onTap: () => _onLogoutTap(context, ref),
              ),
            ],
          ),
        ],
        ),
      ),
    );
  }
}

Future<void> _onLogoutTap(BuildContext context, WidgetRef ref) async {
  final confirmed = await showDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: const Text('Đăng xuất'),
      content: const Text('Bạn có chắc chắn muốn đăng xuất?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(ctx).pop(false),
          child: const Text('Hủy'),
        ),
        TextButton(
          onPressed: () => Navigator.of(ctx).pop(true),
          child: Text('Đăng xuất', style: TextStyle(color: Theme.of(context).colorScheme.error)),
        ),
      ],
    ),
  );
  if (confirmed != true || !context.mounted) return;

  await ref.read(authNotifierProvider.notifier).logout();
  if (!context.mounted) return;
  context.go('/');
}

class _SectionCard extends StatelessWidget {
  final List<Widget> children;
  const _SectionCard({required this.children});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.colorScheme.outlineVariant),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.04),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: List.generate(children.length, (i) {
          final isLast = i == children.length - 1;
          return Column(
            children: [
              children[i],
              if (!isLast)
                Divider(height: 1, thickness: 1, color: theme.colorScheme.outlineVariant.withValues(alpha: 0.5)),
            ],
          );
        }),
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isDestructive;
  final VoidCallback? onTap;
  const _SettingsTile({
    required this.icon,
    required this.title,
    this.isDestructive = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final leadingBg = isDestructive 
        ? theme.colorScheme.error.withValues(alpha: 0.1) 
        : theme.colorScheme.primary.withValues(alpha: 0.1);
    final leadingFg = isDestructive ? theme.colorScheme.error : theme.colorScheme.primary;
    final textColor = isDestructive ? theme.colorScheme.error : theme.colorScheme.onSurface;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: leadingBg,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: leadingFg, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: textColor,
                  letterSpacing: 0.1,
                ),
              ),
            ),
            if (!isDestructive)
              Icon(Icons.chevron_right, color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.7), size: 18),
          ],
        ),
      ),
    );
  }
}
