import 'package:flutter/material.dart';
import '../../viewmodels/live_class_vm.dart';
import '../widgets/webrtc_toolbar.dart';

class LiveClassPage extends StatelessWidget {
  const LiveClassPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: connect LiveClassVM
    return Scaffold(
      appBar: AppBar(title: const Text('Live Class')),
      body: Column(
        children: const [
          Expanded(child: Center(child: Text('Video area placeholder'))),
          WebRtcToolbar(),
        ],
      ),
    );
  }
}

