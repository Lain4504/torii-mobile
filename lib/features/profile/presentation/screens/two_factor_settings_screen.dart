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
  // Mô tả trạng thái chi tiết, phục vụ hiển thị và debug
  String? _statusText;
  bool _isEnabled = false;
  String? _method;
  int? _backupCodesRemaining;
  DateTime? _enabledAt;
  DateTime? _lastUsedAt;
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
        _isEnabled = enabled;
        _method = data['method'] as String?;
        _backupCodesRemaining = data['backupCodesRemaining'] as int?;
        final enabledAtRaw = data['enabledAt'];
        final lastUsedAtRaw = data['lastUsedAt'];
        _enabledAt = enabledAtRaw is String ? DateTime.tryParse(enabledAtRaw) : null;
        _lastUsedAt = lastUsedAtRaw is String ? DateTime.tryParse(lastUsedAtRaw) : null;
        _statusText = enabled ? 'Đã bật xác thực hai yếu tố' : 'Chưa bật xác thực hai yếu tố';
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
      final res = await service.enableTOTP(_secret ?? '', code);
      setState(() {
        _backupCodes = res.data;
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
      setState(() {
        _backupCodes = res.data;
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

  String _formatDate(DateTime dt) {
    return '${dt.day.toString().padLeft(2, '0')}/${dt.month.toString().padLeft(2, '0')}/${dt.year}';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
              if (_statusText != null) ...[
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.grey300),
                  ),
                  child: Text(
                    _statusText!,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
              ],
              // Card mô phỏng SecurityTab trên web-admin
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.grey300),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.textPrimary.withOpacity(0.04),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Xác thực hai yếu tố',
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Thêm lớp bảo mật bổ sung cho tài khoản',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: AppColors.textTertiary,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: _isEnabled ? AppColors.primary.withOpacity(0.08) : AppColors.grey200,
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Text(
                            _isEnabled ? 'Đã bật' : 'Đã tắt',
                            style: theme.textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: _isEnabled ? AppColors.primary : AppColors.textSecondary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    if (_isEnabled) ...[
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          _StatusItem(
                            label: 'Phương thức',
                            value: (_method == 'totp' || _method == null) ? 'Ứng dụng xác thực' : 'Không xác định',
                          ),
                          _StatusItem(
                            label: 'Mã dự phòng',
                            value: _backupCodesRemaining != null ? 'Còn $_backupCodesRemaining mã' : 'Không có dữ liệu',
                          ),
                          if (_enabledAt != null)
                            _StatusItem(
                              label: 'Đã bật',
                              value: _formatDate(_enabledAt!),
                            ),
                          if (_lastUsedAt != null)
                            _StatusItem(
                              label: 'Sử dụng lần cuối',
                              value: _formatDate(_lastUsedAt!),
                            ),
                        ],
                      ),
                    ] else ...[
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.06),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.primary.withOpacity(0.25)),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.shield_outlined, color: AppColors.primary, size: 18),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Bảo vệ tài khoản với 2FA',
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Xác thực hai yếu tố thêm một lớp bảo mật bằng cách yêu cầu mã từ điện thoại của bạn cùng với mật khẩu.',
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: AppColors.textTertiary,
                                      height: 1.35,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                        if (_isEnabled && _backupCodesRemaining != null && _backupCodesRemaining! < 3) ...[
                      const SizedBox(height: 12),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.error.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.error.withOpacity(0.25)),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.warning_amber_rounded, color: AppColors.error, size: 18),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Sắp hết mã dự phòng',
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Bạn chỉ còn $_backupCodesRemaining mã dự phòng. Hãy cân nhắc tạo bộ mã mới.',
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: AppColors.textTertiary,
                                      height: 1.35,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        if (!_isEnabled) ...[
                          Expanded(
                            child: SizedBox(
                              height: 42,
                              child: ElevatedButton(
                                onPressed: _loading
                                    ? null
                                    : () {
                                        _showEnableDrawer(context);
                                      },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primary,
                                  foregroundColor: AppColors.textOnPrimary,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: const Text(
                                  'Bật xác thực hai yếu tố',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ] else ...[
                          Expanded(
                            child: SizedBox(
                              height: 42,
                              child: OutlinedButton(
                                onPressed: _loading ? null : _regenBackupCodes,
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: AppColors.primary,
                                  side: const BorderSide(color: AppColors.primary),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: const Text(
                                  'Tạo mã dự phòng',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: SizedBox(
                              height: 42,
                              child: OutlinedButton(
                                onPressed: _loading
                                    ? null
                                    : () {
                                        _showDisableDrawer(context);
                                      },
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: AppColors.error,
                                  side: BorderSide(color: AppColors.error.withOpacity(0.6)),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: const Text(
                                  'Tắt 2FA',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
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

  Future<void> _showEnableDrawer(BuildContext context) async {
    final theme = Theme.of(context);
    final codeController = TextEditingController();

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 12,
            bottom: MediaQuery.of(ctx).viewInsets.bottom + 16,
          ),
          child: StatefulBuilder(
            builder: (context, setSheetState) {
              Future<void> startSetupInSheet() async {
                setSheetState(() {});
                await _startSetup();
                setSheetState(() {});
              }

              Future<void> enableInSheet() async {
                final code = codeController.text.trim();
                if (code.isEmpty) return;
                await _enable(code);
                if (mounted) Navigator.of(ctx).pop();
              }

              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      margin: const EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                        color: AppColors.grey300,
                        borderRadius: BorderRadius.circular(999),
                      ),
                    ),
                  ),
                  Text(
                    'Bật xác thực hai bước',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Thiết lập 2FA bằng ứng dụng Authenticator để bảo vệ tài khoản tốt hơn.',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: AppColors.textTertiary,
                      height: 1.35,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Hướng dẫn',
                    style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '1. Nhấn "Tạo secret" để lấy mã QR/secret.\n'
                    '2. Quét bằng Google Authenticator / 1Password / v.v.\n'
                    '3. Nhập mã 6 số hiển thị trên app để hoàn tất bật 2FA.',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: AppColors.textTertiary,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 10),
                  if (_secret != null || _otpauthUrl != null) ...[
                    Container(
                      width: double.infinity,
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
                              'Secret',
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
                              'otpauth URL',
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
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 42,
                          child: OutlinedButton(
                            onPressed: _loading ? null : startSetupInSheet,
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
                          height: 42,
                          child: ElevatedButton(
                            onPressed: _loading ? null : enableInSheet,
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
                ],
              );
            },
          ),
        );
      },
    );
  }

  Future<void> _showDisableDrawer(BuildContext context) async {
    final theme = Theme.of(context);
    final codeController = TextEditingController();

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 12,
            bottom: MediaQuery.of(ctx).viewInsets.bottom + 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    color: AppColors.grey300,
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
              ),
              Text(
                'Tắt xác thực hai bước',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Nhập mã 2FA hiện tại từ ứng dụng Authenticator để xác nhận tắt bảo mật hai bước.',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: AppColors.textTertiary,
                  height: 1.35,
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: codeController,
                decoration: const InputDecoration(
                  isDense: true,
                  labelText: 'Mã 6 số hiện tại',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 42,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _loading
                      ? null
                      : () async {
                          final code = codeController.text.trim();
                          if (code.isEmpty) return;
                          await _disable(code);
                          if (mounted) Navigator.of(ctx).pop();
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.error,
                    foregroundColor: AppColors.textOnPrimary,
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text(
                    'Xác nhận tắt 2FA',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _StatusItem extends StatelessWidget {
  final String label;
  final String value;

  const _StatusItem({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.grey300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label.toUpperCase(),
            style: theme.textTheme.bodySmall?.copyWith(
              fontSize: 10,
              fontWeight: FontWeight.w800,
              color: AppColors.textTertiary,
              letterSpacing: 0.6,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

