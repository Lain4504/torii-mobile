# Meet API Service - Developer Guide

## Tổng quan

`MeetApiService` là service chính để giao tiếp với Meet API backend trong ứng dụng Torii Mobile. Service này đã được nâng cấp với các tính năng:

- ✅ **Error handling nhất quán** với `MeetApiException`
- ✅ **Retry logic tự động** cho các lỗi timeout/connection
- ✅ **Response validation** tự động
- ✅ **User-friendly error messages**
- ✅ **Debug logging** chi tiết

## Cài đặt và Sử dụng

### 1. Import Service

```dart
import 'package:torii_app/features/meet/data/datasources/meet_api_service.dart';
```

### 2. Sử dụng với Riverpod

```dart
class MyWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apiService = ref.watch(meetApiServiceProvider);
    // Sử dụng apiService...
  }
}
```

## Error Handling

### MeetApiException

Tất cả các lỗi từ API đều được wrap trong `MeetApiException`:

```dart
class MeetApiException implements Exception {
  final String message;      // User-friendly error message
  final String? code;        // Error code (TIMEOUT, NO_CONNECTION, etc.)
  final dynamic originalError; // Original error object
}
```

### Error Codes

| Code | Ý nghĩa | Khi nào xảy ra |
|------|---------|----------------|
| `TIMEOUT` | Connection timeout | Kết nối quá lâu |
| `NO_CONNECTION` | Không có internet | Mất kết nối mạng |
| `HTTP_4xx/5xx` | HTTP error | Server trả về lỗi |
| `CANCELLED` | Request bị hủy | User hủy request |
| `OPERATION_FAILED` | Operation failed | API trả về status=false |
| `POLL_OPERATION_FAILED` | Poll operation failed | Poll API trả về status=false |
| `CREATE_ROOM_FAILED` | Tạo phòng thất bại | Không tạo được room |
| `GET_TOKEN_FAILED` | Lấy token thất bại | Không lấy được join token |

### Xử lý Lỗi trong Code

```dart
try {
  await apiService.createRoom(roomId);
} on MeetApiException catch (e) {
  // Hiển thị error message cho user
  showSnackbar(e.message);
  
  // Log chi tiết cho debugging
  if (kDebugMode) {
    print('Error code: ${e.code}');
    print('Original error: ${e.originalError}');
  }
} catch (e) {
  // Các lỗi khác (không nên xảy ra)
  showSnackbar('Unexpected error: $e');
}
```

## API Methods

### 1. Token Verification

```dart
Future<VerifyTokenRes> verifyToken({bool isProduction = false})
```

**Đặc biệt:** Method này KHÔNG throw exception, luôn trả về `VerifyTokenRes` với `status` field.

```dart
final result = await apiService.verifyToken();
if (result.status) {
  // Token hợp lệ
  print('Room ID: ${result.roomId}');
  print('User ID: ${result.userId}');
} else {
  // Token không hợp lệ
  print('Error: ${result.msg}');
}
```

### 2. Room Management

#### Check Room Active

```dart
try {
  final isActive = await apiService.isRoomActive('room-123');
  if (isActive) {
    print('Room đang hoạt động');
  }
} on MeetApiException catch (e) {
  print('Lỗi: ${e.message}');
}
```

#### Create Room

```dart
try {
  await apiService.createRoom('room-123');
  print('Tạo phòng thành công');
} on MeetApiException catch (e) {
  // e.code có thể là 'CREATE_ROOM_FAILED'
  print('Lỗi: ${e.message}');
}
```

#### Get Join Token

```dart
try {
  final token = await apiService.getJoinToken(
    roomId: 'room-123',
    name: 'John Doe',
    userId: 'user-456',
    isAdmin: false,
  );
  print('Token: $token');
} on MeetApiException catch (e) {
  // e.code có thể là 'GET_TOKEN_FAILED'
  print('Lỗi: ${e.message}');
}
```

### 3. Polls

#### List Polls

```dart
try {
  final response = await apiService.listPolls();
  for (final poll in response.polls) {
    print('Poll: ${poll.question}');
  }
} on MeetApiException catch (e) {
  print('Lỗi: ${e.message}');
}
```

#### Create Poll

```dart
try {
  final req = polls.CreatePollReq(
    roomId: 'room-123',
    userId: 'user-456',
    pollId: 'poll-789',
    question: 'Bạn thích màu gì?',
    options: [
      polls.CreatePollOptions(id: 1, text: 'Đỏ'),
      polls.CreatePollOptions(id: 2, text: 'Xanh'),
    ],
  );
  
  final response = await apiService.createPoll(req);
  print('Poll created: ${response.pollId}');
} on MeetApiException catch (e) {
  print('Lỗi: ${e.message}');
}
```

