// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_metadata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserMetadata {

 bool get isPresenter; bool get isAdmin; bool get raisedHand; bool get isHandRaised;// Alias for compatibility
 bool get waitForApproval; bool get isOnline;// Participant online status
 String? get profilePic; LockSettings? get lockSettings;
/// Create a copy of UserMetadata
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserMetadataCopyWith<UserMetadata> get copyWith => _$UserMetadataCopyWithImpl<UserMetadata>(this as UserMetadata, _$identity);

  /// Serializes this UserMetadata to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserMetadata&&(identical(other.isPresenter, isPresenter) || other.isPresenter == isPresenter)&&(identical(other.isAdmin, isAdmin) || other.isAdmin == isAdmin)&&(identical(other.raisedHand, raisedHand) || other.raisedHand == raisedHand)&&(identical(other.isHandRaised, isHandRaised) || other.isHandRaised == isHandRaised)&&(identical(other.waitForApproval, waitForApproval) || other.waitForApproval == waitForApproval)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.profilePic, profilePic) || other.profilePic == profilePic)&&(identical(other.lockSettings, lockSettings) || other.lockSettings == lockSettings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isPresenter,isAdmin,raisedHand,isHandRaised,waitForApproval,isOnline,profilePic,lockSettings);

@override
String toString() {
  return 'UserMetadata(isPresenter: $isPresenter, isAdmin: $isAdmin, raisedHand: $raisedHand, isHandRaised: $isHandRaised, waitForApproval: $waitForApproval, isOnline: $isOnline, profilePic: $profilePic, lockSettings: $lockSettings)';
}


}

