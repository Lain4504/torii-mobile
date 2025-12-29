import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../auth/providers/auth_providers.dart';

/// Dashboard Page - Trang home với nút Logout
class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  Future<void> _handleLogout(BuildContext context, WidgetRef ref) async {
    final authState = ref.read(authStateProvider.notifier);
    await authState.logout();
    
    if (context.mounted) {
      context.go('/login');
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text(
          'Dashboard',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          // Hiển thị button theo trạng thái đăng nhập
          if (authState.isAuthenticated)
            // Button Logout khi đã đăng nhập
            IconButton(
              icon: const Icon(Icons.logout),
              tooltip: 'Đăng xuất',
              onPressed: authState.isLoading
                  ? null
                  : () => _handleLogout(context, ref),
            )
          else
            // Buttons Đăng ký và Đăng nhập khi chưa đăng nhập
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                  onPressed: () => context.go('/register'),
                  child: const Text(
                    'Đăng ký',
                    style: TextStyle(
                      color: Color(0xFFFF6B6B),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => context.go('/login'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(color: Color(0xFFFF6B6B), width: 1.5),
                    ),
                  ),
                  child: const Text(
                    'Đăng nhập',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
              ],
            ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Welcome Section với họa tiết Nhật Bản
          Container(
            padding: const EdgeInsets.all(24),
            margin: const EdgeInsets.only(bottom: 24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: const Color(0xFFFFE0E0),
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                // Họa tiết vòng tròn (enso)
                Container(
                  width: 60,
                  height: 60,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFFFF6B6B).withOpacity(0.3),
                      width: 3,
                    ),
                  ),
                  child: const Icon(
                    Icons.school,
                    color: Color(0xFFFF6B6B),
                    size: 30,
                  ),
                ),
                const Text(
                  'Chào mừng đến với Torii',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF333333),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Học tiếng Nhật hiệu quả',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),

          // Menu Items
          _buildMenuItem(
            context,
            icon: Icons.book,
            title: 'Khóa học',
            subtitle: 'Xem các khóa học tiếng Nhật',
            onTap: () => context.go('/courses'),
            color: const Color(0xFFFF6B6B),
          ),
          const SizedBox(height: 12),
          _buildMenuItem(
            context,
            icon: Icons.video_call,
            title: 'Lớp học trực tuyến',
            subtitle: 'Tham gia lớp học live',
            onTap: () => context.go('/live-classes'),
            color: const Color(0xFFFF6B6B),
          ),
          const SizedBox(height: 12),
          _buildMenuItem(
            context,
            icon: Icons.quiz,
            title: 'Bài kiểm tra',
            subtitle: 'Làm bài kiểm tra',
            onTap: () => context.go('/exams'),
            color: const Color(0xFFFF6B6B),
          ),
          const SizedBox(height: 12),
          _buildMenuItem(
            context,
            icon: Icons.style,
            title: 'Flashcards',
            subtitle: 'Học từ vựng với flashcards',
            onTap: () => context.go('/flashcards'),
            color: const Color(0xFFFF6B6B),
          ),
          const SizedBox(height: 12),
          _buildMenuItem(
            context,
            icon: Icons.payment,
            title: 'Thanh toán',
            subtitle: 'Quản lý thanh toán',
            onTap: () => context.go('/payments'),
            color: const Color(0xFFFF6B6B),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    required Color color,
  }) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey[200]!),
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: color),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
        trailing: const Icon(Icons.chevron_right, color: Color(0xFF999999)),
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
      ),
    );
  }
}

