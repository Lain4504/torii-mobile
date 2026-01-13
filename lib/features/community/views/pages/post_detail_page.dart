import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../core/widgets/widgets.dart';
import '../providers/post_providers.dart';
import '../models/post_model.dart';
import '../../../../core/widgets/zen_background.dart';

class PostDetailPage extends ConsumerStatefulWidget {
  final String postId;
  final Post? post;

  const PostDetailPage({super.key, required this.postId, this.post});

  @override
  ConsumerState<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends ConsumerState<PostDetailPage> {
  final TextEditingController _commentController = TextEditingController();

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final commentsAsync = ref.watch(postCommentsProvider(widget.postId));
    final post = widget.post;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: ZenBackground(
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    leading: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),

                  if (post != null) 
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(AppSpacing.xl),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundImage: NetworkImage(post.author.avatar ?? 'https://i.pravatar.cc/150'),
                                ),
                                const SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      post.author.displayName,
                                      style: const TextStyle(fontWeight: AppTypography.extraBold, fontSize: 16),
                                    ),
                                    Text(
                                      'MASTER_LEARNER • ${DateFormat.yMMMd().format(post.createdAt)}',
                                      style: TextStyle(fontSize: 10, fontWeight: AppTypography.bold, color: AppColors.textTertiary),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                            Text(
                              post.title,
                              style: const TextStyle(fontSize: 24, fontWeight: AppTypography.extraBold, letterSpacing: -1.0),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              post.content,
                              style: TextStyle(fontSize: 16, height: 1.6, color: AppColors.textPrimary),
                            ),
                            const SizedBox(height: 32),
                            const SectionDivider(label: 'COMMUNICATIONS'),
                          ],
                        ),
                      ),
                    ),

                  commentsAsync.when(
                    data: (comments) => SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) => _CommentTile(comment: comments[index]),
                          childCount: comments.length,
                        ),
                      ),
                    ),
                    loading: () => const SliverToBoxAdapter(child: Center(child: CircularProgressIndicator())),
                    error: (err, stack) => SliverToBoxAdapter(child: Center(child: Text('Error: $err'))),
                  ),
                  
                  const SliverToBoxAdapter(child: SizedBox(height: 40)),
                ],
              ),
            ),
            
            // Comment input area
            _buildCommentInput(),
          ],
        ),
      ),
    );
  }

  Widget _buildCommentInput() {
    return Container(
      padding: EdgeInsets.only(
        left: AppSpacing.xl,
        right: AppSpacing.xl,
        top: 16,
        bottom: MediaQuery.of(context).padding.bottom + 16,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, -10),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.grey100,
                borderRadius: BorderRadius.circular(AppRadius.xl),
              ),
              child: TextField(
                controller: _commentController,
                decoration: const InputDecoration(
                  hintText: 'Add to neural forum...',
                  border: InputBorder.none,
                  hintStyle: TextStyle(fontSize: 14),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.send_rounded, color: Colors.white, size: 20),
              onPressed: () {
                // TODO: Implement send logic
                _commentController.clear();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _CommentTile extends StatelessWidget {
  final Comment comment;

  const _CommentTile({required this.comment});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.xl),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 16,
            backgroundImage: NetworkImage(comment.author.avatar ?? 'https://i.pravatar.cc/150'),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      comment.author.displayName,
                      style: const TextStyle(fontWeight: AppTypography.bold, fontSize: 13),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      DateFormat.yMMMd().format(comment.createdAt),
                      style: TextStyle(fontSize: 9, color: AppColors.textTertiary),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  comment.content,
                  style: const TextStyle(fontSize: 14, height: 1.4, color: AppColors.textSecondary),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      'Reply',
                      style: TextStyle(fontSize: 11, fontWeight: AppTypography.black, color: AppColors.primary, letterSpacing: 0.5),
                    ),
                    const SizedBox(width: 16),
                    Icon(Icons.favorite_border_rounded, size: 14, color: AppColors.textTertiary),
                  ],
                ),
                
                if (comment.replies.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: AppSpacing.md),
                    child: Column(
                      children: comment.replies.map((r) => _CommentTile(comment: r)).toList(),
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
