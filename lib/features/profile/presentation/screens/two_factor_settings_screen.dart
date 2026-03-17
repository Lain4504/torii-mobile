import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/features/auth/providers/auth_providers.dart';
import 'package:torii_app/services/auth/auth_service.dart';

class TwoFactorSettingsScreen extends ConsumerStatefulWidget {
  const TwoFactorSettingsScreen({super.key});

  @override
  ConsumerState<TwoFactorSettingsScreen> createState() => _TwoFactorSettingsScreenState();
}

class _TwoFactorSettingsScreenState extends ConsumerState<TwoFactorSettingsScreen> {
  bool _loading = false;
  String? _statusText;
  String? _secret;
  String? _otpauthUrl;
  List<String>? _backupCodes;

  Future<void> _loadStatus() async {
    setState(() {
      _loading = true;
    });
    try {
      final AuthService service = ref.read(authServiceProvider);
      final res = await service.get2FAStatus();
      final data = res.data ?? {};
      final enabled = data['isEnabled'] == true || data['enabled'] == true;
      setState(() {
        _statusText = enabled ? 'Đang bật 2FA' : 'Chưa bật 2FA';
      });
    } catch (e) {
      setState(() {
        _statusText = 'Không thể tải trạng thái 2FA: $e';
      });
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  Future<void> _startSetup() async {
    setState(() {
      _loading = true;
      _secret = null;
      _otpauthUrl = null;
    });
    try {
      final service = ref.read(authServiceProvider);
      final res = await service.generateTOTPSecret();
      final data = res.data ?? {};
      setState(() {
        _secret = data['secret'] as String?;
        _otpauthUrl = data['otpauthUrl'] as String?;
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Lỗi tạo secret: $e')));
      }
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  Future<void> _enable(String code) async {
    setState(() {
      _loading = true;
    });
    try {
      final service = ref.read(authServiceProvider);
      final res = await service.enableTOTP(code);
      final data = res.data ?? {};
      final backups = (data['backupCodes'] as List?)?.map((e) => e.toString()).toList();
      setState(() {
        _backupCodes = backups;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Đã bật 2FA thành công')));
      }
      await _loadStatus();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Bật 2FA thất bại: $e')));
      }
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  Future<void> _disable(String code) async {
    setState(() {
      _loading = true;
    });
    try {
      final service = ref.read(authServiceProvider);
      await service.disableTOTP(code);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Đã tắt 2FA')));
      }
      await _loadStatus();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Tắt 2FA thất bại: $e')));
      }
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  Future<void> _regenBackupCodes() async {
    setState(() {
      _loading = true;
    });
    try {
      final service = ref.read(authServiceProvider);
      final res = await service.regenerateBackupCodes();
      final data = res.data ?? {};
      final backups = (data['backupCodes'] as List?)?.map((e) => e.toString()).toList();
      setState(() {
        _backupCodes = backups;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Đã tạo lại backup codes')));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Lỗi tạo lại backup codes: $e')));
      }
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadStatus();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final codeController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20, color: AppColors.textPrimary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Bảo mật & 2FA',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
            letterSpacing: 0.2,
          ),
        ),
        backgroundColor: AppColors.surface,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
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
                      'Trạng thái',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: AppColors.textTertiary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _statusText ?? 'Đang tải...',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
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
                      'Bật / tắt 2FA bằng app Authenticator',
                      style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '1. Nhấn "Tạo secret" để lấy mã QR/secret.\n'
                      '2. Quét bằng Google Authenticator / 1Password / v.v.\n'
                      '3. Nhập mã 6 số để bật 2FA.',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: AppColors.textTertiary,
                        height: 1.35,
                      ),
                    ),
                    const SizedBox(height: 10),
                    if (_secret != null || _otpauthUrl != null) ...[
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColors.background,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.grey300),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (_secret != null) ...[
                              const Text(
                                'Secret:',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.textSecondary,
                                ),
                              ),
                              const SizedBox(height: 2),
                              SelectableText(
                                _secret!,
                                style: const TextStyle(fontSize: 12),
                              ),
                              const SizedBox(height: 6),
                            ],
                            if (_otpauthUrl != null) ...[
                              const Text(
                                'otpauth URL:',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.textSecondary,
                                ),
                              ),
                              const SizedBox(height: 2),
                              SelectableText(
                                _otpauthUrl!,
                                style: const TextStyle(fontSize: 12),
                              ),
                            ],
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                    TextField(
                      controller: codeController,
                      decoration: const InputDecoration(
                        isDense: true,
                        labelText: 'Nhập mã 6 số từ app',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 40,
                            child: OutlinedButton(
                              onPressed: _loading ? null : _startSetup,
                              style: OutlinedButton.styleFrom(
                                foregroundColor: AppColors.primary,
                                side: const BorderSide(color: AppColors.primary),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Text(
                                'Tạo secret',
                                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: SizedBox(
                            height: 40,
                            child: ElevatedButton(
                              onPressed: _loading
                                  ? null
                                  : () {
                                      final code = codeController.text.trim();
                                      if (code.isNotEmpty) {
                                        _enable(code);
                                      }
                                    },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                foregroundColor: AppColors.textOnPrimary,
                                elevation: 0,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              ),
                              child: const Text(
                                'Bật 2FA',
                                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 36,
                      child: TextButton(
                        onPressed: _loading
                            ? null
                            : () {
                                final code = codeController.text.trim();
                                if (code.isNotEmpty) {
                                  _disable(code);
                                }
                              },
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.error,
                        ),
                        child: const Text(
                          'Tắt 2FA với mã hiện tại',
                          style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
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
                      'Backup codes',
                      style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Sử dụng khi bạn mất điện thoại hoặc không truy cập được app 2FA.',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: AppColors.textTertiary,
                        height: 1.35,
                      ),
                    ),
                    const SizedBox(height: 10),
                    if (_backupCodes != null && _backupCodes!.isNotEmpty) ...[
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: _backupCodes!
                            .map(
                              (c) => Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                decoration: BoxDecoration(
                                  color: AppColors.background,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: AppColors.grey300),
                                ),
                                child: Text(
                                  c,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    letterSpacing: 1.2,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      const SizedBox(height: 8),
                    ] else ...[
                      Text(
                        'Chưa có backup codes. Hãy bật 2FA hoặc tạo lại mã để nhận danh sách mã dự phòng.',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: AppColors.textTertiary,
                          height: 1.35,
                        ),
                      ),
                      const SizedBox(height: 8),
                    ],
                    SizedBox(
                      height: 40,
                      child: OutlinedButton(
                        onPressed: _loading ? null : _regenBackupCodes,
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.primary,
                          side: const BorderSide(color: AppColors.primary),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        child: const Text(
                          'Tạo lại backup codes',
                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

