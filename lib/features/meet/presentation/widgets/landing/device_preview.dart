import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:torii_app/core/constants/app_design_system.dart';

/// Device Preview Widget
/// Shows camera preview and mic/camera controls
/// 1:1 clone of apps/meet/src/components/landing/webcamPreview.tsx
class DevicePreview extends ConsumerStatefulWidget {
  final bool lockMicrophone;
  final bool lockWebcam;
  final Function(bool)? onMicToggled;
  final Function(bool)? onCameraToggled;

  const DevicePreview({
    super.key,
    required this.lockMicrophone,
    required this.lockWebcam,
    this.onMicToggled,
    this.onCameraToggled,
  });

  @override
  ConsumerState<DevicePreview> createState() => _DevicePreviewState();
}

class _DevicePreviewState extends ConsumerState<DevicePreview> {
  LocalVideoTrack? _videoTrack;
  LocalAudioTrack? _audioTrack;
  bool _isMicEnabled = false;
  bool _isCameraEnabled = false;

  @override
  void initState() {
    super.initState();
    _initializeDevices();
  }

  Future<void> _initializeDevices() async {
    if (!widget.lockWebcam) {
      await _enableCamera();
    }
    if (!widget.lockMicrophone) {
      await _enableMicrophone();
    }
  }

  Future<void> _enableCamera() async {
    try {
      _videoTrack = await LocalVideoTrack.createCameraTrack();
      setState(() {
        _isCameraEnabled = true;
      });
      widget.onCameraToggled?.call(true);
    } catch (e) {
      debugPrint('Failed to enable camera: $e');
    }
  }

  Future<void> _enableMicrophone() async {
    try {
      _audioTrack = await LocalAudioTrack.create();
      setState(() {
        _isMicEnabled = true;
      });
      widget.onMicToggled?.call(true);
    } catch (e) {
      debugPrint('Failed to enable microphone: $e');
    }
  }

  Future<void> _disableCamera() async {
    await _videoTrack?.stop();
    _videoTrack = null;
    setState(() {
      _isCameraEnabled = false;
    });
    widget.onCameraToggled?.call(false);
  }

  Future<void> _disableMicrophone() async {
    await _audioTrack?.stop();
    _audioTrack = null;
    setState(() {
      _isMicEnabled = false;
    });
    widget.onMicToggled?.call(false);
  }

  @override
  void dispose() {
    _videoTrack?.stop();
    _audioTrack?.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        // Video preview with a premium frame
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.grey300),
              boxShadow: [
                BoxShadow(
                  color: AppColors.textPrimary.withOpacity(0.04),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Stack(
                children: [
                  _isCameraEnabled && _videoTrack != null
                      ? VideoTrackRenderer(
                          _videoTrack!,
                          fit: VideoViewFit.cover,
                        )
                      : Container(
                          color: AppColors.grey200,
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: AppColors.primary.withOpacity(0.08),
                                  child: Icon(
                                    Icons.videocam_off_rounded,
                                    size: 28,
                                    color: AppColors.textTertiary,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  'Camera đang tắt',
                                  style: TextStyle(
                                    color: AppColors.textSecondary,
                                    fontSize: 12.5,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                  
                  // Top overlay for "Device Preview"
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppColors.surface.withOpacity(0.92),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.grey300),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.video_settings, size: 14, color: AppColors.textSecondary),
                          const SizedBox(width: 6),
                          Text(
                            'Xem trước',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: AppColors.textSecondary,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        
        const SizedBox(height: 12),
        
        // Refined device controls
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _DeviceControlButton(
              icon: _isMicEnabled ? Icons.mic_rounded : Icons.mic_off_rounded,
              isActive: _isMicEnabled,
              isLocked: widget.lockMicrophone,
              onTap: _isMicEnabled ? _disableMicrophone : _enableMicrophone,
              activeColor: AppColors.accent,
              label: 'Mic',
            ),
            const SizedBox(width: 16),
            _DeviceControlButton(
              icon: _isCameraEnabled ? Icons.videocam_rounded : Icons.videocam_off_rounded,
              isActive: _isCameraEnabled,
              isLocked: widget.lockWebcam,
              onTap: _isCameraEnabled ? _disableCamera : _enableCamera,
              activeColor: AppColors.accent,
              label: 'Cam',
            ),
          ],
        ),
      ],
    );
  }
}

class _DeviceControlButton extends StatelessWidget {
  final IconData icon;
  final bool isActive;
  final bool isLocked;
  final VoidCallback onTap;
  final Color activeColor;
  final String label;

  const _DeviceControlButton({
    required this.icon,
    required this.isActive,
    required this.isLocked,
    required this.onTap,
    required this.activeColor,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    if (isLocked) {
      return Column(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.error.withOpacity(0.08),
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.error.withOpacity(0.2), width: 1.5),
            ),
            child: const Icon(Icons.block_rounded, color: AppColors.error, size: 22),
          ),
          const SizedBox(height: 8),
          const Text(
            'Locked',
            style: TextStyle(fontSize: 11, color: AppColors.error, fontWeight: FontWeight.bold),
          ),
        ],
      );
    }

    return Column(
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(28),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: isActive ? activeColor : AppColors.textPrimary.withOpacity(0.05),
              shape: BoxShape.circle,
              boxShadow: isActive
                  ? [
                      BoxShadow(
                        color: activeColor.withOpacity(0.3),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ]
                  : null,
            ),
            child: Icon(
              icon,
              color: isActive ? AppColors.textOnPrimary : AppColors.grey700,
              size: 22,
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            color: AppColors.grey700,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
