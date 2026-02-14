import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fixnum/fixnum.dart';
import '../../../providers/session_provider.dart';
import '../../../providers/participant_provider.dart';
import '../../../data/datasources/meet_api_service.dart';
import 'package:torii_app/features/meet/data/models/proto/wajlc_breakout_room.pb.dart' as breakout_room;

/// Breakout Rooms Bottom Sheet
/// Manage breakout rooms
/// 1:1 clone of apps/meet/src/components/breakout-room/index.tsx
class BreakoutRoomsBottomSheet extends ConsumerStatefulWidget {
  const BreakoutRoomsBottomSheet({super.key});

  @override
  ConsumerState<BreakoutRoomsBottomSheet> createState() => _BreakoutRoomsBottomSheetState();
}

class _BreakoutRoomsBottomSheetState extends ConsumerState<BreakoutRoomsBottomSheet> {
  int _numRooms = 2;
  int _durationMinutes = 15;
  String _welcomeMsg = '';
  final Map<String, int> _userRoomAssignments = {}; // userId -> roomId (0 = main, 1..N = breakout)
  bool _isLoading = false;
  String? _errorMessage;
  String? _successMessage;
  List<breakout_room.BreakoutRoom>? _activeRooms;

  @override
  void initState() {
    super.initState();
    _loadActiveRooms();
  }

  Future<void> _loadActiveRooms() async {
    try {
      final api = ref.read(meetApiServiceProvider);
      final res = await api.getBreakoutRooms();
      if (res.status && res.rooms.isNotEmpty) {
        setState(() {
          _activeRooms = res.rooms;
        });
      }
    } catch (e) {
      // Ignore errors - rooms may not exist yet
    }
  }

  void _randomAssign() {
    final participants = ref.read(participantProvider).allParticipants;
    final currentUserId = ref.read(sessionProvider.select((s) => s.currentUser?.userId));
    
    final availableRooms = List.generate(_numRooms, (i) => i + 1);
    final assignments = <String, int>{};
    
    for (final participant in participants) {
      if (participant.userId == currentUserId) continue; // Skip self
      final randomRoom = availableRooms[DateTime.now().millisecondsSinceEpoch % availableRooms.length];
      assignments[participant.userId] = randomRoom;
    }
    
    setState(() {
      _userRoomAssignments.clear();
      _userRoomAssignments.addAll(assignments);
    });
  }

  Future<void> _createBreakoutRooms() async {
    final session = ref.read(sessionProvider);
    final api = ref.read(meetApiServiceProvider);
    final participants = ref.read(participantProvider).allParticipants;
    final currentUserId = session.currentUser?.userId;
    final roomId = session.currentRoom.roomId;

    if (currentUserId == null || roomId.isEmpty) {
      setState(() {
        _errorMessage = 'Session not available';
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _successMessage = null;
    });

    try {
      // Build rooms list (exclude main room, only breakout rooms)
      final rooms = <breakout_room.BreakoutRoom>[];
      for (int roomNum = 1; roomNum <= _numRooms; roomNum++) {
        final usersInRoom = participants
            .where((p) => _userRoomAssignments[p.userId] == roomNum)
            .map((p) => breakout_room.BreakoutRoomUser(
                  id: p.userId,
                  name: p.name,
                  joined: false,
                ))
            .toList();

        if (usersInRoom.isNotEmpty) {
          rooms.add(breakout_room.BreakoutRoom(
            id: roomNum.toString(),
            title: 'Room $roomNum',
            duration: Int64(_durationMinutes),
            started: false,
            created: Int64(DateTime.now().millisecondsSinceEpoch),
            users: usersInRoom,
          ));
        }
      }

      if (rooms.isEmpty) {
        setState(() {
          _errorMessage = 'At least one user must be assigned to a breakout room';
          _isLoading = false;
        });
        return;
      }

      final req = breakout_room.CreateBreakoutRoomsReq(
        roomId: roomId,
        requestedUserId: currentUserId,
        duration: Int64(_durationMinutes),
        welcomeMsg: _welcomeMsg,
        rooms: rooms,
      );

      final res = await api.createBreakoutRooms(req);

      if (res.status) {
        setState(() {
          _successMessage = 'Breakout rooms created successfully';
          _isLoading = false;
        });
        await _loadActiveRooms();
        Future.delayed(const Duration(seconds: 2), () {
          if (mounted) Navigator.pop(context);
        });
      } else {
        setState(() {
          _errorMessage = res.msg.isNotEmpty ? res.msg : 'Failed to create breakout rooms';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Error: ${e.toString()}';
        _isLoading = false;
      });
    }
  }

  Future<void> _endAllRooms() async {
    final api = ref.read(meetApiServiceProvider);
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final res = await api.endAllBreakoutRooms();
      if (res.status) {
        setState(() {
          _successMessage = 'All breakout rooms ended';
          _activeRooms = null;
          _isLoading = false;
        });
        await _loadActiveRooms();
      } else {
        setState(() {
          _errorMessage = res.msg.isNotEmpty ? res.msg : 'Failed to end rooms';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Error: ${e.toString()}';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final participants = ref.watch(participantProvider).allParticipants;
    final currentUserId = ref.watch(sessionProvider.select((s) => s.currentUser?.userId));
    final isAdmin = ref.watch(
      sessionProvider.select((s) => s.currentUser?.metadata?.isAdmin ?? false),
    );
    final breakoutRoomIsActive = ref.watch(
      sessionProvider.select(
        (s) => s.currentRoom.metadata?.roomFeatures?.breakoutRoomFeatures?.isActive ?? false,
      ),
    );

    // Show active rooms management if breakout rooms are active
    if (breakoutRoomIsActive && _activeRooms != null && _activeRooms!.isNotEmpty) {
      return _buildActiveRoomsView();
    }

    // Show create form
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Theme.of(context).dividerColor.withOpacity(0.1),
                ),
              ),
            ),
            child: Row(
              children: [
                const Icon(Icons.grid_view, size: 20),
                const SizedBox(width: 8),
                const Text(
                  'Breakout Rooms',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  splashRadius: 20,
                ),
              ],
            ),
          ),

          // Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (_errorMessage != null)
                    Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        _errorMessage!,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                  if (_successMessage != null)
                    Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        _successMessage!,
                        style: const TextStyle(color: Colors.green),
                      ),
                    ),

