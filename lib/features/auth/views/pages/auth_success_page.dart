import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/widgets/widgets.dart';

class AuthSuccessPage extends StatelessWidget {
  final String title;
  final String message;
  final String buttonText;
  final String nextRoute;

  const AuthSuccessPage({
    super.key,
    this.title = 'All Set!',
    this.message = 'Your action was successful. You can now continue your journey with Torii Nihongo.',
    this.buttonText = 'CONTINUE',
    this.nextRoute = '/login',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        pattern: BackgroundPattern.checkerboard,
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  EntryAnimation(
                    index: 0,
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: AppColors.accent.withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.accent.withValues(alpha: 0.2),
                          width: 4,
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.check_rounded,
                          size: 64,
                          color: AppColors.accent,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xxl),
                  EntryAnimation(
                    index: 1,
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: AppTypography.bold,
                        color: AppColors.secondary,
                        letterSpacing: -0.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  EntryAnimation(
                    index: 2,
                    child: Text(
                      message,
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 16,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xxxl),
                  EntryAnimation(
                    index: 3,
                    verticalOffset: 20,
                    child: AppButton(
                      text: buttonText,
                      onPressed: () => context.go(nextRoute),
                      backgroundColor: AppColors.secondary,
                      borderRadius: AppRadius.md,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xxl),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
