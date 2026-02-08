# Meet Mobile App – Tóm tắt tính năng & so sánh với Web

## 1. Các tính năng đã làm trên Meet Mobile

### 1.1 Kết nối & signaling
- **REST API (MeetApiService)**  
  - `isRoomActive`, `createRoom`, `getJoinToken` (hash signature, API-KEY).  
  - `verifyToken` (Protobuf) → trả về NATS URL, LiveKit URL, token, room info, danh sách subject (chat, whiteboard, dataChannel…).
- **NATS (NatsService)**  
  - Kết nối WebSocket (wss/ws) với token trong connect options.  
  - **JetStream pull** khi server trả `roomStreamName`: consumer `roomId_userId`, request `$JS.API.CONSUMER.MSG.NEXT.<stream>.<consumer>`.  
  - Parse reply → `NatsMsgServerToClient`, dispatch theo event type.  
  - Subscribe chat / whiteboard / dataChannel theo pattern `subject.roomId` (giống web).  
  - **PING** (1 phút) và **TOKEN_RENEW** (3 phút).  
  - Subscribe system (systemPrivate/systemPublic) trước khi gửi `REQ_INITIAL_DATA`.
- **LiveKit (LiveKitService)**  
  - `connect(url, token)` với RoomOptions (adaptiveStream, dynacast, simulcast, videoCodec).  
  - Listeners: TrackSubscribed/Unsubscribed, ParticipantConnected/Disconnected, ActiveSpeakers, ConnectionQuality.  
  - **Reconnecting/Reconnected**: callback để UI debounce “disconnected” và hiển thị “Reconnecting…”.  
  - Identity mobile: server cấp `userId_mobile` khi `user_metadata.extra_data.client === 'mobile'`; app coi `userId` và `userId_mobile` là local.

### 1.2 Luồng join meeting
- **Trạng thái (MeetStatus)**  
  `initial` → `signaling` → `natsConnecting` → `natsConnected` → `deviceSetup` → `mediaConnecting` → `connected` (hoặc `disconnected` / `error`).
- **Device setup**  
  - Sau `RES_INITIAL_DATA` chuyển sang `deviceSetup`, không gửi `REQ_MEDIA_SERVER_DATA` ngay.  
  - Màn hình setup: tên phòng, preview camera (placeholder), chip Camera/Mic, nút **Join**.  
  - Bấm Join → `startMediaConnection()` → gửi `REQ_MEDIA_SERVER_DATA`, set `mediaConnecting` → nhận `RES_MEDIA_SERVER_DATA` → connect LiveKit **một lần** (guard `_isConnectingToLiveKit` + chỉ khi `status == mediaConnecting`).  
- **Join by Room ID** (form nhập roomId + tên) và **Join by Token** (nhập wajlc token thủ công).

### 1.3 Xử lý sự kiện NATS (server → client)
- **RES_INITIAL_DATA**: Parse NatsInitialData + UserMetadata (snake_case → camelCase), set localUser, roomMetadata, participantsMetadata, subscribe chat/whiteboard/dataChannel, set `deviceSetup`.
- **RES_MEDIA_SERVER_DATA**: Parse MediaServerConnInfo → `_connectToLiveKit` (chỉ 1 lần, không ghi đè connected).
- **RES_JOINED_USERS_LIST**: Cập nhật remoteParticipantsMap, participantsMetadata.
- **USER_JOINED / USER_OFFLINE / USER_METADATA_UPDATE**: Cập nhật danh sách user, metadata (raise hand, lock mic/cam…).
- **ROOM_METADATA_UPDATE**: Cập nhật room metadata (ví dụ is_recording).
- **POLL_CREATED / POLL_CLOSED**: Chỉ thông báo toast, không có UI poll.
- **JOIN_BREAKOUT_ROOM**: Toast “Join breakout room”.
- **SESSION_ENDED**: Leave meeting, set disconnected, toast.

### 1.4 Media & điều khiển
- **Mic / Cam**: Bật/tắt theo state; khi connected gọi LiveKit `setMicrophoneEnabled` / `setCameraEnabled`.  
- **Lock settings**: Hiển thị lock mic/cam từ room (admin), disable nút tương ứng cho non-admin.
- **Raise hand**: Gửi USER_METADATA_UPDATE qua NATS (toggle raisedHand).
- **Speakerphone**: Bật/tắt loa ngoài (Helper.setSpeakerphoneOn).
- **Screen share**: LiveKit `setScreenShareEnabled` có implement nhưng **nút Share màn hình bị ẩn** trên UI mobile (không phù hợp mobile).
- **Sort participants**: Active speaker → Last spoke at → Join time (theo remoteParticipantsMap); coi `userId` và `userId_mobile` là cùng một user.

### 1.5 UI meeting
- **MeetingScreen**: AppBar (room name, REC badge khi isRecording, nút Chat), body theo status (form join / loading / device setup / grid participants), notification toast, bottom bar = MeetingControls khi connected.
- **ParticipantTile**: Video (VideoTrackRenderer) hoặc avatar, tên, trạng thái mic (muted/unmuted).  
- **Screen share**: Khi có track screenShareVideo → hiển thị nổi bật (screenSharingParticipant), ẩn khi unsubscribed.
- **MeetingControls**: Mic, Cam, Hand raise, Speaker, Leave (có confirm).
- **Chat**: Bottom sheet, gửi/nhận tin qua NATS subject chat, hiển thị danh sách tin (ChatBottomSheet).
- **Whiteboard**: Subscribe subject whiteboard và nhận message (handle log), **chưa có canvas/vẽ**.