                  // Number of rooms
                  Text(
                    'Number of Rooms',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: _numRooms > 1
                            ? () => setState(() => _numRooms--)
                            : null,
                      ),
                      Text(
                        '$_numRooms',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () => setState(() => _numRooms++),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Duration
                  Text(
                    'Duration (minutes)',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '15',
                    ),
                    onChanged: (value) {
                      final duration = int.tryParse(value);
                      if (duration != null && duration > 0) {
                        setState(() => _durationMinutes = duration);
                      }
                    },
                    controller: TextEditingController(text: _durationMinutes.toString()),
                  ),
                  const SizedBox(height: 24),

                  // Welcome message
                  Text(
                    'Welcome Message',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    maxLines: 3,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Welcome to the breakout room...',
                    ),
                    onChanged: (value) => setState(() => _welcomeMsg = value),
                  ),
                  const SizedBox(height: 24),

                  // Random assign button
                  OutlinedButton.icon(
                    onPressed: _randomAssign,
                    icon: const Icon(Icons.shuffle),
                    label: const Text('Random Assignment'),
                  ),
                  const SizedBox(height: 24),

                  // Participants assignment
                  Text(
                    'Assign Participants',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 8),
                  ...participants.map((participant) {
                    if (participant.userId == currentUserId) return const SizedBox.shrink();
                    final assignedRoom = _userRoomAssignments[participant.userId] ?? 0;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(participant.name),
                          ),
                          DropdownButton<int>(
                            value: assignedRoom,
                            items: [
                              const DropdownMenuItem(value: 0, child: Text('Main Room')),
                              ...List.generate(_numRooms, (i) => i + 1).map(
                                (roomNum) => DropdownMenuItem(
                                  value: roomNum,
                                  child: Text('Room $roomNum'),
                                ),
                              ),
                            ],
                            onChanged: (value) {
                              if (value != null) {
                                setState(() {
                                  if (value == 0) {
                                    _userRoomAssignments.remove(participant.userId);
                                  } else {
                                    _userRoomAssignments[participant.userId] = value;
                                  }
                                });
                              }
                            },
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),

          // Create button
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _isLoading ? null : _createBreakoutRooms,
                icon: _isLoading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.add),
                label: Text(_isLoading ? 'Creating...' : 'Start Breakout Rooms'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActiveRoomsView() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Theme.of(context).dividerColor.withOpacity(0.1),
                ),
              ),
            ),
            child: Row(
              children: [
                const Icon(Icons.grid_view, size: 20),
                const SizedBox(width: 8),
                Text(
                  'Active Breakout Rooms (${_activeRooms?.length ?? 0})',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  splashRadius: 20,
                ),
              ],
            ),
          ),

          // Active rooms list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: (_activeRooms?.length ?? 0) + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  // End all button
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: _isLoading ? null : _endAllRooms,
                        icon: const Icon(Icons.stop),
                        label: const Text('End All Rooms'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.red,
                        ),
                      ),
                    ),
                  );
                }

                final room = _activeRooms![index - 1];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    title: Text(room.title),
                    subtitle: Text('${room.users.length} participants'),
                    trailing: room.started
                        ? const Chip(
                            label: Text('Started'),
                            backgroundColor: Colors.green,
                          )
                        : const Chip(
                            label: Text('Not Started'),
                            backgroundColor: Colors.grey,
                          ),
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
