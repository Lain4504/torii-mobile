import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/app_design_system.dart';
import '../../../core/widgets/widgets.dart';
import '../providers/review_provider.dart';
import '../models/review_model.dart';

/// Review Modal - Minimal Zen UI
/// Shows reviews list and create form in a bottom sheet
class ReviewModal extends ConsumerStatefulWidget {
  final String entityId;
  final ReviewType type;
  final String entityTitle;

  const ReviewModal({
    super.key,
    required this.entityId,
    required this.type,
    required this.entityTitle,
  });

  @override
  ConsumerState<ReviewModal> createState() => _ReviewModalState();

  /// Show review modal
  static Future<void> show(
    BuildContext context, {
    required String entityId,
    required ReviewType type,
    required String entityTitle,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) =>
          ReviewModal(entityId: entityId, type: type, entityTitle: entityTitle),
    );
  }
}

class _ReviewModalState extends ConsumerState<ReviewModal>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _commentController = TextEditingController();
  int _selectedRating = 5;
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    // Load reviews on init
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final params = ReviewParams(entityId: widget.entityId, type: widget.type);
      ref.read(reviewProvider(params).notifier).loadReviews();
    });

    // Pagination listener
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.9) {
      final params = ReviewParams(entityId: widget.entityId, type: widget.type);
      ref.read(reviewProvider(params).notifier).loadMoreReviews();
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    _commentController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final params = ReviewParams(entityId: widget.entityId, type: widget.type);
    final state = ref.watch(reviewProvider(params));

    return DraggableScrollableSheet(
      initialChildSize: 0.9,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: isDark ? AppColors.surfaceDark : AppColors.background,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(AppRadius.xxxl),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 30,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          child: Column(
            children: [
              _buildHandle(isDark),
              _buildHeader(theme, isDark),
              _buildTabBar(theme, isDark),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildReviewsList(state, isDark),
                    _buildCreateReview(state, theme, isDark),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  /// Drag handle
  Widget _buildHandle(bool isDark) {
    return Container(
      margin: const EdgeInsets.only(top: 12, bottom: 8),
      width: 40,
      height: 4,
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.borderDark.withValues(alpha: 0.5)
            : AppColors.grey300,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }

  /// Header with title and close button
  Widget _buildHeader(ThemeData theme, bool isDark) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.xl,
        AppSpacing.md,
        AppSpacing.md,
        AppSpacing.lg,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'REVIEWS',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: AppTypography.black,
                    letterSpacing: 2.0,
                    color: isDark
                        ? AppColors.textTertiary
                        : AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.entityTitle,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: AppTypography.bold,
                    fontSize: 20,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: isDark
                  ? AppColors.surfaceVariantDark
                  : Colors.white.withValues(alpha: 0.8),
              shape: BoxShape.circle,
              border: Border.all(
                color: isDark
                    ? AppColors.borderDark.withValues(alpha: 0.3)
                    : AppColors.grey300.withValues(alpha: 0.5),
              ),
            ),
            child: IconButton(
              icon: const Icon(Icons.close_rounded, size: 18),
              onPressed: () => Navigator.pop(context),
              padding: EdgeInsets.zero,
            ),
          ),
        ],
      ),
    );
  }

  /// Tab bar
  Widget _buildTabBar(ThemeData theme, bool isDark) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.surfaceVariantDark.withValues(alpha: 0.5)
            : AppColors.grey100.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(AppRadius.xl),
        border: Border.all(
          color: isDark
              ? AppColors.borderDark.withValues(alpha: 0.2)
              : AppColors.grey300.withValues(alpha: 0.3),
        ),
      ),
      child: TabBar(
        controller: _tabController,
        indicator: BoxDecoration(
          color: isDark ? AppColors.surfaceDark : Colors.white,
          borderRadius: BorderRadius.circular(AppRadius.lg),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: Colors.transparent,
        labelColor: AppColors.primary,
        unselectedLabelColor: AppColors.textTertiary,
        labelStyle: const TextStyle(
          fontWeight: AppTypography.bold,
          fontSize: 13,
          letterSpacing: 0.5,
        ),
        tabs: const [
          Tab(text: 'ALL REVIEWS'),
          Tab(text: 'WRITE REVIEW'),
        ],
      ),
    );
  }

  /// Reviews list tab
  Widget _buildReviewsList(ReviewState state, bool isDark) {
    if (state.isLoading && state.reviews.isEmpty) {
      return const Center(child: AppLoading(text: 'Loading reviews...'));
    }

    if (state.error != null && state.reviews.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline_rounded,
                size: 48,
                color: AppColors.error.withValues(alpha: 0.5),
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                state.error!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: isDark
                      ? AppColors.textSecondary
                      : AppColors.textTertiary,
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              AppButton(
                text: 'TRY AGAIN',
                onPressed: () {
                  final params = ReviewParams(
                    entityId: widget.entityId,
                    type: widget.type,
                  );
                  ref
                      .read(reviewProvider(params).notifier)
                      .loadReviews(refresh: true);
                },
              ),
            ],
          ),
        ),
      );
    }

    if (state.reviews.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.rate_review_outlined,
                size: 64,
                color: AppColors.textTertiary.withValues(alpha: 0.3),
              ),
              const SizedBox(height: AppSpacing.lg),
              Text(
                'No reviews yet',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: AppTypography.bold,
                  color: isDark
                      ? AppColors.textSecondary
                      : AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                'Be the first to share your thoughts',
                style: TextStyle(
                  color: isDark
                      ? AppColors.textTertiary
                      : AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              AppButton(
                text: 'WRITE REVIEW',
                onPressed: () => _tabController.animateTo(1),
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        // Rating distribution (if available)
        if (state.distribution != null) ...[
          const SizedBox(height: AppSpacing.lg),
          _buildRatingDistribution(state.distribution!, isDark),
          const Divider(height: AppSpacing.xxl),
        ],

        // Reviews list
        Expanded(
          child: ListView.separated(
            controller: _scrollController,
            padding: const EdgeInsets.all(AppSpacing.xl),
            itemCount: state.reviews.length + (state.isLoadingMore ? 1 : 0),
            separatorBuilder: (context, index) =>
                const SizedBox(height: AppSpacing.lg),
            itemBuilder: (context, index) {
              if (index >= state.reviews.length) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(AppSpacing.lg),
                    child: AppLoading(text: 'Loading more...'),
                  ),
                );
              }

              final review = state.reviews[index];
              return _buildReviewCard(review, isDark);
            },
          ),
        ),
      ],
    );
  }

  /// Rating distribution widget
  Widget _buildRatingDistribution(RatingDistribution dist, bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.lg),
        decoration: BoxDecoration(
          color: isDark
              ? AppColors.surfaceVariantDark.withValues(alpha: 0.3)
              : Colors.white.withValues(alpha: 0.8),
          borderRadius: BorderRadius.circular(AppRadius.card),
          border: Border.all(
            color: isDark
                ? AppColors.borderDark.withValues(alpha: 0.2)
                : AppColors.grey300.withValues(alpha: 0.3),
          ),
        ),
        child: Row(
          children: [
            // Average rating
            Column(
              children: [
                Text(
                  dist.averageRating.toStringAsFixed(1),
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: AppTypography.black,
                    color: isDark ? AppColors.primaryLight : AppColors.primary,
                    height: 1,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: List.generate(
                    5,
                    (index) => Icon(
                      index < dist.averageRating.round()
                          ? Icons.star_rounded
                          : Icons.star_outline_rounded,
                      size: 16,
                      color: AppColors.accent,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${dist.totalReviews} reviews',
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppColors.textTertiary,
                  ),
                ),
              ],
            ),
            const SizedBox(width: AppSpacing.xl),

            // Distribution bars
            Expanded(
              child: Column(
                children: List.generate(5, (index) {
                  final stars = 5 - index;
                  final percent = dist.getPercentForRating(stars);
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Row(
                      children: [
                        Text(
                          '$stars',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: AppTypography.medium,
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Icon(
                          Icons.star_rounded,
                          size: 12,
                          color: AppColors.accent,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: LinearProgressIndicator(
                              value: percent / 100,
                              backgroundColor: isDark
                                  ? AppColors.borderDark.withValues(alpha: 0.2)
                                  : AppColors.grey200,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                isDark
                                    ? AppColors.primaryLight
                                    : AppColors.primary,
                              ),
                              minHeight: 6,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        SizedBox(
                          width: 35,
                          child: Text(
                            '${percent.toStringAsFixed(0)}%',
                            style: const TextStyle(
                              fontSize: 11,
                              color: AppColors.textTertiary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Review card
  Widget _buildReviewCard(Review review, bool isDark) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.surfaceVariantDark.withValues(alpha: 0.3)
            : Colors.white.withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(AppRadius.card),
        border: Border.all(
          color: isDark
              ? AppColors.borderDark.withValues(alpha: 0.2)
              : AppColors.grey300.withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User info and rating
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: AppColors.primarySurface,
                backgroundImage: review.user?.avatarUrl != null
                    ? NetworkImage(review.user!.avatarUrl!)
                    : null,
                child: review.user?.avatarUrl == null
                    ? const Icon(
                        Icons.person_rounded,
                        size: 20,
                        color: AppColors.primary,
                      )
                    : null,
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review.user?.displayName ?? 'Anonymous',
                      style: const TextStyle(
                        fontWeight: AppTypography.bold,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      review.timeAgo,
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppColors.textTertiary,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: List.generate(
                  5,
                  (index) => Icon(
                    index < review.rating
                        ? Icons.star_rounded
                        : Icons.star_outline_rounded,
                    size: 16,
                    color: AppColors.accent,
                  ),
                ),
              ),
            ],
          ),

          // Comment
          if (review.comment != null && review.comment!.isNotEmpty) ...[
            const SizedBox(height: AppSpacing.md),
            Text(
              review.comment!,
              style: TextStyle(
                fontSize: 14,
                height: 1.6,
                color: isDark ? AppColors.textSecondary : AppColors.textPrimary,
              ),
            ),
          ],
        ],
      ),
    );
  }

  /// Create review tab
  Widget _buildCreateReview(ReviewState state, ThemeData theme, bool isDark) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppSpacing.md),

          // Rating selector
          Text(
            'YOUR RATING',
            style: TextStyle(
              fontSize: 10,
              fontWeight: AppTypography.black,
              letterSpacing: 2.0,
              color: isDark ? AppColors.textTertiary : AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                final rating = index + 1;
                return GestureDetector(
                  onTap: () => setState(() => _selectedRating = rating),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Icon(
                      rating <= _selectedRating
                          ? Icons.star_rounded
                          : Icons.star_outline_rounded,
                      size: 48,
                      color: rating <= _selectedRating
                          ? AppColors.accent
                          : AppColors.textTertiary.withValues(alpha: 0.3),
                    ),
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: AppSpacing.xxl),

          // Comment field
          Text(
            'YOUR REVIEW (OPTIONAL)',
            style: TextStyle(
              fontSize: 10,
              fontWeight: AppTypography.black,
              letterSpacing: 2.0,
              color: isDark ? AppColors.textTertiary : AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Container(
            decoration: BoxDecoration(
              color: isDark
                  ? AppColors.surfaceVariantDark.withValues(alpha: 0.3)
                  : Colors.white.withValues(alpha: 0.8),
              borderRadius: BorderRadius.circular(AppRadius.xl),
              border: Border.all(
                color: isDark
                    ? AppColors.borderDark.withValues(alpha: 0.2)
                    : AppColors.grey300.withValues(alpha: 0.3),
              ),
            ),
            child: TextField(
              controller: _commentController,
              maxLines: 6,
              decoration: InputDecoration(
                hintText:
                    'Share your thoughts about this ${widget.type.name}...',
                hintStyle: TextStyle(
                  color: AppColors.textTertiary.withValues(alpha: 0.5),
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.all(AppSpacing.lg),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.xxl),

          // Submit button
          SizedBox(
            width: double.infinity,
            child: AppButton(
              text: state.isSubmitting ? 'SUBMITTING...' : 'SUBMIT REVIEW',
              onPressed: state.isSubmitting ? null : _submitReview,
            ),
          ),

          if (state.error != null) ...[
            const SizedBox(height: AppSpacing.lg),
            Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.error.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(AppRadius.lg),
                border: Border.all(
                  color: AppColors.error.withValues(alpha: 0.3),
                ),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.error_outline_rounded,
                    color: AppColors.error,
                    size: 20,
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Text(
                      state.error!,
                      style: const TextStyle(
                        color: AppColors.error,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Future<void> _submitReview() async {
    final params = ReviewParams(entityId: widget.entityId, type: widget.type);
    final success = await ref
        .read(reviewProvider(params).notifier)
        .submitReview(
          rating: _selectedRating,
          comment: _commentController.text.trim().isEmpty
              ? null
              : _commentController.text.trim(),
        );

    if (success && mounted) {
      _commentController.clear();
      _selectedRating = 5;
      _tabController.animateTo(0); // Switch to reviews list
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Review submitted successfully!'),
          backgroundColor: AppColors.success,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}
