
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_message.freezed.dart';
part 'chat_message.g.dart';

@freezed
abstract class ChatMessage with _$ChatMessage {
  const factory ChatMessage({
    required String messageId,
    required String senderId,
    required String senderName,
    required String message,
    required DateTime createdAt,
    String? toUserId,
    @Default(false) bool isPrivate,
    @Default(false) bool isSystemMsg,
    @Default(false) bool fromAdmin,
    
    // Legacy fields for compatibility if needed
    String? id,
    String? sentAt,
    String? fromName,
    String? fromUserId,
  }) = _ChatMessage;

  factory ChatMessage.fromJson(Map<String, dynamic> json) => _$ChatMessageFromJson(json);
}
