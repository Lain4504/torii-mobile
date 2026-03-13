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
      backgroundColor: AppColors.grey50,
      body: AppBackground(
        pattern: BackgroundPattern.checkerboard,
        child: SafeArea(
          child: Column(
            children: [
              const Spacer(),
              
              Expanded(
                flex: 4,
                child: Center(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        EntryAnimation(
                          index: 0,
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: AppColors.accent.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(AppRadius.sm),
                              border: Border.all(
                                color: AppColors.accent.withValues(alpha: 0.2),
                                width: 2,
                              ),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.check_circle_rounded,
                                size: 56,
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
                              fontSize: 32,
                              fontWeight: AppTypography.black,
                              color: AppColors.secondary,
                              letterSpacing: -0.5,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.lg),
                        EntryAnimation(
                          index: 2,
                          child: Text(
                            message,
                            style: const TextStyle(
                              color: AppColors.textTertiary,
                              fontSize: 16,
                              height: 1.6,
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
                            padding: const EdgeInsets.symmetric(vertical: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
