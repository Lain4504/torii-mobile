import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/constants/app_design_system.dart';
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
  String _learningTarget = '6 tháng';
  String _learningPurpose = 'JLPT';
  String? _selectedJlptMonth = 'Tháng 7';
  String? _selectedJlptYear = '2026';
  String _jlptExamDate = 'Tháng 7/2026';
  int _dailyStudyTime = 60;
  String _currentLevel = 'Mới bắt đầu';
  bool _wantsPlacementTest = false;

  Future<void> _skipSurvey() async {
    if (_isSubmitting) return;
    setState(() => _isSubmitting = true);
    final authNotifier = ref.read(authStateProvider.notifier);

    try {
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
      // Fallback mark onboarding locally if backend fails
    }

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
      _buildPurposeStep(),
      _buildLevelStep(),
      _buildTargetStep(),
      _buildFrequencyStep(),
      if (_learningPurpose == 'JLPT' || _learningPurpose == 'JLPT Exam') _buildJLPTDateStep(),
      _buildFinalStep(),
    ];
  }

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void _prevPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 400),
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
      jlptExamDate: (_learningPurpose == 'JLPT' || _learningPurpose == 'JLPT Exam') ? _jlptExamDate : null,
      dailyStudyTime: _dailyStudyTime,
      currentLevel: _currentLevel,
      wantsPlacementTest: _wantsPlacementTest,
    );

    if (response.success) {
      await ref.read(authStateProvider.notifier).refreshProfile();
      if (mounted) context.go('/');
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response.message ?? 'Không thể lưu khảo sát')),
        );
      }
    }
    setState(() => _isSubmitting = false);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final progress = (_currentPage + 1) / _pages.length;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Simplified Progress Bar
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  LinearProgressIndicator(
                    value: progress,
                    backgroundColor: theme.colorScheme.primary.withValues(alpha: 0.1),
                    valueColor: AlwaysStoppedAnimation<Color>(theme.colorScheme.primary),
                    borderRadius: BorderRadius.circular(10),
                    minHeight: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (_currentPage < _pages.length - 1)
                        TextButton(
                          onPressed: _isSubmitting ? null : _skipSurvey,
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                            minimumSize: Size.zero,
                          ),
                          child: Text(
                            'Bỏ qua',
                            style: TextStyle(
                              color: theme.colorScheme.onSurfaceVariant,
                              fontWeight: AppTypography.semiBold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                    ],
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

            // Navigation Bar
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
              child: Row(
                children: [
                  if (_currentPage > 0)
                    Expanded(
                      flex: 1,
                      child: TextButton(
                        onPressed: _isSubmitting ? null : _prevPage,
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        child: Text(
                          'Quay lại',
                          style: TextStyle(
                            color: theme.colorScheme.onSurfaceVariant,
                            fontWeight: AppTypography.semiBold,
                          ),
                        ),
                      ),
                    )
                  else
                    const Expanded(flex: 1, child: SizedBox.shrink()),
                  
                  const SizedBox(width: 16),
                  
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      onPressed: _isSubmitting 
                        ? null 
                        : (_currentPage == _pages.length - 1 ? _submit : _nextPage),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.colorScheme.primary,
                        foregroundColor: theme.colorScheme.onPrimary,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.button)),
                      ),
                      child: _isSubmitting 
                        ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                        : Text(
                            _currentPage == _pages.length - 1 ? 'Bắt đầu ngay' : 'Tiếp tục',
                            style: const TextStyle(fontWeight: AppTypography.bold),
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

  Widget _buildStepContainer({
    required IconData icon,
    required String title,
    required String subtitle,
    required Widget content,
    Color? iconColor,
  }) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(height: 32),
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: (iconColor ?? theme.colorScheme.primary).withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(icon, size: 36, color: iconColor ?? theme.colorScheme.primary),
          ),
          const SizedBox(height: 24),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: AppTypography.bold,
              color: theme.colorScheme.onSurface,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: theme.colorScheme.onSurfaceVariant,
              fontSize: 15,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 40),
          content,
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildWelcomeStep() {
    final theme = Theme.of(context);
    return _buildStepContainer(
      icon: Icons.auto_awesome,
      title: 'Chào mừng đến với Torii Nihongo',
      subtitle: 'Chúng tôi muốn cá nhân hóa trải nghiệm học tập của bạn để đạt kết quả tốt nhất.',
      iconColor: Colors.amber,
      content: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: theme.colorScheme.primaryContainer.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Icon(Icons.rocket_launch, size: 48, color: theme.colorScheme.primary),
            const SizedBox(height: 16),
            Text(
              'Tiếng Nhật là một hành trình thú vị. Chúng tôi sẽ đồng hành cùng bạn trên mọi chặng đường.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: theme.colorScheme.onPrimaryContainer,
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPurposeStep() {
    return _buildStepContainer(
      icon: Icons.emoji_events,
      title: 'Mục tiêu của bạn?',
      subtitle: 'Tại sao bạn lại chọn học tiếng Nhật?',
      iconColor: Colors.orange,
      content: Column(
        children: [
          { 'label': 'Thi chứng chỉ JLPT', 'value': 'JLPT' },
          { 'label': 'Phục vụ công việc', 'value': 'Work' },
          { 'label': 'Chuẩn bị du học', 'value': 'Study' },
          { 'label': 'Du lịch & Văn hóa', 'value': 'Travel' },
          { 'label': 'Sở thích cá nhân', 'value': 'Other' },
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

  Widget _buildLevelStep() {
    final theme = Theme.of(context);
    return _buildStepContainer(
      icon: Icons.school,
      title: 'Trình độ hiện tại',
      subtitle: 'Bạn đã có nền tảng tiếng Nhật chưa?',
      iconColor: Colors.purple,
      content: Column(
        children: [
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 2.5,
            children: [
              'Mới bắt đầu', 'N5', 'N4', 'N3', 'N2', 'N1'
            ].map((l) => _buildOptionCard(
              label: l,
              isSelected: _currentLevel == l,
              onTap: () => setState(() => _currentLevel = l),
            )).toList(),
          ),
          const SizedBox(height: 32),
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainer,
              borderRadius: BorderRadius.circular(16),
            ),
            child: CheckboxListTile(
              value: _wantsPlacementTest,
              onChanged: (val) => setState(() => _wantsPlacementTest = val ?? false),
              title: const Text('Làm bài kiểm tra đầu vào', style: TextStyle(fontWeight: AppTypography.semiBold, fontSize: 14)),
              subtitle: const Text('Khuyên dùng nếu bạn đã từng học', style: TextStyle(fontSize: 12)),
              activeColor: theme.colorScheme.primary,
              contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              controlAffinity: ListTileControlAffinity.leading,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildTargetStep() {
    return _buildStepContainer(
      icon: Icons.flag,
      title: 'Thời hạn hoàn thành',
      subtitle: 'Bạn dự kiến đạt mục tiêu trong bao lâu?',
      content: Column(
        children: [
          '4 tháng', '6 tháng', '8 tháng', '12 tháng', 'Không giới hạn'
        ].map((t) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: _buildOptionCard(
            label: t,
            isSelected: _learningTarget == t,
            onTap: () => setState(() => _learningTarget = t),
            fullWidth: true,
          ),
        )).toList(),
      ),
    );
  }

  Widget _buildFrequencyStep() {
    return _buildStepContainer(
      icon: Icons.access_time_filled,
      title: 'Thời gian học mỗi ngày',
      subtitle: 'Bạn có thể dành bao nhiêu thời gian để học?',
      iconColor: Colors.teal,
      content: Column(
        children: [
          { 'label': '15-30 phút', 'value': 30 },
          { 'label': '1 giờ', 'value': 60 },
          { 'label': '2 giờ', 'value': 120 },
          { 'label': 'Trên 3 giờ', 'value': 240 },
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

  Widget _buildJLPTDateStep() {
    final years = ['2026', '2027', '2028', '2029'];
    final months = ['Tháng 7', 'Tháng 12'];
    final theme = Theme.of(context);

    return _buildStepContainer(
      icon: Icons.calendar_today,
      title: 'Kỳ thi JLPT',
      subtitle: 'Chọn thời gian dự kiến bạn sẽ tham gia kỳ thi.',
      iconColor: Colors.red,
      content: Column(
        children: [
          Text(
            'Chọn năm và tháng',
            style: TextStyle(
              fontWeight: AppTypography.semiBold,
              color: theme.colorScheme.onSurface,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              // Year Selector
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Năm', style: TextStyle(fontSize: 12, color: theme.colorScheme.onSurfaceVariant)),
                    const SizedBox(height: 8),
                    _buildMiniSelector(
                      value: _selectedJlptYear!,
                      items: years,
                      onChanged: (val) {
                        setState(() {
                          _selectedJlptYear = val;
                          _jlptExamDate = '$_selectedJlptMonth/$_selectedJlptYear';
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              // Month Selector
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Tháng', style: TextStyle(fontSize: 12, color: theme.colorScheme.onSurfaceVariant)),
                    const SizedBox(height: 8),
                    _buildMiniSelector(
                      value: _selectedJlptMonth!,
                      items: months,
                      onChanged: (val) {
                        setState(() {
                          _selectedJlptMonth = val;
                          _jlptExamDate = '$_selectedJlptMonth/$_selectedJlptYear';
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          _buildOptionCard(
            label: 'Chưa quyết định',
            isSelected: _jlptExamDate == 'Chưa quyết định',
            onTap: () {
              setState(() {
                _jlptExamDate = 'Chưa quyết định';
              });
            },
            fullWidth: true,
          ),
        ],
      ),
    );
  }

  Widget _buildMiniSelector({
    required String value,
    required List<String> items,
    required ValueChanged<String> onChanged,
  }) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.colorScheme.outlineVariant, width: 1),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          icon: Icon(Icons.keyboard_arrow_down, color: theme.colorScheme.onSurfaceVariant),
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: AppTypography.medium,
                  color: theme.colorScheme.onSurface,
                ),
              ),
            );
          }).toList(),
          onChanged: (val) => val != null ? onChanged(val) : null,
        ),
      ),
    );
  }

  Widget _buildFinalStep() {
    final theme = Theme.of(context);
    return _buildStepContainer(
      icon: Icons.auto_awesome,
      title: 'Đã sẵn sàng!',
      subtitle: 'Chúng tôi đã thiết lập lộ trình học tập cá nhân hóa dành riêng cho bạn.',
      iconColor: Colors.cyan,
      content: Column(
        children: [
          const SizedBox(height: 20),
          Container(
            height: 180,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [theme.colorScheme.primary, theme.colorScheme.primary.withValues(alpha: 0.8)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: theme.colorScheme.primary.withValues(alpha: 0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                )
              ],
            ),
            child: const Center(
              child: Icon(Icons.check_circle_rounded, size: 80, color: Colors.white),
            ),
          ),
          const SizedBox(height: 40),
          Text(
            'Lộ trình của bạn đã được tối ưu hóa. Hãy bắt đầu chinh phục tiếng Nhật ngay thôi!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: theme.colorScheme.onSurfaceVariant,
              height: 1.5,
            ),
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
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: fullWidth ? double.infinity : null,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        decoration: BoxDecoration(
          color: isSelected ? theme.colorScheme.primaryContainer : theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(AppRadius.card),
          border: Border.all(
            color: isSelected ? theme.colorScheme.primary : theme.colorScheme.outlineVariant,
            width: isSelected ? 2 : 1.5,
          ),
          boxShadow: isSelected ? [
            BoxShadow(
              color: theme.colorScheme.primary.withValues(alpha: 0.08),
              blurRadius: 10,
              offset: const Offset(0, 4),
            )
          ] : null,
        ),
        child: Row(
          mainAxisSize: fullWidth ? MainAxisSize.max : MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: isSelected ? AppTypography.bold : AppTypography.semiBold,
                  color: isSelected ? theme.colorScheme.onPrimaryContainer : theme.colorScheme.onSurface,
                ),
              ),
            ),
            if (isSelected) ...[
              const SizedBox(width: 8),
              Icon(Icons.check_circle, color: theme.colorScheme.primary, size: 20),
            ],
          ],
        ),
      ),
    );
  }
}

