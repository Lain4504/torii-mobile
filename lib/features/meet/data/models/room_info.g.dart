// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RoomInfo _$RoomInfoFromJson(Map<String, dynamic> json) => _RoomInfo(
  metadataId: json['metadataId'] as String?,
  roomTitle: json['roomTitle'] as String? ?? '',
  isRecording: json['isRecording'] as bool? ?? false,
  isActiveRtmp: json['isActiveRtmp'] as bool? ?? false,
  welcomeMessage: json['welcomeMessage'] as String? ?? '',
  roomFeatures: json['roomFeatures'] == null
      ? null
      : RoomFeatures.fromJson(json['roomFeatures'] as Map<String, dynamic>),
  roomId: json['roomId'] as String?,
  roomSid: json['roomSid'] as String?,
);

Map<String, dynamic> _$RoomInfoToJson(_RoomInfo instance) => <String, dynamic>{
  'metadataId': instance.metadataId,
  'roomTitle': instance.roomTitle,
  'isRecording': instance.isRecording,
  'isActiveRtmp': instance.isActiveRtmp,
  'welcomeMessage': instance.welcomeMessage,
  'roomFeatures': instance.roomFeatures,
  'roomId': instance.roomId,
  'roomSid': instance.roomSid,
};

_BreakoutRoomFeatures _$BreakoutRoomFeaturesFromJson(
  Map<String, dynamic> json,
) => _BreakoutRoomFeatures(
  isAllow: json['isAllow'] as bool? ?? false,
  allowedNumberRooms: (json['allowedNumberRooms'] as num?)?.toInt() ?? 0,
  isActive: json['isActive'] as bool? ?? false,
);

Map<String, dynamic> _$BreakoutRoomFeaturesToJson(
  _BreakoutRoomFeatures instance,
) => <String, dynamic>{
  'isAllow': instance.isAllow,
  'allowedNumberRooms': instance.allowedNumberRooms,
  'isActive': instance.isActive,
};

