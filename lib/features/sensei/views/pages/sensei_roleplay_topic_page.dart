import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/constants/app_design_system.dart';
import '../widgets/sensei_quota_header.dart';

class RoleplayCategory {
  final String title;
  final IconData icon;
  final List<Color> gradient;
  final String imagePath;
  final List<String> topics;

  const RoleplayCategory({
    required this.title,
    required this.icon,
    required this.gradient,
    required this.imagePath,
    required this.topics,
  });
}

class SenseiRoleplayTopicPage extends ConsumerStatefulWidget {
  const SenseiRoleplayTopicPage({super.key});

  @override
  ConsumerState<SenseiRoleplayTopicPage> createState() =>
      _SenseiRoleplayTopicPageState();
}

class _SenseiRoleplayTopicPageState
    extends ConsumerState<SenseiRoleplayTopicPage> {
  final TextEditingController _topicController = TextEditingController();

  final List<RoleplayCategory> _categories = [
    const RoleplayCategory(
      title: "Giao tiếp hằng ngày",
      icon: FontAwesomeIcons.comments,
      gradient: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
      imagePath: "assets/images/rp_daily.png",
      topics: ["Kết bạn mới", "Đi siêu thị", "Hỏi đường", "Gọi điện thoại"],
    ),
    const RoleplayCategory(
      title: "Du lịch & Di chuyển",
      icon: FontAwesomeIcons.planeDeparture,
      gradient: [Color(0xFF3B82F6), Color(0xFF2DD4BF)],
      imagePath: "assets/images/rp_travel.png",
      topics: ["Tại sân bay", "Mua vé tàu", "Đặt phòng khách sạn"],
    ),
    const RoleplayCategory(
      title: "Ẩm thực & Mua sắm",
      icon: FontAwesomeIcons.utensils,
      gradient: [Color(0xFFF59E0B), Color(0xFFEF4444)],
      imagePath: "assets/images/rp_food.png",
      topics: ["Đặt món ở nhà hàng", "Tại tiệm thuốc", "Đi mua quần áo"],
    ),
    const RoleplayCategory(
      title: "Công việc & Học tập",
      icon: FontAwesomeIcons.briefcase,
      gradient: [Color(0xFF10B981), Color(0xFF3B82F6)],
      imagePath: "assets/images/rp_work.png",
      topics: ["Phỏng vấn xin việc", "Thảo luận nhóm", "Gặp gỡ đối tác"],
    ),
  ];

  @override
  void dispose() {
    _topicController.dispose();
    super.dispose();
  }

  void _startRoleplay(String topic) {
    if (topic.trim().isEmpty) return;
    context.push('/sensei/roleplay-chat', extra: topic.trim());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: 120,
            floating: true,
            pinned: true,
            elevation: 0,
            backgroundColor: theme.colorScheme.surface,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              centerTitle: false,
              title: Text(
                'Sensei Roleplay',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: AppTypography.black,
                  letterSpacing: AppTypography.letterSpacingTight,
                  color: theme.colorScheme.onSurface,
                ),
              ),
              background: Stack(
                children: [
                  Positioned.fill(
                    child: Opacity(
                      opacity: 0.05,
                      child: Image.asset(
                        'assets/images/seigaiha_pattern.png',
                        repeat: ImageRepeat.repeat,
                        scale: 2,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          theme.colorScheme.surface.withValues(alpha: 0.8),
                          theme.colorScheme.surface,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: const [
              SenseiQuotaHeader(),
              SizedBox(width: 8),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionHeader(theme, 'CHỦ ĐỀ TỰ CHỌN'),
                  const SizedBox(height: 12),
                  _buildCustomTopicInput(theme),
                  const SizedBox(height: 40),
                  _buildSectionHeader(theme, 'GỢI Ý CHỦ ĐỀ'),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 60),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final category = _categories[index];
                  return _buildCategoryCard(category, theme);
                },
                childCount: _categories.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(ThemeData theme, String title) {
    return Text(
      title,
      style: theme.textTheme.labelLarge?.copyWith(
        fontWeight: AppTypography.black,
        color: theme.colorScheme.primary,
        letterSpacing: 1.2,
      ),
    );
  }

  Widget _buildCustomTopicInput(ThemeData theme) {
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(AppRadius.xl),
        border: Border.all(color: theme.colorScheme.outlineVariant),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.04),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _topicController,
              style: theme.textTheme.bodyMedium?.copyWith(fontWeight: AppTypography.semiBold),
              decoration: InputDecoration(
                hintText: 'VD: Phỏng vấn tại Apple...',
                hintStyle: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
                  fontWeight: AppTypography.regular,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                border: InputBorder.none,
              ),
              onSubmitted: _startRoleplay,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: _buildInputActionButton(theme),
          ),
        ],
      ),
    );
  }

  Widget _buildInputActionButton(ThemeData theme) {
    return GestureDetector(
      onTap: () => _startRoleplay(_topicController.text),
      child: Container(
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [theme.colorScheme.primary, theme.colorScheme.primary.withValues(alpha: 0.8)]),
          borderRadius: BorderRadius.circular(AppRadius.lg),
          boxShadow: [
            BoxShadow(
              color: theme.colorScheme.primary.withValues(alpha: 0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: const Center(
          child: Icon(
            FontAwesomeIcons.chevronRight,
            size: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard(RoleplayCategory category, ThemeData theme) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Banner Area
          Stack(
            children: [
              Container(
                height: 140,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppRadius.xl),
                  boxShadow: [
                    BoxShadow(
                      color: category.gradient.first.withValues(alpha: 0.15),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppRadius.xl),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        category.imagePath,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          color: theme.colorScheme.surfaceVariant,
                          child: Icon(Icons.image, color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.3)),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              category.gradient.first.withValues(alpha: 0.9),
                              category.gradient.last.withValues(alpha: 0.6),
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.2),
                                borderRadius:
                                    BorderRadius.circular(AppRadius.lg),
                                border: Border.all(
                                  color: Colors.white.withValues(alpha: 0.3),
                                ),
                              ),
                              child: Icon(
                                category.icon,
                                size: 18,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              category.title,
                              style: theme.textTheme.titleLarge?.copyWith(
                                fontWeight: AppTypography.black,
                                color: Colors.white,
                                letterSpacing: AppTypography.letterSpacingTight,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Topics Area
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: category.topics
                  .map((topic) =>
                      _buildTopicChip(topic, category.gradient, theme))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopicChip(String topic, List<Color> gradient, ThemeData theme) {
    return InkWell(
      onTap: () => _startRoleplay(topic),
      borderRadius: BorderRadius.circular(AppRadius.lg),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(AppRadius.lg),
          border: Border.all(color: theme.colorScheme.outlineVariant),
          boxShadow: [
            BoxShadow(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.02),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: gradient),
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              topic,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: AppTypography.bold,
                color: theme.colorScheme.onSurface.withValues(alpha: 0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
