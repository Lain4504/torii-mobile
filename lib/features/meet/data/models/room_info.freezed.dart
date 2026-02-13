// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RoomInfo {

 String? get metadataId; String get roomTitle; bool get isRecording; bool get isActiveRtmp; String get welcomeMessage; RoomFeatures? get roomFeatures;// Additional fields for compatibility
 String? get roomId; String? get roomSid;
/// Create a copy of RoomInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoomInfoCopyWith<RoomInfo> get copyWith => _$RoomInfoCopyWithImpl<RoomInfo>(this as RoomInfo, _$identity);

  /// Serializes this RoomInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoomInfo&&(identical(other.metadataId, metadataId) || other.metadataId == metadataId)&&(identical(other.roomTitle, roomTitle) || other.roomTitle == roomTitle)&&(identical(other.isRecording, isRecording) || other.isRecording == isRecording)&&(identical(other.isActiveRtmp, isActiveRtmp) || other.isActiveRtmp == isActiveRtmp)&&(identical(other.welcomeMessage, welcomeMessage) || other.welcomeMessage == welcomeMessage)&&(identical(other.roomFeatures, roomFeatures) || other.roomFeatures == roomFeatures)&&(identical(other.roomId, roomId) || other.roomId == roomId)&&(identical(other.roomSid, roomSid) || other.roomSid == roomSid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,metadataId,roomTitle,isRecording,isActiveRtmp,welcomeMessage,roomFeatures,roomId,roomSid);

@override
String toString() {
  return 'RoomInfo(metadataId: $metadataId, roomTitle: $roomTitle, isRecording: $isRecording, isActiveRtmp: $isActiveRtmp, welcomeMessage: $welcomeMessage, roomFeatures: $roomFeatures, roomId: $roomId, roomSid: $roomSid)';
}


}

