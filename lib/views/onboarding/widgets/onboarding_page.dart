import 'package:flutter/material.dart';

class OnboardingPageData {
  final String imagePath;
  final IconData icon;
  final String title;
  final String description;
  final String buttonText;

  OnboardingPageData({
    required this.imagePath,
    required this.icon,
    required this.title,
    required this.description,
    required this.buttonText,
  });
}

class OnboardingPage extends StatefulWidget {
  final OnboardingPageData data;
  final VoidCallback onButtonPressed;

  const OnboardingPage({
    super.key,
    required this.data,
    required this.onButtonPressed,
  });

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(widget.data.imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            // Gradient overlay để text dễ đọc hơn với màu sắc đẹp hơn
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0.0, 0.4, 0.7, 1.0],
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.4),
                Colors.black.withOpacity(0.6),
                Colors.black.withOpacity(0.75),
              ],
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  const Spacer(flex: 2),
                  // Logo Torii Nihongo với animation
                  ScaleTransition(
                    scale: _scaleAnimation,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: Image.asset(
                        'assets/images/logo.png',
                        height: 60,
                        width: 60,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Icon đại diện cho tính năng với animation
                  ScaleTransition(
                    scale: _scaleAnimation,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white.withOpacity(0.3),
                          width: 2,
                        ),
                      ),
                      child: Icon(
                        widget.data.icon,
                        size: 52,
                        color: const Color(0xFFFFFFFF), // Trắng tinh khiết
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.5),
                            offset: const Offset(0, 2),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Tiêu đề với màu trắng tinh khiết và shadow đẹp
                  Text(
                    widget.data.title,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFFFFFFFF), // Trắng tinh khiết
                      height: 1.3,
                      letterSpacing: 0.8,
                      shadows: [
                        Shadow(
                          color: Color(0xFF000000), // Đen đậm
                          offset: Offset(0, 4),
                          blurRadius: 12,
                        ),
                        Shadow(
                          color: Color(0x80000000), // Đen mờ
                          offset: Offset(0, 2),
                          blurRadius: 6,
                        ),
                        Shadow(
                          color: Color(0x40000000), // Đen nhạt
                          offset: Offset(0, 1),
                          blurRadius: 3,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  // Mô tả với màu sáng và shadow đẹp hơn
                  Text(
                    widget.data.description,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFFF5F5F5), // Màu trắng kem
                      height: 1.7,
                      letterSpacing: 0.3,
                      shadows: [
                        const Shadow(
                          color: Color(0xFF000000), // Đen đậm
                          offset: Offset(0, 2),
                          blurRadius: 6,
                        ),
                        Shadow(
                          color: Colors.black.withOpacity(0.6),
                          offset: const Offset(0, 1),
                          blurRadius: 3,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(flex: 3),
                  // Nút hành động
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: widget.onButtonPressed,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFDC143C), // Màu đỏ
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 8,
                        shadowColor: const Color(0xFFDC143C).withOpacity(0.5),
                      ),
                      child: Text(
                        widget.data.buttonText,
                        style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.0,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              color: Colors.black26,
                              offset: Offset(0, 2),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

