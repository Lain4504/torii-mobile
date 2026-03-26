import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:torii_app/core/providers/api_providers.dart';
import 'package:torii_app/features/academy/presentation/widgets/folder_card.dart';
import 'package:torii_app/data/models/academy_models.dart';

class MyFoldersScreen extends ConsumerWidget {
  const MyFoldersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final foldersAsync = ref.watch(myFoldersProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Thư mục của tôi'),
        centerTitle: true,
      ),
      body: foldersAsync.when(
        data: (folders) {
          if (folders.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.folder_open_rounded,
                    size: 80,
                    color: theme.dividerColor.withOpacity(0.2),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Bạn chưa có thư mục tài nguyên nào.',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.hintColor,
                    ),
                  ),
                ],
              ),
            );
          }

          // Group folders by class name
          final groupedFolders = <String, List<AcademyFolder>>{};
          for (final folder in folders) {
            final key = folder.className ?? 'Khác';
            groupedFolders.putIfAbsent(key, () => []).add(folder);
          }

          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            itemCount: groupedFolders.length,
            itemBuilder: (context, index) {
              final className = groupedFolders.keys.elementAt(index);
              final classFolders = groupedFolders[className]!;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      className,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w900,
                        color: theme.colorScheme.primary,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                  ...classFolders.map((folder) => FolderCard(
                        folder: folder,
                        onTap: () => context.push(
                          '/academy/folders/${folder.id}',
                          extra: folder.name,
                        ),
                      )),
                ],
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
                Text('Không thể tải danh sách thư mục: $error'),
                TextButton(
                  onPressed: () => ref.refresh(myFoldersProvider),
                  child: const Text('Thử lại'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
