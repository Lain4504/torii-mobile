
import 'package:freezed_annotation/freezed_annotation.dart';

part 'room_info.freezed.dart';
part 'room_info.g.dart';

@freezed
abstract class RoomInfo with _$RoomInfo {
  const factory RoomInfo({
    String? metadataId,
    @Default('') String roomTitle,
    @Default(false) bool isRecording,
    @Default(false) bool isActiveRtmp,
    @Default('') String welcomeMessage,
    RoomFeatures? roomFeatures,
    
    // Additional fields for compatibility
    String? roomId,
    String? roomSid,
  }) = _RoomInfo;

  factory RoomInfo.fromJson(Map<String, dynamic> json) => _$RoomInfoFromJson(json);
}

@freezed
abstract class BreakoutRoomFeatures with _$BreakoutRoomFeatures {
  const factory BreakoutRoomFeatures({
    @Default(false) bool isActive,
  }) = _BreakoutRoomFeatures;

  factory BreakoutRoomFeatures.fromJson(Map<String, dynamic> json) =>
      _$BreakoutRoomFeaturesFromJson(json);
}

@freezed
abstract class ChatFeatures with _$ChatFeatures {
  const factory ChatFeatures({
    @Default(true) bool isAllow,
    @Default(true) bool isAllowFileUpload,
    @Default([]) List<String> allowedFileTypes,
    @Default(0) int maxFileSize,
  }) = _ChatFeatures;

  factory ChatFeatures.fromJson(Map<String, dynamic> json) =>
      _$ChatFeaturesFromJson(json);
}

@freezed
abstract class RoomFeatures with _$RoomFeatures {
  const factory RoomFeatures({
    WhiteboardFeatures? whiteboardFeatures,
    @Default(false) bool chat,
    @Default(false) bool whiteboard,
    ExternalMediaPlayerFeatures? externalMediaPlayerFeatures,
    DisplayExternalLinkFeatures? displayExternalLinkFeatures,
    BreakoutRoomFeatures? breakoutRoomFeatures,
    ChatFeatures? chatFeatures,

    // Common missing fields
    @Default(true) bool allowWebcams,
    @Default(false) bool adminOnlyWebcams,
    @Default(true) bool allowScreenShare,
    @Default(true) bool allowViewOtherWebcams,
    @Default(true) bool allowViewOtherUsersList,
    @Default(true) bool allowRaiseHand,
    @Default(false) bool muteOnStart,
  }) = _RoomFeatures;

  factory RoomFeatures.fromJson(Map<String, dynamic> json) => _$RoomFeaturesFromJson(json);
}

@freezed
abstract class ExternalMediaPlayerFeatures with _$ExternalMediaPlayerFeatures {
  const factory ExternalMediaPlayerFeatures({
    @Default(false) bool isActive,
    @Default('') String url,
    @Default(false) bool isAllow,
  }) = _ExternalMediaPlayerFeatures;

  factory ExternalMediaPlayerFeatures.fromJson(Map<String, dynamic> json) =>
      _$ExternalMediaPlayerFeaturesFromJson(json);
}

@freezed
abstract class DisplayExternalLinkFeatures with _$DisplayExternalLinkFeatures {
  const factory DisplayExternalLinkFeatures({
    @Default(false) bool isActive,
    @Default('') String link,
    @Default(false) bool isAllow,
  }) = _DisplayExternalLinkFeatures;

  factory DisplayExternalLinkFeatures.fromJson(Map<String, dynamic> json) =>
      _$DisplayExternalLinkFeaturesFromJson(json);
}

@freezed
abstract class WhiteboardFeatures with _$WhiteboardFeatures {
  const factory WhiteboardFeatures({
    @Default('') String preloadFile,
    @Default('') String fileName,
    @Default('') String whiteboardFileId,
    @Default('') String filePath,
    @Default(0) int totalPages,
    /// Khớp web `roomFeatures.whiteboardFeatures.visible` — presenter bật/tắt bảng qua API.
    @Default(false) bool visible,
    @Default(true) bool isAllow,
  }) = _WhiteboardFeatures;

  factory WhiteboardFeatures.fromJson(Map<String, dynamic> json) => _$WhiteboardFeaturesFromJson(json);
}
