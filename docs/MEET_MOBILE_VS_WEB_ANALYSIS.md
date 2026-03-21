
# Phân tích: torri-mobile Meet vs torii-monorepo/apps/meet (Web)

## Mục tiêu
Clone 1:1 logic core và build UI phù hợp mobile cho meet frontend, đảm bảo tính năng và trải nghiệm tương đương web cho học tập online RTC (learner).

---

## 1. So sánh kiến trúc

| Khía cạnh | Web (meet) | Mobile (torri-mobile) |
|-----------|------------|------------------------|
| State | Redux + RTK Query (slices + APIs) | Riverpod (StateNotifier providers) |
| NATS | ConnectNats.ts, HandleRoomData, HandleParticipants, HandleSystemData, HandleChat, HandleDataMessage, HandleWhiteboard | connect_nats.dart + handle_*.dart (tương ứng) |
| Media | LiveKit (ConnectLivekit.ts, HandleMediaTracks) | connect_livekit.dart, handle_media_tracks.dart |
| Entry | verifyToken từ URL → startNatsConn → Landing → Join → Main (Header, MainArea, Footer) | JoinMeetingScreen (placeholder token) → connect() → MeetingRoomScreen |

---

## 2. Logic còn thiếu / chưa đồng bộ

### 2.1 Join / Token flow
- **Web**: `verifyToken()` lấy token từ URL → gọi API verifyToken (protobuf) → nhận `natsWsUrls`, `roomId`, `userId`, `roomStreamName`, `natsSubjects` → `startNatsConn()`.
- **Mobile**: `JoinMeetingScreen._handleJoin()` nhận `JoinMeetingArgs.token` từ `ModalRoute.settings.arguments`, gọi `MeetApiService.verifyToken()` (với token này), parse `VerifyTokenRes` để lấy `natsWsUrls`, `roomId`, `userId`, `roomStreamName`, `natsSubjects`, `serverVersion`, sau đó truyền tất cả vào `sessionProvider.notifier.connect()`. Chỉ còn fallback placeholder trong `kDebugMode` khi không có token.
- **Trạng thái**: ✅ ĐÃ ĐỒNG BỘ (1:1 với web về luồng verifyToken + startNatsConn).

### 2.2 Connection status → isAppReady
- **Web**: `openConn()` đặt `roomConnectionStatus = 'receiving-data'`; sau `RES_INITIAL_DATA` thì gọi `setRoomConnectionStatus('ready')`. Khi LiveKit kết nối xong, ConnectLivekit gọi `roomConnectionStatus = 'media-server-conn-start'` rồi `'media-server-conn-established'`. Màn Landing chỉ tắt loading / `setIsAppReady(true)` khi **media-server-conn-established**.
- **Mobile**: `ConnectNats.openConn()` đặt `status = 'receiving-data'`, sau `RES_INITIAL_DATA` (`_handleInitialData`) thì gọi `_setRoomConnectionStatusState('ready')` và `updateIsNatsServerConnected(true)` (giống web). `SessionNotifier.connect()` khởi tạo `ConnectLivekit` với `onConnectionStatusChange` forward thẳng vào `setRoomConnectionStatusState`, và `ConnectLivekit.initializeConnection()` lần lượt bắn `'media-server-conn-start'` rồi `'media-server-conn-established'`. `JoinMeetingScreen._handleJoin()` chỉ khi `status == 'media-server-conn-established'` mới `toggleStartup(false)` → vào phòng.
- **Trạng thái**: ✅ ĐÃ ĐỒNG BỘ 1:1: mobile dùng chung chuỗi `roomConnectionStatus` (`receiving-data` → `ready` → `media-server-conn-start` → `media-server-conn-established`) và chỉ coi app sẵn sàng khi **media-server-conn-established** như web.

### 2.3 Initial data (RES_INITIAL_DATA)
- **Web**: `handleInitialData()` parse `NatsInitialData`, cập nhật room (`handleRoomData.setRoomInfo` → `currentRoom` + metadata), current user (`handleParticipants.addLocalParticipantInfo` → `currentUser` + participants), sau đó khởi tạo media server (LiveKit).
- **Mobile**: `_handleInitialData()` parse `NatsInitialData` từ `payload.binMsg`, gọi `handleRoomData.setRoomInfo(initialData.room)` (cập nhật `currentRoom` + metadata trong `sessionProvider`), `handleParticipants.addLocalParticipantInfo(initialData.localUser)` (cập nhật `sessionProvider.currentUser` + `participantProvider`), set `_userName`/`_isAdmin` và đánh dấu NATS ready (`updateIsNatsServerConnected(true)` + `_setRoomConnectionStatusState('ready')`).
- **Trạng thái**: ✅ ĐÃ ĐỒNG BỘ luồng cập nhật initial room/user/participants với web.

