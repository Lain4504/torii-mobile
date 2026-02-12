// Speech Services Provider - Riverpod State Management
// Simplified version of apps/meet/src/store/slices/speechServicesSlice.ts

import 'package:flutter_riverpod/flutter_riverpod.dart';

class SpeechSubtitle {
  final String text;
  final String from;
  final String time;
  final String id;
  final String type; // 'interim' or 'final'
  
  const SpeechSubtitle({
    required this.text,
    required this.from,
    required this.time,
    required this.id,
    required this.type,
  });
}

class SpeechServicesState {
  final String selectedSubtitleLang;
  final List<SpeechSubtitle> subtitles;
  
  const SpeechServicesState({
    this.selectedSubtitleLang = '',
    this.subtitles = const [],
  });
  
  SpeechServicesState copyWith({
    String? selectedSubtitleLang,
    List<SpeechSubtitle>? subtitles,
  }) {
    return SpeechServicesState(
      selectedSubtitleLang: selectedSubtitleLang ?? this.selectedSubtitleLang,
      subtitles: subtitles ?? this.subtitles,
    );
  }
}

class SpeechServicesNotifier extends StateNotifier<SpeechServicesState> {
  SpeechServicesNotifier() : super(const SpeechServicesState());
  
  void addSpeechSubtitleText({
    required String type,
    required Map<String, dynamic> result,
  }) {
    final subtitle = SpeechSubtitle(
      text: result['text'] as String? ?? '',
      from: result['from'] as String? ?? '',
      time: result['time'] as String? ?? '',
      id: result['id'] as String? ?? '',
      type: type,
    );
    
    state = state.copyWith(
      subtitles: [...state.subtitles, subtitle],
    );
  }
  
  void updateSelectedSubtitleLang(String lang) {
    state = state.copyWith(selectedSubtitleLang: lang);
  }
  
  void clearSubtitles() {
    state = state.copyWith(subtitles: []);
  }
}

final speechServicesProvider = StateNotifierProvider<SpeechServicesNotifier, SpeechServicesState>((ref) {
  return SpeechServicesNotifier();
});
