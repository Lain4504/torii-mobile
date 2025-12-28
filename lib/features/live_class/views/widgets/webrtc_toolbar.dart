import 'package:flutter/material.dart';

class WebRtcToolbar extends StatelessWidget {
  const WebRtcToolbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          Icon(Icons.videocam),
          Icon(Icons.mic),
          Icon(Icons.screen_share),
          Icon(Icons.call_end, color: Colors.red),
        ],
      ),
    );
  }
}

