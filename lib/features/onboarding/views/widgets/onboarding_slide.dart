import 'package:flutter/material.dart';
import '../../../../core/constants/app_design_system.dart';

/// Data model for onboarding slides
class OnboardingPageData {
  final String imagePath;
  final String title;
  final String description;
  final String buttonText;

  OnboardingPageData({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.buttonText,
  });
}

/// Individual onboarding slide widget
class OnboardingSlide extends StatelessWidget {
  final OnboardingPageData data;
  final VoidCallback onButtonPressed;

  const OnboardingSlide({
    super.key,
    required this.data,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: SafeArea(
        child: Column(
          children: [
            // Image Section
            Expanded(
              flex: 4,
              child: Container(
                width: double.infinity,
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.1),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Image.asset(
                    data.imagePath,
                    fit: BoxFit.contain,
                    // Error handler
                    errorBuilder: (context, error, stackTrace) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.image_not_supported_outlined,
                              size: 64,
                              color: AppColors.grey300,
                            ),
                            const SizedBox(height: AppSpacing.sm),
                            Text(
                              'Image not found',
                              style: TextStyle(
                                color: AppColors.textTertiary,
                                fontSize: AppTypography.fontSizeXs,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            
            // Content Section
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.xl,
                  vertical: AppSpacing.lg,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Title
                    Text(
                      data.title,
                      style: const TextStyle(
                        fontSize: AppTypography.fontSize2xl,
                        fontWeight: AppTypography.bold,
                        color: AppColors.primary, // Torii Red
                        height: 1.3,
                        letterSpacing: -0.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: AppSpacing.md),
                    
                    // Description
                    Text(
                      data.description,
                      style: const TextStyle(
                        fontSize: AppTypography.fontSizeMd,
                        color: AppColors.textSecondary,
                        height: 1.6,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Spacer(),
                    
                    // Action Button
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: onButtonPressed,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: AppColors.textOnPrimary,
                          elevation: 4,
                          shadowColor: AppColors.primary.withOpacity(0.4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppRadius.lg),
                          ),
                        ),
                        child: Text(
                          data.buttonText, // Removed .toUpperCase() for a cleaner look
                          style: const TextStyle(
                            fontSize: AppTypography.fontSizeMd,
                            fontWeight: AppTypography.semiBold,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xl),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
