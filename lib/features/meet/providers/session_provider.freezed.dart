// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SessionState {

 String get token; String? get serverVersion; CurrentUser? get currentUser; CurrentRoom get currentRoom; ScreenSharingState get screenSharing; bool get isActiveRtmpBroadcasting; bool get isActiveRecording; bool get isWebcamPaginating; bool get isStartup; int get totalVideoSubscribers; int get totalAudioSubscribers; int get totalParticipants; UserDeviceType get userDeviceType; bool get isCloud; bool get isNatsConnected;
/// Create a copy of SessionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionStateCopyWith<SessionState> get copyWith => _$SessionStateCopyWithImpl<SessionState>(this as SessionState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionState&&(identical(other.token, token) || other.token == token)&&(identical(other.serverVersion, serverVersion) || other.serverVersion == serverVersion)&&(identical(other.currentUser, currentUser) || other.currentUser == currentUser)&&(identical(other.currentRoom, currentRoom) || other.currentRoom == currentRoom)&&(identical(other.screenSharing, screenSharing) || other.screenSharing == screenSharing)&&(identical(other.isActiveRtmpBroadcasting, isActiveRtmpBroadcasting) || other.isActiveRtmpBroadcasting == isActiveRtmpBroadcasting)&&(identical(other.isActiveRecording, isActiveRecording) || other.isActiveRecording == isActiveRecording)&&(identical(other.isWebcamPaginating, isWebcamPaginating) || other.isWebcamPaginating == isWebcamPaginating)&&(identical(other.isStartup, isStartup) || other.isStartup == isStartup)&&(identical(other.totalVideoSubscribers, totalVideoSubscribers) || other.totalVideoSubscribers == totalVideoSubscribers)&&(identical(other.totalAudioSubscribers, totalAudioSubscribers) || other.totalAudioSubscribers == totalAudioSubscribers)&&(identical(other.totalParticipants, totalParticipants) || other.totalParticipants == totalParticipants)&&(identical(other.userDeviceType, userDeviceType) || other.userDeviceType == userDeviceType)&&(identical(other.isCloud, isCloud) || other.isCloud == isCloud)&&(identical(other.isNatsConnected, isNatsConnected) || other.isNatsConnected == isNatsConnected));
}


@override
int get hashCode => Object.hash(runtimeType,token,serverVersion,currentUser,currentRoom,screenSharing,isActiveRtmpBroadcasting,isActiveRecording,isWebcamPaginating,isStartup,totalVideoSubscribers,totalAudioSubscribers,totalParticipants,userDeviceType,isCloud,isNatsConnected);

@override
String toString() {
  return 'SessionState(token: $token, serverVersion: $serverVersion, currentUser: $currentUser, currentRoom: $currentRoom, screenSharing: $screenSharing, isActiveRtmpBroadcasting: $isActiveRtmpBroadcasting, isActiveRecording: $isActiveRecording, isWebcamPaginating: $isWebcamPaginating, isStartup: $isStartup, totalVideoSubscribers: $totalVideoSubscribers, totalAudioSubscribers: $totalAudioSubscribers, totalParticipants: $totalParticipants, userDeviceType: $userDeviceType, isCloud: $isCloud, isNatsConnected: $isNatsConnected)';
}


}

