import 'package:flutter/foundation.dart';

/// Shared base class for view models to manage loading and error states.
class BaseViewModel extends ChangeNotifier {
  bool _isBusy = false;
  String? _errorMessage;

  bool get isBusy => _isBusy;
  String? get errorMessage => _errorMessage;

  void setBusy(bool value) {
    if (_isBusy == value) return;
    _isBusy = value;
    notifyListeners();
  }

  void setError(String? message) {
    _errorMessage = message;
    notifyListeners();
  }
}

