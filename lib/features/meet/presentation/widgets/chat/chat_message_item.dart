import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/features/meet/data/models/chat_message.dart';

/// Chat Message Item Widget
/// Displays a single chat message bubble
class ChatMessageItem extends StatelessWidget {
  final ChatMessage message;
  final bool isMe;
  final bool showAvatar;

  const ChatMessageItem({
    super.key,
    required this.message,
    required this.isMe,
    this.showAvatar = true,
  });

  @override
  Widget build(BuildContext context) {
    if (message.isSystemMsg) {
      return Center(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHighest.withOpacity(0.5),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            message.message,
            style: TextStyle(
              fontSize: 12,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      );
    }

    final pollResult = _tryParsePollResultMessage(message.message);

    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (!isMe) ...[
          if (showAvatar)
            CircleAvatar(
              radius: 16,
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: Text(
                _getInitials(message.senderName),
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            )
          else
            const SizedBox(width: 32),
          const SizedBox(width: 8),
        ],

        Flexible(
          child: Column(
            crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              if (!isMe && showAvatar)
                Padding(
                  padding: const EdgeInsets.only(left: 4, bottom: 4),
                  child: Text(
                    message.senderName,
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                    ),
                  ),
                ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: isMe
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(20),
                    topRight: const Radius.circular(20),
                    bottomLeft: isMe ? const Radius.circular(20) : const Radius.circular(4),
                    bottomRight: isMe ? const Radius.circular(4) : const Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (pollResult != null)
                      _buildPollResultContent(context, pollResult)
                    else
                      Text(
                        message.message,
                        style: TextStyle(
                          color: isMe
                              ? Theme.of(context).colorScheme.onPrimary
                              : Theme.of(context).colorScheme.onSurfaceVariant,
                          fontSize: 14,
                        ),
                      ),
                    const SizedBox(height: 4),
                    Text(
                      DateFormat('HH:mm').format(message.createdAt),
                      style: TextStyle(
                        fontSize: 10,
                        color: isMe 
                          ? Theme.of(context).colorScheme.onPrimary.withOpacity(0.7)
                          : Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        
        if (isMe) ...[
          const SizedBox(width: 8),
          // User avatar (optional, currently strictly showing initials for sender isn't common pattern for "Me" side, usually just bubble)
        ],
      ],
    );
  }

  String _getInitials(String name) {
    if (name.isEmpty) return '?';
    final parts = name.trim().split(' ');
    if (parts.length == 1) return parts[0][0].toUpperCase();
    return '${parts[0][0]}${parts[parts.length - 1][0]}'.toUpperCase();
  }

  _PollResultMessage? _tryParsePollResultMessage(String rawMessage) {
    if (!rawMessage.contains('<div') || !rawMessage.contains('<li')) {
      return null;
    }

    String decodeHtml(String s) {
      return s
          .replaceAll('&nbsp;', ' ')
          .replaceAll('&amp;', '&')
          .replaceAll('&lt;', '<')
          .replaceAll('&gt;', '>')
          .replaceAll('&quot;', '"')
          .replaceAll('&#39;', "'");
    }

    String stripTags(String s) {
      return s.replaceAll(RegExp(r'<[^>]*>'), '').trim();
    }

    final strongMatch = RegExp(
      r'<strong[^>]*>(.*?)</strong>',
      caseSensitive: false,
      dotAll: true,
    ).firstMatch(rawMessage);
    final title = strongMatch != null
        ? stripTags(decodeHtml(strongMatch.group(1) ?? ''))
        : '';

    final totalMatch = RegExp(
      r'Tổng số phản hồi:\s*(\d+)',
      caseSensitive: false,
    ).firstMatch(rawMessage);
    final total = totalMatch != null ? int.tryParse(totalMatch.group(1) ?? '') : null;

    final itemMatches = RegExp(
      r'<li[^>]*>(.*?)</li>',
      caseSensitive: false,
      dotAll: true,
    ).allMatches(rawMessage);
    final items = itemMatches
        .map((m) => stripTags(decodeHtml(m.group(1) ?? '')))
        .where((e) => e.isNotEmpty)
        .toList();

    if (title.isEmpty && items.isEmpty) return null;
    return _PollResultMessage(title: title, total: total, items: items);
  }

  Widget _buildPollResultContent(BuildContext context, _PollResultMessage poll) {
    final textColor = isMe
        ? Theme.of(context).colorScheme.onPrimary
        : Theme.of(context).colorScheme.onSurfaceVariant;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.poll_rounded, size: 16, color: textColor.withOpacity(0.9)),
            const SizedBox(width: 6),
            Text(
              'Poll Result',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: textColor.withOpacity(0.9),
              ),
            ),
          ],
        ),
        if (poll.title.isNotEmpty) ...[
          const SizedBox(height: 6),
          Text(
            poll.title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: textColor,
            ),
          ),
        ],
        if (poll.total != null) ...[
          const SizedBox(height: 2),
          Text(
            'Tổng số phản hồi: ${poll.total}',
            style: TextStyle(
              fontSize: 12,
              color: textColor.withOpacity(0.85),
            ),
          ),
        ],
        if (poll.items.isNotEmpty) ...[
          const SizedBox(height: 6),
          ...poll.items.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 2),
              child: Text(
                '• $item',
                style: TextStyle(
                  fontSize: 13,
                  color: textColor,
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class _PollResultMessage {
  final String title;
  final int? total;
  final List<String> items;

  _PollResultMessage({
    required this.title,
    required this.total,
    required this.items,
  });
}