/// @nodoc
abstract mixin class $SessionStateCopyWith<$Res>  {
  factory $SessionStateCopyWith(SessionState value, $Res Function(SessionState) _then) = _$SessionStateCopyWithImpl;
@useResult
$Res call({
 String token, String? serverVersion, CurrentUser? currentUser, CurrentRoom currentRoom, ScreenSharingState screenSharing, bool isActiveRtmpBroadcasting, bool isActiveRecording, bool isWebcamPaginating, bool isStartup, int totalVideoSubscribers, int totalAudioSubscribers, int totalParticipants, UserDeviceType userDeviceType, bool isCloud, bool isNatsConnected
});




}
/// @nodoc
class _$SessionStateCopyWithImpl<$Res>
    implements $SessionStateCopyWith<$Res> {
  _$SessionStateCopyWithImpl(this._self, this._then);

  final SessionState _self;
  final $Res Function(SessionState) _then;

/// Create a copy of SessionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? token = null,Object? serverVersion = freezed,Object? currentUser = freezed,Object? currentRoom = null,Object? screenSharing = null,Object? isActiveRtmpBroadcasting = null,Object? isActiveRecording = null,Object? isWebcamPaginating = null,Object? isStartup = null,Object? totalVideoSubscribers = null,Object? totalAudioSubscribers = null,Object? totalParticipants = null,Object? userDeviceType = null,Object? isCloud = null,Object? isNatsConnected = null,}) {
  return _then(_self.copyWith(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,serverVersion: freezed == serverVersion ? _self.serverVersion : serverVersion // ignore: cast_nullable_to_non_nullable
as String?,currentUser: freezed == currentUser ? _self.currentUser : currentUser // ignore: cast_nullable_to_non_nullable
as CurrentUser?,currentRoom: null == currentRoom ? _self.currentRoom : currentRoom // ignore: cast_nullable_to_non_nullable
as CurrentRoom,screenSharing: null == screenSharing ? _self.screenSharing : screenSharing // ignore: cast_nullable_to_non_nullable
as ScreenSharingState,isActiveRtmpBroadcasting: null == isActiveRtmpBroadcasting ? _self.isActiveRtmpBroadcasting : isActiveRtmpBroadcasting // ignore: cast_nullable_to_non_nullable
as bool,isActiveRecording: null == isActiveRecording ? _self.isActiveRecording : isActiveRecording // ignore: cast_nullable_to_non_nullable
as bool,isWebcamPaginating: null == isWebcamPaginating ? _self.isWebcamPaginating : isWebcamPaginating // ignore: cast_nullable_to_non_nullable
as bool,isStartup: null == isStartup ? _self.isStartup : isStartup // ignore: cast_nullable_to_non_nullable
as bool,totalVideoSubscribers: null == totalVideoSubscribers ? _self.totalVideoSubscribers : totalVideoSubscribers // ignore: cast_nullable_to_non_nullable
as int,totalAudioSubscribers: null == totalAudioSubscribers ? _self.totalAudioSubscribers : totalAudioSubscribers // ignore: cast_nullable_to_non_nullable
as int,totalParticipants: null == totalParticipants ? _self.totalParticipants : totalParticipants // ignore: cast_nullable_to_non_nullable
as int,userDeviceType: null == userDeviceType ? _self.userDeviceType : userDeviceType // ignore: cast_nullable_to_non_nullable
as UserDeviceType,isCloud: null == isCloud ? _self.isCloud : isCloud // ignore: cast_nullable_to_non_nullable
as bool,isNatsConnected: null == isNatsConnected ? _self.isNatsConnected : isNatsConnected // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SessionState].
extension SessionStatePatterns on SessionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionState value)  $default,){
final _that = this;
switch (_that) {
case _SessionState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionState value)?  $default,){
final _that = this;
switch (_that) {
case _SessionState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String token,  String? serverVersion,  CurrentUser? currentUser,  CurrentRoom currentRoom,  ScreenSharingState screenSharing,  bool isActiveRtmpBroadcasting,  bool isActiveRecording,  bool isWebcamPaginating,  bool isStartup,  int totalVideoSubscribers,  int totalAudioSubscribers,  int totalParticipants,  UserDeviceType userDeviceType,  bool isCloud,  bool isNatsConnected)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionState() when $default != null:
return $default(_that.token,_that.serverVersion,_that.currentUser,_that.currentRoom,_that.screenSharing,_that.isActiveRtmpBroadcasting,_that.isActiveRecording,_that.isWebcamPaginating,_that.isStartup,_that.totalVideoSubscribers,_that.totalAudioSubscribers,_that.totalParticipants,_that.userDeviceType,_that.isCloud,_that.isNatsConnected);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String token,  String? serverVersion,  CurrentUser? currentUser,  CurrentRoom currentRoom,  ScreenSharingState screenSharing,  bool isActiveRtmpBroadcasting,  bool isActiveRecording,  bool isWebcamPaginating,  bool isStartup,  int totalVideoSubscribers,  int totalAudioSubscribers,  int totalParticipants,  UserDeviceType userDeviceType,  bool isCloud,  bool isNatsConnected)  $default,) {final _that = this;
switch (_that) {
case _SessionState():
return $default(_that.token,_that.serverVersion,_that.currentUser,_that.currentRoom,_that.screenSharing,_that.isActiveRtmpBroadcasting,_that.isActiveRecording,_that.isWebcamPaginating,_that.isStartup,_that.totalVideoSubscribers,_that.totalAudioSubscribers,_that.totalParticipants,_that.userDeviceType,_that.isCloud,_that.isNatsConnected);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String token,  String? serverVersion,  CurrentUser? currentUser,  CurrentRoom currentRoom,  ScreenSharingState screenSharing,  bool isActiveRtmpBroadcasting,  bool isActiveRecording,  bool isWebcamPaginating,  bool isStartup,  int totalVideoSubscribers,  int totalAudioSubscribers,  int totalParticipants,  UserDeviceType userDeviceType,  bool isCloud,  bool isNatsConnected)?  $default,) {final _that = this;
switch (_that) {
case _SessionState() when $default != null:
return $default(_that.token,_that.serverVersion,_that.currentUser,_that.currentRoom,_that.screenSharing,_that.isActiveRtmpBroadcasting,_that.isActiveRecording,_that.isWebcamPaginating,_that.isStartup,_that.totalVideoSubscribers,_that.totalAudioSubscribers,_that.totalParticipants,_that.userDeviceType,_that.isCloud,_that.isNatsConnected);case _:
  return null;

}
}

}

