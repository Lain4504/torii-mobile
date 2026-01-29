import 'package:flutter/material.dart';
import '../../../core/constants/app_design_system.dart';
import 'comment_modal.dart';

/// Comment Icon Button - Floating action button for opening comments
/// Can be placed in app bar actions of blog/post details
class CommentIconButton extends StatelessWidget {
  final String postId;
  final String postTitle;
  final bool isDark;

  const CommentIconButton({
    super.key,
    required this.postId,
    required this.postTitle,
    this.isDark = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.9),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: IconButton(
        icon: const Icon(
          Icons.chat_bubble_outline_rounded,
          size: 20,
          color: AppColors.textPrimary,
        ),
        onPressed: () {
          CommentModal.show(context, postId: postId, postTitle: postTitle);
        },
        padding: EdgeInsets.zero,
      ),
    );
  }
}
