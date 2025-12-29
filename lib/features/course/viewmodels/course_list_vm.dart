import 'package:flutter/foundation.dart';

class CourseListVM extends ChangeNotifier {
  // TODO: inject CourseRepository
  final bool _loading = false;

  bool get isLoading => _loading;
}