/// @nodoc
abstract mixin class $UserMetadataCopyWith<$Res>  {
  factory $UserMetadataCopyWith(UserMetadata value, $Res Function(UserMetadata) _then) = _$UserMetadataCopyWithImpl;
@useResult
$Res call({
 bool isPresenter, bool isAdmin, bool raisedHand, bool isHandRaised, bool waitForApproval, bool isOnline, String? profilePic, LockSettings? lockSettings
});


$LockSettingsCopyWith<$Res>? get lockSettings;

}
/// @nodoc
class _$UserMetadataCopyWithImpl<$Res>
    implements $UserMetadataCopyWith<$Res> {
  _$UserMetadataCopyWithImpl(this._self, this._then);

  final UserMetadata _self;
  final $Res Function(UserMetadata) _then;

/// Create a copy of UserMetadata
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isPresenter = null,Object? isAdmin = null,Object? raisedHand = null,Object? isHandRaised = null,Object? waitForApproval = null,Object? isOnline = null,Object? profilePic = freezed,Object? lockSettings = freezed,}) {
  return _then(_self.copyWith(
isPresenter: null == isPresenter ? _self.isPresenter : isPresenter // ignore: cast_nullable_to_non_nullable
as bool,isAdmin: null == isAdmin ? _self.isAdmin : isAdmin // ignore: cast_nullable_to_non_nullable
as bool,raisedHand: null == raisedHand ? _self.raisedHand : raisedHand // ignore: cast_nullable_to_non_nullable
as bool,isHandRaised: null == isHandRaised ? _self.isHandRaised : isHandRaised // ignore: cast_nullable_to_non_nullable
as bool,waitForApproval: null == waitForApproval ? _self.waitForApproval : waitForApproval // ignore: cast_nullable_to_non_nullable
as bool,isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,profilePic: freezed == profilePic ? _self.profilePic : profilePic // ignore: cast_nullable_to_non_nullable
as String?,lockSettings: freezed == lockSettings ? _self.lockSettings : lockSettings // ignore: cast_nullable_to_non_nullable
as LockSettings?,
  ));
}
/// Create a copy of UserMetadata
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LockSettingsCopyWith<$Res>? get lockSettings {
    if (_self.lockSettings == null) {
    return null;
  }

  return $LockSettingsCopyWith<$Res>(_self.lockSettings!, (value) {
    return _then(_self.copyWith(lockSettings: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserMetadata].
extension UserMetadataPatterns on UserMetadata {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserMetadata value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserMetadata() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserMetadata value)  $default,){
final _that = this;
switch (_that) {
case _UserMetadata():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserMetadata value)?  $default,){
final _that = this;
switch (_that) {
case _UserMetadata() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isPresenter,  bool isAdmin,  bool raisedHand,  bool isHandRaised,  bool waitForApproval,  bool isOnline,  String? profilePic,  LockSettings? lockSettings)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserMetadata() when $default != null:
return $default(_that.isPresenter,_that.isAdmin,_that.raisedHand,_that.isHandRaised,_that.waitForApproval,_that.isOnline,_that.profilePic,_that.lockSettings);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isPresenter,  bool isAdmin,  bool raisedHand,  bool isHandRaised,  bool waitForApproval,  bool isOnline,  String? profilePic,  LockSettings? lockSettings)  $default,) {final _that = this;
switch (_that) {
case _UserMetadata():
return $default(_that.isPresenter,_that.isAdmin,_that.raisedHand,_that.isHandRaised,_that.waitForApproval,_that.isOnline,_that.profilePic,_that.lockSettings);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isPresenter,  bool isAdmin,  bool raisedHand,  bool isHandRaised,  bool waitForApproval,  bool isOnline,  String? profilePic,  LockSettings? lockSettings)?  $default,) {final _that = this;
switch (_that) {
case _UserMetadata() when $default != null:
return $default(_that.isPresenter,_that.isAdmin,_that.raisedHand,_that.isHandRaised,_that.waitForApproval,_that.isOnline,_that.profilePic,_that.lockSettings);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserMetadata implements UserMetadata {
  const _UserMetadata({this.isPresenter = false, this.isAdmin = false, this.raisedHand = false, this.isHandRaised = false, this.waitForApproval = false, this.isOnline = true, this.profilePic, this.lockSettings});
  factory _UserMetadata.fromJson(Map<String, dynamic> json) => _$UserMetadataFromJson(json);

@override@JsonKey() final  bool isPresenter;
@override@JsonKey() final  bool isAdmin;
@override@JsonKey() final  bool raisedHand;
@override@JsonKey() final  bool isHandRaised;
// Alias for compatibility
@override@JsonKey() final  bool waitForApproval;
@override@JsonKey() final  bool isOnline;
// Participant online status
@override final  String? profilePic;
@override final  LockSettings? lockSettings;

/// Create a copy of UserMetadata
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserMetadataCopyWith<_UserMetadata> get copyWith => __$UserMetadataCopyWithImpl<_UserMetadata>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserMetadataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserMetadata&&(identical(other.isPresenter, isPresenter) || other.isPresenter == isPresenter)&&(identical(other.isAdmin, isAdmin) || other.isAdmin == isAdmin)&&(identical(other.raisedHand, raisedHand) || other.raisedHand == raisedHand)&&(identical(other.isHandRaised, isHandRaised) || other.isHandRaised == isHandRaised)&&(identical(other.waitForApproval, waitForApproval) || other.waitForApproval == waitForApproval)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.profilePic, profilePic) || other.profilePic == profilePic)&&(identical(other.lockSettings, lockSettings) || other.lockSettings == lockSettings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isPresenter,isAdmin,raisedHand,isHandRaised,waitForApproval,isOnline,profilePic,lockSettings);

@override
String toString() {
  return 'UserMetadata(isPresenter: $isPresenter, isAdmin: $isAdmin, raisedHand: $raisedHand, isHandRaised: $isHandRaised, waitForApproval: $waitForApproval, isOnline: $isOnline, profilePic: $profilePic, lockSettings: $lockSettings)';
}


}

/// @nodoc
abstract mixin class _$UserMetadataCopyWith<$Res> implements $UserMetadataCopyWith<$Res> {
  factory _$UserMetadataCopyWith(_UserMetadata value, $Res Function(_UserMetadata) _then) = __$UserMetadataCopyWithImpl;
@override @useResult
$Res call({
 bool isPresenter, bool isAdmin, bool raisedHand, bool isHandRaised, bool waitForApproval, bool isOnline, String? profilePic, LockSettings? lockSettings
});


@override $LockSettingsCopyWith<$Res>? get lockSettings;

}
/// @nodoc
class __$UserMetadataCopyWithImpl<$Res>
    implements _$UserMetadataCopyWith<$Res> {
  __$UserMetadataCopyWithImpl(this._self, this._then);

  final _UserMetadata _self;
  final $Res Function(_UserMetadata) _then;

/// Create a copy of UserMetadata
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isPresenter = null,Object? isAdmin = null,Object? raisedHand = null,Object? isHandRaised = null,Object? waitForApproval = null,Object? isOnline = null,Object? profilePic = freezed,Object? lockSettings = freezed,}) {
  return _then(_UserMetadata(
isPresenter: null == isPresenter ? _self.isPresenter : isPresenter // ignore: cast_nullable_to_non_nullable
as bool,isAdmin: null == isAdmin ? _self.isAdmin : isAdmin // ignore: cast_nullable_to_non_nullable
as bool,raisedHand: null == raisedHand ? _self.raisedHand : raisedHand // ignore: cast_nullable_to_non_nullable
as bool,isHandRaised: null == isHandRaised ? _self.isHandRaised : isHandRaised // ignore: cast_nullable_to_non_nullable
as bool,waitForApproval: null == waitForApproval ? _self.waitForApproval : waitForApproval // ignore: cast_nullable_to_non_nullable
as bool,isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,profilePic: freezed == profilePic ? _self.profilePic : profilePic // ignore: cast_nullable_to_non_nullable
as String?,lockSettings: freezed == lockSettings ? _self.lockSettings : lockSettings // ignore: cast_nullable_to_non_nullable
as LockSettings?,
  ));
}

/// Create a copy of UserMetadata
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LockSettingsCopyWith<$Res>? get lockSettings {
    if (_self.lockSettings == null) {
    return null;
  }

  return $LockSettingsCopyWith<$Res>(_self.lockSettings!, (value) {
    return _then(_self.copyWith(lockSettings: value));
  });
}
}


