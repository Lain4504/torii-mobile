import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/widgets/widgets.dart';
import 'package:torii_app/features/community/providers/post_providers.dart';
import 'package:torii_app/features/community/models/post_model.dart';
import 'package:torii_app/features/auth/providers/auth_providers.dart';

class PostListPage extends ConsumerWidget {
  const PostListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postsAsync = ref.watch(postListProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: ZenBackground(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              floating: true,
              pinned: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: const Text(
                'CỘNG ĐỒNG',
                style: TextStyle(
                  fontFamily: AppTypography.fontFamilySerif,
                  fontWeight: AppTypography.black,
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  letterSpacing: 2.0,
                  color: AppColors.textPrimary,
                ),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.add_box_outlined, color: AppColors.primary),
                  onPressed: () {
                    final authState = ref.read(authStateProvider);
                    if (authState.value?.isAuthenticated != true) {
                      context.push('/login?redirect=${Uri.encodeComponent(GoRouterState.of(context).uri.toString())}');
                      return;
                    }
                    // TODO: Navigate to create post page
                  },
                ),
              ],
            ),
            
            postsAsync.when(
              data: (posts) => SliverPadding(
                padding: const EdgeInsets.all(AppSpacing.xl),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final post = posts[index];
                      return EntryAnimation(
                        index: index,
                        child: _PostCard(post: post),
                      );
                    },
                    childCount: posts.length,
                  ),
                ),
              ),
              loading: () => const SliverFillRemaining(
                child: Center(child: ZenLoading(text: 'Loading posts...')),
              ),
              error: (err, stack) => SliverFillRemaining(
                child: Center(
                  child: Text(
                    'Không có kết nối mạng: $err',
                    style: const TextStyle(fontSize: 10, fontWeight: AppTypography.black, letterSpacing: 1.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PostCard extends StatelessWidget {
  final Post post;

  const _PostCard({required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.lg),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(AppRadius.xxl),
        border: Border.all(color: AppColors.grey300.withValues(alpha: 0.3)),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.03),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: InkWell(
        onTap: () => context.push('/community/${post.id}', extra: post),
        borderRadius: BorderRadius.circular(AppRadius.xxl),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundImage: NetworkImage(post.author.avatarUrl ?? 'https://i.pravatar.cc/150'),
                    backgroundColor: AppColors.primarySurface,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post.author.displayName,
                          style: const TextStyle(fontWeight: AppTypography.bold, fontSize: 14),
                        ),
                        Text(
                          DateFormat.yMMMd().format(post.createdAt),
                          style: TextStyle(fontSize: 10, color: AppColors.textTertiary),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.more_horiz_rounded, size: 20, color: AppColors.textTertiary),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                post.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: AppTypography.extraBold,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                post.content,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  _PostStat(icon: Icons.favorite_border_rounded, count: post.likesCount),
                  const SizedBox(width: 16),
                  _PostStat(icon: Icons.chat_bubble_outline_rounded, count: post.commentsCount),
                  const Spacer(),
                  const Icon(Icons.bookmark_border_rounded, size: 20, color: AppColors.textTertiary),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PostStat extends StatelessWidget {
  final IconData icon;
  final int count;

  const _PostStat({required this.icon, required this.count});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: AppColors.textTertiary),
        const SizedBox(width: 4),
        Text(
          '$count',
          style: TextStyle(fontSize: 12, fontWeight: AppTypography.bold, color: AppColors.textSecondary),
        ),
      ],
    );
  }
}
