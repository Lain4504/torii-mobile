# MEET MOBILE - Checklist Kiểm Thử (Manual QA)

File này liệt kê các trường hợp (Test Cases) cần kiểm tra để đảm bảo logic Mobile hoạt động tương đương với Web Frontend.

Bạn có thể đánh dấu `[x]` vào các mục đã kiểm tra thành công.

## 1. Kết nối & Tham gia (Join/Leave Flow)
- [ ] **Tham gia phòng thành công**: Nhập đúng Room ID/Token/Name -> Vào được màn hình chính.
- [ ] **Hiển thị trạng thái Loading**: Khi ấn "Tham gia ngay", hiện loading spinner + thông báo "Đang kết nối...".
- [ ] **Thông báo lỗi Token/Room**: Nhập sai -> Hiện Toast/Snackbar báo lỗi.
- [ ] **Waiting Room (Phòng chờ)**:
  - [ ] Tham gia vào phòng có bật Waiting Room -> Hiện màn hình "Vui lòng đợi người tổ chức duyệt".
  - [ ] Khi Admin duyệt (trên Web) -> Tự động chuyển vào màn hình chính.
  - [ ] Khi Admin từ chối -> Hiện thông báo và quay lại màn hình Join.
- [ ] **Rời phòng (Leave)**:
  - [ ] Ấn nút đỏ "Rời phòng" -> Hiện popup xác nhận.
  - [ ] Xác nhận rời -> Quay lại màn hình Join/Home.
  - [ ] Đóng app/kill app -> Server nhận được sự kiện User Left (kiểm tra trên Web).

## 2. Media (Audio/Video)
- [ ] **Local Video (Camera của mình)**:
  - [ ] Bật Camera -> Thấy hình mình ở góc phải/grid.
  - [ ] Tắt Camera -> Thấy Avatar/Placeholder.
  - [ ] Đảo Camera (nếu có nút) -> Chuyển cam trước/sau.
- [ ] **Local Audio (Mic của mình)**:
  - [ ] Bật Mic -> Icon mic trên video tile mất gạch chéo.
  - [ ] Tắt Mic -> Icon mic có gạch chéo đỏ.
  - [ ] Nói vào mic -> Thấy hiệu ứng sóng âm/viền xanh (Active Speaker) quanh video tile của mình.
- [ ] **Remote Audio/Video (Người khác)**:
  - [ ] Người khác bật Cam -> Thấy video của họ trên Mobile.
  - [ ] Người khác tắt Cam -> Thấy Avatar của họ.
  - [ ] Người khác nói -> Thấy hiệu ứng Active Speaker quanh tile của họ.
  - [ ] Nghe được tiếng của người khác rõ ràng.

## 3. Chat System
- [ ] **Gửi tin nhắn công khai (Public)**:
  - [ ] Nhập text -> Gửi -> Hiển thị ngay lập tức trong list chat.
  - [ ] Web nhận được tin nhắn.
- [ ] **Nhận tin nhắn công khai**:
  - [ ] Web gửi tin -> Mobile nhận và hiển thị đúng tên người gửi + nội dung + thời gian.
  - [ ] Có thông báo chấm đỏ (nếu đang đóng panel chat).
- [ ] **Tin nhắn riêng (Private Message)**:
  - [ ] Chọn user khác -> Gửi tin riêng -> Chỉ mình và họ thấy.
  - [ ] Nhận tin riêng -> Có ký hiệu "(Riêng tư)" hoặc màu sắc khác biệt.
- [ ] **Chat hệ thống**:
  - [ ] Nhận thông báo "User A đã tham gia", "User B đã rời phòng".
  - [ ] Tin nhắn từ hệ thống (nếu có).

## 4. Danh sách người tham gia (Participants)
- [ ] **Danh sách User**:
  - [ ] Hiển thị đủ số lượng người trong phòng.
  - [ ] Hiển thị đúng tên (Me/Bạn cho bản thân).
  - [ ] Admin có icon vương miện/ngôi sao.
- [ ] **Trạng thái thiết bị**:
  - [ ] Icon Mic/Cam bên cạnh tên update đúng theo thời gian thực (khi họ bật/tắt).
- [ ] **Raise Hand (Giơ tay)**:
  - [ ] Ấn nút giơ tay -> Thấy icon bàn tay cạnh tên mình.
  - [ ] Người khác giơ tay -> Thấy icon bàn tay cạnh tên họ và thông báo (nếu có).
  - [ ] Hạ tay -> Icon biến mất.

## 5. Chia sẻ màn hình (Screen Share)
*Lưu ý: Mobile thường chỉ nhận (view) chia sẻ từ PC, việc share từ Mobile phụ thuộc vào OS permission.*
- [ ] **Xem chia sẻ**:
  - [ ] Web bắt đầu share -> Mobile tự động chuyển layout hiển thị màn hình share lớn.
  - [ ] Hình ảnh rõ nét, độ trễ thấp.
  - [ ] Web dừng share -> Mobile quay lại lưới video (Grid Layout).
- [ ] **Zoom/Pan**: Có thể phóng to/thu nhỏ màn hình được share (nếu đã implement).

## 6. Tính năng dữ liệu (Data Channels)
- [ ] **Polls (Bình chọn)**:
  - [ ] Web tạo Poll -> Mobile hiện popup/notification mời bình chọn.
  - [ ] Mobile chọn đáp án -> Gửi thành công.
  - [ ] Web công bố kết quả -> Mobile nhìn thấy kết quả cập nhật.
- [ ] **Whiteboard (Bảng trắng)**:
  - [ ] Web vẽ -> Mobile nhận dữ liệu nét vẽ (kiểm tra log hoặc hiển thị nếu đã xong UI).
  - [ ] *Hiện tại Mobile mới chỉ nhận data, chưa vẽ lại 100% mượt mà như web.*
- [ ] **Breakout Rooms (Phòng nhỏ)**:
  - [ ] Web mời vào phòng nhỏ -> Mobile hiện popup "Mời tham gia Breakout Room...".
  - [ ] Ấn Chấp nhận -> Rời phòng chính, vào phòng mới (reload lại luồng Join).
  - [ ] (Advanced) Ấn Từ chối -> Ở lại phòng chính.

## 7. Xử lý kết nối (Robustness)
- [ ] **Mất mạng (Offline)**: Tắt Wifi/4G -> Hiện thông báo "Mất kết nối".
- [ ] **Có mạng lại (Reconnect)**: Bật lại mạng -> Tự động kết nối lại (NATS + LiveKit) -> Hiện "Đã kết nối lại".
- [ ] **Kicked (Bị đuổi)**: Admin kick user -> Mobile tự động rời phòng và hiện thông báo "Bạn đã bị quản trị viên mời ra khỏi phòng".
- [ ] **End Room**: Admin kết thúc phòng -> Mobile tự động rời và hiện "Phòng đã kết thúc".

## 8. Giao diện (UI/UX)
- [ ] **Landscape/Portrait**: Xoay ngang điện thoại -> Giao diện video grid tự sắp xếp lại hợp lý.
- [ ] **Dark Mode**: Giao diện hiển thị tốt, không bị lỗi màu trắng chữ trắng.
- [ ] **Performance**: Lướt danh sách chat, đóng mở panel mượt mà, không giật lag.
