import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/features/meet/data/models/proto/wajlc_polls.pb.dart' as polls_pb;
import '../../../providers/session_provider.dart';
import '../../../data/datasources/meet_api_service.dart';
import '../../../providers/room_settings_provider.dart';

/// Poll Create Widget
/// Form to create a new poll (1:1 with web createPoll)
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
      final userId = session.currentUser?.userId ?? '';
      final roomId = session.currentRoom.roomId;
      
      if (userId.isEmpty || roomId.isEmpty) {
        throw Exception('User or room not found');
      }

      // Generate pollId (server may override)
      final pollId = DateTime.now().millisecondsSinceEpoch.toString();
      
      // Build CreatePollReq (matches web)
      final options = validOptions.asMap().entries.map((entry) {
        return polls_pb.CreatePollOptions(
          id: entry.key + 1, // Option IDs start from 1
          text: entry.value,
        );
      }).toList();

      final req = polls_pb.CreatePollReq(
        roomId: roomId,
        userId: userId,
        pollId: pollId,
        question: question,
        options: options,
      );

      // Call API (matches web useCreatePollMutation)
      final api = ref.read(meetApiServiceProvider);
      final response = await api.createPoll(req);

      if (mounted) {
        if (response.status) {
          ref.read(roomSettingsProvider.notifier).addUserNotification(
            const UserNotification(
              message: 'Poll created successfully',
              typeOption: 'info',
            ),
          );
          widget.onPollCreated?.call();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(response.msg.isNotEmpty ? response.msg : 'Failed to create poll'),
            ),
          );
        }
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