/// @nodoc


class _SessionState implements SessionState {
  const _SessionState({this.token = '', this.serverVersion, this.currentUser, required this.currentRoom, this.screenSharing = const ScreenSharingState(), this.isActiveRtmpBroadcasting = false, this.isActiveRecording = false, this.isWebcamPaginating = false, this.isStartup = true, this.totalVideoSubscribers = 0, this.totalAudioSubscribers = 0, this.totalParticipants = 0, this.userDeviceType = UserDeviceType.mobile, this.isCloud = false, this.isNatsConnected = false});
  

@override@JsonKey() final  String token;
@override final  String? serverVersion;
@override final  CurrentUser? currentUser;
@override final  CurrentRoom currentRoom;
@override@JsonKey() final  ScreenSharingState screenSharing;
@override@JsonKey() final  bool isActiveRtmpBroadcasting;
@override@JsonKey() final  bool isActiveRecording;
@override@JsonKey() final  bool isWebcamPaginating;
@override@JsonKey() final  bool isStartup;
@override@JsonKey() final  int totalVideoSubscribers;
@override@JsonKey() final  int totalAudioSubscribers;
@override@JsonKey() final  int totalParticipants;
@override@JsonKey() final  UserDeviceType userDeviceType;
@override@JsonKey() final  bool isCloud;
@override@JsonKey() final  bool isNatsConnected;

/// Create a copy of SessionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionStateCopyWith<_SessionState> get copyWith => __$SessionStateCopyWithImpl<_SessionState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionState&&(identical(other.token, token) || other.token == token)&&(identical(other.serverVersion, serverVersion) || other.serverVersion == serverVersion)&&(identical(other.currentUser, currentUser) || other.currentUser == currentUser)&&(identical(other.currentRoom, currentRoom) || other.currentRoom == currentRoom)&&(identical(other.screenSharing, screenSharing) || other.screenSharing == screenSharing)&&(identical(other.isActiveRtmpBroadcasting, isActiveRtmpBroadcasting) || other.isActiveRtmpBroadcasting == isActiveRtmpBroadcasting)&&(identical(other.isActiveRecording, isActiveRecording) || other.isActiveRecording == isActiveRecording)&&(identical(other.isWebcamPaginating, isWebcamPaginating) || other.isWebcamPaginating == isWebcamPaginating)&&(identical(other.isStartup, isStartup) || other.isStartup == isStartup)&&(identical(other.totalVideoSubscribers, totalVideoSubscribers) || other.totalVideoSubscribers == totalVideoSubscribers)&&(identical(other.totalAudioSubscribers, totalAudioSubscribers) || other.totalAudioSubscribers == totalAudioSubscribers)&&(identical(other.totalParticipants, totalParticipants) || other.totalParticipants == totalParticipants)&&(identical(other.userDeviceType, userDeviceType) || other.userDeviceType == userDeviceType)&&(identical(other.isCloud, isCloud) || other.isCloud == isCloud)&&(identical(other.isNatsConnected, isNatsConnected) || other.isNatsConnected == isNatsConnected));
}


@override
int get hashCode => Object.hash(runtimeType,token,serverVersion,currentUser,currentRoom,screenSharing,isActiveRtmpBroadcasting,isActiveRecording,isWebcamPaginating,isStartup,totalVideoSubscribers,totalAudioSubscribers,totalParticipants,userDeviceType,isCloud,isNatsConnected);

