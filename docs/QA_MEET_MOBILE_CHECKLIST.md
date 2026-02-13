### QA Checklist – Meet Mobile (1:1 Web)

Mục tiêu: kiểm tra bản `torri-mobile` meet client **rep 1:1 logic** với `apps/meet` (web).  
Chấp nhận khác biệt UI do mobile, **không chấp nhận khác biệt về hành vi / logic**.

---

### 1. Join / Token / Session

- **1.1 Join meeting với token hợp lệ**
  - **Precondition**: Có deep link/token hợp lệ giống web.
  - **Steps**:
    - Mở app, join bằng token.
  - **Expected**:
    - Join vào phòng thành công, không lỗi.
    - `isStartup` chuyển về `false` sau khi LiveKit connected (trạng thái “ready” giống web).

- **1.2 Token invalid / expired**
  - **Precondition**: Token hết hạn/invalid (backend trả lỗi giống web).
  - **Steps**:
    - Join bằng token sai hoặc đã hết hạn.
  - **Expected**:
    - Không join được phòng.
    - Hiển thị thông báo lỗi tương đương web (nội dung + UX hợp lý).

- **1.3 Token renewal (refresh)**
  - **Precondition**: Đang trong phòng, token gần hết hạn.
  - **Steps**:
    - Giữ user trong phòng đến khi đến thời điểm renew token.
  - **Expected**:
    - Mobile gửi NATS event `REQ_RENEW_WAJLC_TOKEN`.
    - Backend trả token mới, user không bị out khỏi phòng.
    - Media (audio/video) và NATS vẫn hoạt động, giống web.

---

### 2. Connection Status / isAppReady

- **2.1 App chỉ “ready” khi LiveKit `media-server-conn-established`**
  - **Steps**:
    - Join meeting.
    - Quan sát UI loading + log (nếu có) về `roomConnectionStatus`.
  - **Expected**:
    - App vẫn coi là “đang khởi tạo” cho tới khi nhận `'media-server-conn-established'`.
    - Sau mốc này mới tắt màn startup/loader, tương đương web.

- **2.2 Mất kết nối / reconnect**
  - **Steps**:
    - Khi đang trong phòng, tắt mạng vài giây rồi bật lại.
  - **Expected**:
    - App hiển thị trạng thái reconnect tương đương web.
    - Sau khi mạng lại ổn định, NATS + LiveKit reconnect, participants / chat / polls vẫn giữ state hợp lý (không mất toàn bộ).

---

### 3. Chat (Public/Private, File Send, Translation)

- **3.1 Chat public cơ bản**
  - **Precondition**: 2 users (A, B) trong cùng phòng (2 mobile hoặc mobile + web).
  - **Steps**:
    - A gửi message ở tab Public.
  - **Expected**:
    - A và B đều thấy message, nội dung đúng.
    - Tên người gửi, thời gian hiển thị đúng.
    - Khi panel chat đóng, badge/unread count hoạt động giống web.

- **3.2 Chat private**
  - **Steps**:
    - A mở participants, chọn private chat với B.
    - A gửi message private cho B.
  - **Expected**:
    - Chỉ A và B nhìn thấy message.
    - Unread badge tab private hoạt động đúng (nếu đang ở tab khác).
    - Flow chọn/chuyển tab public/private tương đương web.

- **3.3 Gửi file trong chat – thành công**
  - **Steps**:
    - A mở Chat bottom sheet.
    - Nhấn icon attach file.
    - Chọn 1 file hợp lệ (PDF/PNG nhỏ).
  - **Expected**:
    - Hiển thị trạng thái uploading, sau đó snack bar “File uploaded”.
    - Chat message gửi ra có format:  
      `Attachment: {fileName}\n{downloadUrl}` (giống web).
    - B mở được link file (browser).