/// @nodoc
abstract mixin class $RoomInfoCopyWith<$Res>  {
  factory $RoomInfoCopyWith(RoomInfo value, $Res Function(RoomInfo) _then) = _$RoomInfoCopyWithImpl;
@useResult
$Res call({
 String? metadataId, String roomTitle, bool isRecording, bool isActiveRtmp, String welcomeMessage, RoomFeatures? roomFeatures, String? roomId, String? roomSid
});


$RoomFeaturesCopyWith<$Res>? get roomFeatures;

}
/// @nodoc
class _$RoomInfoCopyWithImpl<$Res>
    implements $RoomInfoCopyWith<$Res> {
  _$RoomInfoCopyWithImpl(this._self, this._then);

  final RoomInfo _self;
  final $Res Function(RoomInfo) _then;

/// Create a copy of RoomInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? metadataId = freezed,Object? roomTitle = null,Object? isRecording = null,Object? isActiveRtmp = null,Object? welcomeMessage = null,Object? roomFeatures = freezed,Object? roomId = freezed,Object? roomSid = freezed,}) {
  return _then(_self.copyWith(
metadataId: freezed == metadataId ? _self.metadataId : metadataId // ignore: cast_nullable_to_non_nullable
as String?,roomTitle: null == roomTitle ? _self.roomTitle : roomTitle // ignore: cast_nullable_to_non_nullable
as String,isRecording: null == isRecording ? _self.isRecording : isRecording // ignore: cast_nullable_to_non_nullable
as bool,isActiveRtmp: null == isActiveRtmp ? _self.isActiveRtmp : isActiveRtmp // ignore: cast_nullable_to_non_nullable
as bool,welcomeMessage: null == welcomeMessage ? _self.welcomeMessage : welcomeMessage // ignore: cast_nullable_to_non_nullable
as String,roomFeatures: freezed == roomFeatures ? _self.roomFeatures : roomFeatures // ignore: cast_nullable_to_non_nullable
as RoomFeatures?,roomId: freezed == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String?,roomSid: freezed == roomSid ? _self.roomSid : roomSid // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of RoomInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoomFeaturesCopyWith<$Res>? get roomFeatures {
    if (_self.roomFeatures == null) {
    return null;
  }

  return $RoomFeaturesCopyWith<$Res>(_self.roomFeatures!, (value) {
    return _then(_self.copyWith(roomFeatures: value));
  });
}
}


/// Adds pattern-matching-related methods to [RoomInfo].
extension RoomInfoPatterns on RoomInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoomInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoomInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoomInfo value)  $default,){
final _that = this;
switch (_that) {
case _RoomInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoomInfo value)?  $default,){
final _that = this;
switch (_that) {
case _RoomInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? metadataId,  String roomTitle,  bool isRecording,  bool isActiveRtmp,  String welcomeMessage,  RoomFeatures? roomFeatures,  String? roomId,  String? roomSid)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoomInfo() when $default != null:
return $default(_that.metadataId,_that.roomTitle,_that.isRecording,_that.isActiveRtmp,_that.welcomeMessage,_that.roomFeatures,_that.roomId,_that.roomSid);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? metadataId,  String roomTitle,  bool isRecording,  bool isActiveRtmp,  String welcomeMessage,  RoomFeatures? roomFeatures,  String? roomId,  String? roomSid)  $default,) {final _that = this;
switch (_that) {
case _RoomInfo():
return $default(_that.metadataId,_that.roomTitle,_that.isRecording,_that.isActiveRtmp,_that.welcomeMessage,_that.roomFeatures,_that.roomId,_that.roomSid);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? metadataId,  String roomTitle,  bool isRecording,  bool isActiveRtmp,  String welcomeMessage,  RoomFeatures? roomFeatures,  String? roomId,  String? roomSid)?  $default,) {final _that = this;
switch (_that) {
case _RoomInfo() when $default != null:
return $default(_that.metadataId,_that.roomTitle,_that.isRecording,_that.isActiveRtmp,_that.welcomeMessage,_that.roomFeatures,_that.roomId,_that.roomSid);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RoomInfo implements RoomInfo {
  const _RoomInfo({this.metadataId, this.roomTitle = '', this.isRecording = false, this.isActiveRtmp = false, this.welcomeMessage = '', this.roomFeatures, this.roomId, this.roomSid});
  factory _RoomInfo.fromJson(Map<String, dynamic> json) => _$RoomInfoFromJson(json);

@override final  String? metadataId;
@override@JsonKey() final  String roomTitle;
@override@JsonKey() final  bool isRecording;
@override@JsonKey() final  bool isActiveRtmp;
@override@JsonKey() final  String welcomeMessage;
@override final  RoomFeatures? roomFeatures;
// Additional fields for compatibility
@override final  String? roomId;
@override final  String? roomSid;

/// Create a copy of RoomInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoomInfoCopyWith<_RoomInfo> get copyWith => __$RoomInfoCopyWithImpl<_RoomInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RoomInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoomInfo&&(identical(other.metadataId, metadataId) || other.metadataId == metadataId)&&(identical(other.roomTitle, roomTitle) || other.roomTitle == roomTitle)&&(identical(other.isRecording, isRecording) || other.isRecording == isRecording)&&(identical(other.isActiveRtmp, isActiveRtmp) || other.isActiveRtmp == isActiveRtmp)&&(identical(other.welcomeMessage, welcomeMessage) || other.welcomeMessage == welcomeMessage)&&(identical(other.roomFeatures, roomFeatures) || other.roomFeatures == roomFeatures)&&(identical(other.roomId, roomId) || other.roomId == roomId)&&(identical(other.roomSid, roomSid) || other.roomSid == roomSid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,metadataId,roomTitle,isRecording,isActiveRtmp,welcomeMessage,roomFeatures,roomId,roomSid);

@override
String toString() {
  return 'RoomInfo(metadataId: $metadataId, roomTitle: $roomTitle, isRecording: $isRecording, isActiveRtmp: $isActiveRtmp, welcomeMessage: $welcomeMessage, roomFeatures: $roomFeatures, roomId: $roomId, roomSid: $roomSid)';
}


}

/// @nodoc
abstract mixin class _$RoomInfoCopyWith<$Res> implements $RoomInfoCopyWith<$Res> {
  factory _$RoomInfoCopyWith(_RoomInfo value, $Res Function(_RoomInfo) _then) = __$RoomInfoCopyWithImpl;
@override @useResult
$Res call({
 String? metadataId, String roomTitle, bool isRecording, bool isActiveRtmp, String welcomeMessage, RoomFeatures? roomFeatures, String? roomId, String? roomSid
});


@override $RoomFeaturesCopyWith<$Res>? get roomFeatures;

}
/// @nodoc
class __$RoomInfoCopyWithImpl<$Res>
    implements _$RoomInfoCopyWith<$Res> {
  __$RoomInfoCopyWithImpl(this._self, this._then);

  final _RoomInfo _self;
  final $Res Function(_RoomInfo) _then;

/// Create a copy of RoomInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? metadataId = freezed,Object? roomTitle = null,Object? isRecording = null,Object? isActiveRtmp = null,Object? welcomeMessage = null,Object? roomFeatures = freezed,Object? roomId = freezed,Object? roomSid = freezed,}) {
  return _then(_RoomInfo(
metadataId: freezed == metadataId ? _self.metadataId : metadataId // ignore: cast_nullable_to_non_nullable
as String?,roomTitle: null == roomTitle ? _self.roomTitle : roomTitle // ignore: cast_nullable_to_non_nullable
as String,isRecording: null == isRecording ? _self.isRecording : isRecording // ignore: cast_nullable_to_non_nullable
as bool,isActiveRtmp: null == isActiveRtmp ? _self.isActiveRtmp : isActiveRtmp // ignore: cast_nullable_to_non_nullable
as bool,welcomeMessage: null == welcomeMessage ? _self.welcomeMessage : welcomeMessage // ignore: cast_nullable_to_non_nullable
as String,roomFeatures: freezed == roomFeatures ? _self.roomFeatures : roomFeatures // ignore: cast_nullable_to_non_nullable
as RoomFeatures?,roomId: freezed == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String?,roomSid: freezed == roomSid ? _self.roomSid : roomSid // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of RoomInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoomFeaturesCopyWith<$Res>? get roomFeatures {
    if (_self.roomFeatures == null) {
    return null;
  }

  return $RoomFeaturesCopyWith<$Res>(_self.roomFeatures!, (value) {
    return _then(_self.copyWith(roomFeatures: value));
  });
}
}


/// @nodoc
mixin _$RoomFeatures {

 WhiteboardFeatures? get whiteboardFeatures; bool get chat; bool get whiteboard; ExternalMediaPlayerFeatures? get externalMediaPlayerFeatures; DisplayExternalLinkFeatures? get displayExternalLinkFeatures;
/// Create a copy of RoomFeatures
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoomFeaturesCopyWith<RoomFeatures> get copyWith => _$RoomFeaturesCopyWithImpl<RoomFeatures>(this as RoomFeatures, _$identity);

  /// Serializes this RoomFeatures to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoomFeatures&&(identical(other.whiteboardFeatures, whiteboardFeatures) || other.whiteboardFeatures == whiteboardFeatures)&&(identical(other.chat, chat) || other.chat == chat)&&(identical(other.whiteboard, whiteboard) || other.whiteboard == whiteboard)&&(identical(other.externalMediaPlayerFeatures, externalMediaPlayerFeatures) || other.externalMediaPlayerFeatures == externalMediaPlayerFeatures)&&(identical(other.displayExternalLinkFeatures, displayExternalLinkFeatures) || other.displayExternalLinkFeatures == displayExternalLinkFeatures));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,whiteboardFeatures,chat,whiteboard,externalMediaPlayerFeatures,displayExternalLinkFeatures);

@override
String toString() {
  return 'RoomFeatures(whiteboardFeatures: $whiteboardFeatures, chat: $chat, whiteboard: $whiteboard, externalMediaPlayerFeatures: $externalMediaPlayerFeatures, displayExternalLinkFeatures: $displayExternalLinkFeatures)';
}


}

/// @nodoc
abstract mixin class $RoomFeaturesCopyWith<$Res>  {
  factory $RoomFeaturesCopyWith(RoomFeatures value, $Res Function(RoomFeatures) _then) = _$RoomFeaturesCopyWithImpl;
@useResult
$Res call({
 WhiteboardFeatures? whiteboardFeatures, bool chat, bool whiteboard, ExternalMediaPlayerFeatures? externalMediaPlayerFeatures, DisplayExternalLinkFeatures? displayExternalLinkFeatures
});


$WhiteboardFeaturesCopyWith<$Res>? get whiteboardFeatures;$ExternalMediaPlayerFeaturesCopyWith<$Res>? get externalMediaPlayerFeatures;$DisplayExternalLinkFeaturesCopyWith<$Res>? get displayExternalLinkFeatures;

}
/// @nodoc
class _$RoomFeaturesCopyWithImpl<$Res>
    implements $RoomFeaturesCopyWith<$Res> {
  _$RoomFeaturesCopyWithImpl(this._self, this._then);

  final RoomFeatures _self;
  final $Res Function(RoomFeatures) _then;

/// Create a copy of RoomFeatures
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? whiteboardFeatures = freezed,Object? chat = null,Object? whiteboard = null,Object? externalMediaPlayerFeatures = freezed,Object? displayExternalLinkFeatures = freezed,}) {
  return _then(_self.copyWith(
whiteboardFeatures: freezed == whiteboardFeatures ? _self.whiteboardFeatures : whiteboardFeatures // ignore: cast_nullable_to_non_nullable
as WhiteboardFeatures?,chat: null == chat ? _self.chat : chat // ignore: cast_nullable_to_non_nullable
as bool,whiteboard: null == whiteboard ? _self.whiteboard : whiteboard // ignore: cast_nullable_to_non_nullable
as bool,externalMediaPlayerFeatures: freezed == externalMediaPlayerFeatures ? _self.externalMediaPlayerFeatures : externalMediaPlayerFeatures // ignore: cast_nullable_to_non_nullable
as ExternalMediaPlayerFeatures?,displayExternalLinkFeatures: freezed == displayExternalLinkFeatures ? _self.displayExternalLinkFeatures : displayExternalLinkFeatures // ignore: cast_nullable_to_non_nullable
as DisplayExternalLinkFeatures?,
  ));
}
/// Create a copy of RoomFeatures
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WhiteboardFeaturesCopyWith<$Res>? get whiteboardFeatures {
    if (_self.whiteboardFeatures == null) {
    return null;
  }

  return $WhiteboardFeaturesCopyWith<$Res>(_self.whiteboardFeatures!, (value) {
    return _then(_self.copyWith(whiteboardFeatures: value));
  });
}/// Create a copy of RoomFeatures
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExternalMediaPlayerFeaturesCopyWith<$Res>? get externalMediaPlayerFeatures {
    if (_self.externalMediaPlayerFeatures == null) {
    return null;
  }

  return $ExternalMediaPlayerFeaturesCopyWith<$Res>(_self.externalMediaPlayerFeatures!, (value) {
    return _then(_self.copyWith(externalMediaPlayerFeatures: value));
  });
}/// Create a copy of RoomFeatures
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DisplayExternalLinkFeaturesCopyWith<$Res>? get displayExternalLinkFeatures {
    if (_self.displayExternalLinkFeatures == null) {
    return null;
  }

  return $DisplayExternalLinkFeaturesCopyWith<$Res>(_self.displayExternalLinkFeatures!, (value) {
    return _then(_self.copyWith(displayExternalLinkFeatures: value));
  });
}
}


/// Adds pattern-matching-related methods to [RoomFeatures].
extension RoomFeaturesPatterns on RoomFeatures {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoomFeatures value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoomFeatures() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoomFeatures value)  $default,){
final _that = this;
switch (_that) {
case _RoomFeatures():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoomFeatures value)?  $default,){
final _that = this;
switch (_that) {
case _RoomFeatures() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( WhiteboardFeatures? whiteboardFeatures,  bool chat,  bool whiteboard,  ExternalMediaPlayerFeatures? externalMediaPlayerFeatures,  DisplayExternalLinkFeatures? displayExternalLinkFeatures)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoomFeatures() when $default != null:
return $default(_that.whiteboardFeatures,_that.chat,_that.whiteboard,_that.externalMediaPlayerFeatures,_that.displayExternalLinkFeatures);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( WhiteboardFeatures? whiteboardFeatures,  bool chat,  bool whiteboard,  ExternalMediaPlayerFeatures? externalMediaPlayerFeatures,  DisplayExternalLinkFeatures? displayExternalLinkFeatures)  $default,) {final _that = this;
switch (_that) {
case _RoomFeatures():
return $default(_that.whiteboardFeatures,_that.chat,_that.whiteboard,_that.externalMediaPlayerFeatures,_that.displayExternalLinkFeatures);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( WhiteboardFeatures? whiteboardFeatures,  bool chat,  bool whiteboard,  ExternalMediaPlayerFeatures? externalMediaPlayerFeatures,  DisplayExternalLinkFeatures? displayExternalLinkFeatures)?  $default,) {final _that = this;
switch (_that) {
case _RoomFeatures() when $default != null:
return $default(_that.whiteboardFeatures,_that.chat,_that.whiteboard,_that.externalMediaPlayerFeatures,_that.displayExternalLinkFeatures);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RoomFeatures implements RoomFeatures {
  const _RoomFeatures({this.whiteboardFeatures, this.chat = false, this.whiteboard = false, this.externalMediaPlayerFeatures, this.displayExternalLinkFeatures});
  factory _RoomFeatures.fromJson(Map<String, dynamic> json) => _$RoomFeaturesFromJson(json);

@override final  WhiteboardFeatures? whiteboardFeatures;
@override@JsonKey() final  bool chat;
@override@JsonKey() final  bool whiteboard;
@override final  ExternalMediaPlayerFeatures? externalMediaPlayerFeatures;
@override final  DisplayExternalLinkFeatures? displayExternalLinkFeatures;

/// Create a copy of RoomFeatures
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoomFeaturesCopyWith<_RoomFeatures> get copyWith => __$RoomFeaturesCopyWithImpl<_RoomFeatures>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RoomFeaturesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoomFeatures&&(identical(other.whiteboardFeatures, whiteboardFeatures) || other.whiteboardFeatures == whiteboardFeatures)&&(identical(other.chat, chat) || other.chat == chat)&&(identical(other.whiteboard, whiteboard) || other.whiteboard == whiteboard)&&(identical(other.externalMediaPlayerFeatures, externalMediaPlayerFeatures) || other.externalMediaPlayerFeatures == externalMediaPlayerFeatures)&&(identical(other.displayExternalLinkFeatures, displayExternalLinkFeatures) || other.displayExternalLinkFeatures == displayExternalLinkFeatures));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,whiteboardFeatures,chat,whiteboard,externalMediaPlayerFeatures,displayExternalLinkFeatures);

@override
String toString() {
  return 'RoomFeatures(whiteboardFeatures: $whiteboardFeatures, chat: $chat, whiteboard: $whiteboard, externalMediaPlayerFeatures: $externalMediaPlayerFeatures, displayExternalLinkFeatures: $displayExternalLinkFeatures)';
}


}

/// @nodoc
abstract mixin class _$RoomFeaturesCopyWith<$Res> implements $RoomFeaturesCopyWith<$Res> {
  factory _$RoomFeaturesCopyWith(_RoomFeatures value, $Res Function(_RoomFeatures) _then) = __$RoomFeaturesCopyWithImpl;
@override @useResult
$Res call({
 WhiteboardFeatures? whiteboardFeatures, bool chat, bool whiteboard, ExternalMediaPlayerFeatures? externalMediaPlayerFeatures, DisplayExternalLinkFeatures? displayExternalLinkFeatures
});


@override $WhiteboardFeaturesCopyWith<$Res>? get whiteboardFeatures;@override $ExternalMediaPlayerFeaturesCopyWith<$Res>? get externalMediaPlayerFeatures;@override $DisplayExternalLinkFeaturesCopyWith<$Res>? get displayExternalLinkFeatures;

}
/// @nodoc
class __$RoomFeaturesCopyWithImpl<$Res>
    implements _$RoomFeaturesCopyWith<$Res> {
  __$RoomFeaturesCopyWithImpl(this._self, this._then);

  final _RoomFeatures _self;
  final $Res Function(_RoomFeatures) _then;

/// Create a copy of RoomFeatures
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? whiteboardFeatures = freezed,Object? chat = null,Object? whiteboard = null,Object? externalMediaPlayerFeatures = freezed,Object? displayExternalLinkFeatures = freezed,}) {
  return _then(_RoomFeatures(
whiteboardFeatures: freezed == whiteboardFeatures ? _self.whiteboardFeatures : whiteboardFeatures // ignore: cast_nullable_to_non_nullable
as WhiteboardFeatures?,chat: null == chat ? _self.chat : chat // ignore: cast_nullable_to_non_nullable
as bool,whiteboard: null == whiteboard ? _self.whiteboard : whiteboard // ignore: cast_nullable_to_non_nullable
as bool,externalMediaPlayerFeatures: freezed == externalMediaPlayerFeatures ? _self.externalMediaPlayerFeatures : externalMediaPlayerFeatures // ignore: cast_nullable_to_non_nullable
as ExternalMediaPlayerFeatures?,displayExternalLinkFeatures: freezed == displayExternalLinkFeatures ? _self.displayExternalLinkFeatures : displayExternalLinkFeatures // ignore: cast_nullable_to_non_nullable
as DisplayExternalLinkFeatures?,
  ));
}

/// Create a copy of RoomFeatures
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WhiteboardFeaturesCopyWith<$Res>? get whiteboardFeatures {
    if (_self.whiteboardFeatures == null) {
    return null;
  }

  return $WhiteboardFeaturesCopyWith<$Res>(_self.whiteboardFeatures!, (value) {
    return _then(_self.copyWith(whiteboardFeatures: value));
  });
}/// Create a copy of RoomFeatures
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExternalMediaPlayerFeaturesCopyWith<$Res>? get externalMediaPlayerFeatures {
    if (_self.externalMediaPlayerFeatures == null) {
    return null;
  }

  return $ExternalMediaPlayerFeaturesCopyWith<$Res>(_self.externalMediaPlayerFeatures!, (value) {
    return _then(_self.copyWith(externalMediaPlayerFeatures: value));
  });
}/// Create a copy of RoomFeatures
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DisplayExternalLinkFeaturesCopyWith<$Res>? get displayExternalLinkFeatures {
    if (_self.displayExternalLinkFeatures == null) {
    return null;
  }

  return $DisplayExternalLinkFeaturesCopyWith<$Res>(_self.displayExternalLinkFeatures!, (value) {
    return _then(_self.copyWith(displayExternalLinkFeatures: value));
  });
}
}


