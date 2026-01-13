import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../core/widgets/animations/entry_animation.dart';

/// Onboarding Page - Minimalist First Impressions
/// 
/// A calm, elegant introduction to the Torii learning experience.
/// Features generous whitespace and focused messaging.
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<_OnboardingData> _pages = [
    _OnboardingData(
      icon: Icons.auto_stories_outlined,
      title: 'Learn Japanese',
      subtitle: 'Your gateway to the Japanese language',
      description: 'Master vocabulary, grammar, and kanji through interactive lessons designed for all levels.',
    ),
    _OnboardingData(
      icon: Icons.psychology_outlined,
      title: 'Smart Practice',
      subtitle: 'Powered by spaced repetition',
      description: 'Our intelligent flashcard system helps you remember what you learn, when you need it most.',
    ),
    _OnboardingData(
      icon: Icons.emoji_events_outlined,
      title: 'Track Progress',
      subtitle: 'Celebrate every milestone',
      description: 'Set goals, earn streaks, and watch your Japanese skills grow day by day.',
    ),
  ];

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: AppDuration.normal,
        curve: AppCurves.easeOut,
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
    final theme = Theme.of(context);
    
    return Scaffold(
      body: Stack(
        children: [
          // Zen Background Pattern
          Positioned.fill(
            child: Container(
              color: theme.scaffoldBackgroundColor,
              child: Stack(
                children: [
                  // Top Right Soft Glow
                  Positioned(
                    top: -100,
                    right: -100,
                    child: Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        color: AppColors.primarySurface.withOpacity(0.3),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  // Bottom Left Soft Glow
                  Positioned(
                    bottom: -50,
                    left: -50,
                    child: Container(
                      width: 250,
                      height: 250,
                      decoration: BoxDecoration(
                        color: AppColors.accentSurface.withOpacity(0.3),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  // Subtle Grid/Pattern (Ma inspiration)
                  Positioned.fill(
                    child: CustomPaint(
                      painter: ZenPatternPainter(
                        color: AppColors.grey200.withOpacity(0.2),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          SafeArea(
            child: Column(
              children: [
                // Header with Logo
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.lg,
                    vertical: AppSpacing.md,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      EntryAnimation(
                        delay: const Duration(milliseconds: 200),
                        child: Row(
                          children: [
                            Container(
                              width: 36,
                              height: 36,
                              decoration: BoxDecoration(
                                gradient: AppColors.primaryGradient,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.primary.withOpacity(0.2),
                                    blurRadius: 12,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: const Center(
                                child: Text(
                                  '鳥',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: AppSpacing.sm),
                            Text(
                              'TORII',
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: AppTypography.extraBold,
                                letterSpacing: 1.2,
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      if (_currentPage < _pages.length - 1)
                        EntryAnimation(
                          delay: const Duration(milliseconds: 300),
                          child: TextButton(
                            onPressed: _skipOnboarding,
                            style: TextButton.styleFrom(
                              foregroundColor: AppColors.textSecondary,
                            ),
                            child: const Text('Skip'),
                          ),
                        ),
                    ],
                  ),
                ),
                
                // Page Content
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() => _currentPage = index);
                    },
                    itemCount: _pages.length,
                    itemBuilder: (context, index) {
                      return _OnboardingSlide(
                        data: _pages[index],
                        isActive: index == _currentPage,
                      );
                    },
                  ),
                ),
                
                // Bottom Section
                Padding(
                  padding: const EdgeInsets.all(AppSpacing.xl),
                  child: Column(
                    children: [
                      // Page Indicators
                      EntryAnimation(
                        delay: const Duration(milliseconds: 400),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            _pages.length,
                            (index) => _PageIndicator(isActive: index == _currentPage),
                          ),
                        ),
                      ),
                      const SizedBox(height: AppSpacing.xxl),
                      
                      // Action Button
                      EntryAnimation(
                        delay: const Duration(milliseconds: 500),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _nextPage,
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 18),
                              elevation: 8,
                              shadowColor: AppColors.primary.withOpacity(0.25),
                            ),
                            child: Text(
                              _currentPage == _pages.length - 1 
                                  ? 'Begin Your Journey' 
                                  : 'Explore More',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: AppSpacing.md),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Custom Background Painter for Zen aesthetic
class ZenPatternPainter extends CustomPainter {
  final Color color;
  ZenPatternPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    // Draw rhythmic vertical lines (like bamboo or shoji)
    const spacing = 60.0;
    for (double i = 0; i < size.width; i += spacing) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Onboarding Slide - Individual page content
class _OnboardingSlide extends StatelessWidget {
  final _OnboardingData data;
  final bool isActive;

  const _OnboardingSlide({
    required this.data,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xxl),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Illustration/Icon Container
          EntryAnimation(
            animate: isActive,
            index: 0,
            verticalOffset: 40,
            child: Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withOpacity(0.04),
                    blurRadius: 32,
                    offset: const Offset(0, 12),
                  ),
                ],
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Spinning outer ring (subtle decoration)
                  Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.primarySurface,
                        width: 1,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Icon(
                    data.icon,
                    size: 72,
                    color: AppColors.primary,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.xxxl),
          
          // Badge
          EntryAnimation(
            animate: isActive,
            index: 1,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
                vertical: AppSpacing.xs,
              ),
              decoration: BoxDecoration(
                color: AppColors.primarySurface,
                borderRadius: BorderRadius.circular(AppRadius.full),
              ),
              child: Text(
                data.subtitle.toUpperCase(),
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: AppTypography.bold,
                  color: AppColors.primary,
                  letterSpacing: 2,
                ),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          
          // Title
          EntryAnimation(
            animate: isActive,
            index: 2,
            child: Text(
              data.title,
              style: theme.textTheme.displaySmall?.copyWith(
                fontWeight: AppTypography.extraBold,
                color: AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          
          // Description
          EntryAnimation(
            animate: isActive,
            index: 3,
            child: Text(
              data.description,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: AppColors.textSecondary,
                height: 1.7,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

/// Page Indicator
class _PageIndicator extends StatelessWidget {
  final bool isActive;

  const _PageIndicator({required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: AppDuration.normal,
      curve: AppCurves.fastOutSlowIn,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: isActive ? 32 : 8,
      height: 6,
      decoration: BoxDecoration(
        color: isActive ? AppColors.primary : AppColors.grey300.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10),
        boxShadow: isActive ? [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ] : null,
      ),
    );
  }
}

/// Onboarding data model
class _OnboardingData {
  final IconData icon;
  final String title;
  final String subtitle;
  final String description;

  _OnboardingData({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.description,
  });
}
