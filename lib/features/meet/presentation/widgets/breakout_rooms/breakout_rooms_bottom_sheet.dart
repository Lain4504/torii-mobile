import 'dart:math';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/features/meet/data/datasources/meet_api_service.dart';
import 'package:torii_app/features/meet/data/models/proto/wajlc_breakout_room.pb.dart'
    as breakout_room;
import 'package:torii_app/features/meet/providers/participant_provider.dart';
import 'package:torii_app/features/meet/providers/session_provider.dart';
import 'package:torii_app/features/meet/core/breakout/breakout_room_switcher.dart';
import 'package:torii_app/features/meet/providers/breakout_room_provider.dart';

class BreakoutRoomsBottomSheet extends ConsumerStatefulWidget {
  const BreakoutRoomsBottomSheet({super.key});

  @override
  ConsumerState<BreakoutRoomsBottomSheet> createState() =>
      _BreakoutRoomsBottomSheetState();
}

class _BreakoutRoomsBottomSheetState
    extends ConsumerState<BreakoutRoomsBottomSheet> {
  final _welcomeMsgCtrl = TextEditingController();
  final _broadcastMsgCtrl = TextEditingController();

  int _roomCount = 2;
  int _durationMinutes = 15;
  bool _creating = false;
  bool _loadingRooms = false;
  Timer? _pollTimer;

  // roomIndex (1..N) -> list of userIds
  final Map<int, Set<String>> _assignments = {};

  List<breakout_room.BreakoutRoom> _activeRooms = const [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _refreshRooms();
    });
    // Web polls listRooms every 10s while modal is open.
    _pollTimer = Timer.periodic(const Duration(seconds: 10), (_) {
      if (!mounted) return;
      _refreshRooms();
    });
  }

  @override
  void dispose() {
    _pollTimer?.cancel();
    _welcomeMsgCtrl.dispose();
    _broadcastMsgCtrl.dispose();
    super.dispose();
  }

  bool get _isAdmin =>
      ref.read(sessionProvider).currentUser?.metadata?.isAdmin == true;

  int get _allowedNumberRooms {
    final room = ref.read(sessionProvider).currentRoom.metadata;
    return room?.roomFeatures?.breakoutRoomFeatures?.allowedNumberRooms ?? 0;
  }

  bool get _isBreakoutAllowed {
    final room = ref.read(sessionProvider).currentRoom.metadata;
    return room?.roomFeatures?.breakoutRoomFeatures?.isAllow ?? false;
  }

  bool get _breakoutIsActive {
    final room = ref.read(sessionProvider).currentRoom.metadata;
    return room?.roomFeatures?.breakoutRoomFeatures?.isActive ?? false;
  }

  List<ParticipantInfo> get _assignableParticipants {
    final session = ref.read(sessionProvider);
    final currentUserId = session.currentUser?.userId;
    final list = ref.read(participantProvider).allParticipants;
    return list
        .where((p) =>
            p.userId != 'RECORDER_BOT' &&
            p.userId != 'RTMP_BOT' &&
            p.userId != currentUserId)
        .toList()
      ..sort((a, b) => a.name.compareTo(b.name));
  }

  Future<void> _refreshRooms() async {
    if (_loadingRooms) return;
    setState(() => _loadingRooms = true);
    try {
      final api = ref.read(meetApiServiceProvider);
      // Ensure request uses meeting JWT token.
      api.setManualToken(ref.read(sessionProvider).token);
      final res = await api.getBreakoutRooms();
      if (!mounted) return;
      if (res.status) {
        setState(() => _activeRooms = res.rooms);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(res.msg.isNotEmpty ? res.msg : 'Không tải được phòng nhóm'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Lỗi tải phòng nhóm: $e'),
          backgroundColor: AppColors.error,
        ),
      );
    } finally {
      if (mounted) setState(() => _loadingRooms = false);
    }
  }

  void _ensureAssignmentsForCount(int count) {
    for (var i = 1; i <= count; i++) {
      _assignments.putIfAbsent(i, () => <String>{});
    }
    _assignments.removeWhere((key, _) => key > count);
  }

  void _randomAssign() {
    final participants = _assignableParticipants.map((p) => p.userId).toList();
    if (participants.isEmpty) return;

    _ensureAssignmentsForCount(_roomCount);
    for (final e in _assignments.entries) {
      e.value.clear();
    }

    participants.shuffle(Random());
    for (var idx = 0; idx < participants.length; idx++) {
      final roomIndex = (idx % _roomCount) + 1;
      _assignments[roomIndex]!.add(participants[idx]);
    }
    setState(() {});
  }

  Future<void> _createRooms() async {
    if (_creating) return;
    final session = ref.read(sessionProvider);
    final roomId = session.currentRoom.roomId;
    final userId = session.currentUser?.userId ?? '';

    if (!_isAdmin) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Chỉ admin mới tạo được phòng nhóm'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }
    if (roomId.isEmpty || userId.isEmpty) return;

    _ensureAssignmentsForCount(_roomCount);

    final rooms = <breakout_room.BreakoutRoom>[];
    for (var i = 1; i <= _roomCount; i++) {
      final nameById = {for (final p in _assignableParticipants) p.userId: p.name};
      final users = (_assignments[i] ?? <String>{})
          .map((uid) => breakout_room.BreakoutRoomUser(id: uid, name: nameById[uid] ?? ''))
          .toList();
      rooms.add(
        breakout_room.BreakoutRoom(
          id: i.toString(),
          title: 'Room $i',
          users: users,
        ),
      );
    }

    setState(() => _creating = true);
    final api = ref.read(meetApiServiceProvider);
    api.setManualToken(session.token);
    try {
      final res = await api.createBreakoutRooms(
        breakout_room.CreateBreakoutRoomsReq(
          roomId: roomId,
          requestedUserId: userId,
          duration: (_durationMinutes * 60),
          welcomeMsg: _welcomeMsgCtrl.text.trim().isEmpty
              ? null
              : _welcomeMsgCtrl.text.trim(),
          rooms: rooms,
        ),
      );
      if (!mounted) return;
      if (!res.status) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(res.msg.isNotEmpty ? res.msg : 'Không tạo được phòng nhóm'),
            backgroundColor: AppColors.error,
          ),
        );
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Đã tạo breakout rooms')),
      );
      await _refreshRooms();
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Lỗi tạo phòng nhóm: $e'),
          backgroundColor: AppColors.error,
        ),
      );
    } finally {
      if (mounted) setState(() => _creating = false);
    }
  }

  Future<void> _endAllRooms() async {
    final session = ref.read(sessionProvider);
    final api = ref.read(meetApiServiceProvider);
    api.setManualToken(session.token);
    try {
      final res = await api.endAllBreakoutRooms();
      if (!mounted) return;
      if (!res.status) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(res.msg.isNotEmpty ? res.msg : 'Không kết thúc được phòng nhóm'),
            backgroundColor: AppColors.error,
          ),
        );
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Đã kết thúc tất cả breakout rooms')),
      );
      await _refreshRooms();
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Lỗi kết thúc breakout rooms: $e'),
          backgroundColor: AppColors.error,
        ),
      );
    }
  }

  Future<void> _endRoom(String breakoutRoomId) async {
    final session = ref.read(sessionProvider);
    final api = ref.read(meetApiServiceProvider);
    api.setManualToken(session.token);
    try {
      final res = await api.endBreakoutRoom(
        breakout_room.EndBreakoutRoomReq(breakoutRoomId: breakoutRoomId),
      );
      if (!mounted) return;
      if (!res.status) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(res.msg.isNotEmpty ? res.msg : 'Không kết thúc được phòng'),
            backgroundColor: AppColors.error,
          ),
        );
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Đã kết thúc phòng nhóm')),
      );
      await _refreshRooms();
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Lỗi kết thúc phòng: $e'),
          backgroundColor: AppColors.error,
        ),
      );
    }
  }

  Future<void> _increaseDuration(String breakoutRoomId) async {
    final ctrl = TextEditingController(text: '5');
    final add = await showDialog<int>(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        title: const Text('Tăng thời lượng'),
        content: TextField(
          controller: ctrl,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Số phút tăng thêm',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Hủy'),
          ),
          TextButton(
            onPressed: () {
              final v = int.tryParse(ctrl.text.trim());
              Navigator.of(ctx).pop(v);
            },
            child: const Text('Tăng'),
          ),
        ],
      ),
    );
    if (add == null || add <= 0) return;

    final session = ref.read(sessionProvider);
    final api = ref.read(meetApiServiceProvider);
    api.setManualToken(session.token);
    try {
      final res = await api.increaseBreakoutRoomDuration(
        breakout_room.IncreaseBreakoutRoomDurationReq(
          breakoutRoomId: breakoutRoomId,
          duration: (add * 60),
          roomId: session.currentRoom.roomId,
        ),
      );
      if (!mounted) return;
      if (!res.status) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(res.msg.isNotEmpty ? res.msg : 'Không tăng được thời lượng'),
            backgroundColor: AppColors.error,
          ),
        );
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Đã tăng thời lượng phòng nhóm')),
      );
      await _refreshRooms();
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Lỗi tăng thời lượng: $e'),
          backgroundColor: AppColors.error,
        ),
      );
    }
  }

  Future<void> _broadcastMessage() async {
    final msg = _broadcastMsgCtrl.text.trim();
    if (msg.isEmpty) return;
    final session = ref.read(sessionProvider);
    final api = ref.read(meetApiServiceProvider);
    api.setManualToken(session.token);
    try {
      final res = await api.broadcastBreakoutRoomMessage(
        breakout_room.BroadcastBreakoutRoomMsgReq(
          msg: msg,
          roomId: session.currentRoom.roomId,
        ),
      );
      if (!mounted) return;
      if (!res.status) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(res.msg.isNotEmpty ? res.msg : 'Không gửi được tin nhắn'),
            backgroundColor: AppColors.error,
          ),
        );
        return;
      }
      _broadcastMsgCtrl.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Đã broadcast tin nhắn tới breakout rooms')),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Lỗi broadcast: $e'),
          backgroundColor: AppColors.error,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Event-driven refresh (JOIN_BREAKOUT_ROOM / BREAKOUT_ROOM_ENDED).
    ref.listen<int>(
      breakoutRoomProvider.select((s) => s.roomsRefreshSeq),
      (_, __) => _refreshRooms(),
    );

    final mq = MediaQuery.of(context);
    final surface = Theme.of(context).colorScheme.surface;

    final maxRooms = _allowedNumberRooms > 0 ? _allowedNumberRooms : 12;
    final canUse = _isBreakoutAllowed;
    final isActive = _breakoutIsActive;

    if (!canUse) {
      return Container(
        height: (mq.size.height * 0.55).clamp(220.0, mq.size.height),
        decoration: BoxDecoration(
          color: surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _SheetHeader(
              title: 'Breakout Rooms',
              subtitle: 'Tính năng phòng nhóm đang bị tắt trong phòng này.',
              onClose: () => Navigator.pop(context),
            ),
            const SizedBox(height: 12),
            const Spacer(),
            const Icon(Icons.meeting_room_outlined, size: 44),
            const SizedBox(height: 10),
            const Text('Breakout rooms is not enabled.'),
            const Spacer(),
          ],
        ),
      );
    }

    _ensureAssignmentsForCount(_roomCount);

    return Container(
      height: (mq.size.height * 0.80).clamp(320.0, mq.size.height),
      decoration: BoxDecoration(
        color: surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        children: [
          _SheetHeader(
            title: 'Breakout Rooms',
            subtitle: _isAdmin
                ? (isActive ? 'Quản lý phòng nhóm đang hoạt động.' : 'Tạo và quản lý phòng nhóm.')
                : 'Chỉ admin có quyền quản lý phòng nhóm.',
            trailing: IconButton(
              onPressed: _loadingRooms ? null : _refreshRooms,
              icon: const Icon(Icons.refresh),
              splashRadius: 20,
            ),
            onClose: () => Navigator.pop(context),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
              children: [
                if (_isAdmin && !isActive) ...[
                  _SectionCard(
                    title: 'Create',
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: _NumberField(
                                label: 'Rooms',
                                value: _roomCount,
                                min: 1,
                                max: maxRooms,
                                onChanged: (v) => setState(() {
                                  _roomCount = v;
                                  _ensureAssignmentsForCount(_roomCount);
                                }),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: _NumberField(
                                label: 'Duration (min)',
                                value: _durationMinutes,
                                min: 1,
                                max: 240,
                                onChanged: (v) =>
                                    setState(() => _durationMinutes = v),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        TextField(
                          controller: _welcomeMsgCtrl,
                          maxLines: 2,
                          decoration: const InputDecoration(
                            labelText: 'Welcome message (optional)',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: _randomAssign,
                                icon: const Icon(Icons.shuffle),
                                label: const Text('Random assignment'),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: FilledButton.icon(
                                onPressed: _creating ? null : _createRooms,
                                icon: _creating
                                    ? const SizedBox(
                                        width: 16,
                                        height: 16,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                        ),
                                      )
                                    : const Icon(Icons.add),
                                label: const Text('Create'),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        _RoomAssignmentsEditor(
                          roomCount: _roomCount,
                          assignments: _assignments,
                          participants: _assignableParticipants,
                          onEditRoom: (roomIndex) async {
                            final selected = Set<String>.from(_assignments[roomIndex] ?? const <String>{});
                            final updated = await showModalBottomSheet<Set<String>>(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (ctx) {
                                final mq = MediaQuery.of(ctx);
                                return SizedBox(
                                  height: (mq.size.height * 0.80).clamp(320.0, mq.size.height),
                                  child: _ParticipantPickerSheet(
                                    title: 'Assign participants (Room $roomIndex)',
                                    participants: _assignableParticipants,
                                    initialSelected: selected,
                                  ),
                                );
                              },
                            );
                            if (updated == null) return;
                            setState(() {
                              _assignments[roomIndex] = updated;
                              // Ensure a user is assigned to at most one room (prevents inconsistent create req).
                              for (final entry in _assignments.entries) {
                                if (entry.key == roomIndex) continue;
                                entry.value.removeAll(updated);
                              }
                            });
                          },
                        ),
                        const SizedBox(height: 12),
                        _AssignmentsPreview(
                          roomCount: _roomCount,
                          assignments: _assignments,
                          participants: _assignableParticipants,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
                if (_isAdmin) ...[
                  _SectionCard(
                    title: 'Broadcast message',
                    child: Column(
                      children: [
                        TextField(
                          controller: _broadcastMsgCtrl,
                          maxLines: 2,
                          decoration: const InputDecoration(
                            labelText: 'Message',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          child: FilledButton.icon(
                            onPressed: _broadcastMessage,
                            icon: const Icon(Icons.campaign),
                            label: const Text('Broadcast'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
                _SectionCard(
                  title: 'Active rooms',
                  trailing: _isAdmin
                      ? TextButton(
                          onPressed: _activeRooms.isEmpty ? null : _endAllRooms,
                          style: TextButton.styleFrom(
                            foregroundColor:
                                Theme.of(context).colorScheme.error,
                          ),
                          child: const Text('End all'),
                        )
                      : null,
                  child: _loadingRooms
                      ? const Padding(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          child: Center(
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        )
                      : _activeRooms.isEmpty
                          ? const Padding(
                              padding: EdgeInsets.symmetric(vertical: 12),
                              child: Text('Chưa có breakout rooms nào.'),
                            )
                          : Column(
                              children: _activeRooms
                                  .map((r) => _ActiveRoomTile(
                                        room: r,
                                        isAdmin: _isAdmin,
                                        onJoin: () async {
                                          // Admin can also join any breakout room from management list (matches web JoinBtn).
                                          await joinAndSwitchToBreakoutRoom(
                                            context: context,
                                            ref: ref,
                                            breakoutRoomId: r.id,
                                            isAdmin: true,
                                          );
                                        },
                                        onEnd: () => _endRoom(r.id),
                                        onIncrease: () =>
                                            _increaseDuration(r.id),
                                      ))
                                  .toList(),
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

class _SheetHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onClose;
  final Widget? trailing;

  const _SheetHeader({
    required this.title,
    required this.subtitle,
    required this.onClose,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 10, 8, 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).dividerColor.withValues(alpha: 0.10),
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.meeting_room_outlined,
              size: 18,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          if (trailing != null) trailing!,
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: onClose,
            splashRadius: 20,
          ),
        ],
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final String title;
  final Widget child;
  final Widget? trailing;

  const _SectionCard({
    required this.title,
    required this.child,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: 0.25),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
                const Spacer(),
                if (trailing != null) trailing!,
              ],
            ),
            const SizedBox(height: 10),
            child,
          ],
        ),
      ),
    );
  }
}

class _NumberField extends StatelessWidget {
  final String label;
  final int value;
  final int min;
  final int max;
  final ValueChanged<int> onChanged;

  const _NumberField({
    required this.label,
    required this.value,
    required this.min,
    required this.max,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: value <= min ? null : () => onChanged(value - 1),
            icon: const Icon(Icons.remove),
            splashRadius: 18,
          ),
          Expanded(
            child: Text(
              '$value',
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
          IconButton(
            onPressed: value >= max ? null : () => onChanged(value + 1),
            icon: const Icon(Icons.add),
            splashRadius: 18,
          ),
        ],
      ),
    );
  }
}

class _AssignmentsPreview extends StatelessWidget {
  final int roomCount;
  final Map<int, Set<String>> assignments;
  final List<ParticipantInfo> participants;

  const _AssignmentsPreview({
    required this.roomCount,
    required this.assignments,
    required this.participants,
  });

  @override
  Widget build(BuildContext context) {
    if (participants.isEmpty) {
      return Text(
        'Không có người tham gia để phân phòng.',
        style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant),
      );
    }

    final nameById = {for (final p in participants) p.userId: p.name};

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(roomCount, (idx) {
        final i = idx + 1;
        final users = assignments[i] ?? <String>{};
        final names = users.map((u) => nameById[u] ?? u).toList()..sort();
        return Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Text(
            'Room $i: ${names.isEmpty ? '(empty)' : names.join(', ')}',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12.5),
          ),
        );
      }),
    );
  }
}

class _RoomAssignmentsEditor extends StatelessWidget {
  final int roomCount;
  final Map<int, Set<String>> assignments;
  final List<ParticipantInfo> participants;
  final Future<void> Function(int roomIndex) onEditRoom;

  const _RoomAssignmentsEditor({
    required this.roomCount,
    required this.assignments,
    required this.participants,
    required this.onEditRoom,
  });

  @override
  Widget build(BuildContext context) {
    if (participants.isEmpty) {
      return Text(
        'Không có người tham gia để phân phòng.',
        style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant),
      );
    }

    return Column(
      children: List.generate(roomCount, (idx) {
        final i = idx + 1;
        final count = (assignments[i] ?? const <String>{}).length;
        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: Theme.of(context).dividerColor.withValues(alpha: 0.10),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Room $i', style: const TextStyle(fontWeight: FontWeight.w700)),
                    const SizedBox(height: 2),
                    Text(
                      '$count assigned',
                      style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              OutlinedButton(
                onPressed: () => onEditRoom(i),
                child: const Text('Edit'),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class _ParticipantPickerSheet extends StatefulWidget {
  final String title;
  final List<ParticipantInfo> participants;
  final Set<String> initialSelected;

  const _ParticipantPickerSheet({
    required this.title,
    required this.participants,
    required this.initialSelected,
  });

  @override
  State<_ParticipantPickerSheet> createState() => _ParticipantPickerSheetState();
}

class _ParticipantPickerSheetState extends State<_ParticipantPickerSheet> {
  late Set<String> _selected;
  final _searchCtrl = TextEditingController();
  String _q = '';

  @override
  void initState() {
    super.initState();
    _selected = Set<String>.from(widget.initialSelected);
    _searchCtrl.addListener(() {
      setState(() => _q = _searchCtrl.text.trim().toLowerCase());
    });
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final surface = Theme.of(context).colorScheme.surface;
    final filtered = widget.participants.where((p) {
      if (_q.isEmpty) return true;
      return p.name.toLowerCase().contains(_q) || p.userId.toLowerCase().contains(_q);
    }).toList()
      ..sort((a, b) => a.name.compareTo(b.name));

    return Container(
      decoration: BoxDecoration(
        color: surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        children: [
          _SheetHeader(
            title: widget.title,
            subtitle: 'Chọn người tham gia cho phòng này.',
            onClose: () => Navigator.pop(context),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
            child: TextField(
              controller: _searchCtrl,
              decoration: const InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filtered.length,
              itemBuilder: (ctx, idx) {
                final p = filtered[idx];
                final checked = _selected.contains(p.userId);
                return CheckboxListTile(
                  value: checked,
                  onChanged: (v) {
                    setState(() {
                      if (v == true) {
                        _selected.add(p.userId);
                      } else {
                        _selected.remove(p.userId);
                      }
                    });
                  },
                  title: Text(p.name.isNotEmpty ? p.name : p.userId),
                  subtitle: p.name.isNotEmpty ? Text(p.userId) : null,
                  controlAffinity: ListTileControlAffinity.leading,
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Theme.of(context).dividerColor.withValues(alpha: 0.10),
                ),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => setState(() => _selected.clear()),
                    child: const Text('Clear'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: FilledButton(
                    onPressed: () => Navigator.pop(context, _selected),
                    child: Text('Save (${_selected.length})'),
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

class _ActiveRoomTile extends StatelessWidget {
  final breakout_room.BreakoutRoom room;
  final bool isAdmin;
  final VoidCallback onJoin;
  final VoidCallback onEnd;
  final VoidCallback onIncrease;

  const _ActiveRoomTile({
    required this.room,
    required this.isAdmin,
    required this.onJoin,
    required this.onEnd,
    required this.onIncrease,
  });

  @override
  Widget build(BuildContext context) {
    final users = room.users;
    final joinedCount = users.where((u) => u.joined).length;
    final total = users.length;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: Theme.of(context).dividerColor.withValues(alpha: 0.10),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.meeting_room,
              size: 18,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  room.title.isNotEmpty ? room.title : room.id,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 2),
                Text(
                  '$joinedCount/$total joined',
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          if (isAdmin) ...[
            IconButton(
              onPressed: onJoin,
              icon: const Icon(Icons.login),
              splashRadius: 20,
              tooltip: 'Join room',
            ),
            IconButton(
              onPressed: onIncrease,
              icon: const Icon(Icons.timer_outlined),
              splashRadius: 20,
              tooltip: 'Increase duration',
            ),
            IconButton(
              onPressed: onEnd,
              icon: Icon(Icons.stop_circle_outlined,
                  color: Theme.of(context).colorScheme.error),
              splashRadius: 20,
              tooltip: 'End room',
            ),
          ],
        ],
      ),
    );
  }
}

