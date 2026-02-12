import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/features/meet/data/models/proto/wajlc_polls.pb.dart' as polls;
import 'package:torii_app/features/meet/data/models/proto/wajlc_datamessage.pb.dart' as data_msg;
import 'package:torii_app/features/meet/presentation/providers/meet_provider.dart';

class PollsBottomSheet extends ConsumerWidget {
  const PollsBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(meetControllerProvider);
    final notifier = ref.read(meetControllerProvider.notifier);
    final pollsList = state.polls;

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
                  'Bình chọn',

                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
                ),
                IconButton(
                  icon: const Icon(Icons.refresh, color: Colors.white70),
                  onPressed: () => notifier.refreshPollsPublic(),
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (pollsList.isEmpty)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: Center(
                  child: Text(
                    'Chưa có bình chọn nào.',

                    style: TextStyle(color: Colors.white60),
                  ),
                ),
              )
            else
              Flexible(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: pollsList.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final poll = pollsList[index];
                    final isRunning = poll.isRunning;
                    return _PollCard(
                      poll: poll,
                      isRunning: isRunning,
                      onVote: (optionId) async {
                        await notifier.submitPollVote(poll, optionId);
                      },
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

class _PollCard extends StatefulWidget {
  final polls.PollInfo poll;
  final bool isRunning;
  final Future<void> Function(int optionId) onVote;

  const _PollCard({
    required this.poll,
    required this.isRunning,
    required this.onVote,
  });

  @override
  State<_PollCard> createState() => _PollCardState();
}

class _PollCardState extends State<_PollCard> {
  int? _selectedOption;
  bool _submitting = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF222222),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.poll.question,
            style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          ...widget.poll.options.map((o) {
            final optionId = o.id.toInt();
            return RadioListTile<int>(
              dense: true,
              contentPadding: EdgeInsets.zero,
              value: optionId,
              groupValue: _selectedOption,
              onChanged: widget.isRunning && !_submitting
                  ? (v) => setState(() {
                        _selectedOption = v;
                      })
                  : null,
              title: Text(
                o.text,
                style: const TextStyle(color: Colors.white70, fontSize: 14),
              ),
              activeColor: Colors.blueAccent,
            );
          }),
          const SizedBox(height: 8),
          if (widget.isRunning)
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: _selectedOption == null || _submitting
                    ? null
                    : () async {
                        setState(() => _submitting = true);
                        try {
                          await widget.onVote(_selectedOption!);
                        } finally {
                          if (mounted) setState(() => _submitting = false);
                        }
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  minimumSize: const Size(0, 36),
                ),
                child: _submitting
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Text('Bình chọn'),

              ),
            )
          else
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Đã đóng',

                style: TextStyle(color: Colors.white54, fontSize: 12),
              ),
            ),
        ],
      ),
    );
  }
}

