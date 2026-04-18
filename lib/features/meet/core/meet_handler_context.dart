import 'package:torii_app/features/meet/data/models/room_info.dart';

/// Context dùng trong callback NATS/LiveKit — không đọc [sessionProvider] (tránh CircularDependencyError).
abstract class MeetHandlerContext {
  String get meetLocalUserId;
  bool get meetLocalIsAdmin;
  bool get meetLocalIsRecorder;
  bool get meetLocalIsPresenter;
  RoomFeatures? get meetRoomFeatures;
}
