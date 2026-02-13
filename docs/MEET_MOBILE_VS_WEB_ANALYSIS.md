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
- **Mobile**: `JoinMeetingScreen._handleJoin()` dùng **placeholder** (`natsWSUrls`, `token`, `roomId` hardcode). **MeetApiService.verifyToken()** đã có nhưng không được gọi.
- **Cần**: Gọi `MeetApiService.verifyToken()` (với token từ deep link / auth), parse `VerifyTokenRes` và truyền vào `sessionProvider.notifier.connect()`.

### 2.2 Connection status → isAppReady
- **Web**: `roomConnectionStatus === 'ready'` mới tắt loading; `setIsAppReady(true)` khi user bấm Join và **media-server-conn-established**.
- **Mobile**: Chỉ khi `status == 'receiving-data'` thì `toggleStartup(false)` → vào phòng. Chưa tách rõ “NATS ready” vs “LiveKit established”; có thể vào màn hình phòng trước khi media sẵn sàng.
- **Cần**: Đồng bộ flow: chỉ coi “vào phòng” khi đã có trạng thái tương đương media-server-conn-established (LiveKit connected) nếu backend hỗ trợ.

### 2.3 Initial data (RES_INITIAL_DATA)
- **Web**: Initial data cập nhật room, user, participants, v.v. vào store.
- **Mobile**: `ConnectNats._handleInitialData()` set `_userName`, `_isAdmin`, `_currentRoomInfo` nhưng **TODO**: “Update providers with initial data” → không cập nhật sessionProvider (currentUser, currentRoom), participantProvider (danh sách user), chat.
- **Cần**: Trong `_handleInitialData` parse `NatsInitialData`, gọi `sessionProvider.addCurrentUser`, `sessionProvider.addCurrentRoom` (nếu có), và participantProvider với danh sách từ initial data (nếu backend gửi).

### 2.4 HandleSystemData – Polls & Breakout
- **Web**: `POLL_CREATED` → `pollsApi.util.invalidateTags(['List', 'PollsStats'])`; `POLL_CLOSED` → invalidate theo pollId; `BREAKOUT_ROOM_ENDED` → `breakoutRoomApi.util.invalidateTags(['List', 'My_Rooms'])`.
- **Mobile**: Trong `handle_system_data.dart` các dòng invalidate **đang comment**: không refetch polls khi có poll mới/đóng, không refresh breakout list khi phòng kết thúc.
- **Cần**: Bật lại logic: khi POLL_CREATED/POLL_CLOSED gọi refetch polls (xem 2.5); khi BREAKOUT_ROOM_ENDED clear/invalidate state breakout (nếu có API hoặc state local).

### 2.5 Polls – Load từ API & invalidation
- **Web**: RTK Query `listPolls`, `getPollsStats`, v.v.; khi invalidateTags thì tự refetch.
- **Mobile**: `PollsBottomSheet` chỉ đọc `pollsProvider.polls`; polls **không được load từ API** khi mở sheet. `PollsNotifier` có addPoll/updatePoll/removePoll nhưng không có `refetchFromApi`.
- **Cần**: (1) Thêm `refetchFromApi(MeetApiService)` (hoặc tương đương) vào PollsNotifier, gọi `listPolls()` và sync state. (2) Khi mở PollsBottomSheet lần đầu (hoặc khi có POLL_CREATED/POLL_CLOSED) gọi refetch.

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
- **Web**: Chat tabs (public/private), file send, chat translation.
- **Mobile**: Chat bottom sheet có tab public/private, ChatInput. Thiếu gửi file (fileSend). `_handleChatTranslation` trong connect_nats là TODO.
- **Cần**: Gửi file (upload + gửi link trong chat), chat translation nếu web đang dùng.

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
- **Mobile**: `settings_bottom_sheet.dart`: TODO cho audio input/output, video device, video quality, connection quality, elapsed time.
- **Cần**: Gắn với LiveKit device list và room settings (mic, camera, speaker).

### 2.14 Participants
- **Mobile**: `participants_bottom_sheet.dart`: “TODO: Add Mute All button if admin”. Participant item có thể thiếu một số action (mute participant, switch presenter, remove) so với web.
- **Cần**: So sánh với web participant menu (mic, webcam, remove, switch presenter, private chat, lock, v.v.) và bổ sung đủ cho mobile.

### 2.15 Breakout room
- **Mobile**: `breakout_rooms_bottom_sheet.dart`: “TODO: Create breakout rooms”. Đã có join breakout (meeting_room_screen), joinBreakoutRoom API.
- **Cần**: UI tạo/quản lý breakout (nếu admin); sau BREAKOUT_ROOM_ENDED clear invitation/state.

### 2.16 Token renewal
- **Web**: `_renewToken()` định kỳ, gọi API lấy token mới.
- **Mobile**: `ConnectNats._renewToken()`: TODO, chưa gọi API.
- **Cần**: Gọi API renew token (nếu backend có endpoint) và cập nhật token trong session/NATS.

### 2.17 Analytics
- **Web**: sendAnalyticsData qua NATS.
- **Mobile**: `_sendAnalyticsData` chỉ debug print; connect_livekit “TODO: Send analytics data to NATS”.
- **Cần**: Gửi analytics thật khi cần đo lường.

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
