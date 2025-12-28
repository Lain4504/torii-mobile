import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../course/course_view.dart';
import 'widgets/onboarding_page.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingPageData> _pages = [
    OnboardingPageData(
      imagePath: 'assets/images/bg_1.png',
      icon: Icons.school_outlined,
      title: 'Chào mừng bạn đến với Torii Nihongo!',
      description: 'Học tiếng Nhật từ căn bản đến nâng cao một cách hiệu quả và thú vị với phương pháp học hiện đại',
      buttonText: 'Tiếp tục',
    ),
    OnboardingPageData(
      imagePath: 'assets/images/bg_1.png',
      icon: Icons.video_library_outlined,
      title: 'Khoá học và lộ trình đa dạng',
      description: 'Tiếp cận hàng trăm bài học video, làm bài tập phù hợp với mọi trình độ từ N5 đến N1',
      buttonText: 'Tiếp tục',
    ),
    OnboardingPageData(
      imagePath: 'assets/images/bg_1.png',
      icon: Icons.quiz_outlined,
      title: 'Rèn luyện và nâng cao tiếng Nhật',
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
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const CourseView()),
    );
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
                return OnboardingPage(
                  data: _pages[index],
                  onButtonPressed: _nextPage,
                );
              },
            ),
            // Nút Bỏ qua ở góc trên bên phải
            Positioned(
              top: 16,
              right: 16,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: TextButton(
                  onPressed: _skipOnboarding,
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  child: const Text(
                    'Bỏ qua',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFFFFFFF),
                      letterSpacing: 0.5,
                      shadows: [
                        Shadow(
                          color: Colors.black54,
                          offset: Offset(0, 1),
                          blurRadius: 3,
                        ),
                      ],
                    ),
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
      width: isActive ? 32 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: isActive
            ? Colors.white // Màu trắng nổi bật trên nền tối
            : Colors.white.withOpacity(0.4),
        borderRadius: BorderRadius.circular(4),
        boxShadow: isActive
            ? [
                BoxShadow(
                  color: Colors.white.withOpacity(0.5),
                  blurRadius: 8,
                  spreadRadius: 1,
                ),
              ]
            : null,
      ),
    );
  }
}