_ChatFeatures _$ChatFeaturesFromJson(Map<String, dynamic> json) =>
    _ChatFeatures(
      isAllow: json['isAllow'] as bool? ?? true,
      isAllowFileUpload: json['isAllowFileUpload'] as bool? ?? true,
      allowedFileTypes:
          (json['allowedFileTypes'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      maxFileSize: (json['maxFileSize'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ChatFeaturesToJson(_ChatFeatures instance) =>
    <String, dynamic>{
      'isAllow': instance.isAllow,
      'isAllowFileUpload': instance.isAllowFileUpload,
      'allowedFileTypes': instance.allowedFileTypes,
      'maxFileSize': instance.maxFileSize,
    };

_RoomFeatures _$RoomFeaturesFromJson(Map<String, dynamic> json) =>
    _RoomFeatures(
      whiteboardFeatures: json['whiteboardFeatures'] == null
          ? null
          : WhiteboardFeatures.fromJson(
              json['whiteboardFeatures'] as Map<String, dynamic>,
            ),
      chat: json['chat'] as bool? ?? false,
      whiteboard: json['whiteboard'] as bool? ?? false,
      externalMediaPlayerFeatures: json['externalMediaPlayerFeatures'] == null
          ? null
          : ExternalMediaPlayerFeatures.fromJson(
              json['externalMediaPlayerFeatures'] as Map<String, dynamic>,
            ),
      displayExternalLinkFeatures: json['displayExternalLinkFeatures'] == null
          ? null
          : DisplayExternalLinkFeatures.fromJson(
              json['displayExternalLinkFeatures'] as Map<String, dynamic>,
            ),
      breakoutRoomFeatures: json['breakoutRoomFeatures'] == null
          ? null
          : BreakoutRoomFeatures.fromJson(
              json['breakoutRoomFeatures'] as Map<String, dynamic>,
            ),
      chatFeatures: json['chatFeatures'] == null
          ? null
          : ChatFeatures.fromJson(json['chatFeatures'] as Map<String, dynamic>),
      allowWebcams: json['allowWebcams'] as bool? ?? true,
      adminOnlyWebcams: json['adminOnlyWebcams'] as bool? ?? false,
      allowScreenShare: json['allowScreenShare'] as bool? ?? true,
      allowViewOtherWebcams: json['allowViewOtherWebcams'] as bool? ?? true,
      allowViewOtherUsersList: json['allowViewOtherUsersList'] as bool? ?? true,
      allowRaiseHand: json['allowRaiseHand'] as bool? ?? true,
      muteOnStart: json['muteOnStart'] as bool? ?? false,
    );

Map<String, dynamic> _$RoomFeaturesToJson(_RoomFeatures instance) =>
    <String, dynamic>{
      'whiteboardFeatures': instance.whiteboardFeatures,
      'chat': instance.chat,
      'whiteboard': instance.whiteboard,
      'externalMediaPlayerFeatures': instance.externalMediaPlayerFeatures,
      'displayExternalLinkFeatures': instance.displayExternalLinkFeatures,
      'breakoutRoomFeatures': instance.breakoutRoomFeatures,
      'chatFeatures': instance.chatFeatures,
      'allowWebcams': instance.allowWebcams,
      'adminOnlyWebcams': instance.adminOnlyWebcams,
      'allowScreenShare': instance.allowScreenShare,
      'allowViewOtherWebcams': instance.allowViewOtherWebcams,
      'allowViewOtherUsersList': instance.allowViewOtherUsersList,
      'allowRaiseHand': instance.allowRaiseHand,
      'muteOnStart': instance.muteOnStart,
    };

_ExternalMediaPlayerFeatures _$ExternalMediaPlayerFeaturesFromJson(
  Map<String, dynamic> json,
) => _ExternalMediaPlayerFeatures(
  isActive: json['isActive'] as bool? ?? false,
  url: json['url'] as String? ?? '',
  isAllow: json['isAllow'] as bool? ?? false,
);

Map<String, dynamic> _$ExternalMediaPlayerFeaturesToJson(
  _ExternalMediaPlayerFeatures instance,
) => <String, dynamic>{
  'isActive': instance.isActive,
  'url': instance.url,
  'isAllow': instance.isAllow,
};

_DisplayExternalLinkFeatures _$DisplayExternalLinkFeaturesFromJson(
  Map<String, dynamic> json,
) => _DisplayExternalLinkFeatures(
  isActive: json['isActive'] as bool? ?? false,
  link: json['link'] as String? ?? '',
  isAllow: json['isAllow'] as bool? ?? false,
);

Map<String, dynamic> _$DisplayExternalLinkFeaturesToJson(
  _DisplayExternalLinkFeatures instance,
) => <String, dynamic>{
  'isActive': instance.isActive,
  'link': instance.link,
  'isAllow': instance.isAllow,
};

_WhiteboardFeatures _$WhiteboardFeaturesFromJson(Map<String, dynamic> json) =>
    _WhiteboardFeatures(
      preloadFile: json['preloadFile'] as String? ?? '',
      fileName: json['fileName'] as String? ?? '',
      whiteboardFileId: json['whiteboardFileId'] as String? ?? '',
      filePath: json['filePath'] as String? ?? '',
      totalPages: (json['totalPages'] as num?)?.toInt() ?? 0,
      visible: json['visible'] as bool? ?? false,
      isAllow: json['isAllow'] as bool? ?? true,
    );

Map<String, dynamic> _$WhiteboardFeaturesToJson(_WhiteboardFeatures instance) =>
    <String, dynamic>{
      'preloadFile': instance.preloadFile,
      'fileName': instance.fileName,
      'whiteboardFileId': instance.whiteboardFileId,
      'filePath': instance.filePath,
      'totalPages': instance.totalPages,
      'visible': instance.visible,
      'isAllow': instance.isAllow,
    };
