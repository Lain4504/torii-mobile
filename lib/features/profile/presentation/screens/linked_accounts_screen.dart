import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/features/auth/providers/auth_providers.dart';

class LinkedAccountsScreen extends ConsumerStatefulWidget {
  const LinkedAccountsScreen({super.key});

  @override
  ConsumerState<LinkedAccountsScreen> createState() => _LinkedAccountsScreenState();
}

class _LinkedAccountsScreenState extends ConsumerState<LinkedAccountsScreen> {
  bool _loading = true;
  bool _busyGoogle = false;
  List<String> _providers = const [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    final service = ref.read(authServiceProvider);
    final res = await service.getLinkedProviders();
    if (!mounted) return;
    setState(() {
      _providers = res.data ?? const [];
      _loading = false;
    });
  }

  Future<void> _linkGoogle() async {
    if (_busyGoogle) return;
    setState(() => _busyGoogle = true);
    try {
      final google = GoogleSignIn(scopes: const ['email', 'profile']);
      final account = await google.signIn();
      final auth = await account?.authentication;
      final idToken = auth?.idToken;
      if (idToken == null || idToken.isEmpty) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Không lấy được Google ID token')));
        }
        return;
      }

      final service = ref.read(authServiceProvider);
      final res = await service.linkGoogle(idToken);
      if (!mounted) return;
      if (res.success == true) {
        await _load();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Đã liên kết Google')));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(res.message ?? 'Liên kết thất bại')));
      }
    } finally {
      if (mounted) setState(() => _busyGoogle = false);
    }
  }

  Future<void> _unlinkGoogle() async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Hủy liên kết Google?'),
        content: const Text('Bạn có chắc muốn hủy liên kết Google không?'),
        actions: [
          TextButton(onPressed: () => Navigator.of(ctx).pop(false), child: const Text('Không')),
          TextButton(onPressed: () => Navigator.of(ctx).pop(true), child: const Text('Hủy liên kết')),
        ],
      ),
    );
    if (ok != true) return;

    setState(() => _busyGoogle = true);
    try {
      final service = ref.read(authServiceProvider);
      final res = await service.unlinkProvider('google');
      if (!mounted) return;
      if (res.success == true) {
        await _load();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Đã hủy liên kết Google')));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(res.message ?? 'Hủy liên kết thất bại')));
      }
    } finally {
      if (mounted) setState(() => _busyGoogle = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final linkedGoogle = _providers.contains('google');

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20, color: AppColors.textPrimary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Liên kết tài khoản',
          style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800, letterSpacing: 0.2),
        ),
        backgroundColor: AppColors.surface,
        elevation: 0,
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
              children: [
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.grey300),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Đăng nhập nhanh',
                        style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w900),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'Bạn có thể liên kết tài khoản để đăng nhập bằng nhiều phương thức.',
                        style: TextStyle(color: AppColors.textTertiary, height: 1.35),
                      ),
                      const SizedBox(height: 12),
                      _ProviderRow(
                        title: 'Google',
                        subtitle: linkedGoogle ? 'Đã liên kết' : 'Chưa liên kết',
                        isLinked: linkedGoogle,
                        busy: _busyGoogle,
                        onLink: _linkGoogle,
                        onUnlink: _unlinkGoogle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}

class _ProviderRow extends StatelessWidget {
  const _ProviderRow({
    required this.title,
    required this.subtitle,
    required this.isLinked,
    required this.busy,
    required this.onLink,
    required this.onUnlink,
  });

  final String title;
  final String subtitle;
  final bool isLinked;
  final bool busy;
  final VoidCallback onLink;
  final VoidCallback onUnlink;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.grey300),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.10),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(Icons.g_mobiledata_rounded, color: AppColors.primary),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w900)),
                const SizedBox(height: 2),
                Text(subtitle, style: theme.textTheme.bodySmall?.copyWith(color: AppColors.textTertiary)),
              ],
            ),
          ),
          const SizedBox(width: 10),
          SizedBox(
            height: 36,
            child: isLinked
                ? OutlinedButton(
                    onPressed: busy ? null : onUnlink,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.error,
                      side: BorderSide(color: AppColors.error.withOpacity(0.35)),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: Text(busy ? '...' : 'Hủy', style: const TextStyle(fontWeight: FontWeight.w900)),
                  )
                : ElevatedButton(
                    onPressed: busy ? null : onLink,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.textOnPrimary,
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: Text(busy ? '...' : 'Liên kết', style: const TextStyle(fontWeight: FontWeight.w900)),
                  ),
          ),
        ],
      ),
    );
  }
}

