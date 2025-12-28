import 'package:flutter/foundation.dart';

class LiveClassVM extends ChangeNotifier {
  // TODO: inject WebRTC service
  bool _connected = false;

  bool get isConnected => _connected;

  Future<void> joinRoom() async {
    _connected = true;
    notifyListeners();
  }

  Future<void> leaveRoom() async {
    _connected = false;
    notifyListeners();
  }
}

