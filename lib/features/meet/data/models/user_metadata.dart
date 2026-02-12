
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_metadata.freezed.dart';
part 'user_metadata.g.dart';

@freezed
abstract class UserMetadata with _$UserMetadata {
  const factory UserMetadata({
    @Default(false) bool isPresenter,
    @Default(false) bool isAdmin,
    @Default(false) bool raisedHand,
    @Default(false) bool isHandRaised, // Alias for compatibility
    @Default(false) bool waitForApproval,
    @Default(true) bool isOnline, // Participant online status
    String? profilePic,
    LockSettings? lockSettings,
  }) = _UserMetadata;

  factory UserMetadata.fromJson(Map<String, dynamic> json) => _$UserMetadataFromJson(json);
}

@freezed
abstract class LockSettings with _$LockSettings {
  const factory LockSettings({
    @Default(false) bool lockWhiteboard,
    @Default(false) bool lockMic,
    @Default(false) bool lockCamera,
    @Default(false) bool lockChat,
    @Default(false) bool lockScreenShare,
  }) = _LockSettings;

  factory LockSettings.fromJson(Map<String, dynamic> json) => _$LockSettingsFromJson(json);
}
