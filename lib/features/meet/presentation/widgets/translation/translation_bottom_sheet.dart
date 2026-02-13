import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/speech_services_provider.dart';

/// Translation / Live Subtitle Bottom Sheet
/// Shows live subtitles and subtitle language selector
/// 1:1 clone of apps/meet translation-transcription UI for mobile
class TranslationBottomSheet extends ConsumerWidget {
  const TranslationBottomSheet({super.key});

  static const List<Map<String, String>> _subtitleLangs = [
    {'code': 'en', 'name': 'English'},
    {'code': 'ja', 'name': 'Japanese'},
    {'code': 'vi', 'name': 'Vietnamese'},
    {'code': 'ko', 'name': 'Korean'},
    {'code': 'zh', 'name': 'Chinese'},
    {'code': 'es', 'name': 'Spanish'},
    {'code': 'fr', 'name': 'French'},
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(speechServicesProvider);

    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        children: [
          _buildHeader(context),
          _buildSubtitleLangSelector(context, ref, state.selectedSubtitleLang),
          const Divider(height: 1),
          Expanded(
            child: _buildSubtitleList(context, state.subtitles),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
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
          Icon(Icons.subtitles, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 8),
          const Text(
            'Live subtitles',
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
          ),
        ],
      ),
    );
  }

  Widget _buildSubtitleLangSelector(
    BuildContext context,
    WidgetRef ref,
    String selectedLang,
  ) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: _subtitleLangs.map((lang) {
          final code = lang['code']!;
          final name = lang['name']!;
          final isSelected = selectedLang == code;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: FilterChip(
              label: Text(name),
              selected: isSelected,
              onSelected: (_) {
                ref.read(speechServicesProvider.notifier).updateSelectedSubtitleLang(code);
              },
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildSubtitleList(BuildContext context, List<SpeechSubtitle> subtitles) {
    if (subtitles.isEmpty) {
      return Center(
        child: Text(
          'Subtitles will appear here when someone speaks.',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
            fontSize: 14,
          ),
          textAlign: TextAlign.center,
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: subtitles.length,
      itemBuilder: (context, index) {
        final s = subtitles[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 14,
                backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                child: Text(
                  s.from.isNotEmpty ? s.from[0].toUpperCase() : '?',
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      s.from,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      s.text,
                      style: const TextStyle(fontSize: 14),
                    ),
                    if (s.type == 'interim')
                      Text(
                        '...',
                        style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
