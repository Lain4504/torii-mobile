import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/course_model.dart';
import 'course_providers.dart';

class MyLearningState {
  final List<Course> myCourses;
  final bool isLoading;
  final String? error;
  final Map<String, dynamic> stats;

  const MyLearningState({
    this.myCourses = const [],
    this.isLoading = false,
    this.error,
    this.stats = const {},
  });

  MyLearningState copyWith({
    List<Course>? myCourses,
    bool? isLoading,
    String? error,
    Map<String, dynamic>? stats,
  }) {
    return MyLearningState(
      myCourses: myCourses ?? this.myCourses,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      stats: stats ?? this.stats,
    );
  }
}

class MyLearningNotifier extends Notifier<MyLearningState> {
  @override
  MyLearningState build() {
    return const MyLearningState();
  }

  Future<void> loadData() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final repository = ref.read(courseRepositoryProvider);
      
      final results = await Future.wait([
        repository.getMyCourses(),
        repository.getLearningStats(),
      ]);

      state = state.copyWith(
        myCourses: results[0] as List<Course>,
        stats: results[1] as Map<String, dynamic>,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }
}

final myLearningProvider = NotifierProvider<MyLearningNotifier, MyLearningState>(
  MyLearningNotifier.new,
);
