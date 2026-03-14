import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:torii_app/features/auth/providers/auth_providers.dart';
import 'package:torii_app/core/theme/theme_provider.dart';
import '../../../../core/constants/app_design_system.dart';

// Colors from HTML (Tuỳ chọn screen)
const _colorPrimary = Color(0xFF1F3E72);
const _colorSecondary = Color(0xFF5D81BB);
const _colorBackgroundLight = Color(0xFFF7F9FC);
const _colorIconBg = Color(0xFFEFF6FF); // blue-50
const _colorIconBgDark = Color(0x1A1F3E72); // blue-900/30
const _colorTextLight = Color(0xFF334155); // slate-700
const _colorTextDark = Color(0xFFE2E8F0); // slate-200
const _colorChevron = Color(0xFFCBD5E1); // slate-300
const _colorLogoutBg = Color(0xFFFEF2F2); // red-50
const _colorLogoutBgDark = Color(0x33DC2626); // red-900/20
const _colorLogoutText = Color(0xFFEF4444); // red-500
const _colorLogoutChevron = Color(0xFFFECACA); // red-200

/// Profile / Options screen – UI converted from HTML "Tuỳ chọn".
/// Single scrollable list of options; no tabs, no app shell bar.
class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  final _passwordFormKey = GlobalKey<FormState>();
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isPasswordLoading = false;
  bool _obscureOld = true;
  bool _obscureNew = true;
  bool _obscureConfirm = true;

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _handleChangePassword() async {
    if (!_passwordFormKey.currentState!.validate()) return;
    setState(() => _isPasswordLoading = true);
    final success = await ref.read(authNotifierProvider.notifier).changePassword(
      _oldPasswordController.text,
      _newPasswordController.text,
    );
    setState(() => _isPasswordLoading = false);
    if (!mounted) return;
    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Mật khẩu đã được thay đổi thành công'), backgroundColor: AppColors.success),
      );
      _oldPasswordController.clear();
      _newPasswordController.clear();
      _confirmPasswordController.clear();
      Navigator.of(context).pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Thay đổi mật khẩu thất bại. Vui lòng kiểm tra lại mật khẩu hiện tại.'), backgroundColor: AppColors.error),
      );
    }
  }

  void _showChangePasswordSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => DraggableScrollableSheet(
        initialChildSize: 0.75,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        builder: (_, scrollController) => Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: Form(
            key: _passwordFormKey,
            child: ListView(
              controller: scrollController,
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 40),
              children: [
                const Text('Mật khẩu và bảo mật', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: _colorPrimary)),
                const SizedBox(height: 8),
                const Text('Cập nhật mật khẩu để bảo vệ tài khoản.', style: TextStyle(fontSize: 13, color: Color(0xFF64748B))),
                const SizedBox(height: 24),
                _buildFieldLabel('Mật khẩu hiện tại'),
                const SizedBox(height: 8),
                _buildPasswordField(_oldPasswordController, 'Nhập mật khẩu hiện tại', _obscureOld, () => setState(() => _obscureOld = !_obscureOld)),
                const SizedBox(height: 20),
                _buildFieldLabel('Mật khẩu mới'),
                const SizedBox(height: 8),
                _buildPasswordField(_newPasswordController, 'Nhập mật khẩu mới', _obscureNew, () => setState(() => _obscureNew = !_obscureNew)),
                const SizedBox(height: 20),
                _buildFieldLabel('Xác nhận mật khẩu mới'),
                const SizedBox(height: 8),
                _buildPasswordField(_confirmPasswordController, 'Nhập lại mật khẩu mới', _obscureConfirm, () => setState(() => _obscureConfirm = !_obscureConfirm), isLast: true),
                const SizedBox(height: 32),
                SizedBox(
                  height: 52,
                  child: ElevatedButton(
                    onPressed: _isPasswordLoading ? null : _handleChangePassword,
                    style: ElevatedButton.styleFrom(backgroundColor: _colorPrimary, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), elevation: 0),
                    child: _isPasswordLoading ? const SizedBox(height: 22, width: 22, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white)) : const Text('CẬP NHẬT MẬT KHẨU', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFieldLabel(String label) {
    return Text(label.toUpperCase(), style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: _colorPrimary, letterSpacing: 1.0));
  }

  Widget _buildPasswordField(TextEditingController controller, String hint, bool obscure, VoidCallback onToggle, {bool isLast = false}) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      textInputAction: isLast ? TextInputAction.done : TextInputAction.next,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Color(0xFF94A3B8), fontSize: 14),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        suffixIcon: IconButton(
          icon: Icon(obscure ? Icons.visibility_off_rounded : Icons.visibility_rounded, color: const Color(0xFF94A3B8), size: 18),
          onPressed: onToggle,
        ),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFFE2E8F0))),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: _colorPrimary, width: 1.5)),
        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Colors.redAccent)),
      ),
      validator: (v) {
        if (v == null || v.isEmpty) return 'Không được để trống';
        if (hint.contains('mới') && v.length < 8) return 'Tối thiểu 8 ký tự';
        if (hint.contains('Nhập lại') && v != _newPasswordController.text) return 'Mật khẩu không khớp';
        return null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final surfaceColor = isDark ? const Color(0xFF0F172A) : Colors.white;
    final bgColor = isDark ? const Color(0xFF0F172A) : _colorBackgroundLight;
    final textColor = isDark ? _colorTextDark : _colorTextLight;
    final iconBgColor = isDark ? _colorIconBgDark : _colorIconBg;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          children: [
            // Header: back + "Tuỳ chọn"
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                color: surfaceColor,
                border: Border(bottom: BorderSide(color: isDark ? const Color(0xFF334155) : const Color(0xFFF1F5F9), width: 1)),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      if (Navigator.of(context).canPop()) {
                        Navigator.of(context).pop();
                      } else {
                        context.go('/');
                      }
                    },
                    icon: Icon(Icons.chevron_left, color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B), size: 28),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      padding: const EdgeInsets.all(4),
                      minimumSize: const Size(40, 40),
                    ),
                  ),
                  const Expanded(
                    child: Text(
                      'Tuỳ chọn',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: _colorPrimary),
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),
            ),
            // List of options
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  _buildOptionTile(context, icon: Icons.person_outline_rounded, iconColor: _colorSecondary, label: 'Thông tin tài khoản', iconBgColor: iconBgColor, textColor: textColor, surfaceColor: surfaceColor, onTap: () => context.push('/profile/edit')),
                  const SizedBox(height: 12),
                  _buildOptionTile(context, icon: Icons.play_circle_filled_rounded, iconColor: _colorPrimary, label: 'Torii Flix', iconBgColor: iconBgColor, textColor: textColor, surfaceColor: surfaceColor, onTap: _onComingSoon),
                  const SizedBox(height: 12),
                  _buildOptionTile(context, icon: Icons.movie_outlined, iconColor: _colorSecondary, label: 'Video yêu thích', iconBgColor: iconBgColor, textColor: textColor, surfaceColor: surfaceColor, onTap: _onComingSoon),
                  const SizedBox(height: 12),
                  _buildOptionTile(context, icon: Icons.assignment_outlined, iconColor: _colorSecondary, label: 'Ghi chú của tôi', iconBgColor: iconBgColor, textColor: textColor, surfaceColor: surfaceColor, onTap: _onComingSoon),
                  const SizedBox(height: 12),
                  _buildOptionTile(context, icon: Icons.confirmation_number_outlined, iconColor: _colorSecondary, label: 'Voucher kích hoạt', iconBgColor: iconBgColor, textColor: textColor, surfaceColor: surfaceColor, onTap: _onComingSoon),
                  const SizedBox(height: 12),
                  _buildOptionTile(context, icon: Icons.toll_outlined, iconColor: _colorPrimary, label: 'Quy đổi coin', iconBgColor: iconBgColor, textColor: textColor, surfaceColor: surfaceColor, onTap: _onComingSoon),
                  const SizedBox(height: 12),
                  _buildOptionTile(context, icon: Icons.auto_fix_high_outlined, iconColor: _colorSecondary, label: 'Thay đổi giao diện', iconBgColor: iconBgColor, textColor: textColor, surfaceColor: surfaceColor, onTap: () => ref.read(themeModeProvider.notifier).toggleTheme()),
                  const SizedBox(height: 12),
                  _buildOptionTile(context, icon: Icons.receipt_long_outlined, iconColor: _colorSecondary, label: 'Lịch sử giao dịch', iconBgColor: iconBgColor, textColor: textColor, surfaceColor: surfaceColor, onTap: () => context.push('/payment/history')),
                  const SizedBox(height: 12),
                  _buildOptionTile(context, icon: Icons.help_outline_rounded, iconColor: _colorSecondary, label: 'Hướng dẫn sử dụng', iconBgColor: iconBgColor, textColor: textColor, surfaceColor: surfaceColor, onTap: _onComingSoon),
                  const SizedBox(height: 12),
                  _buildOptionTile(context, icon: Icons.lock_outline_rounded, iconColor: _colorSecondary, label: 'Mật khẩu và bảo mật', iconBgColor: iconBgColor, textColor: textColor, surfaceColor: surfaceColor, onTap: _showChangePasswordSheet),
                  const SizedBox(height: 12),
                  _buildOptionTile(
                    context,
                    icon: Icons.logout_rounded,
                    iconColor: _colorLogoutText,
                    label: 'Đăng xuất',
                    iconBgColor: isDark ? _colorLogoutBgDark : _colorLogoutBg,
                    textColor: _colorLogoutText,
                    surfaceColor: surfaceColor,
                    chevronColor: isDark ? const Color(0xFF7F1D1D) : _colorLogoutChevron,
                    onTap: () async {
                      await ref.read(authStateProvider.notifier).logout();
                      if (context.mounted) context.go('/');
                    },
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onComingSoon() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Tính năng đang phát triển'), behavior: SnackBarBehavior.floating),
    );
  }

  Widget _buildOptionTile(
    BuildContext context, {
    required IconData icon,
    required Color iconColor,
    required String label,
    required Color iconBgColor,
    required Color textColor,
    required Color surfaceColor,
    Color? chevronColor,
    required VoidCallback onTap,
  }) {
    final chevron = chevronColor ?? (Theme.of(context).brightness == Brightness.dark ? const Color(0xFF64748B) : _colorChevron);
    return Material(
      color: surfaceColor,
      borderRadius: BorderRadius.circular(12),
      shadowColor: Colors.black.withValues(alpha: 0.05),
      elevation: 1,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: iconBgColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: Icon(icon, color: iconColor, size: 22),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: textColor),
                ),
              ),
              Icon(Icons.chevron_right_rounded, color: chevron, size: 24),
            ],
          ),
        ),
      ),
    );
  }
}
