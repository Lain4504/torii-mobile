import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../providers/session_provider.dart';

/// Shows external media player or display external link when active (view only).
/// 1:1 clone of apps/meet main area external media / display link layout.
class ExternalContentView extends ConsumerWidget {
  const ExternalContentView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final room = ref.watch(sessionProvider.select((s) => s.currentRoom));
    final features = room.metadata?.roomFeatures;
    final externalMedia = features?.externalMediaPlayerFeatures;
    final displayLink = features?.displayExternalLinkFeatures;

    if (externalMedia != null && externalMedia.isActive && externalMedia.url.isNotEmpty) {
      return _ExternalMediaView(url: externalMedia.url);
    }
    if (displayLink != null && displayLink.isActive && displayLink.link.isNotEmpty) {
      return _DisplayLinkView(link: displayLink.link);
    }
    return const SizedBox.shrink();
  }
}

class _ExternalMediaView extends StatelessWidget {
  final String url;

  const _ExternalMediaView({required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.video_library,
              size: 48,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 12),
            Text(
              'External media playing',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              url,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: () => _launchUrl(url),
              icon: const Icon(Icons.open_in_new, size: 18),
              label: const Text('Open in browser'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.tryParse(url);
    if (uri != null && await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}

class _DisplayLinkView extends StatelessWidget {
  final String link;

  const _DisplayLinkView({required this.link});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.link,
              size: 48,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 12),
            Text(
              'Display external link',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              link,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: () => _launchUrl(link),
              icon: const Icon(Icons.open_in_new, size: 18),
              label: const Text('Open link'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.tryParse(url);
    if (uri != null && await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
