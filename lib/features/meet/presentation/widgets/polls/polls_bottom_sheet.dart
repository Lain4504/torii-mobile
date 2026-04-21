import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import '../../../providers/polls_provider.dart';
import '../../../providers/participant_provider.dart';
import '../../../data/datasources/meet_api_service.dart';
import '../../../providers/polls_provider.dart' as polls_provider;
import '../../../data/models/poll.dart';
import 'poll_create.dart';
import 'poll_item.dart';

/// Polls Bottom Sheet
/// Displays active polls and create poll option
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
      final names = {
        for (final e in ref.read(participantProvider).participants.entries)
          e.key: e.value.name,
      };
      final polls = polls_provider.pollsFromPollResponse(response, userDisplayNames: names);
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
    final title = _isCreating ? 'Create Poll' : 'Polls';
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(AppRadius.xl)),
      ),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Container(
            width: 36,
            height: 4,
            decoration: BoxDecoration(
              color: Theme.of(context).dividerColor.withValues(alpha: 0.35),
              borderRadius: BorderRadius.circular(999),
            ),
          ),
          // Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Theme.of(context).dividerColor.withValues(alpha: 0.12),
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
                    borderRadius: BorderRadius.circular(AppRadius.md),
                  ),
                  child: Icon(
                    Icons.poll,
                    size: 18,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: AppTypography.fontSizeLg,
                    fontWeight: AppTypography.semiBold,
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
      return Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: 0.35),
              borderRadius: BorderRadius.circular(AppRadius.lg),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.poll_outlined,
                  size: 48,
                  color: Theme.of(context).disabledColor.withValues(alpha: 0.55),
                ),
                const SizedBox(height: 12),
                Text(
                  'No polls yet',
                  style: TextStyle(
                    fontSize: AppTypography.fontSizeMd,
                    fontWeight: AppTypography.semiBold,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Create your first poll to collect responses from participants.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: AppTypography.fontSizeSm,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 14),
                FilledButton.icon(
                  onPressed: () => setState(() => _isCreating = true),
                  icon: const Icon(Icons.add, size: 18),
                  label: const Text('Create Poll'),
                ),
              ],
            ),
          ),
        ),
      );
    }

    // Sort by created date (newest first)
    final sortedPolls = List<Poll>.from(polls)
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));

    return RefreshIndicator(
      onRefresh: () => _loadPolls(force: true),
      child: ListView.builder(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 20),
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
