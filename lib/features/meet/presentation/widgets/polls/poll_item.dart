import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/features/meet/data/models/poll.dart';
import '../../../providers/session_provider.dart';

/// Poll Item Widget
/// Display a single poll to vote
class PollItem extends ConsumerStatefulWidget {
  final Poll poll;
  
  const PollItem({
    super.key,
    required this.poll,
  });

  @override
  ConsumerState<PollItem> createState() => _PollItemState();
}

class _PollItemState extends ConsumerState<PollItem> {
  // TODO: Add local state related to voting if needed (e.g. isVoting loading state)

  int get _totalVotes {
    return widget.poll.options.fold(0, (sum, option) => sum + option.votes.length);
  }
  
  bool _hasVoted(String userId) {
    return widget.poll.options.any((option) => option.votes.contains(userId));
  }
  
  String? _votedOptionId(String userId) {
    for (var option in widget.poll.options) {
      if (option.votes.contains(userId)) {
        return option.id;
      }
    }
    return null;
  }

  void _handleVote(String optionId) {
    final session = ref.read(sessionProvider);
    final userId = session.currentUser?.userId;
    
    if (userId == null) return;
    
    // In a real implementation, we would send a data message to NATS here
    /*
    ref.read(sessionProvider).natsConn?.sendDataMessage(
      type: 'NEW_POLL_RESPONSE', // or custom type
      msg: jsonEncode({
        'pollId': widget.poll.id,
        'optionId': optionId,
        'userId': userId,
      }),
    );
    */
    // For now, let's assuming we just log it or optimistic update 
    // note: the provider logic I added expects 'votes' list in the message 
    // so the server/other clients need to handle aggregation or we do it.
  }

  @override
  Widget build(BuildContext context) {
    final session = ref.watch(sessionProvider);
    final currentUserId = session.currentUser?.userId;
    final totalVotes = _totalVotes;
    final hasVoted = currentUserId != null && _hasVoted(currentUserId);
    final votedOptionId = currentUserId != null ? _votedOptionId(currentUserId) : null;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
              widget.poll.question,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ...widget.poll.options.map((option) {
              final percentage = totalVotes > 0 
                  ? (option.votes.length / totalVotes * 100).toStringAsFixed(0) 
                  : '0';
              final isSelected = option.id == votedOptionId;
              
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: OutlinedButton(
                  onPressed: hasVoted ? null : () => _handleVote(option.id),
                  style: OutlinedButton.styleFrom(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    backgroundColor: isSelected 
                        ? Theme.of(context).colorScheme.primary.withOpacity(0.1) 
                        : null,
                    side: isSelected 
                        ? BorderSide(color: Theme.of(context).colorScheme.primary) 
                        : null,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(option.text),
                      Text('$percentage%'),
                    ],
                  ),
                ),
              );
            }),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Total votes: $totalVotes',
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).disabledColor,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'By: ${widget.poll.createdByName}',
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).disabledColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
