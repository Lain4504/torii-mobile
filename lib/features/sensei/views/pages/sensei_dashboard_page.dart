import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../../models/sensei_model.dart';

class SenseiDashboardPage extends StatelessWidget {
  const SenseiDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AppScaffold(
      title: 'AI Sensei',
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: senseiMenuItems.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final item = senseiMenuItems[index];
          return Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Theme.of(context).colorScheme.outline.withOpacity(0.5)),
              borderRadius: BorderRadius.circular(12),
            ),
            clipBehavior: Clip.antiAlias,
            child: ListTile(
              leading: Icon(item.icon, size: 28, color: item.color),
              title: Text(item.title, style: textTheme.titleMedium),
              subtitle: Text(item.description, style: textTheme.bodySmall),
              trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
              onTap: () => context.push(item.route),
              contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            ),
          );
        },
      ),
    );
  }
}
