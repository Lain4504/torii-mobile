import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'mic_button.dart';
import 'camera_button.dart';
import 'screen_share_button.dart';
import 'raise_hand_button.dart';
import 'leave_button.dart';
import 'more_options_button.dart';

/// Control Bar Widget
/// Shows mic, camera, screen share, leave, and more options buttons
/// 1:1 clone of apps/meet/src/components/footer/index.tsx
class ControlBar extends ConsumerWidget {
  const ControlBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsets.fromLTRB(16, 0, 16, isMobile ? 12 : 24),
      child: Container(
        height: isMobile ? 80 : 96,
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 12 : 24,
        ),
        decoration: BoxDecoration(
          color: isDark 
              ? const Color(0xFF1E1E1E).withOpacity(0.9) 
              : Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: (isDark ? Colors.white : Colors.black).withOpacity(0.08),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Mic button
            const MicButton(),
            SizedBox(width: isMobile ? 10 : 16),
            
            // Camera button
            const CameraButton(),
            SizedBox(width: isMobile ? 10 : 16),
            
            // Screen share button (desktop only)
            if (!isMobile) ...[
              const ScreenShareButton(),
              const SizedBox(width: 16),
            ],
  
            // Raise hand
            const RaiseHandButton(),
            SizedBox(width: isMobile ? 10 : 16),
  
            // More options button
            const MoreOptionsButton(),
            SizedBox(width: isMobile ? 10 : 16),

            // Leave button
            const LeaveButton(),
          ],
        ),
      ),
    );
  }
}
