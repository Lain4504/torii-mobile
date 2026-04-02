import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fixnum/fixnum.dart';
import 'package:torii_app/features/meet/data/datasources/meet_api_service.dart';
import 'package:torii_app/features/meet/data/models/proto/wajlc_breakout_room.pb.dart'
    as breakout_room;
import 'package:torii_app/features/meet/providers/breakout_rooms_provider.dart';
import 'package:torii_app/features/meet/providers/participant_provider.dart';
import 'package:torii_app/features/meet/providers/session_provider.dart';
import 'package:torii_app/features/meet/core/breakout/breakout_room_switcher.dart';

/// Breakout Rooms Bottom Sheet (admin)
/// - Create breakout rooms & assign users
/// - Manage active rooms: list, users, join, end, extend, broadcast, end all
class BreakoutRoomsBottomSheet extends ConsumerStatefulWidget {
  const BreakoutRoomsBottomSheet({super.key});

  @override
  ConsumerState<BreakoutRoomsBottomSheet> createState() =>
      _BreakoutRoomsBottomSheetState();
}

class _BreakoutRoomsBottomSheetState
    extends ConsumerState<BreakoutRoomsBottomSheet> {
  int _numRooms = 2;
  int _durationMinutes = 15;
  String _welcomeMsg = '';
  final Map<String, int> _userRoomAssignments = {}; // userId -> roomNum

  bool _creating = false;
  String? _errorMessage;

  final _broadcastCtrl = TextEditingController();
  bool _broadcasting = false;

  @override
  void initState() {
    super.initState();
    // Like web: listRooms polling ~10s only while manage UI is open.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final allowed = ref.read(
        sessionProvider.select(
          (s) =>
              s.currentRoom.metadata?.roomFeatures?.breakoutRoomFeatures
                  ?.allowedNumberRooms ??
              0,
        ),
      );
      if (allowed > 0) {
        setState(() {
          if (_numRooms > allowed) _numRooms = allowed;
        });
      }
      ref.read(breakoutRoomsProvider.notifier).startPolling();
      ref.read(breakoutRoomsProvider.notifier).fetchList();
    });
  }

  @override
  void dispose() {
    ref.read(breakoutRoomsProvider.notifier).stopPolling();
    _broadcastCtrl.dispose();
    super.dispose();
  }

  void _randomAssign() {
    final participants = ref.read(participantProvider).allParticipants;
    final currentUserId =
        ref.read(sessionProvider.select((s) => s.currentUser?.userId));
    final availableRooms = List.generate(_numRooms, (i) => i + 1);

    final assignments = <String, int>{};
    var seed = DateTime.now().millisecondsSinceEpoch;
    for (final p in participants) {
      if (p.userId == currentUserId) continue;
      seed = 1103515245 * seed + 12345;
      assignments[p.userId] = availableRooms[seed.abs() % availableRooms.length];
    }

    setState(() {
      _userRoomAssignments
        ..clear()
        ..addAll(assignments);
    });
  }

  Future<void> _createBreakoutRooms() async {
    final session = ref.read(sessionProvider);
    final api = ref.read(meetApiServiceProvider);
    final participants = ref.read(participantProvider).allParticipants;
    final currentUserId = session.currentUser?.userId ?? '';
    final parentRoomId = session.currentRoom.roomId;

    if (currentUserId.isEmpty || parentRoomId.isEmpty) {
      setState(() => _errorMessage = 'Thiếu thông tin phiên họp');
      return;
    }

    setState(() {
      _creating = true;
      _errorMessage = null;
    });

    try {
      final rooms = <breakout_room.BreakoutRoom>[];
      for (var roomNum = 1; roomNum <= _numRooms; roomNum++) {
        final users = participants
            .where((p) => _userRoomAssignments[p.userId] == roomNum)
            .map(
              (p) => breakout_room.BreakoutRoomUser(
                id: p.userId,
                name: p.name,
                joined: false,
              ),
            )
            .toList();

        if (users.isEmpty) continue;
        rooms.add(
          breakout_room.BreakoutRoom(
            id: roomNum.toString(),
            title: 'Phòng $roomNum',
            users: users,
          ),
        );
      }

      if (rooms.isEmpty) {
        setState(() {
          _creating = false;
          _errorMessage =
              'Cần phân ít nhất 1 người dùng vào 1 phòng nhóm để tạo.';
        });
        return;
      }

      final req = breakout_room.CreateBreakoutRoomsReq(
        roomId: parentRoomId,
        requestedUserId: currentUserId,
        duration: Int64(_durationMinutes),
        welcomeMsg: _welcomeMsg,
        rooms: rooms,
      );
      final res = await api.createBreakoutRooms(req);
      if (!mounted) return;

      if (!res.status) {
        setState(() {
          _creating = false;
          _errorMessage = res.msg.isNotEmpty ? res.msg : 'Tạo phòng nhóm thất bại';
        });
        return;
      }

      // Web: modal closes on success; metadata update will flip isActive.
      await ref.read(breakoutRoomsProvider.notifier).fetchList(silent: true);
      if (!mounted) return;
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Đã tạo phòng nhóm')),
      );
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _creating = false;
        _errorMessage = e.toString();
      });
    }
  }

  Future<void> _endAllRooms() async {
    final ok = await showDialog<bool>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Kết thúc tất cả?'),
            content: const Text('Tất cả phòng nhóm sẽ bị kết thúc ngay.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx, false),
                child: const Text('Hủy'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(ctx, true),
                child: Text(
                  'Kết thúc',
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
              ),
            ],
          ),
        ) ??
        false;
    if (!ok) return;

    try {
      final res = await ref.read(breakoutRoomsProvider.notifier).endAllRooms();
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(res.status ? 'Đã kết thúc tất cả' : (res.msg.isNotEmpty ? res.msg : 'Không kết thúc được')),
          backgroundColor:
              res.status ? null : Theme.of(context).colorScheme.error,
        ),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Lỗi: $e'),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    }
  }

  Future<void> _broadcastMessage() async {
    final msg = _broadcastCtrl.text.trim();
    if (msg.isEmpty) return;

    final roomId = ref.read(sessionProvider).currentRoom.roomId;
    if (roomId.isEmpty) return;

    setState(() => _broadcasting = true);
    try {
      final res = await ref
          .read(breakoutRoomsProvider.notifier)
          .broadcastMessage(msg: msg, roomId: roomId);
      if (!mounted) return;
      setState(() => _broadcasting = false);
      if (res.status) {
        _broadcastCtrl.clear();
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(res.status ? 'Đã gửi thông báo' : (res.msg.isNotEmpty ? res.msg : 'Gửi thất bại')),
          backgroundColor:
              res.status ? null : Theme.of(context).colorScheme.error,
        ),
      );
    } catch (e) {
      if (!mounted) return;
      setState(() => _broadcasting = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Lỗi: $e'),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final participants = ref.watch(participantProvider).allParticipants;
    final currentUserId =
        ref.watch(sessionProvider.select((s) => s.currentUser?.userId));
    final breakoutRoomIsActive = ref.watch(
      sessionProvider.select(
        (s) => s.currentRoom.metadata?.roomFeatures?.breakoutRoomFeatures?.isActive ?? false,
      ),
    );
    final listState = ref.watch(breakoutRoomsProvider);

    final showManage = breakoutRoomIsActive && listState.activeRooms.isNotEmpty;

    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        children: [
          const SizedBox(height: 8),
          Container(
            width: 36,
            height: 4,
            decoration: BoxDecoration(
              color: theme.dividerColor.withValues(alpha: 0.35),
              borderRadius: BorderRadius.circular(999),
            ),
          ),
          _Header(
            title: showManage
                ? 'Quản lý phòng nhóm (${listState.activeRooms.length})'
                : 'Tạo phòng nhóm',
            onClose: () => Navigator.pop(context),
          ),
          if (showManage)
            Expanded(child: _buildManageActive(theme, listState))
          else
            Expanded(
              child: _buildCreate(
                theme: theme,
                participants: participants,
                currentUserId: currentUserId,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildCreate({
    required ThemeData theme,
    required List<dynamic> participants,
    required String? currentUserId,
  }) {
    final allowedRooms = ref.watch(
      sessionProvider.select(
        (s) =>
            s.currentRoom.metadata?.roomFeatures?.breakoutRoomFeatures
                ?.allowedNumberRooms ??
            0,
      ),
    );
    final maxRooms = allowedRooms > 0 ? allowedRooms : 99;
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (_errorMessage != null)
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: theme.colorScheme.error.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                _errorMessage!,
                style: TextStyle(color: theme.colorScheme.error),
              ),
            ),
          Text('Số phòng', style: theme.textTheme.titleSmall),
          const SizedBox(height: 8),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed:
                    _numRooms > 1 ? () => setState(() => _numRooms--) : null,
              ),
              Text('$_numRooms', style: theme.textTheme.titleLarge),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: _numRooms < maxRooms
                    ? () => setState(() => _numRooms++)
                    : null,
              ),
            ],
          ),
          if (allowedRooms > 0)
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Text(
                'Tối đa $allowedRooms phòng (theo cấu hình của phòng).',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          const SizedBox(height: 16),
          Text('Thời lượng (phút)', style: theme.textTheme.titleSmall),
          const SizedBox(height: 8),
          TextFormField(
            initialValue: _durationMinutes.toString(),
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: '15',
            ),
            onChanged: (value) {
              final v = int.tryParse(value.trim());
              if (v != null && v > 0) {
                setState(() => _durationMinutes = v);
              }
            },
          ),
          const SizedBox(height: 16),
          Text('Tin nhắn chào mừng', style: theme.textTheme.titleSmall),
          const SizedBox(height: 8),
          TextField(
            maxLines: 3,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Chào mừng đến phòng nhóm...',
            ),
            onChanged: (value) => setState(() => _welcomeMsg = value),
          ),
          const SizedBox(height: 16),
          OutlinedButton.icon(
            onPressed: _randomAssign,
            icon: const Icon(Icons.shuffle),
            label: const Text('Phân ngẫu nhiên'),
          ),
          const SizedBox(height: 16),
          Text('Phân người dùng', style: theme.textTheme.titleSmall),
          const SizedBox(height: 8),
          ...participants.map((p) {
            // Participant model in app is not exported here; use dynamic fields.
            final userId = (p as dynamic).userId?.toString() ?? '';
            final name = (p as dynamic).name?.toString() ?? '';
            if (userId.isEmpty || userId == currentUserId) {
              return const SizedBox.shrink();
            }
            final assignedRoom = _userRoomAssignments[userId] ?? 0;
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  Expanded(child: Text(name)),
                  DropdownButton<int>(
                    value: assignedRoom,
                    items: [
                      const DropdownMenuItem(
                        value: 0,
                        child: Text('Phòng chính'),
                      ),
                      ...List.generate(_numRooms, (i) => i + 1).map(
                        (roomNum) => DropdownMenuItem(
                          value: roomNum,
                          child: Text('Phòng $roomNum'),
                        ),
                      ),
                    ],
                    onChanged: (value) {
                      if (value == null) return;
                      setState(() {
                        if (value == 0) {
                          _userRoomAssignments.remove(userId);
                        } else {
                          _userRoomAssignments[userId] = value;
                        }
                      });
                    },
                  ),
                ],
              ),
            );
          }).toList(),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: _creating ? null : _createBreakoutRooms,
              icon: _creating
                  ? SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: theme.colorScheme.onPrimary,
                      ),
                    )
                  : const Icon(Icons.add),
              label: Text(_creating ? 'Đang tạo...' : 'Tạo phòng nhóm'),
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.colorScheme.primary,
                foregroundColor: theme.colorScheme.onPrimary,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Lưu ý: trạng thái “Chưa bắt đầu”/timer phụ thuộc server webhook `room_started` (không tự suy đoán ở client).',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildManageActive(ThemeData theme, BreakoutRoomsState listState) {
    final roomId = ref.read(sessionProvider).currentRoom.roomId;

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
      children: [
        Text('Gửi thông báo', style: theme.textTheme.titleSmall),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _broadcastCtrl,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Nhập nội dung...',
                ),
                minLines: 1,
                maxLines: 3,
              ),
            ),
            const SizedBox(width: 10),
            SizedBox(
              height: 48,
              child: ElevatedButton(
                onPressed: _broadcasting ? null : _broadcastMessage,
                child: _broadcasting
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Gửi'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: _endAllRooms,
            icon: const Icon(Icons.stop_circle_outlined),
            label: const Text('Kết thúc tất cả'),
            style: OutlinedButton.styleFrom(
              foregroundColor: theme.colorScheme.error,
            ),
          ),
        ),
        const SizedBox(height: 12),
        if (listState.isLoading)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              children: const [
                SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
                SizedBox(width: 8),
                Text('Đang cập nhật...'),
              ],
            ),
          ),
        if (listState.error != null && listState.error!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              listState.error!,
              style: TextStyle(color: theme.colorScheme.error),
            ),
          ),
        ...listState.activeRooms.map(
          (r) => _RoomTile(
            room: r,
            parentRoomId: roomId,
            onJoin: () => _joinBreakoutAsAdmin(r.id),
            onEnd: () => _endSingle(r.id),
            onExtend: () => _extend(r.id),
          ),
        ),
      ],
    );
  }

  Future<void> _endSingle(String breakoutRoomId) async {
    final roomId = ref.read(sessionProvider).currentRoom.roomId;
    if (roomId.isEmpty) return;

    final ok = await showDialog<bool>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Kết thúc phòng?'),
            content: const Text('Phòng nhóm sẽ bị kết thúc ngay.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx, false),
                child: const Text('Hủy'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(ctx, true),
                child: Text(
                  'Kết thúc',
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
              ),
            ],
          ),
        ) ??
        false;
    if (!ok) return;

    try {
      final res = await ref
          .read(breakoutRoomsProvider.notifier)
          .endSingleRoom(breakoutRoomId: breakoutRoomId, roomId: roomId);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(res.status ? 'Đã kết thúc phòng' : (res.msg.isNotEmpty ? res.msg : 'Không kết thúc được')),
          backgroundColor:
              res.status ? null : Theme.of(context).colorScheme.error,
        ),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Lỗi: $e'),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    }
  }

  Future<void> _extend(String breakoutRoomId) async {
    final ctrl = TextEditingController(text: '5');
    final minutes = await showModalBottomSheet<int>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
          bottom: MediaQuery.of(ctx).viewInsets.bottom + 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Gia hạn thời gian (phút)',
              style: Theme.of(ctx).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: ctrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: '5',
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                final v = int.tryParse(ctrl.text.trim());
                Navigator.pop(ctx, v);
              },
              child: const Text('Gia hạn'),
            ),
          ],
        ),
      ),
    );
    if (minutes == null || minutes <= 0) return;

    final roomId = ref.read(sessionProvider).currentRoom.roomId;
    if (roomId.isEmpty) return;

    try {
      final res = await ref.read(breakoutRoomsProvider.notifier).extendDuration(
            breakoutRoomId: breakoutRoomId,
            minutes: minutes,
            roomId: roomId,
          );
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(res.status ? 'Đã gia hạn thời gian' : (res.msg.isNotEmpty ? res.msg : 'Gia hạn thất bại')),
          backgroundColor:
              res.status ? null : Theme.of(context).colorScheme.error,
        ),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Lỗi: $e'),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    }
  }

  Future<void> _joinBreakoutAsAdmin(String breakoutRoomId) async {
    Navigator.pop(context);
    await joinAndSwitchToBreakoutRoom(
      context: context,
      ref: ref,
      breakoutRoomId: breakoutRoomId,
      isAdmin: true,
    );
  }
}

