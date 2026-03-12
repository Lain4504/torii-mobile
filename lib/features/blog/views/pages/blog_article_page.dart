import 'package:flutter/material.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../core/widgets/widgets.dart';

class BlogArticlePage extends StatelessWidget {
  const BlogArticlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: AppBackground(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              floating: true,
              pinned: true,
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              elevation: 0,
              expandedHeight: 250,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  'https://picsum.photos/seed/article/800/600',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.xl),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: const Text(
                        'JLPT TIPS',
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: AppTypography.black,
                          color: AppColors.white,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    const Text(
                      'Mastering Keigo: The Ultimate Guide to Polite Japanese',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: AppTypography.black,
                        letterSpacing: -1.0,
                        height: 1.1,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 18,
                          backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=sensei'),
                        ),
                        const SizedBox(width: 12),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Kenji Sensei',
                              style: TextStyle(fontWeight: AppTypography.bold, fontSize: 14),
                            ),
                            Text(
                              'Published Oct 24, 2023 • 8 min read',
                              style: TextStyle(color: AppColors.textTertiary, fontSize: 11),
                            ),
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.share_rounded, size: 20),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.bookmark_border_rounded, size: 20),
                        ),
                      ],
                    ),
                    const Divider(height: AppSpacing.xxl),
                    
                    const Text(
                      'Introduction',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: AppTypography.black,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    const Text(
                      'Understanding Japanese honorifics (Keigo) is one of the most challenging but essential aspects of achieving fluency. Whether you are working in Japan or interacting with Japanese people in formal settings, mastering Keigo shows respect and professionalism.',
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.6,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xl),
                    
                    Container(
                      padding: const EdgeInsets.all(AppSpacing.lg),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.05),
                        border: const Border(
                          left: BorderSide(color: AppColors.primary, width: 4),
                        ),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '💡 PRO TIP',
                            style: TextStyle(
                              fontWeight: AppTypography.black,
                              fontSize: 12,
                              color: AppColors.primary,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Beginners should start with Teineigo (polite form) before attempting Sonkeigo (honorific) or Kenjougo (humble).',
                            style: TextStyle(
                              fontSize: 14,
                              fontStyle: FontStyle.italic,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: AppSpacing.xl),
                    const Text(
                      'Types of Keigo',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: AppTypography.black,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    const Text(
                      '1. Teineigo (丁寧語) - Polite form using "desu" and "masu".\n2. Sonkeigo (尊敬語) - Used to show respect to someone higher in status.\n3. Kenjougo (謙譲語) - Used to lower oneself and show respect to the listener.',
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.8,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    
                    const Divider(height: AppSpacing.xxl),
                    
                    const Text(
                      'RELATED ARTICLES',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: AppTypography.black,
                        letterSpacing: 2.0,
                        color: AppColors.textTertiary,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    SizedBox(
                      height: 120,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        separatorBuilder: (_, __) => const SizedBox(width: AppSpacing.md),
                        itemBuilder: (context, index) {
                          return Container(
                            width: 250,
                            padding: const EdgeInsets.all(AppSpacing.md),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(AppRadius.xs),
                              border: Border.all(color: AppColors.borderLight),
                            ),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: Image.network(
                                    'https://picsum.photos/seed/related$index/100/100',
                                    width: 60,
                                    height: 60,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                const Expanded(
                                  child: Text(
                                    'How to study Kanji effectively',
                                    style: TextStyle(fontWeight: AppTypography.bold, fontSize: 13),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            const SliverToBoxAdapter(child: SizedBox(height: 60)),
          ],
        ),
      ),
    );
  }
}