### 1.6 Ổn định & lỗi
- **Proto3 JSON snake_case**: Dùng `_snakeToCamelMap` + `mergeFromProto3Json` cho mọi payload NATS từ server (Buf).
- **RES_MEDIA_SERVER_DATA nhiều lần**: Chỉ connect LiveKit một lần; không ghi đè `connected` khi một attempt khác timeout.
- **RoomDisconnectedEvent**: Debounce 2.5s; nếu có RoomReconnectingEvent / RoomReconnectedEvent thì hủy set disconnected, hiển thị “Reconnecting…” / “Connected”.

### 1.7 Khác
- **Analytics**: Gửi ANALYTICS_EVENT_USER_CONNECTION_QUALITY lên NATS khi LiveKit báo connection quality.
- **Config**: MeetConfig (dynacast, simulcast, videoCodec, v.v.) trong `lib/features/meet/core/meet_config.dart`.
- **Proto**: Sync từ monorepo `packages/protocol/proto`, generate Dart (script `sync_proto_from_monorepo.sh` + `generate_proto.sh`).

---

## 2. So sánh với bản Web (apps/meet)

### 2.1 Giống / tương đương
| Hạng mục | Web | Mobile |
|----------|-----|--------|
| REST auth (isRoomActive, createRoom, getJoinToken) | ✅ | ✅ |
| verifyToken (Protobuf) | ✅ | ✅ |
| NATS JetStream / system subjects / REQ_INITIAL_DATA → RES_* | ✅ | ✅ (pull consumer) |
| LiveKit connect, tracks, participants, active speaker | ✅ | ✅ |
| Chat (NATS subject, gửi/nhận) | ✅ | ✅ (bottom sheet) |
| Danh sách participants, sort (speaker / last spoke / join) | ✅ | ✅ |
| Mic/Cam/Hand raise/Speaker/Leave | ✅ | ✅ |
| Lock mic/cam (admin), hiển thị cho user | ✅ | ✅ |
| Screen share (xem track screenShare) | ✅ | ✅ (chỉ xem, không bật share trên mobile) |
| Room metadata (is_recording, room title…) | ✅ | ✅ |
| PING / TOKEN_RENEW | ✅ | ✅ |
| Reconnecting / debounce disconnected | ✅ | ✅ (Reconnecting/Reconnected + timer) |

### 2.2 Khác biệt (Mobile đơn giản hơn hoặc khác cách dùng)
| Hạng mục | Web | Mobile |
|----------|-----|--------|
| **Join flow** | Landing có preview cam/mic, rồi vào meeting | Có bước **device setup** riêng (room name, cam/mic chip, nút Join) rồi mới connect LiveKit |
| **Identity** | Một identity per client | Server dùng `userId_mobile` cho mobile; app ẩn trùng user PC/mobile khi sort |
| **Screen share** | Có nút bật share màn hình | Ẩn nút share; chỉ xem share của người khác |
| **Chat** | Tab chat, file upload, dịch | Bottom sheet, chat text cơ bản (không file upload / dịch) |

### 2.3 Chưa có trên Mobile (có trên Web)
| Tính năng | Mô tả ngắn |
|-----------|-------------|
| **Polls** | Web: tạo poll, trả lời, danh sách poll. Mobile: chỉ toast POLL_CREATED/POLL_CLOSED. |
| **Breakout rooms** | Web: tạo/quản lý phòng nhỏ, mời user, join. Mobile: chỉ toast JOIN_BREAKOUT_ROOM. |
| **Recording** | Web: bật/dừng cloud recording, local recording, UI trạng thái. Mobile: chỉ hiển thị badge REC (is_recording từ metadata), không điều khiển ghi hình. |
| **Whiteboard** | Web: canvas vẽ, đồng bộ, quản lý file. Mobile: subscribe whiteboard và log message, không có UI vẽ. |
| **Waiting room** | Web: host duyệt từng user vào phòng. Mobile: chưa có flow chờ duyệt. |
| **External media** | Web: phát video/audio từ link hoặc upload. Mobile: chưa có. |
| **Virtual background** | Web: blur / ảnh nền (TFLite). Mobile: chưa có. |
| **Transcription / translation** | Web: phụ đề, dịch chat, speech-to-text. Mobile: chưa có. |
| **Insights AI** | Web: AI chat, meeting summarization. Mobile: chưa có. |
| **Display external link** | Web: hiển thị link bên ngoài. Mobile: chưa có. |
| **RTMP** | Web: stream ra RTMP. Mobile: chưa có. |
| **E2EE** | Web: có option E2EE (InsertE2EEKey). Mobile: chưa (plan_implement ghi optional/next step). |
| **Admin menus** | Web: lock settings, mute all, v.v. trong menu. Mobile: chỉ hiển thị lock, không có menu admin đầy đủ. |

---

## 3. Tóm tắt ngắn

- **Đã có trên Mobile**: Join phòng (room ID + token), signaling NATS + LiveKit, device setup, video/audio, chat cơ bản, danh sách participants, raise hand, speakerphone, xem screen share, lock mic/cam, reconnecting/debounce disconnect, REC badge.
- **Khác so với Web**: Flow join có bước device setup; identity `_mobile`; ẩn nút screen share; chat dạng bottom sheet.
- **Chưa có so với Web**: Polls, Breakout rooms, điều khiển Recording, Whiteboard UI, Waiting room, External media, Virtual background, Transcription/Translation, Insights AI, E2EE, admin menus đầy đủ.

File này có thể cập nhật khi mobile bổ sung tính năng mới.
