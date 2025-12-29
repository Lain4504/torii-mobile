import 'package:flutter_riverpod/flutter_riverpod.dart';

/// State for dashboard
class DashboardState {
  final Map<String, dynamic> stats; // TODO: Create proper stats model
  final bool isLoading;
  final String? error;

  const DashboardState({
    this.stats = const {},
    this.isLoading = false,
    this.error,
  });

  DashboardState copyWith({
    Map<String, dynamic>? stats,
    bool? isLoading,
    String? error,
  }) {
    return DashboardState(
      stats: stats ?? this.stats,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

/// Notifier for dashboard
/// Aggregates data from multiple features (courses, exams, etc.)
class DashboardNotifier extends Notifier<DashboardState> {
  @override
  DashboardState build() => const DashboardState();

  // TODO: Inject multiple repositories/services
  
  Future<void> loadDashboardData() async {
    state = state.copyWith(isLoading: true, error: null);
    
    try {
      // TODO: Aggregate data from multiple sources
      // - Course progress
      // - Exam results
      // - Flashcard stats
      // - Upcoming live classes
      
      await Future.delayed(const Duration(seconds: 1)); // Simulate API call
      
      state = state.copyWith(
        stats: {}, // TODO: Set actual stats
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}
