import 'package:flutter/foundation.dart';

class AuthViewModel extends ChangeNotifier {
  // TODO: inject repository/service dependencies
  bool _loading = false;

  bool get isLoading => _loading;

  Future<void> login(String email, String password) async {
    _loading = true;
    notifyListeners();
    // TODO: call repo
    _loading = false;
    notifyListeners();
  }
}

