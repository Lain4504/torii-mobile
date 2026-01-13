import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../core/widgets/widgets.dart';
import '../../models/course_model.dart';

/// Course Card - Modern, premium course display
class CourseCard extends StatelessWidget {
  final Course course;

  const CourseCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppRadius.xxl),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.03),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
        border: Border.all(color: AppColors.borderLight.withOpacity(0.3), width: 1.0),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => context.push('/courses/${course.id}'),
          borderRadius: BorderRadius.circular(AppRadius.xxl),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Premium Thumbnail
              _buildThumbnail(isDark),
              
              // Refined Content
              Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Column(
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
                            border: Border.all(color: AppColors.primary.withOpacity(0.1)),
                          ),
                          child: CircleAvatar(
                            radius: 12,
                            backgroundColor: AppColors.primarySurface,
                            backgroundImage: course.instructorAvatarUrl.isNotEmpty
                                ? NetworkImage(course.instructorAvatarUrl)
                                : null,
                            child: course.instructorAvatarUrl.isEmpty
                                ? const Icon(Icons.person_rounded, size: 14, color: AppColors.primary)
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
                          style: theme.textTheme.titleLarge?.copyWith(
                            color: AppColors.primary,
                            fontWeight: AppTypography.black,
                            fontSize: 20,
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
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(AppRadius.xxl - 1),
            ),
            child: course.thumbnailUrl != null && course.thumbnailUrl!.isNotEmpty
                ? Image.network(
                    course.thumbnailUrl!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => _buildPlaceholder(isDark),
                  )
                : _buildPlaceholder(isDark),
          ),
          
          // Subtle Overlay for text readability (if needed)
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black.withOpacity(0.2), Colors.transparent],
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
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.success,
                  borderRadius: BorderRadius.circular(AppRadius.full),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.success.withOpacity(0.2),
                      blurRadius: 10, offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.check_circle_rounded, color: Colors.white, size: 14),
                    SizedBox(width: 6),
                    Text(
                      'ENROLLED',
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
        ],
      ),
    );
  }

  Widget _buildPlaceholder(bool isDark) {
    return Container(
      color: isDark ? AppColors.surfaceVariantDark : AppColors.grey100,
      child: Center(
        child: Icon(
          Icons.landscape_rounded,
          size: 48,
          color: isDark ? AppColors.grey600 : AppColors.grey300,
        ),
      ),
    );
  }

  Widget _buildMetadata(ThemeData theme) {
    return Row(
      children: [
        // Level Tag
        _buildTag(
          text: course.levelLabel,
          backgroundColor: AppColors.primarySurface,
          textColor: AppColors.primary,
        ),
        const SizedBox(width: AppSpacing.sm),
        
        // Type Tag (Differentiates Live vs Record)
        _buildTag(
          text: course.typeLabel.toUpperCase(),
          backgroundColor: course.type == CourseType.liveClass 
              ? AppColors.detailSurface 
              : AppColors.grey50,
          textColor: course.type == CourseType.liveClass 
              ? AppColors.detail 
              : AppColors.textSecondary,
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
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor.withOpacity(0.8),
        borderRadius: BorderRadius.circular(AppRadius.full),
        border: Border.all(color: backgroundColor.withOpacity(0.2)),
      ),
      child: Text(
        text.toUpperCase(),
        style: TextStyle(
          color: textColor,
          fontSize: 8,
          fontWeight: AppTypography.black,
          letterSpacing: 2.5,
        ),
      ),
    );
  }
}
