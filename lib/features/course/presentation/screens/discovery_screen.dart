import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/providers/api_providers.dart';
import 'package:torii_app/data/models/class_catalog_model.dart';

class CourseDiscoveryScreen extends ConsumerStatefulWidget {
  const CourseDiscoveryScreen({super.key});

  @override
  ConsumerState<CourseDiscoveryScreen> createState() =>
      _CourseDiscoveryScreenState();
}

class _CourseDiscoveryScreenState extends ConsumerState<CourseDiscoveryScreen> {
  static const List<String> _levels = ['Tất cả', 'N5', 'N4', 'N3', 'N2', 'N1'];
  String _selectedLevel = 'Tất cả';
  String? _lastUrlLevel;

  @override
  Widget build(BuildContext context) {
    final rawLevel = GoRouterState.of(context).uri.queryParameters['level'];
    final urlLevel = (rawLevel == null || rawLevel.trim().isEmpty)
        ? null
        : rawLevel.trim().toUpperCase();
    if (urlLevel != _lastUrlLevel) {
      _lastUrlLevel = urlLevel;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        final nextLevel = _levels.contains(urlLevel) ? urlLevel! : 'Tất cả';
        if (_selectedLevel == nextLevel) return;
        setState(() => _selectedLevel = nextLevel);
      });
    }
    final effectiveLevel = _selectedLevel == 'Tất cả'
        ? urlLevel
        : _selectedLevel;
    final level =
        (effectiveLevel == null ||
            effectiveLevel.isEmpty ||
            effectiveLevel == 'TẤT CẢ')
        ? null
        : effectiveLevel;
    final liveAsync = ref.watch(classCatalogLiveProvider(level));
    final vodAsync = ref.watch(classCatalogVodProvider(level));
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Khám phá khóa học',
          style: theme.textTheme.titleMedium?.copyWith(
            color: theme.colorScheme.onSurface,
            fontWeight: FontWeight.w800,
          ),
        ),
        backgroundColor: theme.colorScheme.surface,
        elevation: 0,
      ),
      body: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
        children: [
          Text(
            'Lọc theo trình độ',
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _levels.map((lv) {
              final selected = _selectedLevel == lv;
              return ChoiceChip(
                selected: selected,
                label: Text(lv),
                onSelected: (_) => setState(() => _selectedLevel = lv),
                selectedColor: AppColors.primary.withValues(alpha: 0.15),
                labelStyle: TextStyle(
                  color: selected
                      ? AppColors.primary
                      : theme.colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w700,
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          Text(
            'Lớp Live sắp mở',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Ưu tiên lớp N3, N5 trong kỳ hiện tại.',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 10),
          _buildList(context, liveAsync, isLive: true),
          const SizedBox(height: 20),
          Text(
            'Khóa VOD',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 10),
          _buildList(context, vodAsync, isLive: false),
        ],
      ),
    );
  }

  Widget _buildList(
    BuildContext context,
    AsyncValue<List<ClassCatalogItemModel>> async, {
    required bool isLive,
  }) {
    return async.when(
      data: (list) {
        final sorted = isLive ? _sortLiveUpcoming(list) : list;
        if (sorted.isEmpty) {
          return _buildEmptySectionCard(context, isLive: isLive);
        }
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: sorted.length,
          itemBuilder: (context, index) =>
              _buildCourseCard(context, sorted[index], isLive: isLive),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(
        child: _buildEmptySectionCard(
          context,
          isLive: isLive,
          message: 'Không tải được dữ liệu. Hãy thử lại sau.',
        ),
      ),
    );
  }

  Widget _buildEmptySectionCard(
    BuildContext context, {
    required bool isLive,
    String? message,
  }) {
    final theme = Theme.of(context);
    final title = isLive
        ? 'Chưa có lớp LIVE phù hợp'
        : 'Chưa có khóa VOD phù hợp';
    final desc =
        message ??
        'Bạn có thể đổi bộ lọc trình độ hoặc quay lại sau để xem thêm nội dung mới.';

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              isLive ? Icons.live_tv_rounded : Icons.ondemand_video_rounded,
              color: theme.colorScheme.primary,
              size: 20,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  desc,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                    height: 1.35,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<ClassCatalogItemModel> _sortLiveUpcoming(
    List<ClassCatalogItemModel> list,
  ) {
    final now = DateTime.now();
    final copied = [...list];
    copied.sort((a, b) {
      final pa = _livePriority(a);
      final pb = _livePriority(b);
      if (pa != pb) return pa.compareTo(pb);
      final da = a.openingDate;
      final db = b.openingDate;
      if (da == null && db == null) return 0;
      if (da == null) return 1;
      if (db == null) return -1;
      final aPast = da.isBefore(now);
      final bPast = db.isBefore(now);
      if (aPast != bPast) return aPast ? 1 : -1;
      return da.compareTo(db);
    });
    return copied;
  }

  int _livePriority(ClassCatalogItemModel item) {
    final level = (item.jlptLevel ?? '').toUpperCase();
    if (level == 'N3') return 0;
    if (level == 'N5') return 1;
    return 2;
  }

  Widget _buildCourseCard(
    BuildContext context,
    ClassCatalogItemModel c, {
    required bool isLive,
  }) {
    final priceStr =
        '${c.catalogPrice.toInt().toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]}.')}đ';
    final thumb =
        c.thumbnailUrl ?? 'https://picsum.photos/seed/c${c.id}/600/300';
    final title = c.name.isNotEmpty ? c.name : (c.profileTitle ?? 'Khóa học');

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.04),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(24),
                ),
                child: Image.network(
                  thumb,
                  height: 160,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (_, error, stackTrace) => Container(
                    height: 160,
                    color: Theme.of(
                      context,
                    ).colorScheme.outlineVariant.withValues(alpha: 0.3),
                    child: const Icon(Icons.school, size: 48),
                  ),
                ),
              ),
              Positioned(
                top: 12,
                left: 12,
                child: Row(
                  children: [
                    if (c.jlptLevel != null)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          c.jlptLevel!,
                          style: const TextStyle(
                            color: AppColors.textOnPrimary,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: isLive ? AppColors.error : AppColors.primary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        isLive ? 'LIVE' : 'VOD',
                        style: const TextStyle(
                          color: AppColors.textOnPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Text(
                  'Mã: ${c.code}',
                  style: TextStyle(fontSize: 12, color: AppColors.grey700),
                ),
                if (isLive && c.openingDate != null) ...[
                  const SizedBox(height: 6),
                  Text(
                    'Khai giảng: ${DateFormat('dd/MM/yyyy').format(c.openingDate!)}',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.grey700,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      priceStr,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (isLive) {
                          context.push('/course-live/${c.id}');
                        } else {
                          context.push('/course-detail/${c.id}');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor: Theme.of(
                          context,
                        ).colorScheme.onPrimary,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Xem chi tiết',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
