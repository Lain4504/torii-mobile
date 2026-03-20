import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../services/auth/onboarding_service.dart';
import '../../../auth/providers/auth_providers.dart';

class OnboardingSurveyScreen extends ConsumerStatefulWidget {
  const OnboardingSurveyScreen({super.key});

  @override
  ConsumerState<OnboardingSurveyScreen> createState() => _OnboardingSurveyScreenState();
}

class _OnboardingSurveyScreenState extends ConsumerState<OnboardingSurveyScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool _isSubmitting = false;

  // Form State
  String _learningTarget = '6 months';
  String _learningPurpose = 'JLPT';
  String? _jlptExamDate = 'July 2024';
  int _dailyStudyTime = 60;
  String _currentLevel = 'Never learned';
  bool _wantsPlacementTest = false;

  Future<void> _skipSurvey() async {
    if (_isSubmitting) return;
    setState(() => _isSubmitting = true);
    final authNotifier = ref.read(authStateProvider.notifier);

    try {
      // Persist minimal/default values so backend can mark user as onboarded
      // (trường hợp backend deploy được).
      final service = ref.read(onboardingServiceProvider);
      final response = await service.saveSurvey(
        learningTarget: _learningTarget,
        learningPurpose: _learningPurpose,
        jlptExamDate: _learningPurpose == 'JLPT' ? _jlptExamDate : null,
        dailyStudyTime: _dailyStudyTime,
        currentLevel: _currentLevel,
        wantsPlacementTest: _wantsPlacementTest,
      );

      if (response.success) {
        await authNotifier.refreshProfile();
      }
    } catch (_) {
      // Backend lỗi/đang dùng API cũ -> fallback đánh dấu onboarding cục bộ
    }

    // Đảm bảo router không redirect ngược về `/onboarding-survey`
    final user = ref.read(authStateProvider).asData?.value.user;
    if (user == null || !user.isOnboarded) {
      await authNotifier.markOnboardedLocally();
    }

    if (mounted) context.go('/');
    if (mounted) setState(() => _isSubmitting = false);
  }

  List<Widget> get _pages {
    return [
      _buildWelcomeStep(),
      _buildTargetStep(),
      _buildPurposeStep(),
      if (_learningPurpose == 'JLPT') _buildJLPTDateStep(),
      _buildFrequencyStep(),
      _buildLevelStep(),
      _buildFinalStep(),
    ];
  }

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void _prevPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> _submit() async {
    setState(() => _isSubmitting = true);
    final service = ref.read(onboardingServiceProvider);
    
    final response = await service.saveSurvey(
      learningTarget: _learningTarget,
      learningPurpose: _learningPurpose,
      jlptExamDate: _learningPurpose == 'JLPT' ? _jlptExamDate : null,
      dailyStudyTime: _dailyStudyTime,
      currentLevel: _currentLevel,
      wantsPlacementTest: _wantsPlacementTest,
    );

    if (response.success) {
      // Refresh Auth State to get new isOnboarded flag
      await ref.read(authStateProvider.notifier).refreshProfile();
      if (mounted) context.go('/');
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response.message ?? 'Failed to save survey')),
        );
      }
    }
    setState(() => _isSubmitting = false);
  }

  @override
  Widget build(BuildContext context) {
    final progress = (_currentPage + 1) / _pages.length;

    return Scaffold(
      backgroundColor: AppTheme.light.colorScheme.background,
      body: SafeArea(
        child: Column(
          children: [
            // Progress Bar
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Step ${_currentPage + 1} of ${_pages.length}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                      TextButton(
                        onPressed: _isSubmitting ? null : _skipSurvey,
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          visualDensity: VisualDensity.compact,
                        ),
                        child: const Text(
                          'Skip',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ),
                      Text(
                        '${(progress * 100).toInt()}%',
                        style: const TextStyle(fontWeight: FontWeight.w800, color: Colors.blue, fontSize: 12),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.blue.withOpacity(0.1),
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                    borderRadius: BorderRadius.circular(10),
                    minHeight: 6,
                  ),
                ],
              ),
            ),

            // Content
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (page) => setState(() => _currentPage = page),
                children: _pages,
              ),
            ),

            // Bottom Navigation
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (_currentPage > 0)
                    TextButton.icon(
                      onPressed: _isSubmitting ? null : _prevPage,
                      icon: const Icon(Icons.chevron_left),
                      label: const Text('Back'),
                      style: TextButton.styleFrom(
                        visualDensity: VisualDensity.compact,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      ),
                    )
                  else
                    const SizedBox.shrink(),
                  
                  ElevatedButton(
                    onPressed: _isSubmitting 
                      ? null 
                      : (_currentPage == _pages.length - 1 ? _submit : _nextPage),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 0,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      visualDensity: VisualDensity.compact,
                    ),
                    child: _isSubmitting 
                      ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                      : Text(_currentPage == _pages.length - 1 ? 'Finish' : 'Next'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepContainer({
    required IconData icon,
    required String title,
    required String subtitle,
    required Widget content,
    Color iconColor = Colors.blue,
  }) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 28, color: iconColor),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.grey, fontSize: 13, height: 1.25),
          ),
          const SizedBox(height: 20),
          content,
        ],
      ),
    );
  }

  Widget _buildWelcomeStep() {
    return _buildStepContainer(
      icon: Icons.auto_awesome,
      title: 'Welcome to Torii Mon',
      subtitle: 'Let\'s personalize your experience to your goals and pace.',
      iconColor: Colors.amber,
      content: const Column(
        children: [
          SizedBox(height: 40),
          Text(
            'Japanese is a journey. We are here to help you every step of the way.',
            textAlign: TextAlign.center,
            style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildTargetStep() {
    return _buildStepContainer(
      icon: Icons.flag,
      title: 'Your Deadline',
      subtitle: 'When do you want to reach your goal?',
      content: Wrap(
        spacing: 12,
        runSpacing: 12,
        children: [
          '4 months', '6 months', '8 months', '12 months', 'No deadline'
        ].map((t) => _buildOptionCard(
          label: t,
          isSelected: _learningTarget == t,
          onTap: () => setState(() => _learningTarget = t),
        )).toList(),
      ),
    );
  }

  Widget _buildPurposeStep() {
    return _buildStepContainer(
      icon: Icons.emoji_events,
      title: 'Learning Purpose',
      subtitle: 'Why are you learning Japanese?',
      iconColor: Colors.orange,
      content: Column(
        children: [
          { 'label': 'JLPT Exam', 'value': 'JLPT' },
          { 'label': 'Work / Business', 'value': 'Work' },
          { 'label': 'Study Abroad', 'value': 'Study' },
          { 'label': 'Travel / Culture', 'value': 'Travel' },
          { 'label': 'Other', 'value': 'Other' },
        ].map((p) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: _buildOptionCard(
            label: p['label'] as String,
            isSelected: _learningPurpose == p['value'],
            onTap: () => setState(() => _learningPurpose = p['value'] as String),
            fullWidth: true,
          ),
        )).toList(),
      ),
    );
  }

  Widget _buildJLPTDateStep() {
    return _buildStepContainer(
      icon: Icons.calendar_today,
      title: 'JLPT Exam Date',
      subtitle: 'When are you taking the exam?',
      iconColor: Colors.red,
      content: Column(
        children: [
          'July 2024', 'December 2024', 'July 2025', 'December 2025', 'Not decided'
        ].map((d) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: _buildOptionCard(
            label: d,
            isSelected: _jlptExamDate == d,
            onTap: () => setState(() => _jlptExamDate = d),
            fullWidth: true,
          ),
        )).toList(),
      ),
    );
  }

  Widget _buildFrequencyStep() {
    return _buildStepContainer(
      icon: Icons.schedule,
      title: 'Study Time',
      subtitle: 'How many minutes per day?',
      iconColor: Colors.teal,
      content: Column(
        children: [
          { 'label': '15-30 minutes', 'value': 30 },
          { 'label': '1 hour', 'value': 60 },
          { 'label': '2 hours', 'value': 120 },
          { 'label': '3+ hours', 'value': 240 },
        ].map((f) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: _buildOptionCard(
            label: f['label'] as String,
            isSelected: _dailyStudyTime == f['value'],
            onTap: () => setState(() => _dailyStudyTime = f['value'] as int),
            fullWidth: true,
          ),
        )).toList(),
      ),
    );
  }

  Widget _buildLevelStep() {
    return _buildStepContainer(
      icon: Icons.school,
      title: 'Current Level',
      subtitle: 'Where are you starting from?',
      iconColor: Colors.purple,
      content: Column(
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 8,
            alignment: WrapAlignment.center,
            children: [
              'Zero', 'N5.1', 'N5.2', 'N5.3', 'N4', 'N3', 'N2', 'N1'
            ].map((l) => SizedBox(
              width: 80,
              child: _buildOptionCard(
                label: l,
                isSelected: _currentLevel == l,
                onTap: () => setState(() => _currentLevel = l),
              ),
            )).toList(),
          ),
          const SizedBox(height: 32),
          CheckboxListTile(
            value: _wantsPlacementTest,
            onChanged: (val) => setState(() => _wantsPlacementTest = val ?? false),
            title: const Text('I want a placement test', style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: const Text('Recommended if you have previous knowledge'),
            activeColor: Colors.blue,
            contentPadding: EdgeInsets.zero,
            controlAffinity: ListTileControlAffinity.leading,
          ),
        ],
      ),
    );
  }

  Widget _buildFinalStep() {
    return _buildStepContainer(
      icon: Icons.flash_on,
      title: 'Ready to Go!',
      subtitle: 'We have generated your personalized roadmap.',
      iconColor: Colors.cyan,
      content: const Column(
        children: [
          SizedBox(height: 40),
          Icon(Icons.rocket, size: 80, color: Colors.blue),
          SizedBox(height: 24),
          Text(
            'Your learning path is optimized for your target. Let\'s make it happen!',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionCard({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
    bool fullWidth = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: fullWidth ? double.infinity : null,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.withOpacity(0.05) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey.withOpacity(0.3),
            width: isSelected ? 2 : 1,
          ),
          boxShadow: isSelected ? [
            BoxShadow(
              color: Colors.blue.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 6),
            )
          ] : null,
        ),
        child: Row(
          mainAxisSize: fullWidth ? MainAxisSize.max : MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              child: Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                  color: isSelected ? Colors.blue : Colors.black87,
                ),
              ),
            ),
            if (fullWidth) const Spacer() else const SizedBox(width: 12),
            if (isSelected)
              const Icon(Icons.check_circle, color: Colors.blue, size: 18),
          ],
        ),
      ),
    );
  }
}
