import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:torii_app/core/providers/api_providers.dart';
import 'package:torii_app/features/academy/presentation/widgets/resource_item.dart';
import 'package:torii_app/data/models/academy_models.dart';

class FolderResourcesScreen extends ConsumerWidget {
  final String folderId;
  final String? folderName;

  const FolderResourcesScreen({
    super.key,
    required this.folderId,
    this.folderName,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resourcesAsync = ref.watch(folderResourcesProvider(folderId));
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(folderName ?? 'Tài nguyên'),
      ),
      body: resourcesAsync.when(
        data: (resources) {
          if (resources.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.description_outlined,
                    size: 80,
                    color: theme.dividerColor.withOpacity(0.2),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Thư mục này chưa có tài nguyên nào.',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.hintColor,
                    ),
                  ),
                ],
              ),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: resources.length,
            separatorBuilder: (context, index) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final resource = resources[index];
              return ResourceItem(
                resource: resource,
                onTap: () => _handleOpenResource(context, resource),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline_rounded, color: Colors.red, size: 48),
                const SizedBox(height: 16),
                Text('Không thể tải tài nguyên: $error'),
                TextButton(
                  onPressed: () => ref.refresh(folderResourcesProvider(folderId)),
                  child: const Text('Thử lại'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _handleOpenResource(BuildContext context, AcademyResource resource) async {
    final url = resource.url;
    if (url == null || url.isEmpty) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Không tìm thấy đường dẫn tài nguyên')),
        );
      }
      return;
    }

    final uri = Uri.parse(url);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Không thể mở liên kết này')),
          );
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Lỗi khi mở tài nguyên: $e')),
        );
      }
    }
  }
}
