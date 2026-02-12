import 'package:flutter/material.dart';

/// Settings Bottom Sheet
/// Displays application settings (Audio, Video, General)
/// 1:1 clone of apps/meet/src/components/settings/index.tsx
class SettingsBottomSheet extends StatefulWidget {
  const SettingsBottomSheet({super.key});

  @override
  State<SettingsBottomSheet> createState() => _SettingsBottomSheetState();
}

class _SettingsBottomSheetState extends State<SettingsBottomSheet> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'Microphone',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: 'default',
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
          items: const [
            DropdownMenuItem(value: 'default', child: Text('Default Microphone')),
            DropdownMenuItem(value: 'headset', child: Text('Headset Microphone')),
          ],
          onChanged: (value) {
            // TODO: Update audio input device
          },
        ),
        const SizedBox(height: 24),
        const Text(
          'Speaker',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: 'default',
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
          items: const [
            DropdownMenuItem(value: 'default', child: Text('Default Speaker')),
            DropdownMenuItem(value: 'speaker', child: Text('Speakerphone')),
          ],
          onChanged: (value) {
            // TODO: Update audio output device
          },
        ),
      ],
    );
  }

  Widget _buildVideoSettings() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'Camera',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: 'front',
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
          items: const [
            DropdownMenuItem(value: 'front', child: Text('Front Camera')),
            DropdownMenuItem(value: 'back', child: Text('Back Camera')),
          ],
          onChanged: (value) {
            // TODO: Update video input device
          },
        ),
        const SizedBox(height: 24),
        const Text(
          'Video Quality',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: 'high',
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
          items: const [
            DropdownMenuItem(value: 'high', child: Text('High Definition (720p)')),
            DropdownMenuItem(value: 'medium', child: Text('Standard Definition (360p)')),
            DropdownMenuItem(value: 'low', child: Text('Low Definition (180p)')),
          ],
          onChanged: (value) {
            // TODO: Update video quality
          },
        ),
      ],
    );
  }

  Widget _buildGeneralSettings() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        SwitchListTile(
          title: const Text('Show connection quality'),
          value: true,
          onChanged: (value) {
            // TODO: Toggle connection quality indicator
          },
        ),
        SwitchListTile(
          title: const Text('Show elapsed time'),
          value: true,
          onChanged: (value) {
            // TODO: Toggle elapsed time
          },
        ),
      ],
    );
  }
}
