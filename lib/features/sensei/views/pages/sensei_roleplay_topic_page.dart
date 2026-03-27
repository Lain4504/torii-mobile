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
  ConsumerState<SenseiRoleplayTopicPage> createState() => _SenseiRoleplayTopicPageState();
}

class _SenseiRoleplayTopicPageState extends ConsumerState<SenseiRoleplayTopicPage> {
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
      appBar: AppBar(
        title: Text(
          'AI Roleplay',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w900,
            letterSpacing: -0.5,
          ),
        ),
        backgroundColor: theme.colorScheme.surface,
        elevation: 0,
        foregroundColor: theme.colorScheme.onSurface,
        actions: const [
          SenseiQuotaHeader(),
          SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCustomTopicSection(theme),
            const SizedBox(height: 32),
            Text(
              'GỢI Ý CHỦ ĐỀ',
              style: theme.textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.w900,
                color: theme.colorScheme.primary,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 20),
            ..._categories.map((category) => _buildCategorySection(category, theme)),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomTopicSection(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'CHỦ ĐỀ TỰ CHỌN',
          style: theme.textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w900,
            color: theme.colorScheme.primary,
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: theme.colorScheme.onSurface.withOpacity(0.04),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: TextField(
                  controller: _topicController,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                  decoration: InputDecoration(
                    hintText: 'VD: Phỏng vấn tại Apple...',
                    hintStyle: TextStyle(
                      color: theme.colorScheme.onSurfaceVariant.withOpacity(0.5),
                    ),
                    filled: true,
                    fillColor: theme.colorScheme.surface,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: theme.colorScheme.outlineVariant),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: theme.colorScheme.outlineVariant),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: theme.colorScheme.primary, width: 2),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  ),
                  onSubmitted: _startRoleplay,
                ),
              ),
            ),
            const SizedBox(width: 12),
            _buildActionButton(theme),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButton(ThemeData theme) {
    return Container(
      height: 52,
      width: 52,
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _startRoleplay(_topicController.text),
          borderRadius: BorderRadius.circular(16),
          child: const Center(
            child: Icon(FontAwesomeIcons.chevronRight, size: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildCategorySection(RoleplayCategory category, ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Container(
              height: 160,
              width: double.infinity,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: category.gradient.first.withOpacity(0.2),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    category.imagePath,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          category.gradient.first.withOpacity(0.85),
                          category.gradient.last.withOpacity(0.4),
                        ],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: Colors.white.withOpacity(0.3)),
                          ),
                          child: Icon(category.icon, size: 20, color: Colors.white),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          category.title,
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                            letterSpacing: -0.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Wrap(
              spacing: 12,
              runSpacing: 12,
              children: category.topics.map((topic) => _buildTopicCard(topic, category.gradient, theme)).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopicCard(String topic, List<Color> gradient, ThemeData theme) {
    return InkWell(
      onTap: () => _startRoleplay(topic),
      borderRadius: BorderRadius.circular(18),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: theme.colorScheme.outlineVariant),
          boxShadow: [
            BoxShadow(
              color: theme.colorScheme.onSurface.withOpacity(0.03),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: gradient),
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              topic,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: theme.colorScheme.onSurface.withOpacity(0.85),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
