import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/providers/api_providers.dart';
import 'package:torii_app/data/models/class_catalog_model.dart';

class CourseDiscoveryScreen extends ConsumerStatefulWidget {
  const CourseDiscoveryScreen({super.key});

  @override
  ConsumerState<CourseDiscoveryScreen> createState() => _CourseDiscoveryScreenState();
}

class _CourseDiscoveryScreenState extends ConsumerState<CourseDiscoveryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final rawLevel = GoRouterState.of(context).uri.queryParameters['level'];
    final level = (rawLevel == null || rawLevel.trim().isEmpty) ? null : rawLevel.trim();
    final liveAsync = ref.watch(classCatalogLiveProvider(level));
    final vodAsync = ref.watch(classCatalogVodProvider(level));
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        title: Text(
          'Khám phá khóa học',
          style: theme.textTheme.titleMedium?.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w800,
          ),
        ),
        backgroundColor: AppColors.surface,
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          labelColor: AppColors.primary,
          unselectedLabelColor: AppColors.grey700,
          tabs: const [
            Tab(text: 'Lớp Live'),
            Tab(text: 'Khóa VOD'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildList(context, liveAsync, isLive: true),
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
        if (list.isEmpty) {
          return const Center(child: Text('Chưa có lớp phù hợp'));
        }
        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          itemCount: list.length,
          itemBuilder: (context, index) => _buildCourseCard(context, list[index], isLive: isLive),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Lỗi: $e', style: TextStyle(color: AppColors.error))),
    );
  }

  Widget _buildCourseCard(BuildContext context, ClassCatalogItemModel c, {required bool isLive}) {
    final priceStr =
        '${c.catalogPrice.toInt().toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]}.')}đ';
    final thumb = c.thumbnailUrl ?? 'https://picsum.photos/seed/c${c.id}/600/300';
    final title = c.name.isNotEmpty ? c.name : (c.profileTitle ?? 'Khóa học');

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(color: AppColors.textPrimary.withOpacity(0.04), blurRadius: 20, offset: const Offset(0, 10)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                child: Image.network(
                  thumb,
                  height: 160,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(height: 160, color: AppColors.grey200, child: const Icon(Icons.school, size: 48)),
                ),
              ),
              Positioned(
                top: 12,
                left: 12,
                child: Row(
                  children: [
                    if (c.jlptLevel != null)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(12)),
                        child: Text(c.jlptLevel!, style: const TextStyle(color: AppColors.textOnPrimary, fontWeight: FontWeight.bold, fontSize: 12)),
                      ),
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: isLive ? AppColors.error : AppColors.primary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        isLive ? 'LIVE' : 'VOD',
                        style: const TextStyle(color: AppColors.textOnPrimary, fontWeight: FontWeight.bold, fontSize: 12),
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
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Text('Mã: ${c.code}', style: TextStyle(fontSize: 12, color: AppColors.grey700)),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(priceStr, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.primary)),
                    ElevatedButton(
                      onPressed: () {
                        if (isLive) {
                          context.push('/course-live/${c.id}');
                        } else {
                          context.push('/course-detail/${c.id}');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.textOnPrimary,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        elevation: 0,
                      ),
                      child: const Text('Xem chi tiết', style: TextStyle(fontWeight: FontWeight.bold)),
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
