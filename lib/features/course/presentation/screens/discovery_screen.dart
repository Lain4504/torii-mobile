import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/providers/api_providers.dart';
import 'package:torii_app/data/models/academy_models.dart';

class DiscoveryScreen extends ConsumerStatefulWidget {
  const DiscoveryScreen({super.key});

  @override
  ConsumerState<DiscoveryScreen> createState() => _DiscoveryScreenState();
}

class _DiscoveryScreenState extends ConsumerState<DiscoveryScreen> {
  String _selectedLevel = 'Tất cả';
  final List<String> _levels = ['Tất cả', 'N5', 'N4', 'N3', 'N2', 'N1'];

  Future<void> _openCourseSearch(BuildContext context) async {
    final effectiveLevel = _selectedLevel == 'Tất cả' ? null : _selectedLevel;
    try {
      final results = await Future.wait<List<AcademyProductModel>>([
        ref.read(classCatalogLiveProvider(effectiveLevel).future),
        ref.read(classCatalogVodProvider(effectiveLevel).future),
      ]);

      if (!mounted) return;

      final allItems = <AcademyProductModel>[
        ...results[0],
        ...results[1],
      ];

      final deduped = <String, AcademyProductModel>{};
      for (final item in allItems) {
        deduped['${item.mode}:${item.id}'] = item;
      }

      await showSearch<AcademyProductModel?>(
        context: context,
        delegate: _CourseSearchDelegate(deduped.values.toList()),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Không thể tải dữ liệu tìm kiếm: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 900;

    // Correctly process level for provider
    final effectiveLevel = _selectedLevel == 'Tất cả' ? null : _selectedLevel;
    final liveAsync = ref.watch(classCatalogLiveProvider(effectiveLevel));
    final vodAsync = ref.watch(classCatalogVodProvider(effectiveLevel));

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: CustomScrollView(
        slivers: [
          _buildAppBar(context, theme),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: _buildLevelFilter(theme),
            ),
          ),
          _buildSectionHeader(theme, 'Lớp học trực tuyến (LIVE)', 'Khai giảng định kỳ với giáo viên'),
          _buildProductGrid(liveAsync, isDesktop, true),
          const SliverToBoxAdapter(child: SizedBox(height: 32)),
          _buildSectionHeader(theme, 'Khóa học tự học (VOD)', 'Học mọi lúc mọi nơi với video bài giảng'),
          _buildProductGrid(vodAsync, isDesktop, false),
          const SliverToBoxAdapter(child: SizedBox(height: 48)),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context, ThemeData theme) {
    return SliverAppBar(
      expandedHeight: 120,
      floating: true,
      pinned: true,
      elevation: 0,
      backgroundColor: theme.colorScheme.surface,
      surfaceTintColor: Colors.transparent,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        titlePadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        title: Text(
          'Khám phá khóa học',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: AppTypography.extraBold,
            color: theme.colorScheme.onSurface,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: IconButton(
            onPressed: () => _openCourseSearch(context),
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer.withValues(alpha: 0.3),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.search,
                color: theme.colorScheme.primary,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLevelFilter(ThemeData theme) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: _levels.map((lvl) {
          final isSelected = _selectedLevel == lvl;
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: ChoiceChip(
              label: Text(lvl),
              selected: isSelected,
              onSelected: (val) {
                if (val) setState(() => _selectedLevel = lvl);
              },
              side: BorderSide.none,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : theme.colorScheme.onSurface,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
              selectedColor: theme.colorScheme.primary,
              backgroundColor: theme.colorScheme.surfaceVariant.withValues(alpha: 0.5),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildSectionHeader(ThemeData theme, String title, String subtitle) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w800,
                color: theme.colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductGrid(
    AsyncValue<List<AcademyProductModel>> asyncValue,
    bool isDesktop,
    bool isLive,
  ) {
    return asyncValue.when(
      data: (items) {
        if (items.isEmpty) {
          return const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(40),
              child: Center(child: Text('Không có khóa học nào phù hợp.')),
            ),
          );
        }
        return SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isDesktop ? 3 : 1,
              mainAxisSpacing: 24,
              crossAxisSpacing: 24,
              childAspectRatio: isDesktop ? 0.85 : 1.1,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) => _buildProductCard(context, items[index]),
              childCount: items.length,
            ),
          ),
        );
      },
      loading: () => const SliverToBoxAdapter(
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (e, _) => SliverToBoxAdapter(
        child: Center(child: Text('Lỗi tải dữ liệu: $e')),
      ),
    );
  }

  Widget _buildProductCard(BuildContext context, AcademyProductModel item) {
    final theme = Theme.of(context);
    final priceStr = NumberFormat.currency(locale: 'vi_VN', symbol: 'đ', decimalDigits: 0).format(item.displayPrice);
    
    return GestureDetector(
      onTap: () {
        final classSlug = item.liveClassId != null ? '&liveClassId=${item.liveClassId}' : '';
        context.push('/course-detail/${item.id}?mode=${item.mode}$classSlug');
      },
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: theme.colorScheme.primary.withValues(alpha: 0.05),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                      child: Image.network(
                        item.thumbnailUrl ?? 'https://picsum.photos/seed/${item.id}/600/400',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: theme.colorScheme.primaryContainer.withValues(alpha: 0.3),
                          child: Icon(Icons.school, size: 48, color: theme.colorScheme.primary),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 16,
                    left: 16,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        item.jlptLevel ?? 'N/A',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  if (item.isLive && item.startDate != null)
                    Positioned(
                      bottom: 12,
                      right: 12,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.6),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'Khai giảng: ${DateFormat('dd/MM').format(item.startDate!)}',
                          style: const TextStyle(color: Colors.white, fontSize: 11),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (item.discountPrice != null && item.price != null)
                              Text(
                                NumberFormat.currency(locale: 'vi_VN', symbol: 'đ', decimalDigits: 0).format(item.price),
                                style: theme.textTheme.bodySmall?.copyWith(
                                  decoration: TextDecoration.lineThrough,
                                  color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
                                ),
                              ),
                            Text(
                              priceStr,
                              style: theme.textTheme.titleMedium?.copyWith(
                                color: theme.colorScheme.primary,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primary.withValues(alpha: 0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 14,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CourseSearchDelegate extends SearchDelegate<AcademyProductModel?> {
  _CourseSearchDelegate(this.items);

  final List<AcademyProductModel> items;

  @override
  String? get searchFieldLabel => 'Tìm khóa học...';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(
          onPressed: () => query = '',
          icon: const Icon(Icons.close),
        ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildResultList(context);
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildResultList(context);
  }

  List<AcademyProductModel> _filteredItems() {
    final keyword = query.trim().toLowerCase();
    if (keyword.isEmpty) return items;

    return items.where((item) {
      final name = item.name.toLowerCase();
      final level = (item.jlptLevel ?? '').toLowerCase();
      final mode = item.mode.toLowerCase();
      return name.contains(keyword) || level.contains(keyword) || mode.contains(keyword);
    }).toList();
  }

  Widget _buildResultList(BuildContext context) {
    final theme = Theme.of(context);
    final filtered = _filteredItems();

    if (filtered.isEmpty) {
      return const Center(
        child: Text('Không tìm thấy khóa học phù hợp.'),
      );
    }

    return ListView.separated(
      itemCount: filtered.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final item = filtered[index];
        final modeLabel = item.isLive ? 'LIVE' : 'VOD';
        final levelLabel = (item.jlptLevel ?? 'N/A').trim();

        return ListTile(
          leading: CircleAvatar(
            backgroundColor: theme.colorScheme.primaryContainer.withValues(alpha: 0.35),
            child: Icon(
              item.isLive ? Icons.videocam : Icons.play_lesson,
              color: theme.colorScheme.primary,
              size: 18,
            ),
          ),
          title: Text(
            item.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text('$modeLabel • $levelLabel'),
          trailing: const Icon(Icons.arrow_forward_ios, size: 14),
          onTap: () {
            final classSlug = item.liveClassId != null ? '&liveClassId=${item.liveClassId}' : '';
            final route = '/course-detail/${item.id}?mode=${item.mode}$classSlug';
            final router = GoRouter.of(context);
            close(context, item);
            router.push(route);
          },
        );
      },
    );
  }
}
