import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryRed = Color(0xFFE53935);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Cài đặt', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 12),
        children: [
          _buildMenuItem(Icons.person_outline, 'Hồ sơ cá nhân', primaryRed),
          _buildMenuItem(Icons.lock_outline, 'Đổi mật khẩu', primaryRed),
          _buildMenuItem(Icons.military_tech_outlined, 'Thành tựu học tập', primaryRed),
          _buildMenuItem(Icons.credit_card_outlined, 'Thông tin thanh toán', primaryRed),
          _buildMenuItem(Icons.notifications_none_rounded, 'Thông báo', primaryRed),
          _buildMenuItem(Icons.help_outline_rounded, 'Trợ giúp', primaryRed),
          _buildMenuItem(Icons.article_outlined, 'Điều khoản sử dụng', primaryRed),
          const Divider(height: 32),
          _buildMenuItem(Icons.logout_rounded, 'Đăng xuất', primaryRed, isDestructive: true),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, Color primaryRed, {bool isDestructive = false}) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(color: isDestructive ? Colors.red[50] : Colors.grey[50], borderRadius: BorderRadius.circular(10)),
        child: Icon(icon, color: isDestructive ? Colors.red : primaryRed, size: 22),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: isDestructive ? Colors.red : Colors.black87,
        ),
      ),
      trailing: isDestructive ? null : const Icon(Icons.chevron_right, color: Colors.grey, size: 20),
      onTap: () {},
    );
  }
}
