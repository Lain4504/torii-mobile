import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../core/widgets/widgets.dart';
import '../../models/course_model.dart';

/// Enrolled Course Card - Special variant for My Learning page
/// Shows progress ring and "Continue Learning" CTA
class EnrolledCourseCard extends StatelessWidget {
  final Course course;

  const EnrolledCourseCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    
    // Mock progress - in production this should come from API
    final progress = 0.65;

    return ClipRRect(
      borderRadius: BorderRadius.circular(AppRadius.xxl),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              AppColors.primarySurface.withValues(alpha: 0.3),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.08),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
          ],
          border: Border.all(
            color: AppColors.primary.withValues(alpha: 0.15),
            width: 1.5,
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => context.push('/courses/${course.id}/lessons'),
            borderRadius: BorderRadius.circular(AppRadius.xxl),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Thumbnail section (left side)
                  _buildThumbnailSection(isDark, progress),
                  
                  // Content section (right side)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(AppSpacing.md),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Top section: Title and Progress
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Title
                              Text(
                                course.title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.titleLarge?.copyWith(
                                  fontWeight: AppTypography.extraBold,
                                  fontSize: 15,
                                  height: 1.2,
                                  letterSpacing: -0.5,
                                ),
                              ),
                              const SizedBox(height: AppSpacing.md),
                              
                              // Progress info
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'YOUR PROGRESS',
                                          style: TextStyle(
                                            fontSize: 7,
                                            fontWeight: AppTypography.black,
                                            letterSpacing: 1.5,
                                            color: AppColors.textTertiary,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.timer_outlined,
                                              size: 12,
                                              color: AppColors.textSecondary,
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              'Lesson 8 of 12',
                                              style: TextStyle(
                                                fontSize: 11,
                                                color: AppColors.textSecondary,
                                                fontWeight: AppTypography.medium,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  
                                  // Progress ring (smaller for list view)
                                  CourseProgressRing(
                                    progress: progress,
                                    size: 44,
                                    strokeWidth: 3,
                                    showPercentage: true,
                                    animate: true,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          
                          // Bottom section: Continue Learning CTA
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSpacing.md,
                              vertical: AppSpacing.sm,
                            ),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.primary.withValues(alpha: 0.08),
                                  AppColors.primaryLight.withValues(alpha: 0.05),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(AppRadius.md),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.play_circle_rounded,
                                  size: 18,
                                  color: AppColors.primary,
                                ),
                                const SizedBox(width: AppSpacing.xs),
                                Text(
                                  'CONTINUE',
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: AppTypography.black,
                                    letterSpacing: 1.0,
                                    color: AppColors.primary,
                                  ),
                                ),
                                const SizedBox(width: AppSpacing.xs),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 10,
                                  color: AppColors.primary.withValues(alpha: 0.6),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildThumbnailSection(bool isDark, double progress) {
    return SizedBox(
      width: 110,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Thumbnail
          Positioned.fill(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(AppRadius.xxl),
                bottomLeft: Radius.circular(AppRadius.xxl),
              ),
              child: course.thumbnailUrl != null && course.thumbnailUrl!.isNotEmpty
                  ? Image.network(
                      course.thumbnailUrl!,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          _buildPlaceholder(isDark),
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return _buildPlaceholder(isDark);
                      },
                    )
                  : _buildPlaceholder(isDark),
            ),
          ),
          
          // Gradient overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(AppRadius.xxl),
                  bottomLeft: Radius.circular(AppRadius.xxl),
                ),
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withValues(alpha: 0.3),
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ),
          
          // Progress bar at bottom of thumbnail
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 3,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
              ),
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: progress,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.primary,
                        AppColors.primaryLight,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          
          // Enrolled badge
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.success,
                borderRadius: BorderRadius.circular(AppRadius.full),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.success.withValues(alpha: 0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.check_circle_rounded, color: Colors.white, size: 10),
                  const SizedBox(width: 3),
                  Text(
                    'ENROLLED',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 7,
                      letterSpacing: 1.2,
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
      width: 110,
      constraints: const BoxConstraints.expand(),
      color: isDark ? AppColors.surfaceVariantDark : AppColors.grey100,
      child: Center(
        child: Icon(
          Icons.landscape_rounded,
          size: 40,
          color: isDark ? AppColors.grey600 : AppColors.grey300,
        ),
      ),
    );
  }
}
