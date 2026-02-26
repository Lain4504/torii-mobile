# Kế Hoạch Cập Nhật & Bổ Sung Tính Năng Cho App Mobile Torii (Learner)

Dựa trên việc phân tích tính năng của `web-learner` dashboard và cấu trúc module của `apps/server`, dưới đây là kế hoạch chi tiết để hoàn thiện ứng dụng di động cho Learner, đảm bảo ứng dụng phục vụ đầy đủ tính năng và thân thiện với người dùng (không hiển thị UUIDs rườm rà).

## 1. Mục Tiêu & Yêu Cầu Chung
- **Đồng bộ tính năng**: Đảm bảo app mobile có đầy đủ các tính năng như trên web dashboard (Assignments, Notebooks, Discussions...). Cập nhật các màn hình hiện đang là giao diện trống (như Certificates, Learning History).
- **Thân thiện với người dùng (UX/UI)**: 
  - KHÔNG hiển thị các trường `id`, `userId`, `courseId`, `enrollmentId` (UUIDs) ra ngoài giao diện cho người dùng thấy.
  - Sử dụng các định danh dễ đọc (ví dụ: `certificateCode`, tên khóa học, trạng thái bằng tiếng Việt).
  - Tích hợp UI đẹp mắt, mượt mà dựa trên design system hiện tại (`AppColors`, `AppTypography`).

---

## 2. Các Tính Năng Thiếu Cần Bổ Sung (Missing Features)

### 2.1. Assignments & Submissions (Bài Tập & Nộp Bài)
*Tính năng quan trọng nhất đang thiếu, cho phép học viên làm bài tập về nhà và nhận điểm.*
- **Backend Model**: `Assignment` (TEXT, FILE, BOTH), `Submission`, `GradeHistory`.
- **Thư mục**: `lib/features/assignment/`
- **Màn hình (Screens)**:
  - `AssignmentListPage`: Danh sách bài tập (Lọc theo: Đang chờ, Đã nộp, Đã chấm).
  - `AssignmentDetailPage`: Chi tiết yêu cầu bài tập, hướng dẫn, và file đính kèm.
  - `SubmissionScreen / BottomSheet`: Giao diện nộp bài (Nhập text, đính kèm file).
- **UX Rules**: Hiển thị trạng thái rõ ràng (Draft, Submitted, Graded), tiến độ (maxScore, score), ẩn UUID bài nộp.

### 2.2. Notebooks (Sổ Tay Từ Vựng / Ghi Chú)
*Trên web có phần Notes (Sổ tay từ vựng) cho phép tạo sổ tay, lưu từ mới và học. Mobile hiện chỉ có Flashcard gốc.*
- **Backend Model**: `Notebook`, `NoteEntry`.
- **Thư mục**: `lib/features/notebook/`
- **Màn hình (Screens)**:
  - `NotebookListPage`: Tab "Của tôi" và "Khám phá" (Công khai).
  - `NotebookDetailPage`: Danh sách từ vựng trong sổ tay.
  - `AddWordModal`: Thêm từ vựng thủ công (Từ, Phonetic, Nghĩa, Ghi chú, Từ loại).
- **Tích hợp**: Nút "Học Flashcard" để liên kết với tính năng luyện tập flashcard hiện có của app.

### 2.3. Course Discussions (Thảo Luận Khóa Học / Bài Học)
*Web có mục Q&A / Discussion trong từng khóa học/bài học, mobile hiện chỉ có Community Feed chung.*
- **Backend Model**: `DiscussionTopic`, `Comment`.
- **Thư mục**: Tích hợp vào `lib/features/course/views/pages/lesson_page.dart`.
- **Màn hình / Widget**:
  - `LessonDiscussionTab`: Tab bình luận hỏi đáp ngay bên dưới video bài giảng.
  - Cho phép học viên gửi câu hỏi, giảng viên trả lời.

---

## 3. Cập Nhật Các Tính Năng Hiện Có (Refinements)

### 3.1. Hoàn Thiện Các Màn Hình Đang Trống (Mockup)
- **Certificates (`certificates_page.dart`)**: Hiện tại chỉ là UI rỗng. Cần gọi API lấy danh sách chứng chỉ (`certificate.model.ts`), hiển thị `certificateCode` (Mã chứng chỉ: CERT-XXXX) thay vì hiển thị `id` hay `courseId`.
- **Learning History (`learning_history_page.dart`)**: Hiện tại là UI rỗng. Cần gọi API lấy dữ liệu tiến độ, hiển thị ngày tháng định dạng đẹp (`dd/MM/yyyy`).

### 3.2. Ẩn IDs và Tối ưu UI (Toàn App)
- **Payment / Wallet**: Thay vì hiện `orderId` là UUID, hãy hiện mã đơn hàng thân thiện (nếu backend có), hoặc ẩn hẳn và chỉ hiện ngày giao dịch + số tiền.
- **Tickets (Hỗ trợ)**: Hiển thị "Ticket #123" thay vì UUID của ticket.

### 3.3. Cập Nhật Router (`app_router.dart`)
- Thêm route `/assignments` và `/assignments/:id`.
- Thêm route `/notebooks` và `/notebooks/:id`.
- Cập nhật Dashboard Quick Shortcuts để có nút trỏ tới "Bài tập" và "Sổ tay".

---

## 4. Lộ Trình Triển Khai (Milestones)

- [ ] **Giai đoạn 1**: Tạo cấu trúc thư mục, Models, Repositories, Providers cho `Assignment` và `Notebook`.
- [ ] **Giai đoạn 2**: Xây dựng UI Screens cho `Assignment` (List & Detail & Nộp bài).
- [ ] **Giai đoạn 3**: Xây dựng UI Screens cho `Notebook` (List & Detail & Thêm từ).
- [ ] **Giai đoạn 4**: Tích hợp API và xử lý logic kết nối Backend (chú ý validate dữ liệu schema như `assignment.model.ts`).
- [ ] **Giai đoạn 5**: Rà soát lại toàn bộ UI các màn hình hiện có (Course, Wallet, Certificate...) để dọn dẹp các UUID bị lộ ra ngoài, thay bằng tên/mã định danh rõ ràng.
- [ ] **Giai đoạn 6**: Update `app_router.dart` và liên kết navigation vào `DashboardPage`.

---

*Vui lòng xem file này như một tài liệu hướng dẫn (blueprint) để thực hiện task. Nếu bạn muốn bắt đầu làm ngay, hãy chọn Giai đoạn 1 để bắt đầu code!*