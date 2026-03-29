import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

/// Sau khi người dùng rời phòng / host kết thúc phiên (đã [disconnect]):
/// quay lại màn hình trước (vd. [LiveScheduleScreen] khi vào bằng `push('/meet')`),
/// hoặc `go('/live-schedule')` khi không có stack (deep link).
void navigateOutOfMeet(BuildContext context) {
  if (!context.mounted) return;
  if (context.canPop()) {
    context.pop();
  } else {
    context.go('/live-schedule');
  }
}
