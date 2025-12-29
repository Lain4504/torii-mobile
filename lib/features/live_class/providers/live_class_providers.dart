import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'live_class_state.dart';

/// Provider for live class state
final liveClassProvider = NotifierProvider<LiveClassNotifier, LiveClassState>(
  LiveClassNotifier.new,
);

// TODO: Add more live class-related providers
// Example:
// final upcomingClassesProvider = FutureProvider<List<LiveClass>>((ref) async {
//   return await liveClassRepository.getUpcomingClasses();
// });
