import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/providers/shared_prefs_provider.dart';
import 'package:torii_app/features/onboarding/providers/onboarding_provider.dart';

class WelcomeScreen extends ConsumerStatefulWidget {
  const WelcomeScreen({super.key});

  @override
  ConsumerState<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends ConsumerState<WelcomeScreen> {
  late final PageController _pageController;
  int _currentPage = 0;

  final List<_OnboardingPageData> _pages = const [
    _OnboardingPageData(
      asset: 'assets/images/onboarding_welcome.png',
      title: 'Chào mừng đến với Torii Nihongo',
      description:
          'Khám phá hành trình học tiếng Nhật được thiết kế riêng cho người Việt, từ cơ bản đến nâng cao.',
    ),
    _OnboardingPageData(
      asset: 'assets/images/onboarding_live.png',
      title: 'Lớp học tương tác trực tiếp',
      description:
          'Tham gia lớp học online, luyện nói với giáo viên và bạn học trong môi trường thân thiện.',
    ),
    _OnboardingPageData(
      asset: 'assets/images/onboarding_video.png',
      title: 'Học mọi lúc mọi nơi',
      description:
          'Xem lại video, luyện tập qua bài tập tương tác và theo dõi tiến độ học mỗi ngày.',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _completeOnboarding() async {
    final prefs = ref.read(sharedPreferencesProvider);
    final notifier = ref.read(onboardingNotifierProvider);
    await prefs.setBool(onboardingCompletedKey, true);
    notifier.value = true;
  }

  void _onSkip(BuildContext context) async {
    await _completeOnboarding();
    if (context.mounted) {
      context.go('/login');
    }
  }

  void _onNext(BuildContext context) async {
    if (_currentPage < _pages.length - 1) {
      _pageController.animateToPage(
        _currentPage + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    } else {
      await _completeOnboarding();
      if (context.mounted) {
        context.go('/register');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Top bar with Skip
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => _onSkip(context),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      minimumSize: const Size(0, 0),
                    ),
                    child: Text(
                      'Bỏ qua',
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(width: 52), // spacer
                  const SizedBox(width: 52), // balance với nút Bỏ qua
                ],
              ),
            ),

            // PageView with 3 onboarding tabs
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  final page = _pages[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 16),
                        Expanded(
                          child: Center(
                            child: Image.asset(
                              page.asset,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          page.title,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.w800,
                            color: theme.colorScheme.onSurface,
                            letterSpacing: -0.5,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          page.description,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                            height: 1.6,
                          ),
                        ),
                        const SizedBox(height: 32),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Bottom controls
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Indicator dots
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(_pages.length, (index) {
                      final isActive = index == _currentPage;
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        height: 6,
                        width: isActive ? 20 : 8,
                        decoration: BoxDecoration(
                          color: isActive
                              ? theme.colorScheme.primary
                              : theme.colorScheme.outlineVariant,
                          borderRadius: BorderRadius.circular(999),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => _onNext(context),
                      child: Text(
                        _currentPage == _pages.length - 1
                            ? 'Bắt đầu học ngay'
                            : 'Tiếp tục',
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  TextButton(
                    onPressed: () async {
                      await _completeOnboarding();
                      if (context.mounted) {
                        context.go('/login');
                      }
                    },
                    child: Text(
                      'Tôi đã có tài khoản',
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OnboardingPageData {
  final String asset;
  final String title;
  final String description;

  const _OnboardingPageData({
    required this.asset,
    required this.title,
    required this.description,
  });
}
