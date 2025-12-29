import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/register_form.dart';

/// Register Page với UI phong cách Nhật Bản
class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFFFFF0F5), // Màu hồng sakura nhạt
              Colors.white,
              const Color(0xFFF0F8FF), // Màu xanh nhạt
            ],
            stops: const [0.0, 0.5, 1.0],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Custom AppBar với decoration Nhật Bản
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.home, color: Color(0xFF333333)),
                        tooltip: 'Về trang chủ',
                        onPressed: () => context.go('/'),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Đăng ký',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.5,
                                color: Color(0xFF333333),
                              ),
                            ),
                            Text(
                              '新規登録',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                                letterSpacing: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Icon Nhật Bản
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF6B6B).withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.local_florist,
                          color: Color(0xFFFF6B6B),
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Body với decoration
              Expanded(
                child: Stack(
                  children: [
                    // Background decoration - Sakura
                    Positioned(
                      top: 30,
                      right: 30,
                      child: Opacity(
                        opacity: 0.12,
                        child: Icon(
                          Icons.local_florist,
                          size: 120,
                          color: const Color(0xFFFF6B6B),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 180,
                      left: 30,
                      child: Opacity(
                        opacity: 0.1,
                        child: Icon(
                          Icons.eco,
                          size: 90,
                          color: const Color(0xFFFF6B6B),
                        ),
                      ),
                    ),
                    // Form content
                    SingleChildScrollView(
                      padding: const EdgeInsets.all(24),
                      child: const RegisterForm(),
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

