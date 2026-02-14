// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'active_speakers_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ActiveSpeaker {

 String get userId; String get name; bool get isSpeaking; double get audioLevel;// 0.0 to 1.0
 int get lastSpokeAt;
/// Create a copy of ActiveSpeaker
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActiveSpeakerCopyWith<ActiveSpeaker> get copyWith => _$ActiveSpeakerCopyWithImpl<ActiveSpeaker>(this as ActiveSpeaker, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActiveSpeaker&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.isSpeaking, isSpeaking) || other.isSpeaking == isSpeaking)&&(identical(other.audioLevel, audioLevel) || other.audioLevel == audioLevel)&&(identical(other.lastSpokeAt, lastSpokeAt) || other.lastSpokeAt == lastSpokeAt));
}


@override
int get hashCode => Object.hash(runtimeType,userId,name,isSpeaking,audioLevel,lastSpokeAt);

@override
String toString() {
  return 'ActiveSpeaker(userId: $userId, name: $name, isSpeaking: $isSpeaking, audioLevel: $audioLevel, lastSpokeAt: $lastSpokeAt)';
}


}

/// @nodoc
abstract mixin class $ActiveSpeakerCopyWith<$Res>  {
  factory $ActiveSpeakerCopyWith(ActiveSpeaker value, $Res Function(ActiveSpeaker) _then) = _$ActiveSpeakerCopyWithImpl;
@useResult
$Res call({
 String userId, String name, bool isSpeaking, double audioLevel, int lastSpokeAt
});




}
/// @nodoc
class _$ActiveSpeakerCopyWithImpl<$Res>
    implements $ActiveSpeakerCopyWith<$Res> {
  _$ActiveSpeakerCopyWithImpl(this._self, this._then);

  final ActiveSpeaker _self;
  final $Res Function(ActiveSpeaker) _then;

/// Create a copy of ActiveSpeaker
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? name = null,Object? isSpeaking = null,Object? audioLevel = null,Object? lastSpokeAt = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,isSpeaking: null == isSpeaking ? _self.isSpeaking : isSpeaking // ignore: cast_nullable_to_non_nullable
as bool,audioLevel: null == audioLevel ? _self.audioLevel : audioLevel // ignore: cast_nullable_to_non_nullable
as double,lastSpokeAt: null == lastSpokeAt ? _self.lastSpokeAt : lastSpokeAt // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ActiveSpeaker].
extension ActiveSpeakerPatterns on ActiveSpeaker {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ActiveSpeaker value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ActiveSpeaker() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ActiveSpeaker value)  $default,){
final _that = this;
switch (_that) {
case _ActiveSpeaker():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ActiveSpeaker value)?  $default,){
final _that = this;
switch (_that) {
case _ActiveSpeaker() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  String name,  bool isSpeaking,  double audioLevel,  int lastSpokeAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ActiveSpeaker() when $default != null:
return $default(_that.userId,_that.name,_that.isSpeaking,_that.audioLevel,_that.lastSpokeAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  String name,  bool isSpeaking,  double audioLevel,  int lastSpokeAt)  $default,) {final _that = this;
switch (_that) {
case _ActiveSpeaker():
return $default(_that.userId,_that.name,_that.isSpeaking,_that.audioLevel,_that.lastSpokeAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  String name,  bool isSpeaking,  double audioLevel,  int lastSpokeAt)?  $default,) {final _that = this;
switch (_that) {
case _ActiveSpeaker() when $default != null:
return $default(_that.userId,_that.name,_that.isSpeaking,_that.audioLevel,_that.lastSpokeAt);case _:
  return null;

}
}

}

/// @nodoc


class _ActiveSpeaker implements ActiveSpeaker {
  const _ActiveSpeaker({required this.userId, required this.name, this.isSpeaking = false, this.audioLevel = 0.0, this.lastSpokeAt = 0});
  

@override final  String userId;
@override final  String name;
@override@JsonKey() final  bool isSpeaking;
@override@JsonKey() final  double audioLevel;
// 0.0 to 1.0
@override@JsonKey() final  int lastSpokeAt;

/// Create a copy of ActiveSpeaker
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActiveSpeakerCopyWith<_ActiveSpeaker> get copyWith => __$ActiveSpeakerCopyWithImpl<_ActiveSpeaker>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActiveSpeaker&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.isSpeaking, isSpeaking) || other.isSpeaking == isSpeaking)&&(identical(other.audioLevel, audioLevel) || other.audioLevel == audioLevel)&&(identical(other.lastSpokeAt, lastSpokeAt) || other.lastSpokeAt == lastSpokeAt));
}


@override
int get hashCode => Object.hash(runtimeType,userId,name,isSpeaking,audioLevel,lastSpokeAt);

@override
String toString() {
  return 'ActiveSpeaker(userId: $userId, name: $name, isSpeaking: $isSpeaking, audioLevel: $audioLevel, lastSpokeAt: $lastSpokeAt)';
}


}

