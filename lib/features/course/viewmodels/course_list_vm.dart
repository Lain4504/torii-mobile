import 'package:flutter/foundation.dart';

class CourseListVM extends ChangeNotifier {
  // TODO: inject CourseRepository
  bool _loading = false;

  bool get isLoading => _loading;
}

