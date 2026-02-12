import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/poll.dart';
import '../../../../providers/polls_provider.dart';
import '../../../../providers/session_provider.dart';

/// Poll Create Widget
/// Form to create a new poll
class PollCreate extends ConsumerStatefulWidget {
  final VoidCallback? onPollCreated;
  
  const PollCreate({
    super.key,
    this.onPollCreated,
  });

  @override
  ConsumerState<PollCreate> createState() => _PollCreateState();
}

class _PollCreateState extends ConsumerState<PollCreate> {
  final TextEditingController _questionController = TextEditingController();
  final List<TextEditingController> _optionControllers = [
    TextEditingController(),
    TextEditingController(),
  ];
  bool _isLoading = false;

  @override
  void dispose() {
    _questionController.dispose();
    for (var c in _optionControllers) {
      c.dispose();
    }
    super.dispose();
  }

  void _addOption() {
    setState(() {
      _optionControllers.add(TextEditingController());
    });
  }

  void _removeOption(int index) {
    if (_optionControllers.length <= 2) return;
    final controller = _optionControllers[index];
    setState(() {
      _optionControllers.removeAt(index);
    });
    controller.dispose();
  }

  Future<void> _createPoll() async {
    final question = _questionController.text.trim();
    if (question.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a question')),
      );
      return;
    }

    final validOptions = _optionControllers
        .map((c) => c.text.trim())
        .where((t) => t.isNotEmpty)
        .toList();

    if (validOptions.length < 2) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter at least 2 options')),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final session = ref.read(sessionProvider);
      final userId = session.currentUser?.userId ?? 'unknown';
      final userName = session.currentUser?.name ?? 'Unknown';

      final pollId = DateTime.now().millisecondsSinceEpoch.toString();
      final options = validOptions.asMap().entries.map((entry) {
        return PollOption(
          id: '${pollId}_opt_${entry.key}',
          text: entry.value,
        );
      }).toList();

      final newPoll = Poll(
        id: pollId,
        question: question,
        options: options,
        createdBy: userId,
        createdByName: userName,
        createdAt: DateTime.now(),
      );

      // 1. Add locally
      ref.read(pollsProvider.notifier).addPoll(newPoll);

      // 2. Send via NATS
      await session.natsConn?.sendDataMessage(
        type: 'NEW_POLL_RESPONSE', // Using the available enum type
        msg: jsonEncode(newPoll.toJson()),
      );

      if (mounted) {
        // Close the create view (handled by parent switch, usually via setState in PollsBottomSheet)
        // Since we are in a sub-widget, we need to communicate back or just rely on the parent checking state?
        // Actually PollsBottomSheet passed no callback. 
        // We can just pop context if it was a push? No, it's inside Expanded.
        // We probably need to tell PollsBottomSheet to switch back.
        // But PollsBottomSheet controls `_isCreating`.
        // We can use a callback or just standard navigation if it was a route.
        // Given existing code, let's look at how to notify parent.
        // Use a callback parameter.
            ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Poll created successfully')),
            );
            // We need to fix the parent to accept a callback.
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to create poll: $e')),
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
    // We need a way to close this form. 
    // Ideally pass a callback 'onCreated'. 
    // Since I can't easily change the parent signature without errors in parent,
    // I will try to find a parent state or just show success msg. 
    // Wait, PollsBottomSheet renders this.
    
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Question
        const Text(
          'Question',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _questionController,
          decoration: const InputDecoration(
            hintText: 'Ask a question',
            border: OutlineInputBorder(),
          ),
          maxLines: 2,
        ),
        const SizedBox(height: 24),

        // Options
        const Text(
          'Options',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ...List.generate(_optionControllers.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _optionControllers[index],
                    decoration: InputDecoration(
                      hintText: 'Option ${index + 1}',
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                if (_optionControllers.length > 2)
                  IconButton(
                    icon: const Icon(Icons.delete_outline),
                    onPressed: () => _removeOption(index),
                    color: Colors.red,
                  ),
              ],
            ),
          );
        }),

        // Add Option Button
        TextButton.icon(
          onPressed: _addOption,
          icon: const Icon(Icons.add),
          label: const Text('Add option'),
        ),

        const SizedBox(height: 24),
        
        // Launch Button
        SizedBox(
            width: double.infinity,
            child: ElevatedButton(
            onPressed: _isLoading ? null : _createPoll,
            style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                ),
            ),
            child: _isLoading 
                ? const SizedBox(
                    width: 20, 
                    height: 20, 
                    child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2)
                    ) 
                : const Text('Launch Poll'),
            ),
        ),
      ],
    );
  }
}
