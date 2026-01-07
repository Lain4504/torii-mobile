import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../core/widgets/widgets.dart';
import '../../models/course_model.dart';

/// Course Card - Minimalist course display
/// 
/// A clean, focused course card emphasizing readability and hierarchy.
class CourseCard extends StatelessWidget {
  final Course course;

  const CourseCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return MinimalCard(
      onTap: () => context.push('/courses/${course.id}'),
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Thumbnail
          _buildThumbnail(isDark),
          
          // Content
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Metadata Row
                _buildMetadata(theme),
                const SizedBox(height: AppSpacing.sm),
                
                // Title
                Text(
                  course.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: AppTypography.semiBold,
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                
                // Instructor
                Row(
                  children: [
                    CircleAvatar(
                      radius: 12,
                      backgroundImage: course.instructorAvatarUrl.isNotEmpty
                          ? NetworkImage(course.instructorAvatarUrl)
                          : null,
                      backgroundColor: AppColors.grey200,
                      child: course.instructorAvatarUrl.isEmpty
                          ? const Icon(Icons.person, size: 16)
                          : null,
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Expanded(
                      child: Text(
                        course.instructorName,
                        style: theme.textTheme.bodySmall,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: AppSpacing.md),
                
                // Bottom Row: Rating & Price
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Rating
                    Row(
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          size: 16,
                          color: AppColors.accent,
                        ),
                        const SizedBox(width: AppSpacing.xxs),
                        Text(
                          '${course.rating}',
                          style: theme.textTheme.bodySmall?.copyWith(
                            fontWeight: AppTypography.semiBold,
                          ),
                        ),
                        const SizedBox(width: AppSpacing.xs),
                        Text(
                          '(${course.reviewCount})',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: AppColors.textTertiary,
                          ),
                        ),
                      ],
                    ),
                    
                    // Price
                    Text(
                      course.priceLabel,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: AppColors.primary,
                        fontWeight: AppTypography.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildThumbnail(bool isDark) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(AppRadius.card - 1),
            ),
            child: course.thumbnailUrl != null && course.thumbnailUrl!.isNotEmpty
                ? Image.network(
                    course.thumbnailUrl!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: isDark ? AppColors.surfaceVariantDark : AppColors.grey100,
                        child: Center(
                          child: Icon(
                            Icons.school_outlined,
                            size: AppIconSize.xxl,
                            color: isDark ? AppColors.grey600 : AppColors.grey400,
                          ),
                        ),
                      );
                    },
                  )
                : Container(
                    color: isDark ? AppColors.surfaceVariantDark : AppColors.grey100,
                    child: Center(
                      child: Icon(
                        Icons.school_outlined,
                        size: AppIconSize.xxl,
                        color: isDark ? AppColors.grey600 : AppColors.grey400,
                      ),
                    ),
                  ),
          ),
          
          // Enrolled Badge
          if (course.isEnrolled)
            Positioned(
              top: AppSpacing.sm,
              right: AppSpacing.sm,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.sm,
                  vertical: AppSpacing.xs,
                ),
                decoration: BoxDecoration(
                  color: AppColors.success,
                  borderRadius: BorderRadius.circular(AppRadius.xs),
                ),
                child: const Text(
                  'Enrolled',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildMetadata(ThemeData theme) {
    return Row(
      children: [
        // Level Badge
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.sm,
            vertical: AppSpacing.xxs,
          ),
          decoration: BoxDecoration(
            color: AppColors.primarySurface,
            borderRadius: BorderRadius.circular(AppRadius.xs),
          ),
          child: Text(
            course.levelLabel,
            style: const TextStyle(
              color: AppColors.primary,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        
        // Type Badge
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.sm,
            vertical: AppSpacing.xxs,
          ),
          decoration: BoxDecoration(
            color: course.type == CourseType.liveClass 
                ? AppColors.accentSurface
                : AppColors.surfaceVariant,
            borderRadius: BorderRadius.circular(AppRadius.xs),
          ),
          child: Text(
            course.typeLabel,
            style: TextStyle(
              color: course.type == CourseType.liveClass 
                  ? AppColors.accentDark
                  : AppColors.textSecondary,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
