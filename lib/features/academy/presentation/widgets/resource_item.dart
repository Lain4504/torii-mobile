import 'package:flutter/material.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/data/models/academy_models.dart';

class ResourceItem extends StatelessWidget {
  final AcademyResource resource;
  final VoidCallback onTap;

  const ResourceItem({
    super.key,
    required this.resource,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isFile = resource.isFile;

    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: (isFile ? AppColors.detail : Colors.orange).withOpacity(0.1),
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
        child: Icon(
          isFile ? Icons.description_rounded : Icons.link_rounded,
          color: isFile ? AppColors.detail : Colors.orange,
          size: 24,
        ),
      ),
      title: Text(
        resource.title,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        isFile ? 'Tài liệu' : 'Liên kết ngoài',
        style: theme.textTheme.bodySmall?.copyWith(color: theme.hintColor),
      ),
      trailing: const Icon(Icons.open_in_new_rounded, size: 20, color: Colors.grey),
    );
  }
}
