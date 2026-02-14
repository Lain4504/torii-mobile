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
) => _BreakoutRoomFeatures(isActive: json['isActive'] as bool? ?? false);

Map<String, dynamic> _$BreakoutRoomFeaturesToJson(
  _BreakoutRoomFeatures instance,
) => <String, dynamic>{'isActive': instance.isActive};

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
    );

Map<String, dynamic> _$RoomFeaturesToJson(_RoomFeatures instance) =>
    <String, dynamic>{
      'whiteboardFeatures': instance.whiteboardFeatures,
      'chat': instance.chat,
      'whiteboard': instance.whiteboard,
      'externalMediaPlayerFeatures': instance.externalMediaPlayerFeatures,
      'displayExternalLinkFeatures': instance.displayExternalLinkFeatures,
      'breakoutRoomFeatures': instance.breakoutRoomFeatures,
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
    );

Map<String, dynamic> _$WhiteboardFeaturesToJson(_WhiteboardFeatures instance) =>
    <String, dynamic>{
      'preloadFile': instance.preloadFile,
      'fileName': instance.fileName,
      'whiteboardFileId': instance.whiteboardFileId,
      'filePath': instance.filePath,
      'totalPages': instance.totalPages,
    };
