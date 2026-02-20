import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:livekit_client/livekit_client.dart';

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
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: [
        // Video preview with a premium frame
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF0E141C),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: (isDark ? Colors.white : Colors.black).withOpacity(0.08),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Stack(
                children: [
                  _isCameraEnabled && _videoTrack != null
                      ? VideoTrackRenderer(
                          _videoTrack!,
                          fit: VideoViewFit.cover,
                        )
                      : Container(
                          color: const Color(0xFF191F28),
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CircleAvatar(
                                  radius: 40,
                                  backgroundColor: Colors.white.withOpacity(0.05),
                                  child: const Icon(
                                    Icons.videocam_off_rounded,
                                    size: 40,
                                    color: Colors.white24,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                const Text(
                                  'Camera đang tắt',
                                  style: TextStyle(
                                    color: Colors.white38,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                  
                  // Top overlay for "Device Preview"
                  Positioned(
                    top: 16,
                    left: 16,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.video_settings, size: 14, color: Colors.white),
                          SizedBox(width: 6),
                          Text(
                            'Xem trước',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
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
        
        const SizedBox(height: 24),
        
        // Refined device controls
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _DeviceControlButton(
              icon: _isMicEnabled ? Icons.mic_rounded : Icons.mic_off_rounded,
              isActive: _isMicEnabled,
              isLocked: widget.lockMicrophone,
              onTap: _isMicEnabled ? _disableMicrophone : _enableMicrophone,
              activeColor: const Color(0xFF2BC5C5),
              label: 'Microphone',
            ),
            const SizedBox(width: 24),
            _DeviceControlButton(
              icon: _isCameraEnabled ? Icons.videocam_rounded : Icons.videocam_off_rounded,
              isActive: _isCameraEnabled,
              isLocked: widget.lockWebcam,
              onTap: _isCameraEnabled ? _disableCamera : _enableCamera,
              activeColor: const Color(0xFF2BC5C5),
              label: 'Camera',
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
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.08),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.red.withOpacity(0.2), width: 1.5),
            ),
            child: const Icon(Icons.block_rounded, color: Colors.red, size: 28),
          ),
          const SizedBox(height: 8),
          const Text(
            'Locked',
            style: TextStyle(fontSize: 11, color: Colors.red, fontWeight: FontWeight.bold),
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
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: isActive ? activeColor : Colors.black.withOpacity(0.05),
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
              color: isActive ? Colors.white : Colors.black54,
              size: 28,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            color: Colors.black54,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
