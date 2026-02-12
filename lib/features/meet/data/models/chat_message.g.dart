// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatMessage _$ChatMessageFromJson(Map<String, dynamic> json) => _ChatMessage(
  messageId: json['messageId'] as String,
  senderId: json['senderId'] as String,
  senderName: json['senderName'] as String,
  message: json['message'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  toUserId: json['toUserId'] as String?,
  isPrivate: json['isPrivate'] as bool? ?? false,
  isSystemMsg: json['isSystemMsg'] as bool? ?? false,
  fromAdmin: json['fromAdmin'] as bool? ?? false,
  id: json['id'] as String?,
  sentAt: json['sentAt'] as String?,
  fromName: json['fromName'] as String?,
  fromUserId: json['fromUserId'] as String?,
);

Map<String, dynamic> _$ChatMessageToJson(_ChatMessage instance) =>
    <String, dynamic>{
      'messageId': instance.messageId,
      'senderId': instance.senderId,
      'senderName': instance.senderName,
      'message': instance.message,
      'createdAt': instance.createdAt.toIso8601String(),
      'toUserId': instance.toUserId,
      'isPrivate': instance.isPrivate,
      'isSystemMsg': instance.isSystemMsg,
      'fromAdmin': instance.fromAdmin,
      'id': instance.id,
      'sentAt': instance.sentAt,
      'fromName': instance.fromName,
      'fromUserId': instance.fromUserId,
    };