#### Submit Poll Response

```dart
try {
  final req = polls.SubmitPollResponseReq(
    roomId: 'room-123',
    userId: 'user-456',
    name: 'John Doe',
    pollId: 'poll-789',
    selectedOption: Int64(1),
  );
  
  await apiService.submitPollResponse(req);
  print('Vote submitted');
} on MeetApiException catch (e) {
  print('Lỗi: ${e.message}');
}
```

#### Close Poll

```dart
try {
  await apiService.closePoll('poll-789');
  print('Poll closed');
} on MeetApiException catch (e) {
  print('Lỗi: ${e.message}');
}
```

### 4. Waiting Room

#### Approve Waiting Users

```dart
try {
  final req = ApproveWaitingUsersReq(
    roomId: 'room-123',
    userId: 'user-456',
  );
  
  await apiService.approveWaitingUsers(req);
  print('User approved');
} on MeetApiException catch (e) {
  print('Lỗi: ${e.message}');
}
```

#### Update Waiting Room Message

```dart
try {
  final req = UpdateWaitingRoomMessageReq(
    roomId: 'room-123',
    msg: 'Vui lòng đợi host phê duyệt...',
  );
  
  await apiService.updateWaitingRoomMessage(req);
  print('Message updated');
} on MeetApiException catch (e) {
  print('Lỗi: ${e.message}');
}
```

### 5. Participant Controls

#### Mute/Unmute Track

```dart
try {
  final req = MuteUnMuteTrackReq(
    sid: 'room-sid-123',
    roomId: 'room-123',
    userId: 'user-456',
    trackSid: 'track-789',
    muted: true,
    requestedUserId: 'admin-user',
  );
  
  await apiService.muteUnmuteTrack(req);
  print('Track muted');
} on MeetApiException catch (e) {
  print('Lỗi: ${e.message}');
}
```

#### Remove Participant

```dart
try {
  final req = RemoveParticipantReq(
    sid: 'room-sid-123',
    roomId: 'room-123',
    userId: 'user-456',
    msg: 'Bạn đã bị loại khỏi phòng',
    blockUser: false,
  );
  
  await apiService.removeParticipant(req);
  print('Participant removed');
} on MeetApiException catch (e) {
  print('Lỗi: ${e.message}');
}
```

#### Switch Presenter

```dart
try {
  final req = SwitchPresenterReq(
    roomId: 'room-123',
    userId: 'admin-user',
    requestedUserId: 'user-456',
    task: SwitchPresenterTask.PROMOTE,
  );
  
  await apiService.switchPresenter(req);
  print('Presenter switched');
} on MeetApiException catch (e) {
  print('Lỗi: ${e.message}');
}
```

#### Update Lock Settings

```dart
try {
  final req = UpdateUserLockSettingsReq(
    roomSid: 'room-sid-123',
    roomId: 'room-123',
    userId: 'user-456',
    service: 'microphone',
    direction: 'lock',
    requestedUserId: 'admin-user',
  );
  
  await apiService.updateUserLockSettings(req);
  print('Lock settings updated');
} on MeetApiException catch (e) {
  print('Lỗi: ${e.message}');
}
```

## Retry Logic

Service tự động retry các request khi gặp lỗi timeout hoặc connection:

- **Max retries:** 3 lần
- **Retry delay:** 1s, 2s, 3s (tăng dần)
- **Retry conditions:**
  - Connection timeout
  - Send timeout
  - Receive timeout
  - Connection error

```dart
// Không cần code đặc biệt, retry tự động
try {
  await apiService.createRoom('room-123');
  // Nếu timeout, sẽ tự động retry 3 lần
} on MeetApiException catch (e) {
  // Chỉ catch khi đã retry hết 3 lần
  print('Failed after 3 retries: ${e.message}');
}
```

## Response Validation

Service tự động validate response và throw exception nếu `status = false`:

```dart
// KHÔNG CẦN kiểm tra response.status nữa
try {
  await apiService.createPoll(req);
  // Nếu đến đây = thành công
} on MeetApiException catch (e) {
  // Tự động catch nếu response.status = false
  print('Error: ${e.message}'); // Chứa response.msg
}
```

## Debug Logging

Trong debug mode, service tự động log:

- Request method và path
- Response status code
- Error details

