// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatMessage {

 String get messageId; String get senderId; String get senderName; String get message; DateTime get createdAt; String? get toUserId; bool get isPrivate; bool get isSystemMsg; bool get fromAdmin;// Legacy fields for compatibility if needed
 String? get id; String? get sentAt; String? get fromName; String? get fromUserId;
/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatMessageCopyWith<ChatMessage> get copyWith => _$ChatMessageCopyWithImpl<ChatMessage>(this as ChatMessage, _$identity);

  /// Serializes this ChatMessage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatMessage&&(identical(other.messageId, messageId) || other.messageId == messageId)&&(identical(other.senderId, senderId) || other.senderId == senderId)&&(identical(other.senderName, senderName) || other.senderName == senderName)&&(identical(other.message, message) || other.message == message)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.toUserId, toUserId) || other.toUserId == toUserId)&&(identical(other.isPrivate, isPrivate) || other.isPrivate == isPrivate)&&(identical(other.isSystemMsg, isSystemMsg) || other.isSystemMsg == isSystemMsg)&&(identical(other.fromAdmin, fromAdmin) || other.fromAdmin == fromAdmin)&&(identical(other.id, id) || other.id == id)&&(identical(other.sentAt, sentAt) || other.sentAt == sentAt)&&(identical(other.fromName, fromName) || other.fromName == fromName)&&(identical(other.fromUserId, fromUserId) || other.fromUserId == fromUserId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,messageId,senderId,senderName,message,createdAt,toUserId,isPrivate,isSystemMsg,fromAdmin,id,sentAt,fromName,fromUserId);

@override
String toString() {
  return 'ChatMessage(messageId: $messageId, senderId: $senderId, senderName: $senderName, message: $message, createdAt: $createdAt, toUserId: $toUserId, isPrivate: $isPrivate, isSystemMsg: $isSystemMsg, fromAdmin: $fromAdmin, id: $id, sentAt: $sentAt, fromName: $fromName, fromUserId: $fromUserId)';
}


}

