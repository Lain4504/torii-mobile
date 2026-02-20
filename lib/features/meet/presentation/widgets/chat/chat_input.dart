import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/core/config/app_config.dart';
import 'package:torii_app/features/meet/data/models/proto/wajlc_common_api.pb.dart';
import '../../../data/datasources/meet_api_service.dart';
import '../../../providers/room_settings_provider.dart';
import '../../../providers/session_provider.dart';

/// Chat Input Widget
/// Text field for sending chat messages
class ChatInput extends ConsumerStatefulWidget {
  const ChatInput({super.key});

  @override
  ConsumerState<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends ConsumerState<ChatInput> {
  final TextEditingController _controller = TextEditingController();
  bool _canSend = false;
  bool _isUploading = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _controller.removeListener(_onTextChanged);
    _controller.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    final canSend = _controller.text.trim().isNotEmpty;
    if (canSend != _canSend) {
      setState(() {
        _canSend = canSend;
      });
    }
  }

  void _sendMessage() {
    if (!_canSend) return;

    final text = _controller.text.trim();
    if (text.isEmpty) return;

    final session = ref.read(sessionProvider);
    final currentUser = session.currentUser;
    final natsConn = ref.read(sessionProvider.notifier).natsConn;
    if (currentUser == null || natsConn == null) return;

    _controller.clear();
    final chatKey = ref.read(roomSettingsProvider).selectedChatOption;
    natsConn.sendChatMsg(to: chatKey, message: text);
  }

  Future<void> _pickAndUploadFile() async {
    final session = ref.read(sessionProvider);
    final roomId = session.currentRoom.roomId;
    final natsConn = ref.read(sessionProvider.notifier).natsConn;
    if (natsConn == null) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Not connected')),
        );
      }
      return;
    }

    final result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      withData: true,
    );
    if (result == null || result.files.isEmpty) return;

    final platformFile = result.files.single;
    final name = platformFile.name;
    final bytes = platformFile.bytes;
    if (name.isEmpty || bytes == null) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Could not read file. Try a smaller file or another device.'),
          ),
        );
      }
      return;
    }

    setState(() => _isUploading = true);
    try {
      final base64Data = base64Encode(bytes);
      final api = ref.read(meetApiServiceProvider);
      final res = await api.uploadBase64EncodedFile(
        roomId: roomId,
        fileName: name,
        base64Data: base64Data,
        fileType: RoomUploadedFileType.CHAT_FILE,
      );
      if (!res.status || res.filePath.isEmpty) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(res.msg.isNotEmpty ? res.msg : 'Upload failed')),
          );
        }
        return;
      }
      final downloadUrl = '${AppConfig.apiBaseUrl}/download/uploadedFile/${res.filePath}';
      final message = 'Attachment: $name\n$downloadUrl';
      final chatKey = ref.read(roomSettingsProvider).selectedChatOption;
      await natsConn.sendChatMsg(to: chatKey, message: message);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('File uploaded')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Upload error: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isUploading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 12,
        bottom: 24, // Safety padding for bottom area
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border(
          top: BorderSide(
            color: Theme.of(context).dividerColor.withOpacity(0.1),
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, -2),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.attach_file),
            onPressed: _isUploading ? null : _pickAndUploadFile,
            tooltip: 'Attach file',
          ),
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Send a message...',
                hintStyle: TextStyle(
                  color: Theme.of(context).disabledColor,
                ),
                filled: true,
                fillColor: Theme.of(context).colorScheme.surfaceContainerHighest.withOpacity(0.3),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                isDense: true,
              ),
              textCapitalization: TextCapitalization.sentences,
              maxLines: 3,
              minLines: 1,
            ),
          ),
          const SizedBox(width: 8),
          IconButton.filled(
            onPressed: _canSend ? _sendMessage : null,
            icon: const Icon(Icons.send_rounded),
            color: Theme.of(context).colorScheme.primary,
            style: IconButton.styleFrom(
              backgroundColor: _canSend 
                ? Theme.of(context).colorScheme.primary 
                : Theme.of(context).disabledColor.withOpacity(0.1),
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