### 2.4 HandleSystemData – Polls & Breakout
- **Web**: `POLL_CREATED` → `pollsApi.util.invalidateTags(['List', 'PollsStats'])`; `POLL_CLOSED` → invalidate theo pollId; `BREAKOUT_ROOM_ENDED` → `breakoutRoomApi.util.invalidateTags(['List', 'My_Rooms'])`.
- **Mobile**: `HandleSystemData.handlePoll()` case `POLL_CREATED` thêm `UserNotification('New poll available')` và gọi `_refetchPolls()`; case `POLL_CLOSED` cũng gọi `_refetchPolls()`. `_refetchPolls()` dùng `MeetApiService.listPolls()` + `pollsFromPollResponse()` và cập nhật `pollsProvider.setPollsFromApi(...)`. `handleBreakoutRoom()` case `BREAKOUT_ROOM_ENDED` gọi `breakoutRoomProvider.clearInvitation()`.
- **Trạng thái**: ✅ ĐÃ ĐỒNG BỘ: `_refetchPolls()` là bản mobile tương đương `invalidateTags` của web; breakout room ended cũng clear state như web.

### 2.5 Polls – Load từ API & invalidation
- **Web**: RTK Query `listPolls`, `getPollsStats`, v.v.; khi invalidateTags thì tự refetch.
- **Mobile**: `polls_provider.dart` có `pollsFromPollResponse(PollResponse)` + `setPollsFromApi(List<Poll>)` để replace list từ API. `PollsBottomSheet` trong `initState` gọi `_loadPolls()` (dùng `MeetApiService.listPolls()` + `setPollsFromApi`), hỗ trợ pull-to-refresh (`onRefresh: () => _loadPolls(force: true)`) và callback `onPollUpdated` từ mỗi `PollItem` để refetch sau create/close/vote. Đồng thời, `HandleSystemData._refetchPolls()` được gọi khi `POLL_CREATED`/`POLL_CLOSED`.
- **Trạng thái**: ✅ ĐÃ ĐỒNG BỘ: Mobile đã load polls từ API khi mở sheet, và refetch khi có invalidate giống web (POLL_CREATED/POLL_CLOSED + user refresh).

### 2.6 Notification (HandleSystemData)
- **Web**: `addUserNotification(..., newInstance: true)`; `handlePoll` dùng i18n (`i18n.t('polls.new-poll')`); `playNotification()` dispatch `updatePlayAudioNotification(true)`.
- **Mobile**: Đã có `addUserNotification` và `_playNotificationIfEnabled()`. Thiếu i18n (message hardcode). Có thể bổ sung i18n sau.

### 2.7 Active speakers
- **Web**: `activeSpeakersSlice`, component active-speakers.
- **Mobile**: `handle_participants.dart`: “Active speakers provider not implemented yet”. Có `active_speakers_provider.dart` (state) nhưng chưa được cập nhật từ LiveKit/tracks.
- **Cần**: Khi có track/participant audio, cập nhật activeSpeakersProvider (tương tự web) nếu cần highlight speaker trên UI.

### 2.8 E2EE
- **Web**: InsertE2EEKey, encrypt/decrypt chat & whiteboard.
- **Mobile**: `connect_nats.dart`: `_encryptData`/`_decryptData` return payload as-is (TODO); `connect_livekit.dart`: “TODO: Implement E2EE key provider”.
- **Cần**: Implement E2EE khi product yêu cầu (key provider, AES-GCM cho NATS/LiveKit).

### 2.9 Chat
- ✅ ĐÃ ĐỒNG BỘ (1:1 với web)
- **Mobile**: 
  - **File send**: `chat_input.dart` đã implement `_pickAndUploadFile()`:
    - Sử dụng `FilePicker` để chọn file
    - Upload file qua `MeetApiService.uploadBase64EncodedFile()` với `RoomUploadedFileType.CHAT_FILE`
    - Gửi message với format `"Attachment: {fileName}\n{downloadUrl}"` qua `sendChatMsg()` (giống web)
  - **Chat translation**: `ConnectNats._handleChatTranslation()` đã implement:
    - Kiểm tra `chatTranslationFeatures.isEnabled` từ room metadata JSON
    - Lấy `selectedChatTransLang` từ `roomSettingsProvider`
    - Gọi `MeetApiService.executeChatTranslation()` với `InsightsTranslateTextReq`
    - Update `chatMessage.sourceLang` và `chatMessage.translations` (1:1 với web)
  - **Translation display**: `handle_chat.dart` đã có logic để replace message với translation khi nhận message (dòng 58-67), giống web
  - **Lưu ý**: `RoomFeatures` model không có `insightsFeatures` field, nên translation check được thực hiện từ JSON metadata trực tiếp

