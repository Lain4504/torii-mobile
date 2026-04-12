import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/providers/api_providers.dart';
import 'package:torii_app/data/models/academy_models.dart';
import 'package:torii_app/data/models/academy_product_detail_model.dart';
import 'package:torii_app/data/models/live_product_detail_model.dart';

class CourseDetailScreen extends ConsumerStatefulWidget {
  const CourseDetailScreen({
    super.key, 
    required this.id, 
    this.mode = 'VOD',
    this.initialLiveClassId,
  });
  final String id;
  final String mode;
  final String? initialLiveClassId;

  @override
  ConsumerState<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends ConsumerState<CourseDetailScreen> {
  String? _selectedLiveClassId;

  @override
  Widget build(BuildContext context) {
    final detailAsync = widget.mode.toUpperCase() == 'LIVE'
        ? ref.watch(classCatalogLiveDetailProvider(widget.id))
        : ref.watch(classCatalogVodDetailProvider(widget.id));
    
    final theme = Theme.of(context);
    final bottomInset = MediaQuery.of(context).padding.bottom;
    final bottomSafePadding = 76.0 + bottomInset;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: detailAsync.when(
        data: (item) {
          if (item == null) return const Center(child: Text('Không tìm thấy thông tin khóa học'));
          
          // Auto-select class from deep link or first class
          if (item.isLive && _selectedLiveClassId == null && item.siblingClasses.isNotEmpty) {
            _selectedLiveClassId = widget.initialLiveClassId ?? item.siblingClasses.first.id;
          }

          return Stack(
            children: [
              _buildContent(context, theme, item, bottomSafePadding),
              _buildBottomAction(context, theme, item, bottomSafePadding),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(
          child: Text(
            'Lỗi tải chi tiết: $e',
            style: const TextStyle(color: AppColors.error),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, ThemeData theme, AcademyProductDetailModel item, double bottomPadding) {
    double displayPrice = item.product.displayPrice;
    if (item.isLive && _selectedLiveClassId != null) {
      final selectedClass = item.siblingClasses.where((c) => c.id == _selectedLiveClassId).firstOrNull;
      if (selectedClass != null && (selectedClass.price != null || selectedClass.discountPrice != null)) {
        displayPrice = selectedClass.displayPrice;
      }
    }
    final priceStr = NumberFormat.currency(locale: 'vi_VN', symbol: 'đ', decimalDigits: 0).format(displayPrice);
    
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 280,
          pinned: true,
          backgroundColor: theme.colorScheme.primary,
          flexibleSpace: FlexibleSpaceBar(
            background: Hero(
              tag: 'course_image_${item.id}',
              child: Image.network(
                item.product.thumbnailUrl ?? 'https://picsum.photos/seed/detail/${item.id}/800/600',
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  color: theme.colorScheme.primaryContainer,
                  child: const Icon(Icons.school, size: 80),
                ),
              ),
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.only(left: 12, top: 4, bottom: 4),
            child: CircleAvatar(
              backgroundColor: Colors.black.withValues(alpha: 0.3),
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white, size: 20),
                onPressed: () => context.pop(),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    if (item.product.jlptLevel != null)
                      _buildBadge(theme, 'JLPT ${item.product.jlptLevel}', theme.colorScheme.primary),
                    const SizedBox(width: 8),
                    _buildBadge(theme, item.mode, Colors.orange),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  item.name,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Giá ưu đãi',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
                          ),
                        ),
                        Text(
                          priceStr,
                          style: theme.textTheme.titleLarge?.copyWith(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.w900,
                            letterSpacing: -0.5,
                          ),
                        ),
                      ],
                    ),
                    if (item.product.instructor != null)
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 18,
                            backgroundImage: NetworkImage(item.product.instructor!['avatarUrl'] ?? ''),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            item.product.instructor!['displayName'] ?? 'Giảng viên',
                            style: const TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                  ],
                ),
                if (item.isLive && item.siblingClasses.isNotEmpty) ...[
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 24),
                    child: Divider(height: 1),
                  ),
                  _buildSectionTitle(theme, 'Lịch học (Vui lòng chọn lớp)'),
                  const SizedBox(height: 12),
                  ...item.siblingClasses.map((lc) => _buildLiveClassTile(theme, lc)),
                ],
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Divider(height: 1),
                ),
                _buildSection(theme, 'Mô tả khóa học', item.description ?? 'Dữ liệu mô tả đang được cập nhật.'),
                const SizedBox(height: 32),
                _buildSectionTitle(theme, 'Chương trình giảng dạy'),
                const SizedBox(height: 16),
                if (item.modules.isEmpty)
                  _buildEmptyCurriculum(theme)
                else
                  ...item.modules.map((m) => _buildModuleTile(context, theme, m)),
                SizedBox(height: bottomPadding + 40),
              ],
            ),
          ),
        ),
        // Adding extra space at the end of the scroll view
        SliverToBoxAdapter(child: SizedBox(height: bottomPadding + 60)),
      ],
    );
  }

  Widget _buildBadge(ThemeData theme, String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 11,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }

  Widget _buildLiveClassTile(ThemeData theme, LiveClassModel lc) {
    final classId = lc.id;
    final name = lc.name;
    final isSelected = _selectedLiveClassId == classId;
    
    return GestureDetector(
      onTap: () => setState(() => _selectedLiveClassId = classId),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? theme.colorScheme.primaryContainer.withValues(alpha: 0.2) : theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? theme.colorScheme.primary : theme.colorScheme.outlineVariant.withValues(alpha: 0.5),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: isSelected ? theme.colorScheme.primary : theme.colorScheme.onSurfaceVariant,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 15)),
                  if (lc.price != null || lc.discountPrice != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      NumberFormat.currency(locale: 'vi_VN', symbol: 'đ', decimalDigits: 0).format(lc.displayPrice),
                      style: TextStyle(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                  ],
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.calendar_today, size: 12, color: theme.colorScheme.onSurfaceVariant),
                      const SizedBox(width: 4),
                      Text(
                        'Khai giảng: ${lc.openingDate != null ? DateFormat('dd/MM/yyyy').format(lc.openingDate!) : 'Đang cập nhật'}',
                        style: TextStyle(fontSize: 12, color: theme.colorScheme.onSurfaceVariant),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(ThemeData theme, String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(theme, title),
        const SizedBox(height: 12),
        Text(
          _stripHtml(content),
          style: theme.textTheme.bodyMedium?.copyWith(
            height: 1.6,
            color: theme.colorScheme.onSurface.withValues(alpha: 0.8),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(ThemeData theme, String title) {
    return Text(
      title,
      style: theme.textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.w900,
        color: theme.colorScheme.onSurface,
      ),
    );
  }

  Widget _buildEmptyCurriculum(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceVariant.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Text(
          'Chương trình đang được cập nhật.',
          style: TextStyle(color: theme.colorScheme.onSurfaceVariant),
        ),
      ),
    );
  }

  Widget _buildModuleTile(BuildContext context, ThemeData theme, CurriculumModuleModel module) {
    final lessons = module.lessons;
    
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.colorScheme.outlineVariant.withValues(alpha: 0.5)),
      ),
      child: ExpansionTile(
        title: Text(
          module.title,
          style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14),
        ),
        subtitle: Text('${lessons.length} bài học', style: const TextStyle(fontSize: 12)),
        tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        childrenPadding: const EdgeInsets.only(bottom: 12),
        children: lessons.map((lesson) {
          return ListTile(
            leading: Icon(Icons.play_circle_fill, size: 20, color: theme.colorScheme.primary),
            title: Text(
              lesson.title,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            dense: true,
          );
        }).toList(),
      ),
    );
  }

  Widget _buildBottomAction(BuildContext context, ThemeData theme, AcademyProductDetailModel item, double padding) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: padding,
        padding: const EdgeInsets.fromLTRB(24, 12, 24, 0),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  if (item.isLive && _selectedLiveClassId == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Vui lòng chọn lớp học trước khi đăng ký'))
                    );
                    return;
                  }
                  final targetId = item.id;
                  final classSlug = item.isLive ? '&liveClassId=$_selectedLiveClassId' : '';
                  context.push('/checkout/$targetId?mode=${item.product.mode}$classSlug');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  foregroundColor: theme.colorScheme.onPrimary,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  elevation: 0,
                ),
                child: const Text('Đăng ký học ngay', style: TextStyle(fontWeight: FontWeight.w900)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _stripHtml(String h) {
    return h
        .replaceAll(RegExp(r'<[^>]*>'), ' ')
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim();
  }
}
