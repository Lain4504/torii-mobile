import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/polls_provider.dart';
import '../../../data/datasources/meet_api_service.dart';
import '../../../providers/polls_provider.dart' as polls_provider;
import '../../../data/models/poll.dart';
import 'poll_create.dart';
import 'poll_item.dart';

/// Polls Bottom Sheet
/// Displays active polls and create poll option
/// 1:1 clone of apps/meet/src/components/polls/index.tsx
class PollsBottomSheet extends ConsumerStatefulWidget {
  const PollsBottomSheet({super.key});

  @override
  ConsumerState<PollsBottomSheet> createState() => _PollsBottomSheetState();
}

class _PollsBottomSheetState extends ConsumerState<PollsBottomSheet> {
  bool _isCreating = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    // Load polls when bottom sheet opens
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadPolls();
    });
  }

  Future<void> _loadPolls({bool force = false}) async {
    if (_isLoading && !force) return;
    setState(() => _isLoading = true);
    try {
      final api = ref.read(meetApiServiceProvider);
      final response = await api.listPolls();
      final polls = polls_provider.pollsFromPollResponse(response);
      ref.read(pollsProvider.notifier).setPollsFromApi(polls);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to load polls: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
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
                const Icon(Icons.poll, size: 20),
                const SizedBox(width: 8),
                Text(
                  _isCreating ? 'Create a poll' : 'Polls',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                if (_isCreating) ...[
                  TextButton(
                    onPressed: () => setState(() => _isCreating = false),
                    child: const Text('Cancel'),
                  ),
                ] else ...[
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    splashRadius: 20,
                  ),
                ],
              ],
            ),
          ),

          // Content
          Expanded(
            child: _isCreating 
              ? PollCreate(
                  onPollCreated: () {
                    setState(() => _isCreating = false);
                    _loadPolls(force: true); // Reload polls after creation
                  },
                )
              : _buildPollList(context, ref),
          ),
        ],
      ),
    );
  }

  Widget _buildPollList(BuildContext context, WidgetRef ref) {
    final pollsState = ref.watch(pollsProvider);
    final polls = pollsState.polls;

    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (polls.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.poll_outlined,
              size: 48,
              color: Theme.of(context).disabledColor.withOpacity(0.2),
            ),
            const SizedBox(height: 16),
            Text(
              'No polls yet',
              style: TextStyle(
                color: Theme.of(context).disabledColor,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Create a poll to start asking questions',
              style: TextStyle(
                fontSize: 12,
                color: Theme.of(context).disabledColor.withOpacity(0.7),
              ),
            ),
          ],
        ),
      );
    }

    // Sort by created date (newest first)
    final sortedPolls = List<Poll>.from(polls)
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));

    return RefreshIndicator(
      onRefresh: () => _loadPolls(force: true),
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: sortedPolls.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: PollItem(
              poll: sortedPolls[index],
              serialNum: sortedPolls.length - index,
              onPollUpdated: _loadPolls,
            ),
          );
        },
      ),
    );
  }
}
