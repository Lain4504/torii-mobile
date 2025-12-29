import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/assets.dart';
import '../widgets/onboarding_slide.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingPageData> _pages = [
    OnboardingPageData(
      imagePath: Assets.onboarding1,
      title: 'Học tiếng Nhật dễ dàng',
      description: 'Học tiếng Nhật từ căn bản đến nâng cao một cách hiệu quả và thú vị với phương pháp học hiện đại',
      buttonText: 'Tiếp tục',
    ),
    OnboardingPageData(
      imagePath: Assets.onboarding2,
      title: 'Lộ trình rõ ràng, hiệu quả',
      description: 'Tiếp cận hàng trăm bài học video, làm bài tập phù hợp với mọi trình độ từ N5 đến N1',
      buttonText: 'Tiếp tục',
    ),
    OnboardingPageData(
      imagePath: Assets.onboarding3,
      title: 'Học mọi lúc, mọi nơi',
      description: 'Thực hành, làm bài tập và ôn luyện từ vựng mọi lúc, mọi nơi với công nghệ AI thông minh',
      buttonText: 'Bắt đầu ngay',
    ),
  ];

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _completeOnboarding();
    }
  }

  void _skipOnboarding() {
    _completeOnboarding();
  }

  Future<void> _completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarding_completed', true);
    
    if (!mounted) return;
    context.go('/');
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: _pages.length,
              itemBuilder: (context, index) {
                return OnboardingSlide(
                  data: _pages[index],
                  onButtonPressed: _nextPage,
                );
              },
            ),
            // Nút Bỏ qua ở góc trên bên phải
            Positioned(
              top: 24,
              right: 24,
              child: TextButton(
                onPressed: _skipOnboarding,
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
                child: Text(
                  'Bỏ qua',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
            ),
            // Page indicator ở dưới cùng (ngay trên nút)
            Positioned(
              bottom: 120,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _pages.length,
                  (index) => _buildPageIndicator(index == _currentPage),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPageIndicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: isActive ? 24 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: isActive
            ? const Color(0xFF4CAF50) // Màu xanh lá
            : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}


