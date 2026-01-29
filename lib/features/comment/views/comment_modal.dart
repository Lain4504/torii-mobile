import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/app_design_system.dart';
import '../../../core/widgets/widgets.dart';
import '../providers/comment_provider.dart';
import '../models/comment_model.dart';

/// Comment Modal - Minimal Zen UI
class CommentModal extends ConsumerStatefulWidget {
  final String postId;
  final String postTitle;

  const CommentModal({
    super.key,
    required this.postId,
    required this.postTitle,
  });

  @override
  ConsumerState<CommentModal> createState() => _CommentModalState();

  static Future<void> show(
    BuildContext context, {
    required String postId,
    required String postTitle,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => CommentModal(postId: postId, postTitle: postTitle),
    );
  }
}

class _CommentModalState extends ConsumerState<CommentModal>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _contentController = TextEditingController();
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(commentProvider(widget.postId).notifier).loadComments();
    });

    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.9) {
      ref.read(commentProvider(widget.postId).notifier).loadMoreComments();
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    _contentController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final state = ref.watch(commentProvider(widget.postId));

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
                    _buildCommentsList(state, isDark),
                    _buildCreateComment(state, theme, isDark),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

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
                  'COMMENTS', // Changed from REVIEWS
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
                  widget.postTitle,
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
          Tab(text: 'ALL COMMENTS'),
          Tab(text: 'WRITE COMMENT'),
        ],
      ),
    );
  }

  Widget _buildCommentsList(CommentState state, bool isDark) {
    if (state.isLoading && state.comments.isEmpty) {
      return const Center(child: ZenLoading(text: 'Loading comments...'));
    }

    if (state.error != null && state.comments.isEmpty) {
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
              ZenButton(
                text: 'TRY AGAIN',
                onPressed: () => ref
                    .read(commentProvider(widget.postId).notifier)
                    .loadComments(refresh: true),
              ),
            ],
          ),
        ),
      );
    }

    if (state.comments.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.chat_bubble_outline_rounded,
                size: 64,
                color: AppColors.textTertiary.withValues(alpha: 0.3),
              ),
              const SizedBox(height: AppSpacing.lg),
              Text(
                'No comments yet',
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
              ZenButton(
                text: 'WRITE COMMENT',
                onPressed: () => _tabController.animateTo(1),
              ),
            ],
          ),
        ),
      );
    }

    return ListView.separated(
      controller: _scrollController,
      padding: const EdgeInsets.all(AppSpacing.xl),
      itemCount: state.comments.length + (state.isLoadingMore ? 1 : 0),
      separatorBuilder: (context, index) =>
          const SizedBox(height: AppSpacing.lg),
      itemBuilder: (context, index) {
        if (index >= state.comments.length) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(AppSpacing.lg),
              child: ZenLoading(text: 'Loading more...'),
            ),
          );
        }
        return _buildCommentCard(state.comments[index], isDark);
      },
    );
  }

  Widget _buildCommentCard(Comment comment, bool isDark) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: AppColors.primarySurface,
                backgroundImage: comment.author?.avatarUrl != null
                    ? NetworkImage(comment.author!.avatarUrl!)
                    : null,
                child: comment.author?.avatarUrl == null
                    ? const Icon(
                        Icons.person_rounded,
                        size: 16,
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
                      comment.author?.displayName ?? 'Anonymous',
                      style: const TextStyle(
                        fontWeight: AppTypography.bold,
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      comment.timeAgo,
                      style: const TextStyle(
                        fontSize: 10,
                        color: AppColors.textTertiary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            comment.content,
            style: TextStyle(
              height: 1.5,
              color: isDark ? AppColors.textSecondary : AppColors.textPrimary,
              fontSize: 13,
            ),
          ),
          // Indented replies (simple level 1 support)
          if (comment.replies != null && comment.replies!.isNotEmpty) ...[
            const SizedBox(height: AppSpacing.md),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      color: AppColors.grey300.withValues(alpha: 0.5),
                      width: 2,
                    ),
                  ),
                ),
                padding: const EdgeInsets.only(left: 12),
                child: Column(
                  children: comment.replies!
                      .map(
                        (reply) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: _buildReplyItem(reply, isDark),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildReplyItem(Comment reply, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              reply.author?.displayName ?? 'Anonymous',
              style: const TextStyle(
                fontWeight: AppTypography.bold,
                fontSize: 12,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              reply.timeAgo,
              style: const TextStyle(
                fontSize: 10,
                color: AppColors.textTertiary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 2),
        Text(
          reply.content,
          style: TextStyle(
            fontSize: 12,
            color: isDark ? AppColors.textSecondary : AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildCreateComment(CommentState state, ThemeData theme, bool isDark) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppSpacing.md),
          Text(
            'YOUR COMMENT',
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
              controller: _contentController,
              maxLines: 6,
              decoration: InputDecoration(
                hintText: 'Share your thoughts...',
                hintStyle: TextStyle(
                  color: AppColors.textTertiary.withValues(alpha: 0.5),
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.all(AppSpacing.lg),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.xxl),
          SizedBox(
            width: double.infinity,
            child: ZenButton(
              text: state.isSubmitting ? 'POSTING...' : 'POST COMMENT',
              onPressed: state.isSubmitting ? null : _submitComment,
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

  Future<void> _submitComment() async {
    final success = await ref
        .read(commentProvider(widget.postId).notifier)
        .submitComment(
          content: _contentController.text.trim().isEmpty
              ? ''
              : _contentController.text.trim(),
        );

    if (success && mounted) {
      _contentController.clear();
      _tabController.animateTo(0);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Comment posted successfully!'),
          backgroundColor: AppColors.success,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}