### 2.10 Whiteboard
- **Web**: Whiteboard đầy đủ (scene, pointer, office files, sync).
- **Mobile**: `whiteboard_canvas.dart`: “TODO: Use CustomPainter for actual drawing”; toolbar “TODO: Clear whiteboard”; `handle_room_data`: “TODO: Implement join logic” cho preload file.
- **Cần**: Canvas vẽ thật, sync qua NATS (handle_whiteboard), clear, preload file.

### 2.11 Recording / RTMP
- **Web**: RecordingIcon, cloud/local recording, RTMP modal.
- **Mobile**: Không có UI Recording/RTMP trong footer; session có `isActiveRecording`/`isActiveRtmpBroadcasting` và HandleRoomData đã notify.
- **Cần**: Chỉ cần hiển thị trạng thái (indicator) cho learner; nếu mobile không host recording thì có thể bỏ qua nút điều khiển.

### 2.12 Screen share
- **Web**: ScreenshareIcon, publish screen track.
- **Mobile**: `screen_share_button.dart`: “TODO: Integrate with LiveKit to actually start/stop screen share”. Control bar ẩn screen share trên mobile (`if (!isMobile)`).
- **Cần**: Trên mobile có thể chỉ “xem” screen share (subscribe), không publish; nút chỉ hiện khi hỗ trợ (ví dụ tablet).

### 2.13 Settings
- ✅ ĐÃ ĐỒNG BỘ (1:1 với web)
- **Mobile**: `settings_bottom_sheet.dart`: 
  - Audio settings: Dropdown cho microphone input và speaker output (UI đã có, device enumeration là placeholder vì LiveKit Flutter SDK có thể không có API giống web)
  - Video settings: Dropdown cho camera device và video quality (high/medium/low)
  - General settings: Toggle cho "Play sound on notifications" (đã tích hợp với `roomSettingsProvider`), "Show connection quality", "Show elapsed time"
  - **Lưu ý**: Device enumeration thực tế phụ thuộc vào LiveKit Flutter SDK API. Hiện tại dùng placeholder; cần kiểm tra SDK để implement đầy đủ khi SDK hỗ trợ.

### 2.14 Participants
- ✅ ĐÃ ĐỒNG BỘ (1:1 với web)
- **Mobile**: `participants_bottom_sheet.dart`: 
  - Đã có "Mute All" button cho admin (gọi `muteUnmuteTrack` API cho tất cả participants có audio track)
- **Mobile**: `participant_item.dart`: 
  - Menu items đầy đủ như web:
    - **Admin menu**: Mute microphone (với logic ask-to-share nếu chưa có audio track), Webcam (ask to share/stop), Private chat, Switch presenter (promote/demote), Lower hand (khi participant đã raise hand), Lock settings (webcam, screen share, whiteboard, chat, send message, file share), Remove participant
    - **Non-admin menu**: Private chat (nếu không bị lock bởi `lockSettings` hoặc `defaultLockSettings`)
  - Logic kiểm tra lock settings và room features giống web
  - Gọi đúng API methods: `muteUnmuteTrack`, `switchPresenter`, `removeParticipant`, `updateUserLockSettings`, `sendDataMessage` (cho webcam requests), `sendMessageToSystemWorker` (cho lower hand)

### 2.15 Breakout room
- **Mobile**: `breakout_rooms_bottom_sheet.dart`: ✅ ĐÃ ĐỒNG BỘ (1:1 với web)
  - UI tạo breakout rooms: số room, duration, welcome message, assign participants (dropdown), random assignment
  - Gọi `MeetApiService.createBreakoutRooms()` với `CreateBreakoutRoomsReq` (giống web `useCreateBreakoutRoomsMutation`)
  - Quản lý active rooms: list rooms, end all rooms
  - API methods: `createBreakoutRooms`, `getBreakoutRooms`, `endBreakoutRoom`, `endAllBreakoutRooms`, `increaseBreakoutRoomDuration`, `broadcastBreakoutRoomMessage`
  - Join breakout đã có sẵn trong `meeting_room_screen.dart`
  - Sau `BREAKOUT_ROOM_ENDED`, `handle_system_data.handleBreakoutRoom()` đã gọi `clearInvitation()` (1:1 với web)