class _Header extends StatelessWidget {
  final String title;
  final VoidCallback onClose;

  const _Header({required this.title, required this.onClose});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: theme.dividerColor.withValues(alpha: 0.1),
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withOpacity(0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.grid_view,
              size: 18,
              color: theme.colorScheme.primary,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: onClose,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            splashRadius: 20,
          ),
        ],
      ),
    );
  }
}

class _RoomTile extends StatelessWidget {
  final breakout_room.BreakoutRoom room;
  final String parentRoomId;
  final VoidCallback onJoin;
  final VoidCallback onEnd;
  final VoidCallback onExtend;

  const _RoomTile({
    required this.room,
    required this.parentRoomId,
    required this.onJoin,
    required this.onEnd,
    required this.onExtend,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ExpansionTile(
        title: Text(room.title, style: const TextStyle(fontWeight: FontWeight.w700)),
        subtitle: Text('${room.users.length} người'),
        trailing: room.started
            ? _CountdownChip(createdSec: room.created, durationMin: room.duration)
            : Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.06),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Chưa bắt đầu',
                  style: TextStyle(color: theme.colorScheme.onSurfaceVariant, fontWeight: FontWeight.w700),
                ),
              ),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  alignment: WrapAlignment.end,
                  children: [
                    OutlinedButton.icon(
                      onPressed: onExtend,
                      icon: const Icon(Icons.timer_outlined, size: 18),
                      label: const Text('Gia hạn'),
                    ),
                    ElevatedButton.icon(
                      onPressed: onJoin,
                      icon: const Icon(Icons.login, size: 18),
                      label: const Text('Tham gia'),
                    ),
                    OutlinedButton.icon(
                      onPressed: onEnd,
                      icon: Icon(Icons.stop, size: 18, color: theme.colorScheme.error),
                      label: Text('Kết thúc', style: TextStyle(color: theme.colorScheme.error)),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: theme.colorScheme.error,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                ...room.users.map(
                  (u) => ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(
                      u.joined ? Icons.check_circle : Icons.circle_outlined,
                      size: 18,
                      color: u.joined ? Colors.green : theme.colorScheme.onSurfaceVariant,
                    ),
                    title: Text(u.name.isNotEmpty ? u.name : u.id),
                    subtitle: u.id.isNotEmpty ? Text(u.id, style: const TextStyle(fontSize: 11)) : null,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CountdownChip extends StatefulWidget {
  final Int64 createdSec;
  final Int64 durationMin;

  const _CountdownChip({required this.createdSec, required this.durationMin});

  @override
  State<_CountdownChip> createState() => _CountdownChipState();
}

class _CountdownChipState extends State<_CountdownChip> {
  Timer? _t;
  String _text = '';

  @override
  void initState() {
    super.initState();
    _tick();
    _t = Timer.periodic(const Duration(seconds: 1), (_) => _tick());
  }

  @override
  void dispose() {
    _t?.cancel();
    super.dispose();
  }

  void _tick() {
    final startMs = widget.createdSec.toInt() * 1000;
    final endMs = startMs + widget.durationMin.toInt() * 60 * 1000;
    final now = DateTime.now().millisecondsSinceEpoch;
    final remaining = Duration(milliseconds: (endMs - now).clamp(0, 1 << 31));
    final mm = remaining.inMinutes;
    final ss = remaining.inSeconds % 60;
    final txt = '${mm.toString().padLeft(2, '0')}:${ss.toString().padLeft(2, '0')}';
    if (mounted && txt != _text) {
      setState(() => _text = txt);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: theme.colorScheme.onSurface.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: theme.dividerColor.withValues(alpha: 0.2)),
      ),
      child: Text(
        _text,
        style: const TextStyle(fontWeight: FontWeight.w800),
      ),
    );
  }
}
