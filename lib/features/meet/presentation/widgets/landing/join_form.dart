import 'package:flutter/material.dart';

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircularProgressIndicator(),
        const SizedBox(height: 16),
        Text(
          loadingMessage!,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        if (waitForApproval) ...[
          const SizedBox(height: 8),
          Text(
            'Vui lòng đợi người tổ chức cho phép bạn tham gia.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withOpacity(0.7),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );
  }

  Widget _buildJoinState(BuildContext context) {
    final bothLocked = lockMicrophone && lockWebcam;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Sẵn sàng tham gia?',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        Text(
          _getJoinPrompt(),
          style: TextStyle(
            fontSize: 14,
            color: Colors.white.withOpacity(0.7),
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 40),
        
        if (bothLocked)
          // Only listen-only button
          ElevatedButton.icon(
            onPressed: onJoin,
            icon: const Icon(Icons.volume_up),
            label: const Text('Tham gia chỉ nghe'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.surface,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(
                  color: Theme.of(context).dividerColor.withOpacity(0.2),
                ),
              ),
            ),
          )
        else
          // Join button
          ElevatedButton(
            onPressed: onJoin,
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Tham gia ngay',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
      ],
    );
  }

  String _getJoinPrompt() {
    if (lockMicrophone && lockWebcam) {
      return 'Cả micrô và máy ảnh của bạn đều bị khóa. Bạn có thể tham gia với tư cách là người nghe.';
    } else if (lockMicrophone) {
      return 'Micrô của bạn đã bị khóa. Bạn có thể tham gia với tư cách là người nghe hoặc bật máy ảnh.';
    } else if (lockWebcam) {
      return 'Máy ảnh của bạn đã bị khóa. Bạn có thể tham gia với tư cách là người nghe hoặc bật micrô.';
    }
    return 'Vui lòng chọn thiết bị của bạn trước khi tham gia.';
  }
}