```dart
// Tự động log khi kDebugMode = true
Meet API Error: Connection timeout
Request: POST /api/polls/create
Response: 500 Internal Server Error

// Retry attempts
Retrying /api/polls/create (attempt 1/3)
Retrying /api/polls/create (attempt 2/3)
```

## Configuration

Cần cấu hình trong `AppConfig`:

```dart
class AppConfig {
  static const String apiBaseUrl = 'https://api.example.com';
  static const String meetApiKey = 'your-api-key';
  static const String meetApiSecret = 'your-secret-key';
}
```

## Best Practices

### 1. Luôn Handle MeetApiException

```dart
// ✅ ĐÚNG
try {
  await apiService.createRoom(roomId);
} on MeetApiException catch (e) {
  showError(e.message);
}

// ❌ SAI - Không catch exception
await apiService.createRoom(roomId); // Có thể crash app
```

### 2. Hiển thị Error Message cho User

```dart
// ✅ ĐÚNG - Hiển thị message từ exception
try {
  await apiService.submitPollResponse(req);
} on MeetApiException catch (e) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(e.message)),
  );
}

// ❌ SAI - Hiển thị message generic
try {
  await apiService.submitPollResponse(req);
} on MeetApiException catch (e) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Error occurred')), // Không helpful
  );
}
```

### 3. Log Chi Tiết trong Debug Mode

```dart
// ✅ ĐÚNG
try {
  await apiService.createRoom(roomId);
} on MeetApiException catch (e) {
  if (kDebugMode) {
    print('Create room failed:');
    print('  Message: ${e.message}');
    print('  Code: ${e.code}');
    print('  Original: ${e.originalError}');
  }
  showError(e.message);
}
```

### 4. Không Cần Kiểm Tra Response Status

```dart
// ✅ ĐÚNG - Service tự động validate
try {
  await apiService.createPoll(req);
  // Đến đây = thành công
} on MeetApiException catch (e) {
  // Tự động catch nếu status = false
}

// ❌ SAI - Không cần kiểm tra nữa
try {
  final response = await apiService.createPoll(req);
  if (response.status) { // Không cần thiết
    // ...
  }
} on MeetApiException catch (e) {
  // ...
}
```

### 5. Sử dụng Specific Error Codes

```dart
// ✅ ĐÚNG - Xử lý specific errors
try {
  await apiService.getJoinToken(...);
} on MeetApiException catch (e) {
  if (e.code == 'NO_CONNECTION') {
    showOfflineDialog();
  } else if (e.code == 'TIMEOUT') {
    showRetryDialog();
  } else {
    showError(e.message);
  }
}
```

## Troubleshooting

### Lỗi "Connection timeout"

**Nguyên nhân:** Mạng chậm hoặc server không phản hồi

**Giải pháp:**
- Kiểm tra kết nối internet
- Service tự động retry 3 lần
- Tăng timeout nếu cần (hiện tại: 30s)

### Lỗi "No internet connection"

**Nguyên nhân:** Thiết bị mất kết nối mạng

**Giải pháp:**
- Hiển thị dialog yêu cầu user kiểm tra mạng
- Cho phép user retry sau khi kết nối lại

### Lỗi "Invalid or expired token"

**Nguyên nhân:** JWT token hết hạn hoặc không hợp lệ

**Giải pháp:**
- Refresh token và thử lại
- Yêu cầu user đăng nhập lại

### Lỗi "HTTP_401" hoặc "HTTP_403"

**Nguyên nhân:** Không có quyền truy cập

**Giải pháp:**
- Kiểm tra user có quyền admin không
- Kiểm tra API key và signature

## Migration từ Code Cũ

### Trước đây

```dart
// Code cũ - Phải tự kiểm tra status
try {
  final res = await apiService.createPoll(req);
  if (!res.status) {
    showNotification(res.msg);
    return;
  }
  // Xử lý thành công
} catch (e) {
  showNotification('Failed to create poll');
}
```

### Bây giờ

```dart
// Code mới - Tự động validate
try {
  await apiService.createPoll(req);
  // Đến đây = thành công
} on MeetApiException catch (e) {
  showNotification(e.message); // Chứa res.msg
}
```

## Changelog

### Version 2.0 (Current)

- ✅ Added `MeetApiException` for consistent error handling
- ✅ Added automatic retry logic (3 attempts)
- ✅ Added response validation
- ✅ Added user-friendly error messages
- ✅ Added detailed debug logging
- ✅ Added timeout configuration (30s)
- ✅ Improved error interceptor

### Version 1.0 (Legacy)

- Basic Dio setup
- Protobuf serialization
- HMAC authentication
- Manual error handling
