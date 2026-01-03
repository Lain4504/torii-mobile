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
      color: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            // Phần illustration ở trên (chiếm phần lớn màn hình)
            Expanded(
              flex: 5,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.background,
                ),
                child: Image.asset(
                  data.imagePath,
                  fit: BoxFit.contain,
                  width: double.infinity,
                  // Error handler - hiển thị placeholder nếu ảnh không load được
                  errorBuilder: (context, error, stackTrace) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.image_not_supported_outlined,
                            size: 80,
                            color: AppColors.grey400,
                          ),
                          const SizedBox(height: AppSpacing.md),
                          Text(
                            'Không thể tải hình ảnh',
                            style: TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: AppTypography.fontSizeSm,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            // Phần nội dung ở dưới
            Expanded(
              flex: 3,
              child: Container(
                color: AppColors.background,
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.xl,
                  vertical: AppSpacing.xl,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Tiêu đề với màu xanh lá
                    Text(
                      data.title,
                      style: TextStyle(
                        fontSize: AppTypography.fontSize3xl,
                        fontWeight: AppTypography.bold,
                        color: AppColors.accent,
                        height: 1.3,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    // Mô tả với màu xám đậm
                    Text(
                      data.description,
                      style: TextStyle(
                        fontSize: AppTypography.fontSizeMd,
                        color: AppColors.grey700,
                        height: 1.6,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: AppSpacing.xl + AppSpacing.sm),
                    // Nút hành động màu xanh lá
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: onButtonPressed,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.accent,
                          foregroundColor: AppColors.textOnPrimary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppRadius.md),
                          ),
                          elevation: AppElevation.none,
                        ),
                        child: Text(
                          data.buttonText.toUpperCase(),
                          style: TextStyle(
                            fontSize: AppTypography.fontSizeMd,
                            fontWeight: AppTypography.semiBold,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                    ),
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
