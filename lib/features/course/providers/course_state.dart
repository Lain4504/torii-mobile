import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/course_model.dart';

/// State for course list
class CourseListState {
  final List<Course> courses;
  final bool isLoading;
  final String? error;

  const CourseListState({
    this.courses = const [],
    this.isLoading = false,
    this.error,
  });

  CourseListState copyWith({
    List<Course>? courses,
    bool? isLoading,
    String? error,
  }) {
    return CourseListState(
      courses: courses ?? this.courses,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

/// StateNotifier for managing course list
class CourseListNotifier extends Notifier<CourseListState> {
  @override
  CourseListState build() => const CourseListState();
  
  Future<void> loadCourses() async {
    state = state.copyWith(isLoading: true, error: null);
    
    try {
      await Future.delayed(const Duration(seconds: 1)); // Simulate API call
      
      // Mock Data
      final mockCourses = <Course>[
        const Course(
          id: '00000000-0000-0000-0000-000000000001',
          title: 'Mastering JLPT N5: Absolute Beginner',
          description: 'A comprehensive guide to passing N5 with flying colors.',
          thumbnailUrl: 'https://images.unsplash.com/photo-1522202176988-66273c2fd55f?auto=format&fit=crop&q=80&w=2071',
          instructorName: 'Yuki Sensei',
          instructorAvatarUrl: 'https://i.pravatar.cc/150?u=yuki',
          level: JLPTLevel.n5,
          type: CourseType.vod,
          price: 49.99,
          rating: 4.8,
          reviewCount: 124,
          enrolledCount: 1540,
        ),
        const Course(
          id: '2',
          title: 'N4 Grammar & Conversation Live',
          description: 'Interactive live sessions to boost your speaking skills.',
          thumbnailUrl: 'https://images.unsplash.com/photo-1544716278-ca5e3f4abd8c?auto=format&fit=crop&q=80&w=1974',
          instructorName: 'Kenji Tanaka',
          instructorAvatarUrl: 'https://i.pravatar.cc/150?u=kenji',
          level: JLPTLevel.n4,
          type: CourseType.liveClass,
          price: 199.99,
          rating: 4.9,
          reviewCount: 56,
          enrolledCount: 320,
        ),
        const Course(
          id: '3',
          title: 'N3 Kanji Crash Course',
          description: 'Learn all 650 N3 kanji in 30 days.',
          thumbnailUrl: 'https://images.unsplash.com/photo-1528164344705-47542687000d?auto=format&fit=crop&q=80&w=2092',
          instructorName: 'Sakura Team',
          instructorAvatarUrl: 'https://i.pravatar.cc/150?u=sakura',
          level: JLPTLevel.n3,
          type: CourseType.vod,
          price: 79.00,
          rating: 4.5,
          reviewCount: 89,
          enrolledCount: 890,
        ),
        const Course(
          id: '4',
          title: 'Advanced N2 Reading Comprehension',
          description: 'Deep dive into complex Japanese texts and articles.',
          thumbnailUrl: 'https://images.unsplash.com/photo-1456513080510-7bf3a84b82f8?auto=format&fit=crop&q=80&w=1973',
          instructorName: 'Hiroshi Sato',
          instructorAvatarUrl: 'https://i.pravatar.cc/150?u=hiroshi',
          level: JLPTLevel.n2,
          type: CourseType.vod,
          price: 89.99,
          rating: 4.7,
          reviewCount: 204,
          enrolledCount: 1200,
        ),
        const Course(
          id: '5',
          title: 'N1 Business Japanese Mastery',
          description: 'Prepare for the professional world in Japan.',
          thumbnailUrl: 'https://images.unsplash.com/photo-1551836022-d5d88e9218df?auto=format&fit=crop&q=80&w=2070',
          instructorName: 'Akiko Watanabe',
          instructorAvatarUrl: 'https://i.pravatar.cc/150?u=akiko',
          level: JLPTLevel.n1,
          type: CourseType.liveClass,
          price: 249.99,
          rating: 5.0,
          reviewCount: 42,
          enrolledCount: 150,
        ),
      ];
      
      state = state.copyWith(
        courses: mockCourses,
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
