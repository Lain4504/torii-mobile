import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/features/meet/presentation/providers/meet_provider.dart';
import 'package:torii_app/features/meet/data/models/proto/wajlc_nats_msg.pb.dart' as nats_msg;
import 'package:torii_app/features/meet/data/models/proto/wajlc_gen_token.pb.dart' as gen_token;

class ParticipantsBottomSheet extends ConsumerWidget {
  const ParticipantsBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(meetControllerProvider);
    final notifier = ref.read(meetControllerProvider.notifier);

    final isAdmin = state.localUser?.isAdmin ?? state.localMetadata?.isAdmin ?? false;

    final items = <_ParticipantItem>[];

    void addUser(String userId, nats_msg.NatsKvUserInfo info, gen_token.UserMetadata? meta) {
      items.add(
        _ParticipantItem(
          userId: userId,
          name: info.name,
          isAdmin: info.isAdmin,
          isPresenter: meta?.isPresenter ?? false,
          raisedHand: meta?.raisedHand ?? false,
          waitForApproval: meta?.waitForApproval ?? false,
          isLocal: userId == state.userId,
        ),
      );
    }

    if (state.localUser != null) {
      final meta = state.localMetadata;
      addUser(state.userId ?? state.localUser!.userId, state.localUser!, meta);
    }

    state.remoteParticipantsMap.forEach((userId, info) {
      if (userId == state.userId) return;
      final meta = state.participantsMetadata[userId];
      addUser(userId, info, meta);
    });

    items.sort((a, b) {
      // Waiting room users first for admin
      if (isAdmin && a.waitForApproval != b.waitForApproval) {
        return a.waitForApproval ? -1 : 1;
      }
      // Admins first
      if (a.isAdmin != b.isAdmin) {
        return a.isAdmin ? -1 : 1;
      }
      // Presenter next
      if (a.isPresenter != b.isPresenter) {
        return a.isPresenter ? -1 : 1;
      }
      return a.name.toLowerCase().compareTo(b.name.toLowerCase());
    });

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      decoration: const BoxDecoration(
        color: Color(0xFF1A1A1A),
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Người tham gia',

                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Text(
                  '${items.length}',
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (items.isEmpty)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: Center(
                  child: Text(
                    'Chưa có người tham gia.',

                    style: TextStyle(color: Colors.white60),
                  ),
                ),
              )
            else
              Flexible(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: items.length,
                  separatorBuilder: (_, __) => const Divider(
                    color: Colors.white12,
                    height: 8,
                  ),
                  itemBuilder: (context, index) {
                    final p = items[index];
                    return _ParticipantRow(
                      item: p,
                      isCurrentUserAdmin: isAdmin,
                      onApprove: () => notifier.approveWaitingUser(p.userId),
                      onReject: () => notifier.rejectWaitingUser(p.userId, p.name),
                      onMute: () => notifier.muteUser(p.userId),
                      onLowerHand: () => notifier.lowerHandForUser(p.userId),
                      onMakePresenter: () => notifier.switchPresenterForUser(p.userId, makePresenter: !p.isPresenter),
                      onRemove: () => notifier.removeUserFromRoom(p.userId, p.name),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _ParticipantItem {
  final String userId;
  final String name;
  final bool isAdmin;
  final bool isPresenter;
  final bool raisedHand;
  final bool waitForApproval;
  final bool isLocal;

  _ParticipantItem({
    required this.userId,
    required this.name,
    required this.isAdmin,
    required this.isPresenter,
    required this.raisedHand,
    required this.waitForApproval,
    required this.isLocal,
  });
}

class _ParticipantRow extends StatelessWidget {
  final _ParticipantItem item;
  final bool isCurrentUserAdmin;
  final VoidCallback onApprove;
  final VoidCallback onReject;
  final VoidCallback onMute;
  final VoidCallback onLowerHand;
  final VoidCallback onMakePresenter;
  final VoidCallback onRemove;

  const _ParticipantRow({
    required this.item,
    required this.isCurrentUserAdmin,
    required this.onApprove,
    required this.onReject,
    required this.onMute,
    required this.onLowerHand,
    required this.onMakePresenter,
    required this.onRemove,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final title = item.isLocal ? '${item.name} (Bạn)' : item.name;


    return Row(
      children: [
        CircleAvatar(
          radius: 16,
          backgroundColor: item.isAdmin ? Colors.orange : Colors.blueGrey,
          child: Text(
            item.name.isNotEmpty ? item.name[0].toUpperCase() : '?',
            style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Flexible(
                    child: Text(
                      title,
                      style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (item.isAdmin)
                    const Padding(
                      padding: EdgeInsets.only(left: 6),
                      child: Icon(Icons.shield, size: 14, color: Colors.orangeAccent),
                    ),
                  if (item.isPresenter)
                    const Padding(
                      padding: EdgeInsets.only(left: 4),
                      child: Icon(Icons.star, size: 14, color: Colors.amber),
                    ),
                  if (item.raisedHand)
                    const Padding(
                      padding: EdgeInsets.only(left: 4),
                      child: Icon(Icons.back_hand, size: 14, color: Colors.yellow),
                    ),
                ],
              ),
              if (item.waitForApproval)
                const Text(
                  'Đang chờ duyệt',

                  style: TextStyle(color: Colors.orangeAccent, fontSize: 11),
                ),
            ],
          ),
        ),
        if (item.waitForApproval && isCurrentUserAdmin)
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.check, color: Colors.greenAccent, size: 20),
                onPressed: onApprove,
                tooltip: 'Duyệt',

              ),
              IconButton(
                icon: const Icon(Icons.close, color: Colors.redAccent, size: 20),
                onPressed: onReject,
                tooltip: 'Từ chối',

              ),
            ],
          )
        else if (isCurrentUserAdmin && !item.isLocal)
          PopupMenuButton<_ParticipantAction>(
            icon: const Icon(Icons.more_vert, color: Colors.white70, size: 20),
            onSelected: (value) {
              switch (value) {
                case _ParticipantAction.mute:
                  onMute();
                  break;
                case _ParticipantAction.lowerHand:
                  onLowerHand();
                  break;
                case _ParticipantAction.togglePresenter:
                  onMakePresenter();
                  break;
                case _ParticipantAction.remove:
                  onRemove();
                  break;
              }
            },
            itemBuilder: (context) {
              final entries = <PopupMenuEntry<_ParticipantAction>>[];
              entries.add(
                const PopupMenuItem(
                  value: _ParticipantAction.mute,
                  child: Text('Tắt micro'),

                ),
              );
              if (item.raisedHand) {
                entries.add(
                  const PopupMenuItem(
                    value: _ParticipantAction.lowerHand,
                    child: Text('Hạ tay'),

                  ),
                );
              }
              entries.add(
                PopupMenuItem(
                  value: _ParticipantAction.togglePresenter,
                  child: Text(item.isPresenter ? 'Hủy quyền trình bày' : 'Cấp quyền trình bày'),

                ),
              );
              entries.add(
                const PopupMenuItem(
                  value: _ParticipantAction.remove,
                  child: Text('Xóa khỏi phòng'),

                ),
              );
              return entries;
            },
          ),
      ],
    );
  }
}

enum _ParticipantAction {
  mute,
  lowerHand,
  togglePresenter,
  remove,
}