/// @nodoc
mixin _$LockSettings {

 bool get lockWhiteboard; bool get lockMic; bool get lockCamera; bool get lockChat; bool get lockScreenShare;
/// Create a copy of LockSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LockSettingsCopyWith<LockSettings> get copyWith => _$LockSettingsCopyWithImpl<LockSettings>(this as LockSettings, _$identity);

  /// Serializes this LockSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LockSettings&&(identical(other.lockWhiteboard, lockWhiteboard) || other.lockWhiteboard == lockWhiteboard)&&(identical(other.lockMic, lockMic) || other.lockMic == lockMic)&&(identical(other.lockCamera, lockCamera) || other.lockCamera == lockCamera)&&(identical(other.lockChat, lockChat) || other.lockChat == lockChat)&&(identical(other.lockScreenShare, lockScreenShare) || other.lockScreenShare == lockScreenShare));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lockWhiteboard,lockMic,lockCamera,lockChat,lockScreenShare);

@override
String toString() {
  return 'LockSettings(lockWhiteboard: $lockWhiteboard, lockMic: $lockMic, lockCamera: $lockCamera, lockChat: $lockChat, lockScreenShare: $lockScreenShare)';
}


}

/// @nodoc
abstract mixin class $LockSettingsCopyWith<$Res>  {
  factory $LockSettingsCopyWith(LockSettings value, $Res Function(LockSettings) _then) = _$LockSettingsCopyWithImpl;
@useResult
$Res call({
 bool lockWhiteboard, bool lockMic, bool lockCamera, bool lockChat, bool lockScreenShare
});




}
/// @nodoc
class _$LockSettingsCopyWithImpl<$Res>
    implements $LockSettingsCopyWith<$Res> {
  _$LockSettingsCopyWithImpl(this._self, this._then);

  final LockSettings _self;
  final $Res Function(LockSettings) _then;

/// Create a copy of LockSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lockWhiteboard = null,Object? lockMic = null,Object? lockCamera = null,Object? lockChat = null,Object? lockScreenShare = null,}) {
  return _then(_self.copyWith(
lockWhiteboard: null == lockWhiteboard ? _self.lockWhiteboard : lockWhiteboard // ignore: cast_nullable_to_non_nullable
as bool,lockMic: null == lockMic ? _self.lockMic : lockMic // ignore: cast_nullable_to_non_nullable
as bool,lockCamera: null == lockCamera ? _self.lockCamera : lockCamera // ignore: cast_nullable_to_non_nullable
as bool,lockChat: null == lockChat ? _self.lockChat : lockChat // ignore: cast_nullable_to_non_nullable
as bool,lockScreenShare: null == lockScreenShare ? _self.lockScreenShare : lockScreenShare // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [LockSettings].
extension LockSettingsPatterns on LockSettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LockSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LockSettings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LockSettings value)  $default,){
final _that = this;
switch (_that) {
case _LockSettings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LockSettings value)?  $default,){
final _that = this;
switch (_that) {
case _LockSettings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool lockWhiteboard,  bool lockMic,  bool lockCamera,  bool lockChat,  bool lockScreenShare)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LockSettings() when $default != null:
return $default(_that.lockWhiteboard,_that.lockMic,_that.lockCamera,_that.lockChat,_that.lockScreenShare);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool lockWhiteboard,  bool lockMic,  bool lockCamera,  bool lockChat,  bool lockScreenShare)  $default,) {final _that = this;
switch (_that) {
case _LockSettings():
return $default(_that.lockWhiteboard,_that.lockMic,_that.lockCamera,_that.lockChat,_that.lockScreenShare);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool lockWhiteboard,  bool lockMic,  bool lockCamera,  bool lockChat,  bool lockScreenShare)?  $default,) {final _that = this;
switch (_that) {
case _LockSettings() when $default != null:
return $default(_that.lockWhiteboard,_that.lockMic,_that.lockCamera,_that.lockChat,_that.lockScreenShare);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LockSettings implements LockSettings {
  const _LockSettings({this.lockWhiteboard = false, this.lockMic = false, this.lockCamera = false, this.lockChat = false, this.lockScreenShare = false});
  factory _LockSettings.fromJson(Map<String, dynamic> json) => _$LockSettingsFromJson(json);

@override@JsonKey() final  bool lockWhiteboard;
@override@JsonKey() final  bool lockMic;
@override@JsonKey() final  bool lockCamera;
@override@JsonKey() final  bool lockChat;
@override@JsonKey() final  bool lockScreenShare;

/// Create a copy of LockSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LockSettingsCopyWith<_LockSettings> get copyWith => __$LockSettingsCopyWithImpl<_LockSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LockSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LockSettings&&(identical(other.lockWhiteboard, lockWhiteboard) || other.lockWhiteboard == lockWhiteboard)&&(identical(other.lockMic, lockMic) || other.lockMic == lockMic)&&(identical(other.lockCamera, lockCamera) || other.lockCamera == lockCamera)&&(identical(other.lockChat, lockChat) || other.lockChat == lockChat)&&(identical(other.lockScreenShare, lockScreenShare) || other.lockScreenShare == lockScreenShare));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lockWhiteboard,lockMic,lockCamera,lockChat,lockScreenShare);

@override
String toString() {
  return 'LockSettings(lockWhiteboard: $lockWhiteboard, lockMic: $lockMic, lockCamera: $lockCamera, lockChat: $lockChat, lockScreenShare: $lockScreenShare)';
}


}

/// @nodoc
abstract mixin class _$LockSettingsCopyWith<$Res> implements $LockSettingsCopyWith<$Res> {
  factory _$LockSettingsCopyWith(_LockSettings value, $Res Function(_LockSettings) _then) = __$LockSettingsCopyWithImpl;
@override @useResult
$Res call({
 bool lockWhiteboard, bool lockMic, bool lockCamera, bool lockChat, bool lockScreenShare
});




}
/// @nodoc
class __$LockSettingsCopyWithImpl<$Res>
    implements _$LockSettingsCopyWith<$Res> {
  __$LockSettingsCopyWithImpl(this._self, this._then);

  final _LockSettings _self;
  final $Res Function(_LockSettings) _then;

/// Create a copy of LockSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lockWhiteboard = null,Object? lockMic = null,Object? lockCamera = null,Object? lockChat = null,Object? lockScreenShare = null,}) {
  return _then(_LockSettings(
lockWhiteboard: null == lockWhiteboard ? _self.lockWhiteboard : lockWhiteboard // ignore: cast_nullable_to_non_nullable
as bool,lockMic: null == lockMic ? _self.lockMic : lockMic // ignore: cast_nullable_to_non_nullable
as bool,lockCamera: null == lockCamera ? _self.lockCamera : lockCamera // ignore: cast_nullable_to_non_nullable
as bool,lockChat: null == lockChat ? _self.lockChat : lockChat // ignore: cast_nullable_to_non_nullable
as bool,lockScreenShare: null == lockScreenShare ? _self.lockScreenShare : lockScreenShare // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