/// @nodoc
abstract mixin class $ChatMessageCopyWith<$Res>  {
  factory $ChatMessageCopyWith(ChatMessage value, $Res Function(ChatMessage) _then) = _$ChatMessageCopyWithImpl;
@useResult
$Res call({
 String messageId, String senderId, String senderName, String message, DateTime createdAt, String? toUserId, bool isPrivate, bool isSystemMsg, bool fromAdmin, String? id, String? sentAt, String? fromName, String? fromUserId
});




}
/// @nodoc
class _$ChatMessageCopyWithImpl<$Res>
    implements $ChatMessageCopyWith<$Res> {
  _$ChatMessageCopyWithImpl(this._self, this._then);

  final ChatMessage _self;
  final $Res Function(ChatMessage) _then;

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? messageId = null,Object? senderId = null,Object? senderName = null,Object? message = null,Object? createdAt = null,Object? toUserId = freezed,Object? isPrivate = null,Object? isSystemMsg = null,Object? fromAdmin = null,Object? id = freezed,Object? sentAt = freezed,Object? fromName = freezed,Object? fromUserId = freezed,}) {
  return _then(_self.copyWith(
messageId: null == messageId ? _self.messageId : messageId // ignore: cast_nullable_to_non_nullable
as String,senderId: null == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as String,senderName: null == senderName ? _self.senderName : senderName // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,toUserId: freezed == toUserId ? _self.toUserId : toUserId // ignore: cast_nullable_to_non_nullable
as String?,isPrivate: null == isPrivate ? _self.isPrivate : isPrivate // ignore: cast_nullable_to_non_nullable
as bool,isSystemMsg: null == isSystemMsg ? _self.isSystemMsg : isSystemMsg // ignore: cast_nullable_to_non_nullable
as bool,fromAdmin: null == fromAdmin ? _self.fromAdmin : fromAdmin // ignore: cast_nullable_to_non_nullable
as bool,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,sentAt: freezed == sentAt ? _self.sentAt : sentAt // ignore: cast_nullable_to_non_nullable
as String?,fromName: freezed == fromName ? _self.fromName : fromName // ignore: cast_nullable_to_non_nullable
as String?,fromUserId: freezed == fromUserId ? _self.fromUserId : fromUserId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatMessage].
extension ChatMessagePatterns on ChatMessage {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatMessage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatMessage() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatMessage value)  $default,){
final _that = this;
switch (_that) {
case _ChatMessage():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatMessage value)?  $default,){
final _that = this;
switch (_that) {
case _ChatMessage() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String messageId,  String senderId,  String senderName,  String message,  DateTime createdAt,  String? toUserId,  bool isPrivate,  bool isSystemMsg,  bool fromAdmin,  String? id,  String? sentAt,  String? fromName,  String? fromUserId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatMessage() when $default != null:
return $default(_that.messageId,_that.senderId,_that.senderName,_that.message,_that.createdAt,_that.toUserId,_that.isPrivate,_that.isSystemMsg,_that.fromAdmin,_that.id,_that.sentAt,_that.fromName,_that.fromUserId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String messageId,  String senderId,  String senderName,  String message,  DateTime createdAt,  String? toUserId,  bool isPrivate,  bool isSystemMsg,  bool fromAdmin,  String? id,  String? sentAt,  String? fromName,  String? fromUserId)  $default,) {final _that = this;
switch (_that) {
case _ChatMessage():
return $default(_that.messageId,_that.senderId,_that.senderName,_that.message,_that.createdAt,_that.toUserId,_that.isPrivate,_that.isSystemMsg,_that.fromAdmin,_that.id,_that.sentAt,_that.fromName,_that.fromUserId);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String messageId,  String senderId,  String senderName,  String message,  DateTime createdAt,  String? toUserId,  bool isPrivate,  bool isSystemMsg,  bool fromAdmin,  String? id,  String? sentAt,  String? fromName,  String? fromUserId)?  $default,) {final _that = this;
switch (_that) {
case _ChatMessage() when $default != null:
return $default(_that.messageId,_that.senderId,_that.senderName,_that.message,_that.createdAt,_that.toUserId,_that.isPrivate,_that.isSystemMsg,_that.fromAdmin,_that.id,_that.sentAt,_that.fromName,_that.fromUserId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatMessage implements ChatMessage {
  const _ChatMessage({required this.messageId, required this.senderId, required this.senderName, required this.message, required this.createdAt, this.toUserId, this.isPrivate = false, this.isSystemMsg = false, this.fromAdmin = false, this.id, this.sentAt, this.fromName, this.fromUserId});
  factory _ChatMessage.fromJson(Map<String, dynamic> json) => _$ChatMessageFromJson(json);

@override final  String messageId;
@override final  String senderId;
@override final  String senderName;
@override final  String message;
@override final  DateTime createdAt;
@override final  String? toUserId;
@override@JsonKey() final  bool isPrivate;
@override@JsonKey() final  bool isSystemMsg;
@override@JsonKey() final  bool fromAdmin;
// Legacy fields for compatibility if needed
@override final  String? id;
@override final  String? sentAt;
@override final  String? fromName;
@override final  String? fromUserId;

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatMessageCopyWith<_ChatMessage> get copyWith => __$ChatMessageCopyWithImpl<_ChatMessage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatMessageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatMessage&&(identical(other.messageId, messageId) || other.messageId == messageId)&&(identical(other.senderId, senderId) || other.senderId == senderId)&&(identical(other.senderName, senderName) || other.senderName == senderName)&&(identical(other.message, message) || other.message == message)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.toUserId, toUserId) || other.toUserId == toUserId)&&(identical(other.isPrivate, isPrivate) || other.isPrivate == isPrivate)&&(identical(other.isSystemMsg, isSystemMsg) || other.isSystemMsg == isSystemMsg)&&(identical(other.fromAdmin, fromAdmin) || other.fromAdmin == fromAdmin)&&(identical(other.id, id) || other.id == id)&&(identical(other.sentAt, sentAt) || other.sentAt == sentAt)&&(identical(other.fromName, fromName) || other.fromName == fromName)&&(identical(other.fromUserId, fromUserId) || other.fromUserId == fromUserId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,messageId,senderId,senderName,message,createdAt,toUserId,isPrivate,isSystemMsg,fromAdmin,id,sentAt,fromName,fromUserId);

@override
String toString() {
  return 'ChatMessage(messageId: $messageId, senderId: $senderId, senderName: $senderName, message: $message, createdAt: $createdAt, toUserId: $toUserId, isPrivate: $isPrivate, isSystemMsg: $isSystemMsg, fromAdmin: $fromAdmin, id: $id, sentAt: $sentAt, fromName: $fromName, fromUserId: $fromUserId)';
}


}

/// @nodoc
abstract mixin class _$ChatMessageCopyWith<$Res> implements $ChatMessageCopyWith<$Res> {
  factory _$ChatMessageCopyWith(_ChatMessage value, $Res Function(_ChatMessage) _then) = __$ChatMessageCopyWithImpl;
@override @useResult
$Res call({
 String messageId, String senderId, String senderName, String message, DateTime createdAt, String? toUserId, bool isPrivate, bool isSystemMsg, bool fromAdmin, String? id, String? sentAt, String? fromName, String? fromUserId
});




}
/// @nodoc
class __$ChatMessageCopyWithImpl<$Res>
    implements _$ChatMessageCopyWith<$Res> {
  __$ChatMessageCopyWithImpl(this._self, this._then);

  final _ChatMessage _self;
  final $Res Function(_ChatMessage) _then;

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? messageId = null,Object? senderId = null,Object? senderName = null,Object? message = null,Object? createdAt = null,Object? toUserId = freezed,Object? isPrivate = null,Object? isSystemMsg = null,Object? fromAdmin = null,Object? id = freezed,Object? sentAt = freezed,Object? fromName = freezed,Object? fromUserId = freezed,}) {
  return _then(_ChatMessage(
messageId: null == messageId ? _self.messageId : messageId // ignore: cast_nullable_to_non_nullable
as String,senderId: null == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as String,senderName: null == senderName ? _self.senderName : senderName // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,toUserId: freezed == toUserId ? _self.toUserId : toUserId // ignore: cast_nullable_to_non_nullable
as String?,isPrivate: null == isPrivate ? _self.isPrivate : isPrivate // ignore: cast_nullable_to_non_nullable
as bool,isSystemMsg: null == isSystemMsg ? _self.isSystemMsg : isSystemMsg // ignore: cast_nullable_to_non_nullable
as bool,fromAdmin: null == fromAdmin ? _self.fromAdmin : fromAdmin // ignore: cast_nullable_to_non_nullable
as bool,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,sentAt: freezed == sentAt ? _self.sentAt : sentAt // ignore: cast_nullable_to_non_nullable
as String?,fromName: freezed == fromName ? _self.fromName : fromName // ignore: cast_nullable_to_non_nullable
as String?,fromUserId: freezed == fromUserId ? _self.fromUserId : fromUserId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
