import 'package:flutter/material.dart';

class LecturerDetailScreen extends StatelessWidget {
  const LecturerDetailScreen({super.key, required this.lecturer});

  final Map<String, dynamic> lecturer;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final avatarUrl = lecturer['avatarUrl']?.toString();
    final name = (lecturer['name'] ?? lecturer['fullName'] ?? 'Giang vien')
        .toString();
    final code = (lecturer['code'] ?? '').toString();
    final email = (lecturer['email'] ?? '').toString();
    final phone = (lecturer['phone'] ?? '').toString();
    final bio = (lecturer['bio'] ?? lecturer['description'] ?? '').toString();

    return Scaffold(
      appBar: AppBar(title: const Text('Thong tin giang vien')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: theme.colorScheme.outlineVariant),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: theme.colorScheme.outlineVariant,
                  backgroundImage: (avatarUrl != null && avatarUrl.isNotEmpty)
                      ? NetworkImage(avatarUrl)
                      : null,
                  child: (avatarUrl == null || avatarUrl.isEmpty)
                      ? Text(
                          name.isNotEmpty
                              ? name.characters.first.toUpperCase()
                              : 'G',
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w800,
                          ),
                        )
                      : null,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      if (code.isNotEmpty) ...[
                        const SizedBox(height: 4),
                        Text(
                          'Ma: $code',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          if (email.isNotEmpty) _infoTile(context, 'Email', email),
          if (phone.isNotEmpty) _infoTile(context, 'Dien thoai', phone),
          if (bio.isNotEmpty) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: theme.colorScheme.outlineVariant),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Gioi thieu',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    bio,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                      height: 1.45,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _infoTile(BuildContext context, String label, String value) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 90,
            child: Text(
              label,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