- **3.4 Gửi file trong chat – thất bại**
  - **Cách gây lỗi gợi ý**:
    - Dùng file vượt quá max size backend, hoặc tắt mạng giữa upload.
  - **Expected**:
    - Hiển thị thông báo lỗi rõ ràng (upload fail / network error).
    - Không gửi message “Attachment: ...” vào chat nếu upload không thành công.

- **3.5 Chat translation – enable & sử dụng**
  - **Precondition**:
    - Bên web (admin) đã bật chat translation trong `chat-translation-settings`:
      - Enable service, chọn allowed languages + default lang.
  - **Steps**:
    - Trên mobile, đảm bảo `selectedChatTransLang` được set (theo thiết kế state).
    - A (mobile) gửi message public.
  - **Expected**:
    - Mobile gọi API `/api/insights/translation/chat/execute` (có thể check qua backend log).
    - NATS ChatMessage chứa `sourceLang` + `translations` map.
    - `handle_chat.dart` chọn đúng translation theo `selectedChatTransLang` và thay `payload.message`.
    - Văn bản cuối cùng user thấy đã được dịch, giống hành vi web.

- **3.6 Chat translation – disabled**
  - **Steps**:
    - Bên web tắt chat translation (end service).
    - A (mobile) gửi message public/private.
  - **Expected**:
    - Mobile không gọi translation API.
    - Message hiển thị raw text (nguyên văn), giống web khi service off.

---

### 4. Polls

- **4.1 Load danh sách polls**
  - **Steps**:
    - Mở Polls bottom sheet.
  - **Expected**:
    - Hiển thị loading indicator, sau đó list polls từ API.
    - Kéo xuống (pull-to-refresh) sẽ fetch lại danh sách (API được gọi lại).

- **4.2 Tạo poll**
  - **Precondition**: User là admin/host.
  - **Steps**:
    - Mở Polls.
    - Chọn “Create poll”, nhập title + options.
    - Confirm tạo poll.
  - **Expected**:
    - Mobile gọi `createPoll` API (protobuf).
    - Poll mới xuất hiện trong list sau khi reload/invalidate.
    - NATS `POLL_CREATED` (nếu có) cũng trigger refetch tương tự web.

- **4.3 Vote poll**
  - **Steps**:
    - Non-admin user mở Polls.
    - Chọn 1 option của poll đang mở và submit vote.
  - **Expected**:
    - API vote được gọi, server ghi nhận.
    - User không thể vote 2 lần nếu web cũng không cho.
    - `getUserSelectedOption` và các API result của poll trả về giống web cho cùng user.

- **4.4 Xem chi tiết poll (admin)**
  - **Steps**:
    - Admin mở Polls.
    - Mở menu trên 1 poll, chọn “View details”.
  - **Expected**:
    - Modal chi tiết hiển thị:
      - Tỷ lệ % từng option, số người chọn.
      - Danh sách respondents cho mỗi option (nếu backend trả về).
    - Các values khớp với web cho cùng poll.

- **4.5 Đóng poll**
  - **Steps**:
    - Admin mở menu poll, chọn “End poll”.
  - **Expected**:
    - Gọi `closePoll` với `roomId`, `userId` đúng.
    - Poll chuyển sang trạng thái closed trên cả web và mobile.

---

### 5. Breakout Rooms

- **5.1 Tạo breakout rooms + random assign**
  - **Steps**:
    - Admin mở Breakout bottom sheet.
    - Nhập số phòng, thời lượng, welcome message.
    - Nhấn “Random assignment” rồi “Create”.
  - **Expected**:
    - Gọi `createBreakoutRooms` với danh sách user assignments đúng.
    - UI hiển thị list rooms active + thông tin tương đương web (tên, số người, thời gian).

- **5.2 Join/Leave breakout**
  - **Steps**:
    - User join 1 breakout room được gán.
  - **Expected**:
    - User bị chuyển sang “nhánh” breakout như web:
      - Participant list, chat, media chỉ trong breakout.
    - Khi leave/room end, user quay lại main room như web.