/// @nodoc
mixin _$ExternalMediaPlayerFeatures {

 bool get isActive; String get url; bool get isAllow;
/// Create a copy of ExternalMediaPlayerFeatures
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExternalMediaPlayerFeaturesCopyWith<ExternalMediaPlayerFeatures> get copyWith => _$ExternalMediaPlayerFeaturesCopyWithImpl<ExternalMediaPlayerFeatures>(this as ExternalMediaPlayerFeatures, _$identity);

  /// Serializes this ExternalMediaPlayerFeatures to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExternalMediaPlayerFeatures&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.url, url) || other.url == url)&&(identical(other.isAllow, isAllow) || other.isAllow == isAllow));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isActive,url,isAllow);

@override
String toString() {
  return 'ExternalMediaPlayerFeatures(isActive: $isActive, url: $url, isAllow: $isAllow)';
}


}

/// @nodoc
abstract mixin class $ExternalMediaPlayerFeaturesCopyWith<$Res>  {
  factory $ExternalMediaPlayerFeaturesCopyWith(ExternalMediaPlayerFeatures value, $Res Function(ExternalMediaPlayerFeatures) _then) = _$ExternalMediaPlayerFeaturesCopyWithImpl;
@useResult
$Res call({
 bool isActive, String url, bool isAllow
});




}
/// @nodoc
class _$ExternalMediaPlayerFeaturesCopyWithImpl<$Res>
    implements $ExternalMediaPlayerFeaturesCopyWith<$Res> {
  _$ExternalMediaPlayerFeaturesCopyWithImpl(this._self, this._then);

  final ExternalMediaPlayerFeatures _self;
  final $Res Function(ExternalMediaPlayerFeatures) _then;

/// Create a copy of ExternalMediaPlayerFeatures
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isActive = null,Object? url = null,Object? isAllow = null,}) {
  return _then(_self.copyWith(
isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,isAllow: null == isAllow ? _self.isAllow : isAllow // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ExternalMediaPlayerFeatures].
extension ExternalMediaPlayerFeaturesPatterns on ExternalMediaPlayerFeatures {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExternalMediaPlayerFeatures value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExternalMediaPlayerFeatures() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExternalMediaPlayerFeatures value)  $default,){
final _that = this;
switch (_that) {
case _ExternalMediaPlayerFeatures():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExternalMediaPlayerFeatures value)?  $default,){
final _that = this;
switch (_that) {
case _ExternalMediaPlayerFeatures() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isActive,  String url,  bool isAllow)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExternalMediaPlayerFeatures() when $default != null:
return $default(_that.isActive,_that.url,_that.isAllow);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isActive,  String url,  bool isAllow)  $default,) {final _that = this;
switch (_that) {
case _ExternalMediaPlayerFeatures():
return $default(_that.isActive,_that.url,_that.isAllow);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isActive,  String url,  bool isAllow)?  $default,) {final _that = this;
switch (_that) {
case _ExternalMediaPlayerFeatures() when $default != null:
return $default(_that.isActive,_that.url,_that.isAllow);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExternalMediaPlayerFeatures implements ExternalMediaPlayerFeatures {
  const _ExternalMediaPlayerFeatures({this.isActive = false, this.url = '', this.isAllow = false});
  factory _ExternalMediaPlayerFeatures.fromJson(Map<String, dynamic> json) => _$ExternalMediaPlayerFeaturesFromJson(json);

@override@JsonKey() final  bool isActive;
@override@JsonKey() final  String url;
@override@JsonKey() final  bool isAllow;

/// Create a copy of ExternalMediaPlayerFeatures
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExternalMediaPlayerFeaturesCopyWith<_ExternalMediaPlayerFeatures> get copyWith => __$ExternalMediaPlayerFeaturesCopyWithImpl<_ExternalMediaPlayerFeatures>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExternalMediaPlayerFeaturesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExternalMediaPlayerFeatures&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.url, url) || other.url == url)&&(identical(other.isAllow, isAllow) || other.isAllow == isAllow));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isActive,url,isAllow);