@override
String toString() {
  return 'SessionState(token: $token, serverVersion: $serverVersion, currentUser: $currentUser, currentRoom: $currentRoom, screenSharing: $screenSharing, isActiveRtmpBroadcasting: $isActiveRtmpBroadcasting, isActiveRecording: $isActiveRecording, isWebcamPaginating: $isWebcamPaginating, isStartup: $isStartup, totalVideoSubscribers: $totalVideoSubscribers, totalAudioSubscribers: $totalAudioSubscribers, totalParticipants: $totalParticipants, userDeviceType: $userDeviceType, isCloud: $isCloud, isNatsConnected: $isNatsConnected)';
}


}

/// @nodoc
abstract mixin class _$SessionStateCopyWith<$Res> implements $SessionStateCopyWith<$Res> {
  factory _$SessionStateCopyWith(_SessionState value, $Res Function(_SessionState) _then) = __$SessionStateCopyWithImpl;
@override @useResult
$Res call({
 String token, String? serverVersion, CurrentUser? currentUser, CurrentRoom currentRoom, ScreenSharingState screenSharing, bool isActiveRtmpBroadcasting, bool isActiveRecording, bool isWebcamPaginating, bool isStartup, int totalVideoSubscribers, int totalAudioSubscribers, int totalParticipants, UserDeviceType userDeviceType, bool isCloud, bool isNatsConnected
});




}
/// @nodoc
class __$SessionStateCopyWithImpl<$Res>
    implements _$SessionStateCopyWith<$Res> {
  __$SessionStateCopyWithImpl(this._self, this._then);

  final _SessionState _self;
  final $Res Function(_SessionState) _then;

/// Create a copy of SessionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? token = null,Object? serverVersion = freezed,Object? currentUser = freezed,Object? currentRoom = null,Object? screenSharing = null,Object? isActiveRtmpBroadcasting = null,Object? isActiveRecording = null,Object? isWebcamPaginating = null,Object? isStartup = null,Object? totalVideoSubscribers = null,Object? totalAudioSubscribers = null,Object? totalParticipants = null,Object? userDeviceType = null,Object? isCloud = null,Object? isNatsConnected = null,}) {
  return _then(_SessionState(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,serverVersion: freezed == serverVersion ? _self.serverVersion : serverVersion // ignore: cast_nullable_to_non_nullable
as String?,currentUser: freezed == currentUser ? _self.currentUser : currentUser // ignore: cast_nullable_to_non_nullable
as CurrentUser?,currentRoom: null == currentRoom ? _self.currentRoom : currentRoom // ignore: cast_nullable_to_non_nullable
as CurrentRoom,screenSharing: null == screenSharing ? _self.screenSharing : screenSharing // ignore: cast_nullable_to_non_nullable
as ScreenSharingState,isActiveRtmpBroadcasting: null == isActiveRtmpBroadcasting ? _self.isActiveRtmpBroadcasting : isActiveRtmpBroadcasting // ignore: cast_nullable_to_non_nullable
as bool,isActiveRecording: null == isActiveRecording ? _self.isActiveRecording : isActiveRecording // ignore: cast_nullable_to_non_nullable
as bool,isWebcamPaginating: null == isWebcamPaginating ? _self.isWebcamPaginating : isWebcamPaginating // ignore: cast_nullable_to_non_nullable
as bool,isStartup: null == isStartup ? _self.isStartup : isStartup // ignore: cast_nullable_to_non_nullable
as bool,totalVideoSubscribers: null == totalVideoSubscribers ? _self.totalVideoSubscribers : totalVideoSubscribers // ignore: cast_nullable_to_non_nullable
as int,totalAudioSubscribers: null == totalAudioSubscribers ? _self.totalAudioSubscribers : totalAudioSubscribers // ignore: cast_nullable_to_non_nullable
as int,totalParticipants: null == totalParticipants ? _self.totalParticipants : totalParticipants // ignore: cast_nullable_to_non_nullable
as int,userDeviceType: null == userDeviceType ? _self.userDeviceType : userDeviceType // ignore: cast_nullable_to_non_nullable
as UserDeviceType,isCloud: null == isCloud ? _self.isCloud : isCloud // ignore: cast_nullable_to_non_nullable
as bool,isNatsConnected: null == isNatsConnected ? _self.isNatsConnected : isNatsConnected // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
