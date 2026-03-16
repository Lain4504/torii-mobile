import 'package:flutter/material.dart';
import 'package:torii_app/core/constants/app_design_system.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        title: const Text('Cài đặt', style: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.bold)),
        backgroundColor: AppColors.surface,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 12),
        children: [
          _buildMenuItem(Icons.person_outline, 'Hồ sơ cá nhân', false),
          _buildMenuItem(Icons.lock_outline, 'Đổi mật khẩu', false),
          _buildMenuItem(Icons.military_tech_outlined, 'Thành tựu học tập', false),
          _buildMenuItem(Icons.credit_card_outlined, 'Thông tin thanh toán', false),
          _buildMenuItem(Icons.notifications_none_rounded, 'Thông báo', false),
          _buildMenuItem(Icons.help_outline_rounded, 'Trợ giúp', false),
          _buildMenuItem(Icons.article_outlined, 'Điều khoản sử dụng', false),
          const Divider(height: 32),
          _buildMenuItem(Icons.logout_rounded, 'Đăng xuất', true),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, bool isDestructive) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(color: isDestructive ? AppColors.errorLight : AppColors.background, borderRadius: BorderRadius.circular(10)),
        child: Icon(icon, color: isDestructive ? AppColors.error : AppColors.primary, size: 22),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: isDestructive ? AppColors.error : AppColors.textPrimary,
        ),
      ),
      trailing: isDestructive ? null : const Icon(Icons.chevron_right, color: AppColors.textTertiary, size: 20),
      onTap: () {},
    );
  }
}