@override
String toString() {
  return 'ExternalMediaPlayerFeatures(isActive: $isActive, url: $url, isAllow: $isAllow)';
}


}

/// @nodoc
abstract mixin class _$ExternalMediaPlayerFeaturesCopyWith<$Res> implements $ExternalMediaPlayerFeaturesCopyWith<$Res> {
  factory _$ExternalMediaPlayerFeaturesCopyWith(_ExternalMediaPlayerFeatures value, $Res Function(_ExternalMediaPlayerFeatures) _then) = __$ExternalMediaPlayerFeaturesCopyWithImpl;
@override @useResult
$Res call({
 bool isActive, String url, bool isAllow
});




}
/// @nodoc
class __$ExternalMediaPlayerFeaturesCopyWithImpl<$Res>
    implements _$ExternalMediaPlayerFeaturesCopyWith<$Res> {
  __$ExternalMediaPlayerFeaturesCopyWithImpl(this._self, this._then);

  final _ExternalMediaPlayerFeatures _self;
  final $Res Function(_ExternalMediaPlayerFeatures) _then;

/// Create a copy of ExternalMediaPlayerFeatures
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isActive = null,Object? url = null,Object? isAllow = null,}) {
  return _then(_ExternalMediaPlayerFeatures(
isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,isAllow: null == isAllow ? _self.isAllow : isAllow // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$DisplayExternalLinkFeatures {

 bool get isActive; String get link; bool get isAllow;
/// Create a copy of DisplayExternalLinkFeatures
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DisplayExternalLinkFeaturesCopyWith<DisplayExternalLinkFeatures> get copyWith => _$DisplayExternalLinkFeaturesCopyWithImpl<DisplayExternalLinkFeatures>(this as DisplayExternalLinkFeatures, _$identity);

  /// Serializes this DisplayExternalLinkFeatures to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DisplayExternalLinkFeatures&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.link, link) || other.link == link)&&(identical(other.isAllow, isAllow) || other.isAllow == isAllow));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isActive,link,isAllow);

@override
String toString() {
  return 'DisplayExternalLinkFeatures(isActive: $isActive, link: $link, isAllow: $isAllow)';
}


}

/// @nodoc
abstract mixin class $DisplayExternalLinkFeaturesCopyWith<$Res>  {
  factory $DisplayExternalLinkFeaturesCopyWith(DisplayExternalLinkFeatures value, $Res Function(DisplayExternalLinkFeatures) _then) = _$DisplayExternalLinkFeaturesCopyWithImpl;
@useResult
$Res call({
 bool isActive, String link, bool isAllow
});




}
/// @nodoc
class _$DisplayExternalLinkFeaturesCopyWithImpl<$Res>
    implements $DisplayExternalLinkFeaturesCopyWith<$Res> {
  _$DisplayExternalLinkFeaturesCopyWithImpl(this._self, this._then);

  final DisplayExternalLinkFeatures _self;
  final $Res Function(DisplayExternalLinkFeatures) _then;

/// Create a copy of DisplayExternalLinkFeatures
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isActive = null,Object? link = null,Object? isAllow = null,}) {
  return _then(_self.copyWith(
isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,link: null == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String,isAllow: null == isAllow ? _self.isAllow : isAllow // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [DisplayExternalLinkFeatures].
extension DisplayExternalLinkFeaturesPatterns on DisplayExternalLinkFeatures {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DisplayExternalLinkFeatures value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DisplayExternalLinkFeatures() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DisplayExternalLinkFeatures value)  $default,){
final _that = this;
switch (_that) {
case _DisplayExternalLinkFeatures():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DisplayExternalLinkFeatures value)?  $default,){
final _that = this;
switch (_that) {
case _DisplayExternalLinkFeatures() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isActive,  String link,  bool isAllow)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DisplayExternalLinkFeatures() when $default != null:
return $default(_that.isActive,_that.link,_that.isAllow);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isActive,  String link,  bool isAllow)  $default,) {final _that = this;
switch (_that) {
case _DisplayExternalLinkFeatures():
return $default(_that.isActive,_that.link,_that.isAllow);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isActive,  String link,  bool isAllow)?  $default,) {final _that = this;
switch (_that) {
case _DisplayExternalLinkFeatures() when $default != null:
return $default(_that.isActive,_that.link,_that.isAllow);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DisplayExternalLinkFeatures implements DisplayExternalLinkFeatures {
  const _DisplayExternalLinkFeatures({this.isActive = false, this.link = '', this.isAllow = false});
  factory _DisplayExternalLinkFeatures.fromJson(Map<String, dynamic> json) => _$DisplayExternalLinkFeaturesFromJson(json);

@override@JsonKey() final  bool isActive;
@override@JsonKey() final  String link;
@override@JsonKey() final  bool isAllow;

/// Create a copy of DisplayExternalLinkFeatures
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DisplayExternalLinkFeaturesCopyWith<_DisplayExternalLinkFeatures> get copyWith => __$DisplayExternalLinkFeaturesCopyWithImpl<_DisplayExternalLinkFeatures>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DisplayExternalLinkFeaturesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DisplayExternalLinkFeatures&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.link, link) || other.link == link)&&(identical(other.isAllow, isAllow) || other.isAllow == isAllow));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isActive,link,isAllow);

@override
String toString() {
  return 'DisplayExternalLinkFeatures(isActive: $isActive, link: $link, isAllow: $isAllow)';
}


}

