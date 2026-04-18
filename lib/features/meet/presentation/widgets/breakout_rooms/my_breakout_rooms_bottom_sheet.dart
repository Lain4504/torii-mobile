import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/breakout/breakout_room_switcher.dart';
import '../../../providers/breakout_room_provider.dart';
import '../../../providers/session_provider.dart';

/// Danh sách phòng breakout được server gán cho user (GET /api/breakoutRoom/myRooms).
class MyBreakoutRoomsBottomSheet extends ConsumerWidget {
  const MyBreakoutRoomsBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncRooms = ref.watch(myBreakoutRoomsProvider);
    final theme = Theme.of(context);

    return Container(
      height: MediaQuery.of(context).size.height * 0.55,
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 8),
          Center(
            child: Container(
              width: 36,
              height: 4,
              decoration: BoxDecoration(
                color: theme.dividerColor.withValues(alpha: 0.35),
                borderRadius: BorderRadius.circular(999),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Row(
              children: [
                Icon(Icons.meeting_room_outlined, color: theme.colorScheme.primary),
                const SizedBox(width: 10),
                const Expanded(
                  child: Text(
                    'Phòng breakout của tôi',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
                IconButton(
                  tooltip: 'Làm mới',
                  onPressed: () => ref.invalidate(myBreakoutRoomsProvider),
                  icon: const Icon(Icons.refresh_rounded),
                ),
              ],
            ),
          ),
          Expanded(
            child: asyncRooms.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Không tải được danh sách: $e',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              data: (rooms) {
                if (rooms.isEmpty) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Text(
                        'Chưa có phòng breakout được gán.\n'
                        'Khi host chia nhóm, danh sách sẽ cập nhật.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: theme.hintColor),
                      ),
                    ),
                  );
                }
                return RefreshIndicator(
                  onRefresh: () async {
                    ref.invalidate(myBreakoutRoomsProvider);
                    await ref.read(myBreakoutRoomsProvider.future);
                  },
                  child: ListView.separated(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                    itemCount: rooms.length,
                    separatorBuilder: (context, index) => const Divider(height: 1),
                    itemBuilder: (context, index) {
                      final room = rooms[index];
                      final title =
                          room.title.isNotEmpty ? room.title : room.id;
                      final isAdmin =
                          ref.read(sessionProvider).currentUser?.metadata?.isAdmin ??
                              false;
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(title),
                        subtitle: Text(
                          'ID: ${room.id}',
                          style: TextStyle(fontSize: 12, color: theme.hintColor),
                        ),
                        trailing: FilledButton(
                          onPressed: () async {
                            Navigator.of(context).pop();
                            await joinAndSwitchToBreakoutRoom(
                              context: context,
                              ref: ref,
                              breakoutRoomId: room.id,
                              isAdmin: isAdmin,
                            );
                          },
                          child: const Text('Vào phòng'),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
