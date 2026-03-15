import 'package:flutter/material.dart';
import 'package:torii_app/core/constants/app_design_system.dart';

/// Join Form Widget
/// Shows join button and loading states
/// 1:1 clone of apps/meet/src/components/landing/index.tsx (right side)
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
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 64,
            height: 64,
            child: CircularProgressIndicator(
              strokeWidth: 6,
              valueColor: AlwaysStoppedAnimation<Color>(theme.colorScheme.primary),
              backgroundColor: theme.colorScheme.primary.withOpacity(0.1),
            ),
          ),
          const SizedBox(height: 32),
          Text(
            loadingMessage!,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.5,
            ),
            textAlign: TextAlign.center,
          ),
          if (waitForApproval) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.accent.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.accent.withOpacity(0.2)),
              ),
              child: const Text(
                'Vui lòng đợi người tổ chức cho phép bạn tham gia.',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.accent,
                  fontWeight: FontWeight.w500,
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
        const Text(
          'Sẵn sàng tham gia?',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w800,
            letterSpacing: -1,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text(
          _getJoinPrompt(),
          style: TextStyle(
            fontSize: 15,
            color: theme.colorScheme.onSurface.withOpacity(0.6),
            height: 1.5,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 48),
        
        if (bothLocked)
          ElevatedButton.icon(
            onPressed: onJoin,
            icon: const Icon(Icons.headset_rounded, size: 20),
            label: const Text('Tham gia chỉ nghe'),
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.colorScheme.surface,
              foregroundColor: theme.colorScheme.primary,
              shadowColor: Colors.transparent,
              padding: const EdgeInsets.symmetric(vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(
                  color: theme.colorScheme.primary.withOpacity(0.2),
                  width: 2,
                ),
              ),
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        else
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: theme.colorScheme.primary.withOpacity(0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: ElevatedButton(
              onPressed: onJoin,
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.colorScheme.primary,
                foregroundColor: AppColors.textOnPrimary,
                padding: const EdgeInsets.symmetric(vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Tham gia ngay',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),

        const SizedBox(height: 24),
        Text(
          'Bằng cách tham gia, bạn đồng ý với Điều khoản dịch vụ của chúng tôi.',
          style: TextStyle(
            fontSize: 12,
            color: theme.colorScheme.onSurface.withOpacity(0.4),
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
