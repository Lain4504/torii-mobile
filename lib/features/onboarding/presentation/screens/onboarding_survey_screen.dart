import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../services/auth/onboarding_service.dart';
import '../../../auth/providers/auth_providers.dart';

class OnboardingSurveyScreen extends ConsumerStatefulWidget {
  const OnboardingSurveyScreen({super.key});

  @override
  ConsumerState<OnboardingSurveyScreen> createState() => _OnboardingSurveyScreenState();
}

class _OnboardingSurveyScreenState extends ConsumerState<OnboardingSurveyScreen> {
  bool _isSubmitting = false;

  // Simple form state (for course recommendation)
  String _jlptTarget = 'N3';
  String _currentLevel = 'NEVER';

  Future<void> _skipSurvey() async {
    if (_isSubmitting) return;
    setState(() => _isSubmitting = true);
    final authNotifier = ref.read(authStateProvider.notifier);

    try {
      final service = ref.read(onboardingServiceProvider);
      final response = await service.saveSurvey(
        jlptTarget: _jlptTarget,
        currentLevel: _currentLevel,
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

  Future<void> _submit() async {
    setState(() => _isSubmitting = true);
    final service = ref.read(onboardingServiceProvider);
    
    final response = await service.saveSurvey(
      jlptTarget: _jlptTarget,
      currentLevel: _currentLevel,
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

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: _isSubmitting ? null : _skipSurvey,
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
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 12),
                    Text(
                      'Thiết lập mục tiêu',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: AppTypography.bold,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Torii dùng mục tiêu này để gợi ý khóa học phù hợp cho bạn.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: theme.colorScheme.onSurfaceVariant,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 24),

                    _buildSectionTitle('Mục tiêu JLPT'),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: ['N5', 'N4', 'N3', 'N2', 'N1'].map((lvl) {
                        final selected = _jlptTarget == lvl;
                        return _buildChipOption(
                          label: lvl,
                          isSelected: selected,
                          onTap: () => setState(() => _jlptTarget = lvl),
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: 24),
                    _buildSectionTitle('Trình độ hiện tại (tuỳ chọn)'),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        {'label': 'Mới bắt đầu', 'value': 'NEVER'},
                        {'label': 'N5', 'value': 'N5'},
                        {'label': 'N4', 'value': 'N4'},
                        {'label': 'N3', 'value': 'N3'},
                        {'label': 'N2', 'value': 'N2'},
                        {'label': 'N1', 'value': 'N1'},
                      ].map((it) {
                        final v = it['value']!;
                        final selected = _currentLevel == v;
                        return _buildChipOption(
                          label: it['label']!,
                          isSelected: selected,
                          onTap: () => setState(() => _currentLevel = v),
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: 28),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
              child: ElevatedButton(
                onPressed: _isSubmitting ? null : _submit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  foregroundColor: theme.colorScheme.onPrimary,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.button)),
                ),
                child: _isSubmitting
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                      )
                    : const Text(
                        'Xong',
                        style: TextStyle(fontWeight: AppTypography.bold),
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    final theme = Theme.of(context);
    return Text(
      title,
      style: TextStyle(
        fontSize: 12,
        fontWeight: AppTypography.semiBold,
        color: theme.colorScheme.onSurfaceVariant,
      ),
    );
  }

  Widget _buildChipOption({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(999),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected
              ? theme.colorScheme.primary.withValues(alpha: 0.12)
              : theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(999),
          border: Border.all(
            color: isSelected ? theme.colorScheme.primary : theme.colorScheme.outlineVariant,
            width: 1,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: isSelected ? AppTypography.bold : AppTypography.semiBold,
            color: isSelected ? theme.colorScheme.primary : theme.colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}

