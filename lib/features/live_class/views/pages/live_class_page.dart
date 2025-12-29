import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/live_class_providers.dart';
import '../widgets/webrtc_toolbar.dart';

class LiveClassPage extends ConsumerWidget {
  const LiveClassPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(liveClassProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Class'),
        actions: [
          if (state.isConnected)
            IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () => ref.read(liveClassProvider.notifier).leaveRoom(),
            ),
        ],
      ),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : state.error != null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Error: ${state.error}'),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () => ref.read(liveClassProvider.notifier).clearError(),
                        child: const Text('Dismiss'),
                      ),
                    ],
                  ),
                )
              : Column(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          state.isConnected
                              ? 'Connected to class'
                              : 'Not connected',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                    ),
                    const WebRtcToolbar(),
                  ],
                ),
    );
  }
}