- **5.3 End all rooms**
  - **Steps**:
    - Admin nhấn “End all rooms”.
  - **Expected**:
    - Mobile gọi `endAllBreakoutRooms`.
    - NATS `BREAKOUT_ROOM_ENDED` clear invitations/state trên mobile.
    - Tất cả users quay lại main room (web + mobile cùng hành vi).

---

### 6. Participants & Settings

- **6.1 Participants – Mute All (admin)**
  - **Steps**:
    - Admin mở Participants bottom sheet.
    - Nhấn nút “Mute All”.
  - **Expected**:
    - Gọi `muteUnmuteTrack` cho tất cả participants đang có audio track.
    - Mic của mọi người bị mute trên cả web lẫn mobile, trạng thái hiển thị đúng.

- **6.2 Participants – menu admin**
  - **Actions cần test (mỗi action ≥ 1 case)**:
    - Mute/unmute mic một participant.
    - Webcam: yêu cầu bật (ask to share) / stop.
    - Private chat.
    - Switch presenter (promote/demote).
    - Lower hand (khi participant đang raise hand).
    - Lock settings: webcam, screen share, whiteboard, chat, send message, file share.
    - Remove participant.
  - **Expected**:
    - Mỗi action gọi đúng API/NATS:
      - `muteUnmuteTrack`, `switchPresenter`, `removeParticipant`.
      - `updateUserLockSettings`.
      - `sendDataMessage` / `sendMessageToSystemWorker` cho các yêu cầu đặc biệt.
    - Các lock settings được áp vào UI mobile giống web (ví dụ bị lock chat thì không gửi được message).

- **6.3 Settings bottom sheet**
  - **Steps**:
    - Mở Settings.
    - Thay đổi:
      - `Play sound on notifications`.
      - `Show connection quality`.
      - `Show elapsed time`.
  - **Expected**:
    - `roomSettingsProvider` cập nhật state đúng.
    - UI phản ánh:
      - Có/không có sound khi notification (nếu bật).
      - Hiển thị/ẩn connection quality indicator.
      - Hiển thị/ẩn elapsed time.
    - Ghi chú: dropdown device (mic/camera/output) hiện đang là placeholder, chỉ cần check UX + state, không check native device switch.

---

### 7. Analytics

- **7.1 Connection quality analytics**
  - **Steps**:
    - Đang trong phòng, thay đổi network (hoặc dùng tool simulate).
  - **Expected**:
    - Khi quality thay đổi, `ConnectLivekit` gửi:
      - `sendAnalyticsData(ANALYTICS_EVENT_USER_CONNECTION_QUALITY, ...)`.
      - `sendDataMessage` type `USER_CONNECTION_QUALITY_CHANGE`.
    - Backend nhận events giống web.

- **7.2 Smoke analytics cho Chat / Polls / Breakout**
  - **Steps (mức smoke)**:
    - Gửi public/private chat.
    - Vote 1 poll.
    - Tạo 1 breakout room.
  - **Expected**:
    - Backend ghi nhận analytics events tương ứng (nếu có dashboard/log).
    - Không có khác biệt rõ ràng giữa web và mobile cho cùng hành vi.

---

### 8. Regression tổng quát (Web vs Mobile song song)

- **8.1 So sánh trực tiếp Web vs Mobile**
  - **Steps**:
    - Mở cùng 1 room với:
      - 1 client web (apps/meet).
      - 1 client mobile (`torri-mobile`).
    - Thực hiện lần lượt:
      - Join/leave.
      - Chat (public/private, file).
      - Polls (create/vote/end).
      - Breakout (create/join/end).
      - Participants actions (mute, lock, remove…).
  - **Expected**:
    - Với cùng 1 hành động, **state cuối cùng** trên web và mobile phải giống nhau:
      - Ai đang trong phòng / breakout.
      - Ai được mute / camera on/off.
      - Kết quả polls.
      - Nội dung chat (kể cả translation).

