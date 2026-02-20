import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../core/widgets/widgets.dart';
import '../../providers/assessment_providers.dart';
import '../../models/placement_test_model.dart';

class PlacementTestPage extends ConsumerWidget {
  const PlacementTestPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(placementProvider);
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: AppBackground(
        child: _buildContent(context, state, ref, theme),
      ),
    );
  }

  Widget _buildContent(BuildContext context, PlacementState state, WidgetRef ref, ThemeData theme) {
    switch (state.status) {
      case PlacementStatus.intro:
        return _buildIntro(context, ref, theme);
      case PlacementStatus.loading:
      case PlacementStatus.evaluating:
        return _buildStatusView(state.status == PlacementStatus.loading 
            ? 'Đang chuẩn bị đề thi...' 
            : 'Đang đánh giá kết quả...');
      case PlacementStatus.testing:
        return _buildTesting(context, state, ref, theme);
      case PlacementStatus.result:
        return _buildResult(context, state, theme);
      case PlacementStatus.error:
        return _buildError(state.error ?? 'Đã có lỗi xảy ra', ref);
    }
  }

  Widget _buildIntro(BuildContext context, WidgetRef ref, ThemeData theme) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const EntryAnimation(
              index: 0,
              child: HeroIconContainer(
                icon: Icons.auto_awesome_rounded,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: AppSpacing.xxl),
            const EntryAnimation(
              index: 1,
              child: Text(
                'Kiểm tra trình độ',
                style: TextStyle(
                  fontFamily: AppTypography.fontFamilySerif,
                  fontSize: 32,
                  fontWeight: AppTypography.bold,
                  fontStyle: FontStyle.italic,
                  letterSpacing: -1.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            const EntryAnimation(
              index: 2,
              child: Text(
                'Khám phá trình độ tiếng Nhật của bạn chỉ trong 10 phút.\nAI của chúng tôi sẽ điều chỉnh câu hỏi để tìm ra điểm bắt đầu hoàn hảo cho bạn.',
                style: TextStyle(
                  fontSize: 15,
                  color: AppColors.textSecondary,
                  height: 1.6,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: AppSpacing.xxxl),
            EntryAnimation(
              index: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   _buildIntroChip(Icons.format_list_numbered_rounded, '15 Câu hỏi'),
                   const SizedBox(width: AppSpacing.md),
                   _buildIntroChip(Icons.timer_rounded, '10 Phút'),
                   const SizedBox(width: AppSpacing.md),
                   _buildIntroChip(Icons.bolt_rounded, 'AI Support'),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.xxxl),
            EntryAnimation(
              index: 4,
              child: AppButton(
                text: 'BẮT ĐẦU ĐÁNH GIÁ',
                onPressed: () => ref.read(placementProvider.notifier).startTest(),
                isFullWidth: true,
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            TextButton(
              onPressed: () => context.pop(),
              child: const Text(
                'BỎ QUA',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: AppTypography.black,
                  letterSpacing: 2.0,
                  color: AppColors.textTertiary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIntroChip(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(color: AppColors.grey200),
      ),
      child: Column(
        children: [
          Icon(icon, size: 18, color: AppColors.primary),
          const SizedBox(height: 4),
          Text(
            text.toUpperCase(),
            style: const TextStyle(fontSize: 8, fontWeight: AppTypography.black, color: AppColors.textTertiary),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusView(String text) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const LoadingGlow(child: Icon(Icons.psychology_rounded, size: 64, color: AppColors.primary)),
          const SizedBox(height: 32),
          Text(text, style: const TextStyle(fontWeight: AppTypography.medium, color: AppColors.textSecondary)),
        ],
      ),
    );
  }

  Widget _buildTesting(BuildContext context, PlacementState state, WidgetRef ref, ThemeData theme) {
    final currentQ = state.test!.questions[state.currentIndex];
    final progress = (state.currentIndex) / state.test!.questions.length;

    return SafeArea(
      child: Column(
        children: [
          _buildProgressHeader(state.currentIndex + 1, state.test!.questions.length, progress),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppSpacing.xl),
              child: Column(
                children: [
                  const SizedBox(height: AppSpacing.xxl),
                  _buildQuestionCard(currentQ, state, ref, theme),
                ],
              ),
            ),
          ),
          _buildTestingFooter(state, ref),
        ],
      ),
    );
  }

  Widget _buildProgressHeader(int current, int total, double progress) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'CÂU HỎI $current / $total',
                style: const TextStyle(fontSize: 10, fontWeight: AppTypography.black, letterSpacing: 2.0, color: AppColors.textTertiary),
              ),
              Text(
                '${(progress * 100).toInt()}%',
                style: const TextStyle(fontSize: 12, fontWeight: AppTypography.black, color: AppColors.primary),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ProgressBar(progress: progress, height: 6),
        ],
      ),
    );
  }

  Widget _buildQuestionCard(PlacementQuestion q, PlacementState state, WidgetRef ref, ThemeData theme) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(AppRadius.full),
          ),
          child: Text(
            q.type.replaceAll('_', ' ').toUpperCase(),
            style: const TextStyle(fontSize: 9, fontWeight: AppTypography.black, color: AppColors.primary, letterSpacing: 1.0),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          q.content,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: AppTypography.bold,
            color: AppColors.textPrimary,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 48),
        ...q.options.map((option) => Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.md),
          child: _buildOptionTile(option, q.id, state, ref),
        )),
      ],
    );
  }

  Widget _buildOptionTile(String option, String questionId, PlacementState state, WidgetRef ref) {
    final isSelected = state.answers[questionId] == option;
    
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => ref.read(placementProvider.notifier).selectAnswer(questionId, option),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary.withValues(alpha: 0.05) : AppColors.surface,
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(
              color: isSelected ? AppColors.primary : AppColors.grey300,
              width: isSelected ? 2 : 1.5,
            ),
            boxShadow: isSelected ? [BoxShadow(color: AppColors.primary.withValues(alpha: 0.1), blurRadius: 10)] : null,
          ),
          child: Row(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: isSelected ? AppColors.primary : AppColors.grey400, width: isSelected ? 6 : 2),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  option,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: isSelected ? AppTypography.bold : AppTypography.medium,
                    color: isSelected ? AppColors.textPrimary : AppColors.textSecondary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTestingFooter(PlacementState state, WidgetRef ref) {
    final currentQ = state.test!.questions[state.currentIndex];
    final hasAnswer = state.answers.containsKey(currentQ.id);

    return Padding(
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: Row(
        children: [
          if (state.currentIndex > 0)
            IconButton(
              onPressed: () => ref.read(placementProvider.notifier).previousQuestion(),
              icon: const Icon(Icons.arrow_back_rounded, color: AppColors.textTertiary),
            ),
          const Spacer(),
          SizedBox(
            width: 140,
            child: AppButton(
              text: state.currentIndex == state.test!.questions.length - 1 ? 'HOÀN TẤT' : 'TIẾP TỤC',
              onPressed: hasAnswer ? () => ref.read(placementProvider.notifier).nextQuestion() : null,
              isLoading: state.status == PlacementStatus.evaluating,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResult(BuildContext context, PlacementState state, ThemeData theme) {
    final result = state.result!;
    
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const EntryAnimation(
              index: 0,
              child: Text(
                'KẾT QUẢ ĐÁNH GIÁ',
                style: TextStyle(fontSize: 10, fontWeight: AppTypography.black, letterSpacing: 3.0, color: AppColors.primary),
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            EntryAnimation(
              index: 1,
              child: Container(
                padding: const EdgeInsets.all(40),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.primary.withValues(alpha: 0.1), width: 1.5),
                  boxShadow: AppElevation.cardShadow,
                ),
                child: Column(
                  children: [
                    Text(
                      result.suggestedLevel ?? 'N5',
                      style: const TextStyle(fontSize: 80, fontWeight: AppTypography.black, color: AppColors.primary, height: 1),
                    ),
                    const Text(
                      'JLPT',
                      style: TextStyle(fontSize: 14, fontWeight: AppTypography.black, color: AppColors.textTertiary, letterSpacing: 4.0),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.xxxl),
            EntryAnimation(
              index: 2,
              child: Container(
                padding: const EdgeInsets.all(AppSpacing.xl),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(AppRadius.card),
                  border: Border.all(color: AppColors.grey200),
                ),
                child: Column(
                  children: [
                    const Icon(Icons.psychology_rounded, color: AppColors.primary),
                    const SizedBox(height: 12),
                    Text(
                      result.analysis ?? 'Chúng tôi đã đánh giá trình độ của bạn dựa trên các câu trả lời.',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 14, color: AppColors.textSecondary, height: 1.5),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 48),
            EntryAnimation(
              index: 3,
              child: AppButton(
                text: 'BẮT ĐẦU HỌC NGAY',
                onPressed: () {
                  ref.read(placementProvider.notifier).reset();
                  context.go('/');
                },
                isFullWidth: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildError(String error, WidgetRef ref) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline_rounded, size: 64, color: AppColors.error),
            const SizedBox(height: 24),
            Text(error, textAlign: TextAlign.center, style: const TextStyle(color: AppColors.textSecondary)),
            const SizedBox(height: 32),
            AppButton(
              text: 'THỬ LẠI',
              onPressed: () => ref.read(placementProvider.notifier).reset(),
            ),
          ],
        ),
      ),
    );
  }
}

class HeroIconContainer extends StatelessWidget {
  final IconData icon;
  final Color color;

  const HeroIconContainer({super.key, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 50, color: color),
    );
  }
}

class LoadingGlow extends StatefulWidget {
  final Widget child;
  const LoadingGlow({super.key, required this.child});

  @override
  State<LoadingGlow> createState() => _LoadingGlowState();
}

class _LoadingGlowState extends State<LoadingGlow> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2))..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.8, end: 1.2).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(scale: _animation, child: widget.child);
  }
}
