import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/study_set_model.dart';

final studySetsProvider = StateNotifierProvider<StudySetsNotifier, AsyncValue<List<StudySet>>>((ref) {
  return StudySetsNotifier();
});

class StudySetsNotifier extends StateNotifier<AsyncValue<List<StudySet>>> {
  StudySetsNotifier() : super(const AsyncValue.loading()) {
    loadData();
  }

  Future<void> loadData() async {
    state = const AsyncValue.loading();
    try {
      // Mock data for now
      await Future.delayed(const Duration(seconds: 1));
      final mockSets = [
        StudySet(
          id: '1',
          title: 'N5 – Trường học',
          description: 'Từ vựng về chủ đề trường học cấp độ N5',
          cardCount: 24,
          setCards: [
             StudyCard(id: 'c1', term: '学校', definition: 'Trường học', hint: 'がっこう'),
             StudyCard(id: 'c2', term: '先生', definition: 'Giáo viên', hint: 'せんせい'),
             StudyCard(id: 'c3', term: '本', definition: 'Sách', hint: 'ほん'),
             StudyCard(id: 'c4', term: '学生', definition: 'Học sinh', hint: 'がくせい'),
             StudyCard(id: 'c5', term: '教室', definition: 'Phòng học', hint: 'きょうしつ'),
          ],
        ),
        StudySet(
          id: '2',
          title: 'N4 – Giao thông',
          description: 'Các phương tiện và biển báo giao thông N4',
          cardCount: 15,
        ),
        StudySet(
          id: '3',
          title: 'Tính từ đuôi い',
          description: 'Danh sách các tính từ đuôi い phổ biến',
          cardCount: 50,
        ),
      ];
      state = AsyncValue.data(mockSets);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> createSet(String title, String description) async {
    // Mock create
    final currentSets = state.value ?? [];
    final newSet = StudySet(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      description: description,
      cardCount: 0,
    );
    state = AsyncValue.data([...currentSets, newSet]);
  }
}
