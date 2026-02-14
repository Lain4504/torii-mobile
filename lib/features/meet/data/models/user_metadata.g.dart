// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserMetadata _$UserMetadataFromJson(Map<String, dynamic> json) =>
    _UserMetadata(
      isPresenter: json['isPresenter'] as bool? ?? false,
      isAdmin: json['isAdmin'] as bool? ?? false,
      raisedHand: json['raisedHand'] as bool? ?? false,
      isHandRaised: json['isHandRaised'] as bool? ?? false,
      waitForApproval: json['waitForApproval'] as bool? ?? false,
      isOnline: json['isOnline'] as bool? ?? true,
      profilePic: json['profilePic'] as String?,
      lockSettings: json['lockSettings'] == null
          ? null
          : LockSettings.fromJson(json['lockSettings'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserMetadataToJson(_UserMetadata instance) =>
    <String, dynamic>{
      'isPresenter': instance.isPresenter,
      'isAdmin': instance.isAdmin,
      'raisedHand': instance.raisedHand,
      'isHandRaised': instance.isHandRaised,
      'waitForApproval': instance.waitForApproval,
      'isOnline': instance.isOnline,
      'profilePic': instance.profilePic,
      'lockSettings': instance.lockSettings,
    };

_LockSettings _$LockSettingsFromJson(Map<String, dynamic> json) =>
    _LockSettings(
      lockWhiteboard: json['lockWhiteboard'] as bool? ?? false,
      lockMic: json['lockMic'] as bool? ?? false,
      lockCamera: json['lockCamera'] as bool? ?? false,
      lockChat: json['lockChat'] as bool? ?? false,
      lockScreenShare: json['lockScreenShare'] as bool? ?? false,
    );

Map<String, dynamic> _$LockSettingsToJson(_LockSettings instance) =>
    <String, dynamic>{
      'lockWhiteboard': instance.lockWhiteboard,
      'lockMic': instance.lockMic,
      'lockCamera': instance.lockCamera,
      'lockChat': instance.lockChat,
      'lockScreenShare': instance.lockScreenShare,
    };
