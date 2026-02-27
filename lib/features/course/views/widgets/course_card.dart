import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../models/course_model.dart';

/// Course Card - Modern, premium course display
class CourseCard extends StatelessWidget {
  final Course course;

  const CourseCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return ClipRRect(
      borderRadius: BorderRadius.circular(AppRadius.card),
      child: Container(
      decoration: BoxDecoration(
        color: theme.cardColor,
        border: Border.all(
          color: AppColors.border,
          width: 1.0,
        ),
      ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              if (course.isEnrolled) {
                // Navigate to lessons page if enrolled
                context.push('/courses/${course.id}/lessons');
              } else {
                // Navigate to course detail page if not enrolled
                context.push('/courses/${course.id}');
              }
            },
            borderRadius: BorderRadius.circular(AppRadius.card),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Premium Thumbnail - No padding to fill corners
                _buildThumbnail(isDark),

                // Refined Content
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    AppSpacing.lg,
                    AppSpacing.md,
                    AppSpacing.lg,
                    AppSpacing.lg,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Badge Row
                      _buildMetadata(theme),
                      const SizedBox(height: AppSpacing.sm),

                      // Elegant Title
                      Text(
                        course.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: AppTypography.extraBold,
                          color: AppColors.textPrimary,
                          fontSize: 19,
                          height: 1.2,
                          letterSpacing: -0.5,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.md),

                      // Instructor with cleaner profile
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.primary.withValues(alpha: 0.1),
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 12,
                            backgroundColor: AppColors.secondary,
                            backgroundImage:
                                course.instructorAvatarUrl.isNotEmpty
                                ? NetworkImage(course.instructorAvatarUrl)
                                : null,
                            child: course.instructorAvatarUrl.isEmpty
                                ? const Icon(
                                    Icons.person_rounded,
                                    size: 14,
                                    color: AppColors.primary,
                                  )
                                : null,
                          ),
                          ),
                          const SizedBox(width: AppSpacing.sm),
                          Expanded(
                            child: Text(
                              course.instructorName,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: AppColors.textSecondary,
                                fontWeight: AppTypography.medium,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: AppSpacing.lg),

                      // Stats & Price Bar
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Premium Rating
                          // Premium Rating
                          Row(
                            children: [
                              const Icon(
                                Icons.star_rounded,
                                size: 16,
                                color: Color(0xFFFFB800),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '${course.rating}',
                                style: theme.textTheme.labelMedium?.copyWith(
                                  fontWeight: AppTypography.black,
                                  color: AppColors.textSecondary,
                                  letterSpacing: 1.0,
                                ),
                              ),
                            ],
                          ),

                          // Bold Price
                          Text(
                            course.priceLabel,
                            style: theme.textTheme.titleMedium?.copyWith(
                              color: AppColors.primary,
                              fontWeight: AppTypography.black,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildThumbnail(bool isDark) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // High Quality Image Placeholder/Network
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(AppRadius.card),
              topRight: Radius.circular(AppRadius.card),
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
            ),
            child:
                course.thumbnailUrl != null && course.thumbnailUrl!.isNotEmpty
                ? Image.network(
                    course.thumbnailUrl!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        _buildPlaceholder(isDark),
                  )
                : _buildPlaceholder(isDark),
          ),

          // Subtle Overlay for text readability (if needed)
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withValues(alpha: 0.2),
                  Colors.transparent,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // Premium Enrolled Badge
          if (course.isEnrolled)
            Positioned(
              top: 12,
              right: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: AppColors.success,
                  borderRadius: BorderRadius.circular(AppRadius.full),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.check_circle_rounded,
                      color: Colors.white,
                      size: 14,
                    ),
                    SizedBox(width: 6),
                    Text(
                      'ĐÃ ĐĂNG KÝ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 9,
                        letterSpacing: 2.0,
                        fontWeight: AppTypography.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),

          // Expiration Badge
          if (course.expiresAt != null)
            Positioned(
              bottom: 12,
              left: 12,
              child: _buildExpirationBadge(course.expiresAt!),
            ),
        ],
      ),
    );
  }

  Widget _buildExpirationBadge(DateTime expiresAt) {
    final now = DateTime.now();
    final difference = expiresAt.difference(now).inDays;
    final isUrgent = difference < 7;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: (isUrgent ? const Color(0xFFE63946) : AppColors.mutedForeground)
            .withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(AppRadius.sm),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.timer_outlined, color: Colors.white, size: 12),
          const SizedBox(width: 4),
          Text(
            isUrgent
                ? 'CÒN $difference NGÀY'
                : 'HẾT HẠN: ${DateFormat('dd/MM/yyyy').format(expiresAt)}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: AppTypography.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceholder(bool isDark) {
    return Container(
      color: theme.brightness == Brightness.dark ? AppColors.secondary : AppColors.secondary,
      child: Center(
        child: Icon(
          Icons.landscape_rounded,
          size: 48,
          color: theme.brightness == Brightness.dark ? Colors.white24 : Colors.black12,
        ),
      ),
    );
  }

    return Row(
      children: [
        // Level Tag
        _buildTag(
          text: course.levelLabel,
          backgroundColor: AppColors.primary.withValues(alpha: 0.1),
          textColor: AppColors.primary,
        ),
        const SizedBox(width: AppSpacing.sm),

        // Type Tag (Differentiates Live vs Record)
        _buildTag(
          text: course.typeLabel.toUpperCase(),
          backgroundColor: course.type == CourseType.liveClass
              ? AppColors.detail.withValues(alpha: 0.1)
              : AppColors.secondary,
          textColor: course.type == CourseType.liveClass
              ? AppColors.detail
              : AppColors.mutedForeground,
        ),
      ],
    );
  }

  Widget _buildTag({
    required String text,
    required Color backgroundColor,
    required Color textColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(AppRadius.full),
      ),
      child: Text(
        text.toUpperCase(),
        style: TextStyle(
          color: textColor,
          fontSize: 8,
          fontWeight: AppTypography.black,
          letterSpacing: 2.0,
        ),
      ),
    );
  }
}
