import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/core/providers/api_providers.dart';

class CouponsScreen extends ConsumerWidget {
  const CouponsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final repo = ref.watch(gamificationRepositoryProvider);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, size: 20, color: theme.colorScheme.onSurface),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Mã giảm giá của tôi',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
            letterSpacing: 0.2,
          ),
        ),
        backgroundColor: theme.colorScheme.surface,
        elevation: 0,
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: repo.getMyCoupons(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Lỗi: ${snapshot.error}',
                style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.error),
              ),
            );
          }
          final coupons = snapshot.data ?? [];
          if (coupons.isEmpty) {
            return Center(
              child: Text(
                'Bạn chưa có mã giảm giá nào.\nHãy tham gia các sự kiện hoặc đổi quà để nhận mã.',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
              ),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
            itemCount: coupons.length,
            separatorBuilder: (_, __) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              final c = coupons[index];
              final code = (c['code'] ?? c['couponCode'] ?? 'COUPON') as String;
              final desc = (c['description'] ?? '') as String;
              final expiredAt = c['expiredAt'] ?? c['expiresAt'];

              String? expiredText;
              if (expiredAt != null) {
                expiredText = expiredAt.toString();
              }

              return Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: theme.colorScheme.outlineVariant),
                  boxShadow: [
                    BoxShadow(
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.03),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Icon(Icons.local_offer_rounded, color: theme.colorScheme.primary),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            code,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w800,
                              letterSpacing: 0.8,
                            ),
                          ),
                          if (desc.isNotEmpty) ...[
                            const SizedBox(height: 2),
                            Text(
                              desc,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.onSurfaceVariant,
                                height: 1.35,
                              ),
                            ),
                          ],
                          if (expiredText != null) ...[
                            const SizedBox(height: 4),
                            Text(
                              'Hết hạn: $expiredText',
                              style: theme.textTheme.bodySmall?.copyWith(fontSize: 11, color: theme.colorScheme.onSurfaceVariant),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

