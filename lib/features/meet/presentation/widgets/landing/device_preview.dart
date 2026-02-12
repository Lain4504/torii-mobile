import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:livekit_client/livekit_client.dart';
import '../../../providers/room_settings_provider.dart';

/// Device Preview Widget
/// Shows camera preview and mic/camera controls
/// 1:1 clone of apps/meet/src/components/landing/webcamPreview.tsx
class DevicePreview extends ConsumerStatefulWidget {
  final bool lockMicrophone;
  final bool lockWebcam;

  const DevicePreview({
    super.key,
    required this.lockMicrophone,
    required this.lockWebcam,
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
    } catch (e) {
      debugPrint('Failed to enable camera: $e');
    }
  }

  Future<void> _enableMicrophone() async {
    try {
      _audioTrack = await LocalAudioTrack.createTrack();
      setState(() {
        _isMicEnabled = true;
      });
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
  }

  Future<void> _disableMicrophone() async {
    await _audioTrack?.stop();
    _audioTrack = null;
    setState(() {
      _isMicEnabled = false;
    });
  }

  @override
  void dispose() {
    _videoTrack?.stop();
    _audioTrack?.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).dividerColor.withOpacity(0.1),
        ),
      ),
      child: Column(
        children: [
          // Video preview
          AspectRatio(
            aspectRatio: 16 / 9,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: _isCameraEnabled && _videoTrack != null
                  ? VideoTrackRenderer(_videoTrack!)
                  : Container(
                      color: Colors.black87,
                      child: const Center(
                        child: Icon(
                          Icons.videocam_off,
                          size: 64,
                          color: Colors.white54,
                        ),
                      ),
                    ),
            ),
          ),
          
          // Controls
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Microphone button
                if (!widget.lockMicrophone)
                  _buildControlButton(
                    icon: _isMicEnabled ? Icons.mic : Icons.mic_off,
                    isActive: _isMicEnabled,
                    onTap: _isMicEnabled ? _disableMicrophone : _enableMicrophone,
                  )
                else
                  _buildLockedButton(Icons.mic_off),
                
                const SizedBox(width: 20),
                
                // Camera button
                if (!widget.lockWebcam)
                  _buildControlButton(
                    icon: _isCameraEnabled ? Icons.videocam : Icons.videocam_off,
                    isActive: _isCameraEnabled,
                    onTap: _isCameraEnabled ? _disableCamera : _enableCamera,
                  )
                else
                  _buildLockedButton(Icons.videocam_off),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildControlButton({
    required IconData icon,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: isActive
              ? Theme.of(context).colorScheme.primary.withOpacity(0.2)
              : Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isActive
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).dividerColor.withOpacity(0.2),
          ),
        ),
        child: Icon(
          icon,
          color: isActive
              ? Theme.of(context).colorScheme.primary
              : Colors.white70,
        ),
      ),
    );
  }

  Widget _buildLockedButton(IconData icon) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: Colors.red.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.red.withOpacity(0.3),
        ),
      ),
      child: Stack(
        children: [
          Center(
            child: Icon(
              icon,
              color: Colors.red,
            ),
          ),
          Positioned(
            top: 2,
            right: 2,
            child: Icon(
              Icons.lock,
              size: 12,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
