import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fixnum/fixnum.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/features/meet/data/models/poll.dart';
import 'package:torii_app/features/meet/data/models/proto/wajlc_polls.pb.dart' as polls_pb;
import '../../../providers/session_provider.dart';
import '../../../providers/participant_provider.dart';
import '../../../providers/room_settings_provider.dart';
import '../../../data/datasources/meet_api_service.dart';
import 'poll_details_modal.dart';

/// Poll Item Widget
/// Display a single poll to vote (1:1 with web PollItem)
class PollItem extends ConsumerStatefulWidget {
  final Poll poll;
  final int serialNum;
  final VoidCallback? onPollUpdated;
  
  const PollItem({
    super.key,
    required this.poll,
    required this.serialNum,
    this.onPollUpdated,
  });

  @override
  ConsumerState<PollItem> createState() => _PollItemState();
}

class _PollItemState extends ConsumerState<PollItem> {
  bool _isExpanded = true;
  bool _isVoting = false;
  bool _isLoadingDetails = false;
  int? _selectedOptionId;
  bool _hasVoted = false;
  Map<int, int> _optionVoteCounts = {}; // optionId -> voteCount
  int _totalResponses = 0;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.poll.isActive;
    _loadUserVote();
    if (!widget.poll.isActive) {
      _loadPollResults();
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        final isAdmin = ref.read(sessionProvider).currentUser?.metadata?.isAdmin ?? false;
        if (isAdmin) _loadPollResults();
      });
    }
  }

  /// Load user's selected option (matches web useGetUserSelectedOptionQuery)
  Future<void> _loadUserVote() async {
    final session = ref.read(sessionProvider);
    final userId = session.currentUser?.userId;
    if (userId == null) return;

    try {
      final api = ref.read(meetApiServiceProvider);
      final response = await api.getUserSelectedOption(
        pollId: widget.poll.id,
        userId: userId,
      );
      if (response.status && response.hasVoted() && response.voted.toInt() > 0) {
        setState(() {
          _hasVoted = true;
          _selectedOptionId = response.voted.toInt();
        });
      }
    } catch (e) {
      // User hasn't voted yet or error - ignore
    }
  }

  /// Load poll results (for closed polls or admin view)
  Future<void> _loadPollResults() async {
    if (_isLoadingDetails) return;
    setState(() => _isLoadingDetails = true);

    try {
      final session = ref.read(sessionProvider);
      final isAdmin = session.currentUser?.metadata?.isAdmin ?? false;
      final api = ref.read(meetApiServiceProvider);

      polls_pb.PollResponse response;
      if (isAdmin) {
        // Admin gets detailed responses
        response = await api.getPollResponsesDetails(widget.poll.id);
        if (response.status) {
          if (response.hasPollResponsesResult()) {
            _parsePollResults(response);
          } else if (response.responses.isNotEmpty) {
            _parsePollResultsFromResponsesMap(response);
          }
        }
      } else {
        // Non-admin gets public results (only if poll closed)
        if (!widget.poll.isActive) {
          response = await api.getPollResponsesResult(widget.poll.id);
          if (response.status) {
            _parsePollResults(response);
          }
        }
      }
    } catch (e) {
      // Error loading results - use local votes if available
    } finally {
      if (mounted) {
        setState(() => _isLoadingDetails = false);
      }
    }
  }

  void _parsePollResults(polls_pb.PollResponse response) {
    if (!response.hasPollResponsesResult()) return;
    
    final result = response.pollResponsesResult;
    final total = result.totalResponses.toInt();
    setState(() {
      _totalResponses = total;
      _optionVoteCounts = {};
      for (final option in result.options) {
        _optionVoteCounts[option.id.toInt()] = option.voteCount.toInt();
      }
    });
  }

  void _parsePollResultsFromResponsesMap(polls_pb.PollResponse response) {
    final details = response.responses;
    if (details.isEmpty) return;

    final total = int.tryParse(details['total_resp'] ?? '') ?? 0;
    final counts = <int, int>{};
    for (var i = 0; i < widget.poll.options.length; i++) {
      final option = widget.poll.options[i];
      final oid = int.tryParse(option.id) ?? (i + 1);
      final key = '${oid}_count';
      counts[oid] = int.tryParse(details[key] ?? '0') ?? 0;
    }

    setState(() {
      _totalResponses = total;
      _optionVoteCounts = counts;
    });
  }

  /// Handle vote submission (matches web useAddResponseMutation)
  Future<void> _handleVote(int optionId) async {
    if (_isVoting || _hasVoted || !widget.poll.isActive) return;

    setState(() {
      _isVoting = true;
      _selectedOptionId = optionId;
    });

    try {
      final session = ref.read(sessionProvider);
      final userId = session.currentUser?.userId ?? '';
      final userName = session.currentUser?.name ?? '';
      final roomId = session.currentRoom.roomId;

      if (userId.isEmpty || roomId.isEmpty) {
        throw Exception('User or room not found');
      }

      // Find option index (optionId is 1-based in protobuf)
      final optionIndex = widget.poll.options.indexWhere((o) => o.id == optionId.toString());
      if (optionIndex == -1) {
        throw Exception('Invalid option');
      }

      final req = polls_pb.SubmitPollResponseReq(
        roomId: roomId,
        userId: userId,
        name: userName,
        pollId: widget.poll.id,
        selectedOption: Int64(optionId),
      );

      final api = ref.read(meetApiServiceProvider);
      final response = await api.submitPollResponse(req);

      if (mounted) {
        if (response.status) {
          setState(() {
            _hasVoted = true;
            _isVoting = false;
          });

          // Notify via NATS (matches web)
          final natsConn = ref.read(sessionProvider.notifier).natsConn;
          if (natsConn != null) {
            await natsConn.sendDataMessage(
              type: 'NEW_POLL_RESPONSE',
              msg: widget.poll.id,
            );
          }

          ref.read(roomSettingsProvider.notifier).addUserNotification(
            const UserNotification(
              message: 'Your vote has been recorded',
              typeOption: 'info',
            ),
          );

          // Reload poll to get updated counts (for admin) or results (if closed)
          if (!widget.poll.isActive) {
            await _loadPollResults();
          } else {
            // For active polls, admin can see updated counts
            final session = ref.read(sessionProvider);
            if (session.currentUser?.metadata?.isAdmin ?? false) {
              await _loadPollResults();
            }
          }
          widget.onPollUpdated?.call();
        } else {
          setState(() {
            _isVoting = false;
            _selectedOptionId = null;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(response.msg.isNotEmpty ? response.msg : 'Failed to submit vote'),
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isVoting = false;
          _selectedOptionId = null;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to vote: $e')),
        );
      }
    }
  }

  /// Close poll (admin only)
  Future<void> _closePoll() async {
    try {
      final session = ref.read(sessionProvider);
      final roomId = session.currentRoom.roomId;
      final userId = session.currentUser?.userId ?? '';

      final api = ref.read(meetApiServiceProvider);
      final response = await api.closePoll(
        pollId: widget.poll.id,
        roomId: roomId,
        userId: userId,
      );

      if (mounted) {
        if (response.status) {
          ref.read(roomSettingsProvider.notifier).addUserNotification(
            const UserNotification(
              message: 'Poll closed successfully',
              typeOption: 'info',
            ),
          );
          // Reload poll results after closing
          await _loadPollResults();
          widget.onPollUpdated?.call();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(response.msg.isNotEmpty ? response.msg : 'Failed to close poll'),
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to close poll: $e')),
        );
      }
    }
  }

  void _showDetailsModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => PollDetailsModal(
        poll: widget.poll,
        onClose: () => Navigator.of(dialogContext).pop(),
        onPollUpdated: widget.onPollUpdated,
      ),
    );
  }

  bool _canViewPercentage() {
    if (!widget.poll.isActive) return true;
    final session = ref.read(sessionProvider);
    return session.currentUser?.metadata?.isAdmin ?? false;
  }

  int _getTotalVotes() {
    if (_totalResponses > 0) return _totalResponses;
    return widget.poll.options.fold(0, (sum, opt) => sum + opt.votes.length);
  }

  double _getOptionPercentage(int optionIndex) {
    final total = _getTotalVotes();
    if (total == 0) return 0.0;

    if (_optionVoteCounts.isNotEmpty) {
      // Use API results
      final optionId = int.tryParse(widget.poll.options[optionIndex].id) ?? (optionIndex + 1);
      final count = _optionVoteCounts[optionId] ?? 0;
      return (count / total * 100);
    } else {
      // Use local votes
      final option = widget.poll.options[optionIndex];
      return (option.votes.length / total * 100);
    }
  }

  @override
  Widget build(BuildContext context) {
    final session = ref.watch(sessionProvider);
    final isAdmin = session.currentUser?.metadata?.isAdmin ?? false;
    final creatorFromRoom =
        ref.watch(participantProvider).participants[widget.poll.createdBy]?.name;
    final creatorLabel = (creatorFromRoom != null && creatorFromRoom.trim().isNotEmpty)
        ? creatorFromRoom.trim()
        : widget.poll.createdByName;
    final totalVotes = _getTotalVotes();
    final canViewPercentage = _canViewPercentage();
    final isClosed = !widget.poll.isActive;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.lg),
        side: BorderSide(
          color: Theme.of(context).dividerColor.withValues(alpha: 0.18),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          InkWell(
            onTap: () => setState(() => _isExpanded = !_isExpanded),
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(context).dividerColor.withValues(alpha: 0.12),
                  ),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Poll #${widget.serialNum}',
                              style: TextStyle(
                                fontSize: AppTypography.fontSizeXs,
                                fontWeight: AppTypography.semiBold,
                                color: Theme.of(context).colorScheme.onSurfaceVariant,
                              ),
                            ),
                            if (isClosed) ...[
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.error.withValues(alpha: 0.12),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Theme.of(context).colorScheme.error.withValues(alpha: 0.35)),
                                ),
                                child: Text(
                                  'CLOSED',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).colorScheme.error,
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.poll.question,
                          style: const TextStyle(
                            fontSize: AppTypography.fontSizeMd,
                            fontWeight: AppTypography.semiBold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (isAdmin)
                    PopupMenuButton<String>(
                      onSelected: (value) {
                        if (value == 'view-details') {
                          _showDetailsModal(context);
                        } else if (value == 'close-poll' && widget.poll.isActive) {
                          _closePoll();
                        }
                      },
                      itemBuilder: (context) => [
                        const PopupMenuItem(
                          value: 'view-details',
                          child: Row(
                            children: [
                              Icon(Icons.info_outline, size: 18),
                              SizedBox(width: 8),
                              Text('View Details'),
                            ],
                          ),
                        ),
                        if (widget.poll.isActive)
                          const PopupMenuItem(
                            value: 'close-poll',
                            child: Row(
                              children: [
                                Icon(Icons.close, size: 18, color: Colors.red),
                                SizedBox(width: 8),
                                Text('End Poll', style: TextStyle(color: Colors.red)),
                              ],
                            ),
                          ),
                      ],
                    ),
                  Icon(
                    _isExpanded ? Icons.expand_less : Icons.expand_more,
                    color: Theme.of(context).disabledColor,
                  ),
                ],
              ),
            ),
          ),

          // Poll options (expandable)
          if (_isExpanded)
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 12, 14, 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...widget.poll.options.asMap().entries.map((entry) {
                    final index = entry.key;
                    final option = entry.value;
                    final optionId = int.tryParse(option.id) ?? (index + 1);
                    final percentage = _getOptionPercentage(index);
                    final isSelected = _selectedOptionId == optionId;
                    final canVote = !_hasVoted && widget.poll.isActive && !_isVoting;

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: InkWell(
                        onTap: canVote ? () => _handleVote(optionId) : null,
                        borderRadius: BorderRadius.circular(AppRadius.md),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.12)
                                : Theme.of(context).colorScheme.surface,
                            border: Border.all(
                              color: isSelected
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context).dividerColor.withValues(alpha: 0.2),
                            ),
                            borderRadius: BorderRadius.circular(AppRadius.md),
                          ),
                          child: Row(
                            children: [
                              Radio<int>(
                                value: optionId,
                                groupValue: _selectedOptionId,
                                onChanged: canVote ? (val) => _handleVote(optionId) : null,
                              ),
                              Expanded(
                                child: Text(
                                  option.text,
                                  style: TextStyle(
                                    fontWeight: isSelected ? AppTypography.semiBold : AppTypography.medium,
                                  ),
                                ),
                              ),
                              if (canViewPercentage)
                                Text(
                                  '${percentage.toStringAsFixed(0)}%',
                                  style: TextStyle(
                                    fontSize: AppTypography.fontSizeSm,
                                    fontWeight: AppTypography.semiBold,
                                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                  if (canViewPercentage && totalVotes > 0)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: LinearProgressIndicator(
                        value: (_selectedOptionId != null && _optionVoteCounts.containsKey(_selectedOptionId))
                            ? (_optionVoteCounts[_selectedOptionId] ?? 0) / totalVotes
                            : null,
                        minHeight: 6,
                        borderRadius: BorderRadius.circular(AppRadius.full),
                        backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
                      ),
                    ),

                  if (_isVoting)
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(child: CircularProgressIndicator()),
                    ),

                  if (widget.poll.isActive && _selectedOptionId != null && !_hasVoted && !_isVoting)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => _handleVote(_selectedOptionId!),
                          child: const Text('Submit Vote'),
                        ),
                      ),
                    ),

                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (canViewPercentage)
                        Text(
                          'Total responses: $totalVotes',
                          style: TextStyle(
                            fontSize: AppTypography.fontSizeXs,
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ),
                      Text(
                        'By: $creatorLabel',
                        style: TextStyle(
                          fontSize: AppTypography.fontSizeXs,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

        ],
      ),
    );
  }
}
