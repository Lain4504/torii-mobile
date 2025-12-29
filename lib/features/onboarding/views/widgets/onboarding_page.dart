import 'package:flutter/material.dart';

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
                    color: Colors.white,
                  ),
                  child: Image.asset(
                    data.imagePath,
                    fit: BoxFit.contain,
                    width: double.infinity,
                  ),
                ),
              ),
              // Phần nội dung ở dưới
              Expanded(
                flex: 3,
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Tiêu đề với màu xanh lá
                      Text(
                        data.title,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4CAF50), // Màu xanh lá
                          height: 1.3,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      // Mô tả với màu xám đậm
                      Text(
                        data.description,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade700,
                          height: 1.6,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 40),
                      // Nút hành động màu xanh lá
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: onButtonPressed,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4CAF50), // Màu xanh lá
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 0,
                          ),
                          child: Text(
                            data.buttonText.toUpperCase(),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
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