/// @nodoc
abstract mixin class _$ActiveSpeakerCopyWith<$Res> implements $ActiveSpeakerCopyWith<$Res> {
  factory _$ActiveSpeakerCopyWith(_ActiveSpeaker value, $Res Function(_ActiveSpeaker) _then) = __$ActiveSpeakerCopyWithImpl;
@override @useResult
$Res call({
 String userId, String name, bool isSpeaking, double audioLevel, int lastSpokeAt
});




}
/// @nodoc
class __$ActiveSpeakerCopyWithImpl<$Res>
    implements _$ActiveSpeakerCopyWith<$Res> {
  __$ActiveSpeakerCopyWithImpl(this._self, this._then);

  final _ActiveSpeaker _self;
  final $Res Function(_ActiveSpeaker) _then;

/// Create a copy of ActiveSpeaker
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? name = null,Object? isSpeaking = null,Object? audioLevel = null,Object? lastSpokeAt = null,}) {
  return _then(_ActiveSpeaker(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,isSpeaking: null == isSpeaking ? _self.isSpeaking : isSpeaking // ignore: cast_nullable_to_non_nullable
as bool,audioLevel: null == audioLevel ? _self.audioLevel : audioLevel // ignore: cast_nullable_to_non_nullable
as double,lastSpokeAt: null == lastSpokeAt ? _self.lastSpokeAt : lastSpokeAt // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$ActiveSpeakersState {

 Map<String, ActiveSpeaker> get speakers;
/// Create a copy of ActiveSpeakersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActiveSpeakersStateCopyWith<ActiveSpeakersState> get copyWith => _$ActiveSpeakersStateCopyWithImpl<ActiveSpeakersState>(this as ActiveSpeakersState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActiveSpeakersState&&const DeepCollectionEquality().equals(other.speakers, speakers));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(speakers));

@override
String toString() {
  return 'ActiveSpeakersState(speakers: $speakers)';
}


}

/// @nodoc
abstract mixin class $ActiveSpeakersStateCopyWith<$Res>  {
  factory $ActiveSpeakersStateCopyWith(ActiveSpeakersState value, $Res Function(ActiveSpeakersState) _then) = _$ActiveSpeakersStateCopyWithImpl;
@useResult
$Res call({
 Map<String, ActiveSpeaker> speakers
});




}
/// @nodoc
class _$ActiveSpeakersStateCopyWithImpl<$Res>
    implements $ActiveSpeakersStateCopyWith<$Res> {
  _$ActiveSpeakersStateCopyWithImpl(this._self, this._then);

  final ActiveSpeakersState _self;
  final $Res Function(ActiveSpeakersState) _then;

/// Create a copy of ActiveSpeakersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? speakers = null,}) {
  return _then(_self.copyWith(
speakers: null == speakers ? _self.speakers : speakers // ignore: cast_nullable_to_non_nullable
as Map<String, ActiveSpeaker>,
  ));
}

}


/// Adds pattern-matching-related methods to [ActiveSpeakersState].
extension ActiveSpeakersStatePatterns on ActiveSpeakersState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ActiveSpeakersState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ActiveSpeakersState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ActiveSpeakersState value)  $default,){
final _that = this;
switch (_that) {
case _ActiveSpeakersState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ActiveSpeakersState value)?  $default,){
final _that = this;
switch (_that) {
case _ActiveSpeakersState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<String, ActiveSpeaker> speakers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ActiveSpeakersState() when $default != null:
return $default(_that.speakers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<String, ActiveSpeaker> speakers)  $default,) {final _that = this;
switch (_that) {
case _ActiveSpeakersState():
return $default(_that.speakers);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<String, ActiveSpeaker> speakers)?  $default,) {final _that = this;
switch (_that) {
case _ActiveSpeakersState() when $default != null:
return $default(_that.speakers);case _:
  return null;

}
}

}

/// @nodoc


class _ActiveSpeakersState implements ActiveSpeakersState {
  const _ActiveSpeakersState({final  Map<String, ActiveSpeaker> speakers = const {}}): _speakers = speakers;
  

 final  Map<String, ActiveSpeaker> _speakers;
@override@JsonKey() Map<String, ActiveSpeaker> get speakers {
  if (_speakers is EqualUnmodifiableMapView) return _speakers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_speakers);
}


/// Create a copy of ActiveSpeakersState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActiveSpeakersStateCopyWith<_ActiveSpeakersState> get copyWith => __$ActiveSpeakersStateCopyWithImpl<_ActiveSpeakersState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActiveSpeakersState&&const DeepCollectionEquality().equals(other._speakers, _speakers));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_speakers));

@override
String toString() {
  return 'ActiveSpeakersState(speakers: $speakers)';
}


}

/// @nodoc
abstract mixin class _$ActiveSpeakersStateCopyWith<$Res> implements $ActiveSpeakersStateCopyWith<$Res> {
  factory _$ActiveSpeakersStateCopyWith(_ActiveSpeakersState value, $Res Function(_ActiveSpeakersState) _then) = __$ActiveSpeakersStateCopyWithImpl;
@override @useResult
$Res call({
 Map<String, ActiveSpeaker> speakers
});




}
/// @nodoc
class __$ActiveSpeakersStateCopyWithImpl<$Res>
    implements _$ActiveSpeakersStateCopyWith<$Res> {
  __$ActiveSpeakersStateCopyWithImpl(this._self, this._then);

  final _ActiveSpeakersState _self;
  final $Res Function(_ActiveSpeakersState) _then;

/// Create a copy of ActiveSpeakersState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? speakers = null,}) {
  return _then(_ActiveSpeakersState(
speakers: null == speakers ? _self._speakers : speakers // ignore: cast_nullable_to_non_nullable
as Map<String, ActiveSpeaker>,
  ));
}


}

// dart format on
