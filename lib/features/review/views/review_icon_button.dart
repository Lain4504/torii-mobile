import 'package:flutter/material.dart';
import '../../../core/constants/app_design_system.dart';
import '../providers/review_provider.dart';
import 'review_modal.dart';

/// Review Icon Button - Floating action button for opening reviews
/// Can be placed in app bar actions or as floating button
class ReviewIconButton extends StatelessWidget {
  final String entityId;
  final ReviewType type;
  final String entityTitle;
  final bool isDark;

  const ReviewIconButton({
    super.key,
    required this.entityId,
    required this.type,
    required this.entityTitle,
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
          Icons.rate_review_rounded,
          size: 20,
          color: AppColors.textPrimary,
        ),
        onPressed: () {
          ReviewModal.show(
            context,
            entityId: entityId,
            type: type,
            entityTitle: entityTitle,
          );
        },
        padding: EdgeInsets.zero,
      ),
    );
  }
}
