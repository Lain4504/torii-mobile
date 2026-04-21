import 'package:flutter/material.dart';
import 'package:torii_app/core/constants/app_design_system.dart';

/// Join Form Widget
/// Shows join button and loading states
class JoinForm extends StatelessWidget {
  final String? loadingMessage;
  final bool waitForApproval;
  final bool lockMicrophone;
  final bool lockWebcam;
  final VoidCallback onJoin;

  const JoinForm({
    super.key,
    this.loadingMessage,
    required this.waitForApproval,
    required this.lockMicrophone,
    required this.lockWebcam,
    required this.onJoin,
  });

  @override
  Widget build(BuildContext context) {
    if (loadingMessage != null) {
      return _buildLoadingState(context);
    }

    return _buildJoinState(context);
  }

  Widget _buildLoadingState(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 44,
            height: 44,
            child: CircularProgressIndicator(
              strokeWidth: 4,
              valueColor: AlwaysStoppedAnimation<Color>(theme.colorScheme.primary),
              backgroundColor: theme.colorScheme.primary.withOpacity(0.1),
            ),
          ),
          const SizedBox(height: 14),
          Text(
            loadingMessage!,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.2,
            ),
            textAlign: TextAlign.center,
          ),
          if (waitForApproval) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: theme.colorScheme.outlineVariant),
              ),
              child: Text(
                'Vui lòng đợi người tổ chức cho phép bạn tham gia.',
                style: TextStyle(
                  fontSize: 12.5,
                  color: theme.colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildJoinState(BuildContext context) {
    final theme = Theme.of(context);
    final bothLocked = lockMicrophone && lockWebcam;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Sẵn sàng tham gia?',
          style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          _getJoinPrompt(),
          style: TextStyle(
            fontSize: 13,
            color: theme.colorScheme.onSurfaceVariant,
            height: 1.35,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 18),
        
        if (bothLocked)
          ElevatedButton.icon(
            onPressed: onJoin,
            icon: const Icon(Icons.headset_rounded, size: 20),
            label: const Text('Tham gia chỉ nghe'),
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.colorScheme.surface,
              foregroundColor: theme.colorScheme.primary,
              shadowColor: Colors.transparent,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(
                  color: theme.colorScheme.primary.withOpacity(0.2),
                  width: 2,
                ),
              ),
              textStyle: const TextStyle(
                fontSize: 14.5,
                fontWeight: FontWeight.w800,
              ),
            ),
          )
        else
          SizedBox(
            height: 48,
            child: ElevatedButton(
              onPressed: onJoin,
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.colorScheme.primary,
                foregroundColor: theme.colorScheme.onPrimary,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 0,
              ),
              child: const Text(
                'Tham gia ngay',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800, letterSpacing: 0.2),
              ),
            ),
          ),

        const SizedBox(height: 12),
        Text(
          'Bằng cách tham gia, bạn đồng ý với Điều khoản dịch vụ của chúng tôi.',
          style: TextStyle(
            fontSize: 11.5,
            color: theme.colorScheme.onSurfaceVariant,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  String _getJoinPrompt() {
    if (lockMicrophone && lockWebcam) {
      return 'Cả micrô và máy ảnh của bạn đều bị khóa. Bạn có thể tham gia với tư cách là người nghe.';
    } else if (lockMicrophone) {
      return 'Micrô đã bị khóa bởi người tổ chức. Bạn vẫn có thể tham gia và sử dụng máy ảnh.';
    } else if (lockWebcam) {
      return 'Máy ảnh đã bị khóa bởi người tổ chức. Bạn vẫn có thể tham gia và sử dụng micrô.';
    }
    return 'Kiểm tra cài đặt âm thanh và video trước khi vào phòng họp.';
  }
}
