import 'package:flutter/foundation.dart';

import '../core/base/view_model.dart';
import '../data/course_service.dart';
import '../graphql/operations.graphql.dart';
import '../graphql/schema.graphql.dart';

/// ViewModel cho CRUD Course với state chi tiết cho từng hành động.
class CourseViewModel extends BaseViewModel {
  CourseViewModel({required CourseService service}) : _service = service;

  final CourseService _service;

  List<Query$GetCourses$courses> _courses = [];
  List<Query$GetCourses$courses> get courses => _courses;

  bool _isLoadingList = false;
  bool get isLoadingList => _isLoadingList;

  bool _isSubmitting = false;
  bool get isSubmitting => _isSubmitting;

  int? _deletingId;
  int? get deletingId => _deletingId;

  String? _listError;
  String? get listError => _listError;

  String? _actionError;
  String? get actionError => _actionError;

  Future<void> load() async {
    if (_isLoadingList) return;
    _isLoadingList = true;
    _listError = null;
    notifyListeners();

    try {
      _courses = await _service.fetchCourses();
    } catch (e, s) {
      debugPrint('Load courses failed: $e\n$s');
      _listError = 'Không thể tải danh sách khoá học';
    } finally {
      _isLoadingList = false;
      notifyListeners();
    }
  }

  Future<void> create(Input$CreateCourseInput input) async {
    _isSubmitting = true;
    _actionError = null;
    notifyListeners();

    try {
      await _service.createCourse(input);
      await load();
    } catch (e, s) {
      debugPrint('Create course failed: $e\n$s');
      _actionError = 'Không thể tạo khoá học';
    } finally {
      _isSubmitting = false;
      notifyListeners();
    }
  }

  Future<void> update(int id, Input$UpdateCourseInput input) async {
    _isSubmitting = true;
    _actionError = null;
    notifyListeners();

    try {
      await _service.updateCourse(id, input);
      await load();
    } catch (e, s) {
      debugPrint('Update course failed: $e\n$s');
      _actionError = 'Không thể cập nhật khoá học';
    } finally {
      _isSubmitting = false;
      notifyListeners();
    }
  }

  Future<void> remove(int id) async {
    if (_deletingId != null) return;
    _deletingId = id;
    _actionError = null;
    notifyListeners();

    try {
      await _service.deleteCourse(id);
      await load();
    } catch (e, s) {
      debugPrint('Delete course failed: $e\n$s');
      _actionError = 'Không thể xoá khoá học';
    } finally {
      _deletingId = null;
      notifyListeners();
    }
  }
}

