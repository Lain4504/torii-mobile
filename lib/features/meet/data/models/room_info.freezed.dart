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
mixin _$BreakoutRoomFeatures {

/// Khớp server/web `roomFeatures.breakoutRoomFeatures.isAllow`
 bool get isAllow;/// Khớp server/web `roomFeatures.breakoutRoomFeatures.allowedNumberRooms`
 int get allowedNumberRooms; bool get isActive;
/// Create a copy of BreakoutRoomFeatures
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BreakoutRoomFeaturesCopyWith<BreakoutRoomFeatures> get copyWith => _$BreakoutRoomFeaturesCopyWithImpl<BreakoutRoomFeatures>(this as BreakoutRoomFeatures, _$identity);

  /// Serializes this BreakoutRoomFeatures to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BreakoutRoomFeatures&&(identical(other.isAllow, isAllow) || other.isAllow == isAllow)&&(identical(other.allowedNumberRooms, allowedNumberRooms) || other.allowedNumberRooms == allowedNumberRooms)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isAllow,allowedNumberRooms,isActive);

@override
String toString() {
  return 'BreakoutRoomFeatures(isAllow: $isAllow, allowedNumberRooms: $allowedNumberRooms, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class $BreakoutRoomFeaturesCopyWith<$Res>  {
  factory $BreakoutRoomFeaturesCopyWith(BreakoutRoomFeatures value, $Res Function(BreakoutRoomFeatures) _then) = _$BreakoutRoomFeaturesCopyWithImpl;
@useResult
$Res call({
 bool isAllow, int allowedNumberRooms, bool isActive
});




}
/// @nodoc
class _$BreakoutRoomFeaturesCopyWithImpl<$Res>
    implements $BreakoutRoomFeaturesCopyWith<$Res> {
  _$BreakoutRoomFeaturesCopyWithImpl(this._self, this._then);

  final BreakoutRoomFeatures _self;
  final $Res Function(BreakoutRoomFeatures) _then;

/// Create a copy of BreakoutRoomFeatures
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isAllow = null,Object? allowedNumberRooms = null,Object? isActive = null,}) {
  return _then(_self.copyWith(
isAllow: null == isAllow ? _self.isAllow : isAllow // ignore: cast_nullable_to_non_nullable
as bool,allowedNumberRooms: null == allowedNumberRooms ? _self.allowedNumberRooms : allowedNumberRooms // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [BreakoutRoomFeatures].
extension BreakoutRoomFeaturesPatterns on BreakoutRoomFeatures {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BreakoutRoomFeatures value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BreakoutRoomFeatures() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BreakoutRoomFeatures value)  $default,){
final _that = this;
switch (_that) {
case _BreakoutRoomFeatures():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BreakoutRoomFeatures value)?  $default,){
final _that = this;
switch (_that) {
case _BreakoutRoomFeatures() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isAllow,  int allowedNumberRooms,  bool isActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BreakoutRoomFeatures() when $default != null:
return $default(_that.isAllow,_that.allowedNumberRooms,_that.isActive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isAllow,  int allowedNumberRooms,  bool isActive)  $default,) {final _that = this;
switch (_that) {
case _BreakoutRoomFeatures():
return $default(_that.isAllow,_that.allowedNumberRooms,_that.isActive);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isAllow,  int allowedNumberRooms,  bool isActive)?  $default,) {final _that = this;
switch (_that) {
case _BreakoutRoomFeatures() when $default != null:
return $default(_that.isAllow,_that.allowedNumberRooms,_that.isActive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BreakoutRoomFeatures implements BreakoutRoomFeatures {
  const _BreakoutRoomFeatures({this.isAllow = false, this.allowedNumberRooms = 0, this.isActive = false});
  factory _BreakoutRoomFeatures.fromJson(Map<String, dynamic> json) => _$BreakoutRoomFeaturesFromJson(json);

/// Khớp server/web `roomFeatures.breakoutRoomFeatures.isAllow`
@override@JsonKey() final  bool isAllow;
/// Khớp server/web `roomFeatures.breakoutRoomFeatures.allowedNumberRooms`
@override@JsonKey() final  int allowedNumberRooms;
@override@JsonKey() final  bool isActive;

/// Create a copy of BreakoutRoomFeatures
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BreakoutRoomFeaturesCopyWith<_BreakoutRoomFeatures> get copyWith => __$BreakoutRoomFeaturesCopyWithImpl<_BreakoutRoomFeatures>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BreakoutRoomFeaturesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BreakoutRoomFeatures&&(identical(other.isAllow, isAllow) || other.isAllow == isAllow)&&(identical(other.allowedNumberRooms, allowedNumberRooms) || other.allowedNumberRooms == allowedNumberRooms)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isAllow,allowedNumberRooms,isActive);

@override
String toString() {
  return 'BreakoutRoomFeatures(isAllow: $isAllow, allowedNumberRooms: $allowedNumberRooms, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$BreakoutRoomFeaturesCopyWith<$Res> implements $BreakoutRoomFeaturesCopyWith<$Res> {
  factory _$BreakoutRoomFeaturesCopyWith(_BreakoutRoomFeatures value, $Res Function(_BreakoutRoomFeatures) _then) = __$BreakoutRoomFeaturesCopyWithImpl;
@override @useResult
$Res call({
 bool isAllow, int allowedNumberRooms, bool isActive
});




}
/// @nodoc
class __$BreakoutRoomFeaturesCopyWithImpl<$Res>
    implements _$BreakoutRoomFeaturesCopyWith<$Res> {
  __$BreakoutRoomFeaturesCopyWithImpl(this._self, this._then);

  final _BreakoutRoomFeatures _self;
  final $Res Function(_BreakoutRoomFeatures) _then;

/// Create a copy of BreakoutRoomFeatures
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isAllow = null,Object? allowedNumberRooms = null,Object? isActive = null,}) {
  return _then(_BreakoutRoomFeatures(
isAllow: null == isAllow ? _self.isAllow : isAllow // ignore: cast_nullable_to_non_nullable
as bool,allowedNumberRooms: null == allowedNumberRooms ? _self.allowedNumberRooms : allowedNumberRooms // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$ChatFeatures {

 bool get isAllow; bool get isAllowFileUpload; List<String> get allowedFileTypes; int get maxFileSize;
/// Create a copy of ChatFeatures
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatFeaturesCopyWith<ChatFeatures> get copyWith => _$ChatFeaturesCopyWithImpl<ChatFeatures>(this as ChatFeatures, _$identity);

  /// Serializes this ChatFeatures to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatFeatures&&(identical(other.isAllow, isAllow) || other.isAllow == isAllow)&&(identical(other.isAllowFileUpload, isAllowFileUpload) || other.isAllowFileUpload == isAllowFileUpload)&&const DeepCollectionEquality().equals(other.allowedFileTypes, allowedFileTypes)&&(identical(other.maxFileSize, maxFileSize) || other.maxFileSize == maxFileSize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isAllow,isAllowFileUpload,const DeepCollectionEquality().hash(allowedFileTypes),maxFileSize);

@override
String toString() {
  return 'ChatFeatures(isAllow: $isAllow, isAllowFileUpload: $isAllowFileUpload, allowedFileTypes: $allowedFileTypes, maxFileSize: $maxFileSize)';
}


}

/// @nodoc
abstract mixin class $ChatFeaturesCopyWith<$Res>  {
  factory $ChatFeaturesCopyWith(ChatFeatures value, $Res Function(ChatFeatures) _then) = _$ChatFeaturesCopyWithImpl;
@useResult
$Res call({
 bool isAllow, bool isAllowFileUpload, List<String> allowedFileTypes, int maxFileSize
});




}
/// @nodoc
class _$ChatFeaturesCopyWithImpl<$Res>
    implements $ChatFeaturesCopyWith<$Res> {
  _$ChatFeaturesCopyWithImpl(this._self, this._then);

  final ChatFeatures _self;
  final $Res Function(ChatFeatures) _then;

/// Create a copy of ChatFeatures
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isAllow = null,Object? isAllowFileUpload = null,Object? allowedFileTypes = null,Object? maxFileSize = null,}) {
  return _then(_self.copyWith(
isAllow: null == isAllow ? _self.isAllow : isAllow // ignore: cast_nullable_to_non_nullable
as bool,isAllowFileUpload: null == isAllowFileUpload ? _self.isAllowFileUpload : isAllowFileUpload // ignore: cast_nullable_to_non_nullable
as bool,allowedFileTypes: null == allowedFileTypes ? _self.allowedFileTypes : allowedFileTypes // ignore: cast_nullable_to_non_nullable
as List<String>,maxFileSize: null == maxFileSize ? _self.maxFileSize : maxFileSize // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatFeatures].
extension ChatFeaturesPatterns on ChatFeatures {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatFeatures value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatFeatures() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatFeatures value)  $default,){
final _that = this;
switch (_that) {
case _ChatFeatures():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatFeatures value)?  $default,){
final _that = this;
switch (_that) {
case _ChatFeatures() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isAllow,  bool isAllowFileUpload,  List<String> allowedFileTypes,  int maxFileSize)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatFeatures() when $default != null:
return $default(_that.isAllow,_that.isAllowFileUpload,_that.allowedFileTypes,_that.maxFileSize);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isAllow,  bool isAllowFileUpload,  List<String> allowedFileTypes,  int maxFileSize)  $default,) {final _that = this;
switch (_that) {
case _ChatFeatures():
return $default(_that.isAllow,_that.isAllowFileUpload,_that.allowedFileTypes,_that.maxFileSize);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isAllow,  bool isAllowFileUpload,  List<String> allowedFileTypes,  int maxFileSize)?  $default,) {final _that = this;
switch (_that) {
case _ChatFeatures() when $default != null:
return $default(_that.isAllow,_that.isAllowFileUpload,_that.allowedFileTypes,_that.maxFileSize);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatFeatures implements ChatFeatures {
  const _ChatFeatures({this.isAllow = true, this.isAllowFileUpload = true, final  List<String> allowedFileTypes = const [], this.maxFileSize = 0}): _allowedFileTypes = allowedFileTypes;
  factory _ChatFeatures.fromJson(Map<String, dynamic> json) => _$ChatFeaturesFromJson(json);

@override@JsonKey() final  bool isAllow;
@override@JsonKey() final  bool isAllowFileUpload;
 final  List<String> _allowedFileTypes;
@override@JsonKey() List<String> get allowedFileTypes {
  if (_allowedFileTypes is EqualUnmodifiableListView) return _allowedFileTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allowedFileTypes);
}

@override@JsonKey() final  int maxFileSize;

/// Create a copy of ChatFeatures
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatFeaturesCopyWith<_ChatFeatures> get copyWith => __$ChatFeaturesCopyWithImpl<_ChatFeatures>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatFeaturesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatFeatures&&(identical(other.isAllow, isAllow) || other.isAllow == isAllow)&&(identical(other.isAllowFileUpload, isAllowFileUpload) || other.isAllowFileUpload == isAllowFileUpload)&&const DeepCollectionEquality().equals(other._allowedFileTypes, _allowedFileTypes)&&(identical(other.maxFileSize, maxFileSize) || other.maxFileSize == maxFileSize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isAllow,isAllowFileUpload,const DeepCollectionEquality().hash(_allowedFileTypes),maxFileSize);

@override
String toString() {
  return 'ChatFeatures(isAllow: $isAllow, isAllowFileUpload: $isAllowFileUpload, allowedFileTypes: $allowedFileTypes, maxFileSize: $maxFileSize)';
}


}

/// @nodoc
abstract mixin class _$ChatFeaturesCopyWith<$Res> implements $ChatFeaturesCopyWith<$Res> {
  factory _$ChatFeaturesCopyWith(_ChatFeatures value, $Res Function(_ChatFeatures) _then) = __$ChatFeaturesCopyWithImpl;
@override @useResult
$Res call({
 bool isAllow, bool isAllowFileUpload, List<String> allowedFileTypes, int maxFileSize
});




}
/// @nodoc
class __$ChatFeaturesCopyWithImpl<$Res>
    implements _$ChatFeaturesCopyWith<$Res> {
  __$ChatFeaturesCopyWithImpl(this._self, this._then);

  final _ChatFeatures _self;
  final $Res Function(_ChatFeatures) _then;

/// Create a copy of ChatFeatures
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isAllow = null,Object? isAllowFileUpload = null,Object? allowedFileTypes = null,Object? maxFileSize = null,}) {
  return _then(_ChatFeatures(
isAllow: null == isAllow ? _self.isAllow : isAllow // ignore: cast_nullable_to_non_nullable
as bool,isAllowFileUpload: null == isAllowFileUpload ? _self.isAllowFileUpload : isAllowFileUpload // ignore: cast_nullable_to_non_nullable
as bool,allowedFileTypes: null == allowedFileTypes ? _self._allowedFileTypes : allowedFileTypes // ignore: cast_nullable_to_non_nullable
as List<String>,maxFileSize: null == maxFileSize ? _self.maxFileSize : maxFileSize // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$RoomFeatures {

 WhiteboardFeatures? get whiteboardFeatures; bool get chat; bool get whiteboard; ExternalMediaPlayerFeatures? get externalMediaPlayerFeatures; DisplayExternalLinkFeatures? get displayExternalLinkFeatures; BreakoutRoomFeatures? get breakoutRoomFeatures; ChatFeatures? get chatFeatures;// Common missing fields
 bool get allowWebcams; bool get adminOnlyWebcams; bool get allowScreenShare; bool get allowViewOtherWebcams; bool get allowViewOtherUsersList; bool get allowRaiseHand; bool get muteOnStart;
/// Create a copy of RoomFeatures
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoomFeaturesCopyWith<RoomFeatures> get copyWith => _$RoomFeaturesCopyWithImpl<RoomFeatures>(this as RoomFeatures, _$identity);

  /// Serializes this RoomFeatures to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoomFeatures&&(identical(other.whiteboardFeatures, whiteboardFeatures) || other.whiteboardFeatures == whiteboardFeatures)&&(identical(other.chat, chat) || other.chat == chat)&&(identical(other.whiteboard, whiteboard) || other.whiteboard == whiteboard)&&(identical(other.externalMediaPlayerFeatures, externalMediaPlayerFeatures) || other.externalMediaPlayerFeatures == externalMediaPlayerFeatures)&&(identical(other.displayExternalLinkFeatures, displayExternalLinkFeatures) || other.displayExternalLinkFeatures == displayExternalLinkFeatures)&&(identical(other.breakoutRoomFeatures, breakoutRoomFeatures) || other.breakoutRoomFeatures == breakoutRoomFeatures)&&(identical(other.chatFeatures, chatFeatures) || other.chatFeatures == chatFeatures)&&(identical(other.allowWebcams, allowWebcams) || other.allowWebcams == allowWebcams)&&(identical(other.adminOnlyWebcams, adminOnlyWebcams) || other.adminOnlyWebcams == adminOnlyWebcams)&&(identical(other.allowScreenShare, allowScreenShare) || other.allowScreenShare == allowScreenShare)&&(identical(other.allowViewOtherWebcams, allowViewOtherWebcams) || other.allowViewOtherWebcams == allowViewOtherWebcams)&&(identical(other.allowViewOtherUsersList, allowViewOtherUsersList) || other.allowViewOtherUsersList == allowViewOtherUsersList)&&(identical(other.allowRaiseHand, allowRaiseHand) || other.allowRaiseHand == allowRaiseHand)&&(identical(other.muteOnStart, muteOnStart) || other.muteOnStart == muteOnStart));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,whiteboardFeatures,chat,whiteboard,externalMediaPlayerFeatures,displayExternalLinkFeatures,breakoutRoomFeatures,chatFeatures,allowWebcams,adminOnlyWebcams,allowScreenShare,allowViewOtherWebcams,allowViewOtherUsersList,allowRaiseHand,muteOnStart);

@override
String toString() {
  return 'RoomFeatures(whiteboardFeatures: $whiteboardFeatures, chat: $chat, whiteboard: $whiteboard, externalMediaPlayerFeatures: $externalMediaPlayerFeatures, displayExternalLinkFeatures: $displayExternalLinkFeatures, breakoutRoomFeatures: $breakoutRoomFeatures, chatFeatures: $chatFeatures, allowWebcams: $allowWebcams, adminOnlyWebcams: $adminOnlyWebcams, allowScreenShare: $allowScreenShare, allowViewOtherWebcams: $allowViewOtherWebcams, allowViewOtherUsersList: $allowViewOtherUsersList, allowRaiseHand: $allowRaiseHand, muteOnStart: $muteOnStart)';
}


}

/// @nodoc
abstract mixin class $RoomFeaturesCopyWith<$Res>  {
  factory $RoomFeaturesCopyWith(RoomFeatures value, $Res Function(RoomFeatures) _then) = _$RoomFeaturesCopyWithImpl;
@useResult
$Res call({
 WhiteboardFeatures? whiteboardFeatures, bool chat, bool whiteboard, ExternalMediaPlayerFeatures? externalMediaPlayerFeatures, DisplayExternalLinkFeatures? displayExternalLinkFeatures, BreakoutRoomFeatures? breakoutRoomFeatures, ChatFeatures? chatFeatures, bool allowWebcams, bool adminOnlyWebcams, bool allowScreenShare, bool allowViewOtherWebcams, bool allowViewOtherUsersList, bool allowRaiseHand, bool muteOnStart
});


$WhiteboardFeaturesCopyWith<$Res>? get whiteboardFeatures;$ExternalMediaPlayerFeaturesCopyWith<$Res>? get externalMediaPlayerFeatures;$DisplayExternalLinkFeaturesCopyWith<$Res>? get displayExternalLinkFeatures;$BreakoutRoomFeaturesCopyWith<$Res>? get breakoutRoomFeatures;$ChatFeaturesCopyWith<$Res>? get chatFeatures;

}
/// @nodoc
class _$RoomFeaturesCopyWithImpl<$Res>
    implements $RoomFeaturesCopyWith<$Res> {
  _$RoomFeaturesCopyWithImpl(this._self, this._then);

  final RoomFeatures _self;
  final $Res Function(RoomFeatures) _then;

/// Create a copy of RoomFeatures
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? whiteboardFeatures = freezed,Object? chat = null,Object? whiteboard = null,Object? externalMediaPlayerFeatures = freezed,Object? displayExternalLinkFeatures = freezed,Object? breakoutRoomFeatures = freezed,Object? chatFeatures = freezed,Object? allowWebcams = null,Object? adminOnlyWebcams = null,Object? allowScreenShare = null,Object? allowViewOtherWebcams = null,Object? allowViewOtherUsersList = null,Object? allowRaiseHand = null,Object? muteOnStart = null,}) {
  return _then(_self.copyWith(
whiteboardFeatures: freezed == whiteboardFeatures ? _self.whiteboardFeatures : whiteboardFeatures // ignore: cast_nullable_to_non_nullable
as WhiteboardFeatures?,chat: null == chat ? _self.chat : chat // ignore: cast_nullable_to_non_nullable
as bool,whiteboard: null == whiteboard ? _self.whiteboard : whiteboard // ignore: cast_nullable_to_non_nullable
as bool,externalMediaPlayerFeatures: freezed == externalMediaPlayerFeatures ? _self.externalMediaPlayerFeatures : externalMediaPlayerFeatures // ignore: cast_nullable_to_non_nullable
as ExternalMediaPlayerFeatures?,displayExternalLinkFeatures: freezed == displayExternalLinkFeatures ? _self.displayExternalLinkFeatures : displayExternalLinkFeatures // ignore: cast_nullable_to_non_nullable
as DisplayExternalLinkFeatures?,breakoutRoomFeatures: freezed == breakoutRoomFeatures ? _self.breakoutRoomFeatures : breakoutRoomFeatures // ignore: cast_nullable_to_non_nullable
as BreakoutRoomFeatures?,chatFeatures: freezed == chatFeatures ? _self.chatFeatures : chatFeatures // ignore: cast_nullable_to_non_nullable
as ChatFeatures?,allowWebcams: null == allowWebcams ? _self.allowWebcams : allowWebcams // ignore: cast_nullable_to_non_nullable
as bool,adminOnlyWebcams: null == adminOnlyWebcams ? _self.adminOnlyWebcams : adminOnlyWebcams // ignore: cast_nullable_to_non_nullable
as bool,allowScreenShare: null == allowScreenShare ? _self.allowScreenShare : allowScreenShare // ignore: cast_nullable_to_non_nullable
as bool,allowViewOtherWebcams: null == allowViewOtherWebcams ? _self.allowViewOtherWebcams : allowViewOtherWebcams // ignore: cast_nullable_to_non_nullable
as bool,allowViewOtherUsersList: null == allowViewOtherUsersList ? _self.allowViewOtherUsersList : allowViewOtherUsersList // ignore: cast_nullable_to_non_nullable
as bool,allowRaiseHand: null == allowRaiseHand ? _self.allowRaiseHand : allowRaiseHand // ignore: cast_nullable_to_non_nullable
as bool,muteOnStart: null == muteOnStart ? _self.muteOnStart : muteOnStart // ignore: cast_nullable_to_non_nullable
as bool,
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
}/// Create a copy of RoomFeatures
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BreakoutRoomFeaturesCopyWith<$Res>? get breakoutRoomFeatures {
    if (_self.breakoutRoomFeatures == null) {
    return null;
  }

  return $BreakoutRoomFeaturesCopyWith<$Res>(_self.breakoutRoomFeatures!, (value) {
    return _then(_self.copyWith(breakoutRoomFeatures: value));
  });
}/// Create a copy of RoomFeatures
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatFeaturesCopyWith<$Res>? get chatFeatures {
    if (_self.chatFeatures == null) {
    return null;
  }

  return $ChatFeaturesCopyWith<$Res>(_self.chatFeatures!, (value) {
    return _then(_self.copyWith(chatFeatures: value));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( WhiteboardFeatures? whiteboardFeatures,  bool chat,  bool whiteboard,  ExternalMediaPlayerFeatures? externalMediaPlayerFeatures,  DisplayExternalLinkFeatures? displayExternalLinkFeatures,  BreakoutRoomFeatures? breakoutRoomFeatures,  ChatFeatures? chatFeatures,  bool allowWebcams,  bool adminOnlyWebcams,  bool allowScreenShare,  bool allowViewOtherWebcams,  bool allowViewOtherUsersList,  bool allowRaiseHand,  bool muteOnStart)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoomFeatures() when $default != null:
return $default(_that.whiteboardFeatures,_that.chat,_that.whiteboard,_that.externalMediaPlayerFeatures,_that.displayExternalLinkFeatures,_that.breakoutRoomFeatures,_that.chatFeatures,_that.allowWebcams,_that.adminOnlyWebcams,_that.allowScreenShare,_that.allowViewOtherWebcams,_that.allowViewOtherUsersList,_that.allowRaiseHand,_that.muteOnStart);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( WhiteboardFeatures? whiteboardFeatures,  bool chat,  bool whiteboard,  ExternalMediaPlayerFeatures? externalMediaPlayerFeatures,  DisplayExternalLinkFeatures? displayExternalLinkFeatures,  BreakoutRoomFeatures? breakoutRoomFeatures,  ChatFeatures? chatFeatures,  bool allowWebcams,  bool adminOnlyWebcams,  bool allowScreenShare,  bool allowViewOtherWebcams,  bool allowViewOtherUsersList,  bool allowRaiseHand,  bool muteOnStart)  $default,) {final _that = this;
switch (_that) {
case _RoomFeatures():
return $default(_that.whiteboardFeatures,_that.chat,_that.whiteboard,_that.externalMediaPlayerFeatures,_that.displayExternalLinkFeatures,_that.breakoutRoomFeatures,_that.chatFeatures,_that.allowWebcams,_that.adminOnlyWebcams,_that.allowScreenShare,_that.allowViewOtherWebcams,_that.allowViewOtherUsersList,_that.allowRaiseHand,_that.muteOnStart);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( WhiteboardFeatures? whiteboardFeatures,  bool chat,  bool whiteboard,  ExternalMediaPlayerFeatures? externalMediaPlayerFeatures,  DisplayExternalLinkFeatures? displayExternalLinkFeatures,  BreakoutRoomFeatures? breakoutRoomFeatures,  ChatFeatures? chatFeatures,  bool allowWebcams,  bool adminOnlyWebcams,  bool allowScreenShare,  bool allowViewOtherWebcams,  bool allowViewOtherUsersList,  bool allowRaiseHand,  bool muteOnStart)?  $default,) {final _that = this;
switch (_that) {
case _RoomFeatures() when $default != null:
return $default(_that.whiteboardFeatures,_that.chat,_that.whiteboard,_that.externalMediaPlayerFeatures,_that.displayExternalLinkFeatures,_that.breakoutRoomFeatures,_that.chatFeatures,_that.allowWebcams,_that.adminOnlyWebcams,_that.allowScreenShare,_that.allowViewOtherWebcams,_that.allowViewOtherUsersList,_that.allowRaiseHand,_that.muteOnStart);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RoomFeatures implements RoomFeatures {
  const _RoomFeatures({this.whiteboardFeatures, this.chat = false, this.whiteboard = false, this.externalMediaPlayerFeatures, this.displayExternalLinkFeatures, this.breakoutRoomFeatures, this.chatFeatures, this.allowWebcams = true, this.adminOnlyWebcams = false, this.allowScreenShare = true, this.allowViewOtherWebcams = true, this.allowViewOtherUsersList = true, this.allowRaiseHand = true, this.muteOnStart = false});
  factory _RoomFeatures.fromJson(Map<String, dynamic> json) => _$RoomFeaturesFromJson(json);

@override final  WhiteboardFeatures? whiteboardFeatures;
@override@JsonKey() final  bool chat;
@override@JsonKey() final  bool whiteboard;
@override final  ExternalMediaPlayerFeatures? externalMediaPlayerFeatures;
@override final  DisplayExternalLinkFeatures? displayExternalLinkFeatures;
@override final  BreakoutRoomFeatures? breakoutRoomFeatures;
@override final  ChatFeatures? chatFeatures;
// Common missing fields
@override@JsonKey() final  bool allowWebcams;
@override@JsonKey() final  bool adminOnlyWebcams;
@override@JsonKey() final  bool allowScreenShare;
@override@JsonKey() final  bool allowViewOtherWebcams;
@override@JsonKey() final  bool allowViewOtherUsersList;
@override@JsonKey() final  bool allowRaiseHand;
@override@JsonKey() final  bool muteOnStart;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoomFeatures&&(identical(other.whiteboardFeatures, whiteboardFeatures) || other.whiteboardFeatures == whiteboardFeatures)&&(identical(other.chat, chat) || other.chat == chat)&&(identical(other.whiteboard, whiteboard) || other.whiteboard == whiteboard)&&(identical(other.externalMediaPlayerFeatures, externalMediaPlayerFeatures) || other.externalMediaPlayerFeatures == externalMediaPlayerFeatures)&&(identical(other.displayExternalLinkFeatures, displayExternalLinkFeatures) || other.displayExternalLinkFeatures == displayExternalLinkFeatures)&&(identical(other.breakoutRoomFeatures, breakoutRoomFeatures) || other.breakoutRoomFeatures == breakoutRoomFeatures)&&(identical(other.chatFeatures, chatFeatures) || other.chatFeatures == chatFeatures)&&(identical(other.allowWebcams, allowWebcams) || other.allowWebcams == allowWebcams)&&(identical(other.adminOnlyWebcams, adminOnlyWebcams) || other.adminOnlyWebcams == adminOnlyWebcams)&&(identical(other.allowScreenShare, allowScreenShare) || other.allowScreenShare == allowScreenShare)&&(identical(other.allowViewOtherWebcams, allowViewOtherWebcams) || other.allowViewOtherWebcams == allowViewOtherWebcams)&&(identical(other.allowViewOtherUsersList, allowViewOtherUsersList) || other.allowViewOtherUsersList == allowViewOtherUsersList)&&(identical(other.allowRaiseHand, allowRaiseHand) || other.allowRaiseHand == allowRaiseHand)&&(identical(other.muteOnStart, muteOnStart) || other.muteOnStart == muteOnStart));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,whiteboardFeatures,chat,whiteboard,externalMediaPlayerFeatures,displayExternalLinkFeatures,breakoutRoomFeatures,chatFeatures,allowWebcams,adminOnlyWebcams,allowScreenShare,allowViewOtherWebcams,allowViewOtherUsersList,allowRaiseHand,muteOnStart);

@override
String toString() {
  return 'RoomFeatures(whiteboardFeatures: $whiteboardFeatures, chat: $chat, whiteboard: $whiteboard, externalMediaPlayerFeatures: $externalMediaPlayerFeatures, displayExternalLinkFeatures: $displayExternalLinkFeatures, breakoutRoomFeatures: $breakoutRoomFeatures, chatFeatures: $chatFeatures, allowWebcams: $allowWebcams, adminOnlyWebcams: $adminOnlyWebcams, allowScreenShare: $allowScreenShare, allowViewOtherWebcams: $allowViewOtherWebcams, allowViewOtherUsersList: $allowViewOtherUsersList, allowRaiseHand: $allowRaiseHand, muteOnStart: $muteOnStart)';
}


}

/// @nodoc
abstract mixin class _$RoomFeaturesCopyWith<$Res> implements $RoomFeaturesCopyWith<$Res> {
  factory _$RoomFeaturesCopyWith(_RoomFeatures value, $Res Function(_RoomFeatures) _then) = __$RoomFeaturesCopyWithImpl;
@override @useResult
$Res call({
 WhiteboardFeatures? whiteboardFeatures, bool chat, bool whiteboard, ExternalMediaPlayerFeatures? externalMediaPlayerFeatures, DisplayExternalLinkFeatures? displayExternalLinkFeatures, BreakoutRoomFeatures? breakoutRoomFeatures, ChatFeatures? chatFeatures, bool allowWebcams, bool adminOnlyWebcams, bool allowScreenShare, bool allowViewOtherWebcams, bool allowViewOtherUsersList, bool allowRaiseHand, bool muteOnStart
});


@override $WhiteboardFeaturesCopyWith<$Res>? get whiteboardFeatures;@override $ExternalMediaPlayerFeaturesCopyWith<$Res>? get externalMediaPlayerFeatures;@override $DisplayExternalLinkFeaturesCopyWith<$Res>? get displayExternalLinkFeatures;@override $BreakoutRoomFeaturesCopyWith<$Res>? get breakoutRoomFeatures;@override $ChatFeaturesCopyWith<$Res>? get chatFeatures;

}
/// @nodoc
class __$RoomFeaturesCopyWithImpl<$Res>
    implements _$RoomFeaturesCopyWith<$Res> {
  __$RoomFeaturesCopyWithImpl(this._self, this._then);

  final _RoomFeatures _self;
  final $Res Function(_RoomFeatures) _then;

/// Create a copy of RoomFeatures
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? whiteboardFeatures = freezed,Object? chat = null,Object? whiteboard = null,Object? externalMediaPlayerFeatures = freezed,Object? displayExternalLinkFeatures = freezed,Object? breakoutRoomFeatures = freezed,Object? chatFeatures = freezed,Object? allowWebcams = null,Object? adminOnlyWebcams = null,Object? allowScreenShare = null,Object? allowViewOtherWebcams = null,Object? allowViewOtherUsersList = null,Object? allowRaiseHand = null,Object? muteOnStart = null,}) {
  return _then(_RoomFeatures(
whiteboardFeatures: freezed == whiteboardFeatures ? _self.whiteboardFeatures : whiteboardFeatures // ignore: cast_nullable_to_non_nullable
as WhiteboardFeatures?,chat: null == chat ? _self.chat : chat // ignore: cast_nullable_to_non_nullable
as bool,whiteboard: null == whiteboard ? _self.whiteboard : whiteboard // ignore: cast_nullable_to_non_nullable
as bool,externalMediaPlayerFeatures: freezed == externalMediaPlayerFeatures ? _self.externalMediaPlayerFeatures : externalMediaPlayerFeatures // ignore: cast_nullable_to_non_nullable
as ExternalMediaPlayerFeatures?,displayExternalLinkFeatures: freezed == displayExternalLinkFeatures ? _self.displayExternalLinkFeatures : displayExternalLinkFeatures // ignore: cast_nullable_to_non_nullable
as DisplayExternalLinkFeatures?,breakoutRoomFeatures: freezed == breakoutRoomFeatures ? _self.breakoutRoomFeatures : breakoutRoomFeatures // ignore: cast_nullable_to_non_nullable
as BreakoutRoomFeatures?,chatFeatures: freezed == chatFeatures ? _self.chatFeatures : chatFeatures // ignore: cast_nullable_to_non_nullable
as ChatFeatures?,allowWebcams: null == allowWebcams ? _self.allowWebcams : allowWebcams // ignore: cast_nullable_to_non_nullable
as bool,adminOnlyWebcams: null == adminOnlyWebcams ? _self.adminOnlyWebcams : adminOnlyWebcams // ignore: cast_nullable_to_non_nullable
as bool,allowScreenShare: null == allowScreenShare ? _self.allowScreenShare : allowScreenShare // ignore: cast_nullable_to_non_nullable
as bool,allowViewOtherWebcams: null == allowViewOtherWebcams ? _self.allowViewOtherWebcams : allowViewOtherWebcams // ignore: cast_nullable_to_non_nullable
as bool,allowViewOtherUsersList: null == allowViewOtherUsersList ? _self.allowViewOtherUsersList : allowViewOtherUsersList // ignore: cast_nullable_to_non_nullable
as bool,allowRaiseHand: null == allowRaiseHand ? _self.allowRaiseHand : allowRaiseHand // ignore: cast_nullable_to_non_nullable
as bool,muteOnStart: null == muteOnStart ? _self.muteOnStart : muteOnStart // ignore: cast_nullable_to_non_nullable
as bool,
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
}/// Create a copy of RoomFeatures
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BreakoutRoomFeaturesCopyWith<$Res>? get breakoutRoomFeatures {
    if (_self.breakoutRoomFeatures == null) {
    return null;
  }

  return $BreakoutRoomFeaturesCopyWith<$Res>(_self.breakoutRoomFeatures!, (value) {
    return _then(_self.copyWith(breakoutRoomFeatures: value));
  });
}/// Create a copy of RoomFeatures
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatFeaturesCopyWith<$Res>? get chatFeatures {
    if (_self.chatFeatures == null) {
    return null;
  }

  return $ChatFeaturesCopyWith<$Res>(_self.chatFeatures!, (value) {
    return _then(_self.copyWith(chatFeatures: value));
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

 String get preloadFile; String get fileName; String get whiteboardFileId; String get filePath; int get totalPages;/// Khớp web `roomFeatures.whiteboardFeatures.visible` — presenter bật/tắt bảng qua API.
 bool get visible; bool get isAllow;
/// Create a copy of WhiteboardFeatures
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WhiteboardFeaturesCopyWith<WhiteboardFeatures> get copyWith => _$WhiteboardFeaturesCopyWithImpl<WhiteboardFeatures>(this as WhiteboardFeatures, _$identity);

  /// Serializes this WhiteboardFeatures to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WhiteboardFeatures&&(identical(other.preloadFile, preloadFile) || other.preloadFile == preloadFile)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.whiteboardFileId, whiteboardFileId) || other.whiteboardFileId == whiteboardFileId)&&(identical(other.filePath, filePath) || other.filePath == filePath)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.visible, visible) || other.visible == visible)&&(identical(other.isAllow, isAllow) || other.isAllow == isAllow));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,preloadFile,fileName,whiteboardFileId,filePath,totalPages,visible,isAllow);

@override
String toString() {
  return 'WhiteboardFeatures(preloadFile: $preloadFile, fileName: $fileName, whiteboardFileId: $whiteboardFileId, filePath: $filePath, totalPages: $totalPages, visible: $visible, isAllow: $isAllow)';
}


}

/// @nodoc
abstract mixin class $WhiteboardFeaturesCopyWith<$Res>  {
  factory $WhiteboardFeaturesCopyWith(WhiteboardFeatures value, $Res Function(WhiteboardFeatures) _then) = _$WhiteboardFeaturesCopyWithImpl;
@useResult
$Res call({
 String preloadFile, String fileName, String whiteboardFileId, String filePath, int totalPages, bool visible, bool isAllow
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
@pragma('vm:prefer-inline') @override $Res call({Object? preloadFile = null,Object? fileName = null,Object? whiteboardFileId = null,Object? filePath = null,Object? totalPages = null,Object? visible = null,Object? isAllow = null,}) {
  return _then(_self.copyWith(
preloadFile: null == preloadFile ? _self.preloadFile : preloadFile // ignore: cast_nullable_to_non_nullable
as String,fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,whiteboardFileId: null == whiteboardFileId ? _self.whiteboardFileId : whiteboardFileId // ignore: cast_nullable_to_non_nullable
as String,filePath: null == filePath ? _self.filePath : filePath // ignore: cast_nullable_to_non_nullable
as String,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,visible: null == visible ? _self.visible : visible // ignore: cast_nullable_to_non_nullable
as bool,isAllow: null == isAllow ? _self.isAllow : isAllow // ignore: cast_nullable_to_non_nullable
as bool,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String preloadFile,  String fileName,  String whiteboardFileId,  String filePath,  int totalPages,  bool visible,  bool isAllow)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WhiteboardFeatures() when $default != null:
return $default(_that.preloadFile,_that.fileName,_that.whiteboardFileId,_that.filePath,_that.totalPages,_that.visible,_that.isAllow);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String preloadFile,  String fileName,  String whiteboardFileId,  String filePath,  int totalPages,  bool visible,  bool isAllow)  $default,) {final _that = this;
switch (_that) {
case _WhiteboardFeatures():
return $default(_that.preloadFile,_that.fileName,_that.whiteboardFileId,_that.filePath,_that.totalPages,_that.visible,_that.isAllow);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String preloadFile,  String fileName,  String whiteboardFileId,  String filePath,  int totalPages,  bool visible,  bool isAllow)?  $default,) {final _that = this;
switch (_that) {
case _WhiteboardFeatures() when $default != null:
return $default(_that.preloadFile,_that.fileName,_that.whiteboardFileId,_that.filePath,_that.totalPages,_that.visible,_that.isAllow);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WhiteboardFeatures implements WhiteboardFeatures {
  const _WhiteboardFeatures({this.preloadFile = '', this.fileName = '', this.whiteboardFileId = '', this.filePath = '', this.totalPages = 0, this.visible = false, this.isAllow = true});
  factory _WhiteboardFeatures.fromJson(Map<String, dynamic> json) => _$WhiteboardFeaturesFromJson(json);

@override@JsonKey() final  String preloadFile;
@override@JsonKey() final  String fileName;
@override@JsonKey() final  String whiteboardFileId;
@override@JsonKey() final  String filePath;
@override@JsonKey() final  int totalPages;
/// Khớp web `roomFeatures.whiteboardFeatures.visible` — presenter bật/tắt bảng qua API.
@override@JsonKey() final  bool visible;
@override@JsonKey() final  bool isAllow;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WhiteboardFeatures&&(identical(other.preloadFile, preloadFile) || other.preloadFile == preloadFile)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.whiteboardFileId, whiteboardFileId) || other.whiteboardFileId == whiteboardFileId)&&(identical(other.filePath, filePath) || other.filePath == filePath)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.visible, visible) || other.visible == visible)&&(identical(other.isAllow, isAllow) || other.isAllow == isAllow));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,preloadFile,fileName,whiteboardFileId,filePath,totalPages,visible,isAllow);

@override
String toString() {
  return 'WhiteboardFeatures(preloadFile: $preloadFile, fileName: $fileName, whiteboardFileId: $whiteboardFileId, filePath: $filePath, totalPages: $totalPages, visible: $visible, isAllow: $isAllow)';
}


}

/// @nodoc
abstract mixin class _$WhiteboardFeaturesCopyWith<$Res> implements $WhiteboardFeaturesCopyWith<$Res> {
  factory _$WhiteboardFeaturesCopyWith(_WhiteboardFeatures value, $Res Function(_WhiteboardFeatures) _then) = __$WhiteboardFeaturesCopyWithImpl;
@override @useResult
$Res call({
 String preloadFile, String fileName, String whiteboardFileId, String filePath, int totalPages, bool visible, bool isAllow
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
@override @pragma('vm:prefer-inline') $Res call({Object? preloadFile = null,Object? fileName = null,Object? whiteboardFileId = null,Object? filePath = null,Object? totalPages = null,Object? visible = null,Object? isAllow = null,}) {
  return _then(_WhiteboardFeatures(
preloadFile: null == preloadFile ? _self.preloadFile : preloadFile // ignore: cast_nullable_to_non_nullable
as String,fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,whiteboardFileId: null == whiteboardFileId ? _self.whiteboardFileId : whiteboardFileId // ignore: cast_nullable_to_non_nullable
as String,filePath: null == filePath ? _self.filePath : filePath // ignore: cast_nullable_to_non_nullable
as String,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,visible: null == visible ? _self.visible : visible // ignore: cast_nullable_to_non_nullable
as bool,isAllow: null == isAllow ? _self.isAllow : isAllow // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