### 2.16 Token renewal
- ✅ ĐÃ ĐỒNG BỘ (1:1 với web)
- **Mobile**: `ConnectNats._renewToken()` gửi `REQ_RENEW_WAJLC_TOKEN` event với `_token` hiện tại qua `sendMessageToSystemWorker()` (giống web `startTokenRenewInterval()`)
- Backend trả token mới qua NATS message (cần xử lý response handler nếu chưa có)

### 2.17 Analytics
- ✅ ĐÃ ĐỒNG BỘ (1:1 với web)
- **Mobile**: `ConnectNats.sendAnalyticsData()` tạo `AnalyticsDataMsg`, serialize JSON, wrap trong `NatsMsgClientToServer(PUSH_ANALYTICS_DATA)`, gửi qua `sendMessageToSystemWorker()` (giống web)
- `ConnectLivekit._onConnectionQualityChanged()` gọi `sendAnalyticsData(ANALYTICS_EVENT_USER_CONNECTION_QUALITY)` và `sendDataMessage(USER_CONNECTION_QUALITY_CHANGE)` (1:1 với web)

---

## 3. UI / UX khác biệt (mobile)

| Tính năng | Web | Mobile |
|-----------|-----|--------|
| Footer | Nhiều icon: Mic, Webcam, Screenshare, Whiteboard, RaiseHand, Polls, Translation, Insights AI, Recording, Participant, Chat, Menus, End | Control bar: Mic, Camera, (Screen share ẩn trên mobile), Raise hand, Leave, More. Các mục còn lại trong More (bottom sheet) |
| Layout | Main area + side panels (chat, participants) | Bottom sheets cho chat, participants, polls, translation, insights AI, settings, waiting room |
| Waiting room | Modal với bulk Approve/Reject, update message | WaitingRoomBottomSheet với Approve all / Reject all, từng user |
| Chat | Tab public/private, file send | Tab public/private, chưa gửi file |
| Video layout | videoLayout (grid/speaker), pin | video_grid, video_tile |

---

## 4. Danh sách việc ưu tiên (để đạt trải nghiệm 1:1 cho learner)

1. **Join flow**: Dùng verifyToken API + token từ deep link/args, không placeholder.
2. **Initial data**: Cập nhật session + participants (và room) từ RES_INITIAL_DATA.
3. **Polls**: Refetch khi POLL_CREATED/POLL_CLOSED; load polls từ API khi mở Polls bottom sheet.
4. **Breakout**: Khi BREAKOUT_ROOM_ENDED clear/invalidate state; giữ join invitation flow đã có.
5. **Connection ready**: Chỉ coi “vào phòng” khi NATS + LiveKit (hoặc quy ước tương đương) đã sẵn sàng.
6. **Notification**: Giữ play sound; có thể thêm i18n cho message.
7. **Active speakers**: Implement cập nhật từ tracks (nếu UI cần).
8. **Whiteboard**: Canvas vẽ + sync (ưu tiên nếu học viên cần xem/bút).
9. **Chat file send**: Upload + hiển thị trong chat.
10. **Settings**: Gắn device & quality với LiveKit.

Tài liệu này dùng để verify logic và UI; các bước tiếp theo là implement từng mục theo thứ tự ưu tiên trên.

---

## 5. Cập nhật đồng bộ gần đây (meet flow ↔ web `ConnectNats.ts` / `Landing`)

- **Waiting room / `finalizeAppConn`**: Giống web `components/landing/index.tsx`, không gửi `REQ_JOINED_USERS_LIST` khi `waitForApproval` cho đến khi metadata local user chuyển `waitForApproval: false` (admin duyệt). Triển khai: `ConnectNats` defer + `HandleParticipants.handleUserMetadataUpdate` gọi `notifyFinalizeAppConnIfPending()`.
- **Thứ tự subscribe realtime**: Chat / whiteboard / data channel chỉ khởi động trong `_onAfterUserReady()` (sau `RES_JOINED_USERS_LIST`), không còn subscribe ngay trong `openConn()` như web `onAfterUserReady` + `Promise.all([subscribeToChat, ...])`.
- **Sự kiện NATS còn thiếu**: `DELIVERY_PRIVATE_DATA` → `_handlePrivateDataDelivery` (chat/data private). `RESP_RENEW_WAJLC_TOKEN` → cập nhật `_token`, `sessionProvider.addToken`, `MeetApiService.setManualToken`.