/// @nodoc
abstract mixin class _$DisplayExternalLinkFeaturesCopyWith<$Res> implements $DisplayExternalLinkFeaturesCopyWith<$Res> {
  factory _$DisplayExternalLinkFeaturesCopyWith(_DisplayExternalLinkFeatures value, $Res Function(_DisplayExternalLinkFeatures) _then) = __$DisplayExternalLinkFeaturesCopyWithImpl;
@override @useResult
$Res call({
 bool isActive, String link, bool isAllow
});




}
/// @nodoc
class __$DisplayExternalLinkFeaturesCopyWithImpl<$Res>
    implements _$DisplayExternalLinkFeaturesCopyWith<$Res> {
  __$DisplayExternalLinkFeaturesCopyWithImpl(this._self, this._then);

  final _DisplayExternalLinkFeatures _self;
  final $Res Function(_DisplayExternalLinkFeatures) _then;

/// Create a copy of DisplayExternalLinkFeatures
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isActive = null,Object? link = null,Object? isAllow = null,}) {
  return _then(_DisplayExternalLinkFeatures(
isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,link: null == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String,isAllow: null == isAllow ? _self.isAllow : isAllow // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$WhiteboardFeatures {

 String get preloadFile; String get fileName; String get whiteboardFileId; String get filePath; int get totalPages;
/// Create a copy of WhiteboardFeatures
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WhiteboardFeaturesCopyWith<WhiteboardFeatures> get copyWith => _$WhiteboardFeaturesCopyWithImpl<WhiteboardFeatures>(this as WhiteboardFeatures, _$identity);

  /// Serializes this WhiteboardFeatures to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WhiteboardFeatures&&(identical(other.preloadFile, preloadFile) || other.preloadFile == preloadFile)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.whiteboardFileId, whiteboardFileId) || other.whiteboardFileId == whiteboardFileId)&&(identical(other.filePath, filePath) || other.filePath == filePath)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,preloadFile,fileName,whiteboardFileId,filePath,totalPages);

@override
String toString() {
  return 'WhiteboardFeatures(preloadFile: $preloadFile, fileName: $fileName, whiteboardFileId: $whiteboardFileId, filePath: $filePath, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class $WhiteboardFeaturesCopyWith<$Res>  {
  factory $WhiteboardFeaturesCopyWith(WhiteboardFeatures value, $Res Function(WhiteboardFeatures) _then) = _$WhiteboardFeaturesCopyWithImpl;
@useResult
$Res call({
 String preloadFile, String fileName, String whiteboardFileId, String filePath, int totalPages
});




}
/// @nodoc
class _$WhiteboardFeaturesCopyWithImpl<$Res>
    implements $WhiteboardFeaturesCopyWith<$Res> {
  _$WhiteboardFeaturesCopyWithImpl(this._self, this._then);

  final WhiteboardFeatures _self;
  final $Res Function(WhiteboardFeatures) _then;

/// Create a copy of WhiteboardFeatures
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? preloadFile = null,Object? fileName = null,Object? whiteboardFileId = null,Object? filePath = null,Object? totalPages = null,}) {
  return _then(_self.copyWith(
preloadFile: null == preloadFile ? _self.preloadFile : preloadFile // ignore: cast_nullable_to_non_nullable
as String,fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,whiteboardFileId: null == whiteboardFileId ? _self.whiteboardFileId : whiteboardFileId // ignore: cast_nullable_to_non_nullable
as String,filePath: null == filePath ? _self.filePath : filePath // ignore: cast_nullable_to_non_nullable
as String,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [WhiteboardFeatures].
extension WhiteboardFeaturesPatterns on WhiteboardFeatures {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WhiteboardFeatures value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WhiteboardFeatures() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WhiteboardFeatures value)  $default,){
final _that = this;
switch (_that) {
case _WhiteboardFeatures():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WhiteboardFeatures value)?  $default,){
final _that = this;
switch (_that) {
case _WhiteboardFeatures() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String preloadFile,  String fileName,  String whiteboardFileId,  String filePath,  int totalPages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WhiteboardFeatures() when $default != null:
return $default(_that.preloadFile,_that.fileName,_that.whiteboardFileId,_that.filePath,_that.totalPages);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String preloadFile,  String fileName,  String whiteboardFileId,  String filePath,  int totalPages)  $default,) {final _that = this;
switch (_that) {
case _WhiteboardFeatures():
return $default(_that.preloadFile,_that.fileName,_that.whiteboardFileId,_that.filePath,_that.totalPages);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String preloadFile,  String fileName,  String whiteboardFileId,  String filePath,  int totalPages)?  $default,) {final _that = this;
switch (_that) {
case _WhiteboardFeatures() when $default != null:
return $default(_that.preloadFile,_that.fileName,_that.whiteboardFileId,_that.filePath,_that.totalPages);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WhiteboardFeatures implements WhiteboardFeatures {
  const _WhiteboardFeatures({this.preloadFile = '', this.fileName = '', this.whiteboardFileId = '', this.filePath = '', this.totalPages = 0});
  factory _WhiteboardFeatures.fromJson(Map<String, dynamic> json) => _$WhiteboardFeaturesFromJson(json);

@override@JsonKey() final  String preloadFile;
@override@JsonKey() final  String fileName;
@override@JsonKey() final  String whiteboardFileId;
@override@JsonKey() final  String filePath;
@override@JsonKey() final  int totalPages;

/// Create a copy of WhiteboardFeatures
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WhiteboardFeaturesCopyWith<_WhiteboardFeatures> get copyWith => __$WhiteboardFeaturesCopyWithImpl<_WhiteboardFeatures>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WhiteboardFeaturesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WhiteboardFeatures&&(identical(other.preloadFile, preloadFile) || other.preloadFile == preloadFile)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.whiteboardFileId, whiteboardFileId) || other.whiteboardFileId == whiteboardFileId)&&(identical(other.filePath, filePath) || other.filePath == filePath)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,preloadFile,fileName,whiteboardFileId,filePath,totalPages);

@override
String toString() {
  return 'WhiteboardFeatures(preloadFile: $preloadFile, fileName: $fileName, whiteboardFileId: $whiteboardFileId, filePath: $filePath, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class _$WhiteboardFeaturesCopyWith<$Res> implements $WhiteboardFeaturesCopyWith<$Res> {
  factory _$WhiteboardFeaturesCopyWith(_WhiteboardFeatures value, $Res Function(_WhiteboardFeatures) _then) = __$WhiteboardFeaturesCopyWithImpl;
@override @useResult
$Res call({
 String preloadFile, String fileName, String whiteboardFileId, String filePath, int totalPages
});




}
/// @nodoc
class __$WhiteboardFeaturesCopyWithImpl<$Res>
    implements _$WhiteboardFeaturesCopyWith<$Res> {
  __$WhiteboardFeaturesCopyWithImpl(this._self, this._then);

  final _WhiteboardFeatures _self;
  final $Res Function(_WhiteboardFeatures) _then;

/// Create a copy of WhiteboardFeatures
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? preloadFile = null,Object? fileName = null,Object? whiteboardFileId = null,Object? filePath = null,Object? totalPages = null,}) {
  return _then(_WhiteboardFeatures(
preloadFile: null == preloadFile ? _self.preloadFile : preloadFile // ignore: cast_nullable_to_non_nullable
as String,fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,whiteboardFileId: null == whiteboardFileId ? _self.whiteboardFileId : whiteboardFileId // ignore: cast_nullable_to_non_nullable
as String,filePath: null == filePath ? _self.filePath : filePath // ignore: cast_nullable_to_non_nullable
as String,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
