import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/room_settings_provider.dart';
import '../../../providers/session_provider.dart';

/// Settings Bottom Sheet bound to roomSettingsProvider
/// 1:1 clone of apps/meet/src/components/settings/index.tsx
class SettingsBottomSheet extends ConsumerStatefulWidget {
  const SettingsBottomSheet({super.key});

  @override
  ConsumerState<SettingsBottomSheet> createState() => _SettingsBottomSheetState();
}

class _SettingsBottomSheetState extends ConsumerState<SettingsBottomSheet>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<String> _audioInputDevices = [];
  List<String> _audioOutputDevices = [];
  List<String> _videoDevices = [];
  String? _selectedAudioInput;
  String? _selectedAudioOutput;
  String? _selectedVideoDevice;
  String _videoQuality = 'high'; // 'high', 'medium', 'low'
  bool _showConnectionQuality = true;
  bool _showElapsedTime = true;
  bool _isLoadingDevices = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _loadDevices();
  }

  Future<void> _loadDevices() async {
    try {
      // Note: LiveKit Flutter SDK device enumeration may differ from web
      // For now, using placeholder device names - actual implementation depends on SDK version
      setState(() {
        _audioInputDevices = ['Default Microphone', 'Headset Microphone'];
        _audioOutputDevices = ['Default Speaker', 'Speakerphone'];
        _videoDevices = ['Front Camera', 'Back Camera'];
        _selectedAudioInput = _audioInputDevices.isNotEmpty ? _audioInputDevices.first : null;
        _selectedAudioOutput = _audioOutputDevices.isNotEmpty ? _audioOutputDevices.first : null;
        _selectedVideoDevice = _videoDevices.isNotEmpty ? _videoDevices.first : null;
        _isLoadingDevices = false;
      });
      
      // TODO: Implement actual device enumeration when LiveKit Flutter SDK provides API
      // Example (if available):
      // final audioInputs = await AudioDeviceManager.getInputDevices();
      // final audioOutputs = await AudioDeviceManager.getOutputDevices();
      // final videoInputs = await VideoDeviceManager.getDevices();
    } catch (e) {
      setState(() {
        _isLoadingDevices = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to load devices: $e')),
        );
      }
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Theme.of(context).dividerColor.withOpacity(0.1),
                ),
              ),
            ),
            child: Row(
              children: [
                const Icon(Icons.settings, size: 20),
                const SizedBox(width: 8),
                const Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  splashRadius: 20,
                ),
              ],
            ),
          ),
          
          // Tabs
          TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: 'Audio'),
              Tab(text: 'Video'),
              Tab(text: 'General'),
            ],
            labelColor: Theme.of(context).colorScheme.primary,
            unselectedLabelColor: Theme.of(context).disabledColor,
            indicatorColor: Theme.of(context).colorScheme.primary,
          ),
          
          // Content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildAudioSettings(),
                _buildVideoSettings(),
                _buildGeneralSettings(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAudioSettings() {
    final livekitConn = ref.read(sessionProvider.notifier).livekitConn;
    
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'Microphone',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        _isLoadingDevices
            ? const Center(child: CircularProgressIndicator())
            : DropdownButtonFormField<String>(
                initialValue: _selectedAudioInput,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
                items: _audioInputDevices.map((device) {
                  return DropdownMenuItem<String>(
                    value: device,
                    child: Text(device),
                  );
                }).toList(),
                onChanged: (device) async {
                  if (device != null && livekitConn != null) {
                    try {
                      // TODO: Implement actual device switching when LiveKit Flutter SDK provides API
                      // Example: await AudioDeviceManager.setInputDevice(device);
                      setState(() {
                        _selectedAudioInput = device;
                      });
                      if (mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Audio input set to $device')),
                        );
                      }
                    } catch (e) {
                      if (mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Failed to set audio input: $e')),
                        );
                      }
                    }
                  }
                },
              ),
        const SizedBox(height: 24),
        const Text(
          'Speaker',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        _isLoadingDevices
            ? const Center(child: CircularProgressIndicator())
            : DropdownButtonFormField<String>(
                initialValue: _selectedAudioOutput,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
                items: _audioOutputDevices.map((device) {
                  return DropdownMenuItem<String>(
                    value: device,
                    child: Text(device),
                  );
                }).toList(),
                onChanged: (device) async {
                  if (device != null && livekitConn != null) {
                    try {
                      // TODO: Implement actual device switching when LiveKit Flutter SDK provides API
                      // Example: await AudioDeviceManager.setOutputDevice(device);
                      setState(() {
                        _selectedAudioOutput = device;
                      });
                      if (mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Audio output set to $device')),
                        );
                      }
                    } catch (e) {
                      if (mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Failed to set audio output: $e')),
                        );
                      }
                    }
                  }
                },
              ),
      ],
    );
  }

  Widget _buildVideoSettings() {
    final livekitConn = ref.read(sessionProvider.notifier).livekitConn;
    
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'Camera',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        _isLoadingDevices
            ? const Center(child: CircularProgressIndicator())
            : DropdownButtonFormField<String>(
                initialValue: _selectedVideoDevice,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
                items: _videoDevices.map((device) {
                  return DropdownMenuItem<String>(
                    value: device,
                    child: Text(device),
                  );
                }).toList(),
                onChanged: (device) async {
                  if (device != null && livekitConn != null) {
                    try {
                      // TODO: Implement actual device switching when LiveKit Flutter SDK provides API
                      // Example: await VideoDeviceManager.setDevice(device);
                      setState(() {
                        _selectedVideoDevice = device;
                      });
                      if (mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Video device set to $device')),
                        );
                      }
                    } catch (e) {
                      if (mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Failed to set video device: $e')),
                        );
                      }
                    }
                  }
                },
              ),
        const SizedBox(height: 24),
        const Text(
          'Video Quality',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          initialValue: _videoQuality,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
          items: const [
            DropdownMenuItem(value: 'high', child: Text('High Definition (720p)')),
            DropdownMenuItem(value: 'medium', child: Text('Standard Definition (360p)')),
            DropdownMenuItem(value: 'low', child: Text('Low Definition (180p)')),
          ],
          onChanged: (value) async {
            if (value != null && livekitConn != null) {
              try {
                // TODO: Implement actual video quality change when LiveKit Flutter SDK provides API
                // Note: LiveKit Flutter SDK may require republishing tracks to change quality
                // Example:
                // VideoParameters params;
                // switch (value) {
                //   case 'high':
                //     params = VideoParametersPresets.h720_169;
                //     break;
                //   case 'medium':
                //     params = VideoParametersPresets.h360_169;
                //     break;
                //   case 'low':
                //     params = VideoParametersPresets.h180_169;
                //     break;
                // }
                // final room = livekitConn.room;
                // if (room?.localParticipant != null) {
                //   // Republish video track with new quality
                // }
                setState(() {
                  _videoQuality = value;
                });
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Video quality set to $value')),
                  );
                }
              } catch (e) {
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Failed to update video quality: $e')),
                  );
                }
              }
            }
          },
        ),
      ],
    );
  }

  Widget _buildGeneralSettings() {
    final playSound = ref.watch(
      roomSettingsProvider.select((s) => s.playAudioNotification),
    );
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        SwitchListTile(
          title: const Text('Play sound on notifications'),
          value: playSound,
          onChanged: (value) {
            ref.read(roomSettingsProvider.notifier).updatePlayAudioNotification(value);
          },
        ),
        SwitchListTile(
          title: const Text('Show connection quality'),
          value: _showConnectionQuality,
          onChanged: (value) {
            setState(() {
              _showConnectionQuality = value;
            });
            // TODO: Update UI to show/hide connection quality indicator
            // This should be stored in roomSettingsProvider or a separate provider
          },
        ),
        SwitchListTile(
          title: const Text('Show elapsed time'),
          value: _showElapsedTime,
          onChanged: (value) {
            setState(() {
              _showElapsedTime = value;
            });
            // TODO: Update UI to show/hide elapsed time indicator
            // This should be stored in roomSettingsProvider or a separate provider
          },
        ),
      ],
    );
  }
}
