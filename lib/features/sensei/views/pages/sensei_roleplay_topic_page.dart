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
            expandedHeight: 100,
            floating: true,
            pinned: true,
            elevation: 0,
            centerTitle: true,
            backgroundColor: theme.colorScheme.surface,
            surfaceTintColor: Colors.transparent,
            title: Text(
              'Sensei Roleplay',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: AppTypography.bold,
                color: theme.colorScheme.onSurface,
              ),
            ),
            actions: const [
              SenseiQuotaHeader(),
              SizedBox(width: 8),
            ],
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(1),
              child: Divider(
                height: 1,
                thickness: 1,
                color: theme.colorScheme.outlineVariant.withValues(alpha: 0.5),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildCustomTopicCard(theme),
                  const SizedBox(height: 32),
                  _buildSectionHeader(theme, 'CHỦ ĐỀ GỢI Ý'),
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
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 12),
      child: Text(
        title,
        style: theme.textTheme.titleSmall?.copyWith(
          fontWeight: AppTypography.bold,
          color: theme.colorScheme.onSurfaceVariant,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildCustomTopicCard(ThemeData theme) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(AppRadius.xl),
        border: Border.all(color: theme.colorScheme.primary.withValues(alpha: 0.15)),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(AppRadius.md),
                ),
                child: Icon(
                  FontAwesomeIcons.wandMagicSparkles,
                  size: 16,
                  color: theme.colorScheme.primary,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tạo chủ đề riêng',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: AppTypography.bold,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                    Text(
                      'Thực luyện bất kỳ tình huống nào',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _topicController,
            style: theme.textTheme.bodyMedium?.copyWith(fontWeight: AppTypography.semiBold),
            decoration: InputDecoration(
              hintText: 'VD: Phỏng vấn xin việc tại Nhật...',
              hintStyle: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
                fontWeight: AppTypography.regular,
              ),
              filled: true,
              fillColor: theme.colorScheme.surfaceVariant.withValues(alpha: 0.3),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.lg),
                borderSide: BorderSide(color: theme.colorScheme.outlineVariant),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.lg),
                borderSide: BorderSide(color: theme.colorScheme.outlineVariant),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.lg),
                borderSide: BorderSide(color: theme.colorScheme.primary, width: 1.5),
              ),
            ),
            onSubmitted: _startRoleplay,
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: () => _startRoleplay(_topicController.text),
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.colorScheme.primary,
                foregroundColor: theme.colorScheme.onPrimary,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppRadius.lg),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Bắt đầu ngay',
                    style: TextStyle(fontWeight: AppTypography.bold),
                  ),
                  SizedBox(width: 8),
                  Icon(FontAwesomeIcons.paperPlane, size: 14),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(RoleplayCategory category, ThemeData theme) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(AppRadius.xl),
        border: Border.all(color: theme.colorScheme.outlineVariant.withValues(alpha: 0.5)),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Banner Area
          Stack(
            children: [
              Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(AppRadius.xl)),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(AppRadius.xl)),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        category.imagePath,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [category.gradient.first, category.gradient.last],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Icon(category.icon, color: Colors.white.withAlpha(50), size: 64),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              category.gradient.first.withValues(alpha: 0.8),
                              category.gradient.last.withValues(alpha: 0.4),
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              category.title,
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: AppTypography.bold,
                                color: Colors.white,
                                letterSpacing: 0.2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 12,
                        right: 12,
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.2),
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
                          ),
                          child: Icon(category.icon, size: 14, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // Topics Area
          Padding(
            padding: const EdgeInsets.all(16),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
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
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => _startRoleplay(topic),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(color: theme.colorScheme.outlineVariant),
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
                style: theme.textTheme.bodySmall?.copyWith(
                  fontWeight: AppTypography.semiBold,
                  color: theme.colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
