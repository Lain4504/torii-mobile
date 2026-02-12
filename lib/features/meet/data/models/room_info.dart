
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
abstract class RoomFeatures with _$RoomFeatures {
  const factory RoomFeatures({
    WhiteboardFeatures? whiteboardFeatures,
    @Default(false) bool chat,
    @Default(false) bool whiteboard,
  }) = _RoomFeatures;

  factory RoomFeatures.fromJson(Map<String, dynamic> json) => _$RoomFeaturesFromJson(json);
}

@freezed
abstract class WhiteboardFeatures with _$WhiteboardFeatures {
  const factory WhiteboardFeatures({
    @Default('') String preloadFile,
    @Default('') String fileName,
    @Default('') String whiteboardFileId,
    @Default('') String filePath,
    @Default(0) int totalPages,
  }) = _WhiteboardFeatures;

  factory WhiteboardFeatures.fromJson(Map<String, dynamic> json) => _$WhiteboardFeaturesFromJson(json);
}
