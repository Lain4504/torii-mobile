import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import '../../../providers/session_provider.dart';
import 'control_button.dart';

/// Nút rời / kết thúc phòng — khớp web [EndMeetingButton]:
/// - Host (admin): gọi API `endRoom`, đóng phòng cho mọi người.
/// - Người tham gia: chỉ `disconnect` + thông điệp `notifications.user-logged-out`.
class LeaveButton extends ConsumerWidget {
  const LeaveButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAdmin = ref.watch(isAdminProvider);
    return ControlButton(
      icon: Icons.call_end_rounded,
      label: isAdmin ? 'Kết thúc' : 'Rời phòng',
      isActive: true,
      isDanger: true,
      onTap: () => _showConfirmDialog(context, ref, isAdmin),
    );
  }

  void _showConfirmDialog(BuildContext context, WidgetRef ref, bool isAdmin) {
    final title = isAdmin ? 'Kết thúc cuộc họp?' : 'Rời cuộc họp?';
    final body = isAdmin
        ? 'Bạn có chắc muốn kết thúc cuộc họp cho tất cả mọi người?'
        : 'Bạn có chắc muốn rời khỏi cuộc họp?';

    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(title),
        content: Text(body),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Hủy'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(dialogContext).pop();
              await _onConfirmedLeave(context, ref, isAdmin);
            },
            style: TextButton.styleFrom(foregroundColor: Theme.of(context).colorScheme.error),
            child: Text(isAdmin ? 'Kết thúc' : 'Rời phòng'),
          ),
        ],
      ),
    );
  }

  Future<void> _onConfirmedLeave(
    BuildContext context,
    WidgetRef ref,
    bool isAdmin,
  ) async {
    if (isAdmin) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Đang kết thúc phiên họp…')),
      );
      final result = await ref.read(sessionProvider.notifier).endRoomAsAdmin();
      if (!context.mounted) return;
      if (!result.ok) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(result.message),
            backgroundColor: AppColors.error,
          ),
        );
        return;
      }
      ref.read(sessionProvider.notifier).toggleStartup(true);
      return;
    }

    await ref.read(sessionProvider.notifier).disconnect(
          userInitiatedLeave: true,
          sessionEndMessage: 'notifications.user-logged-out',
        );
    ref.read(sessionProvider.notifier).toggleStartup(true);
  }
}
