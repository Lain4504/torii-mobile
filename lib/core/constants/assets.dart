/// Asset paths constants for the application
/// 
/// This class contains all asset paths used throughout the app.
/// Using constants prevents typos and makes asset management easier.
class Assets {
  Assets._(); // Private constructor to prevent instantiation

  // Base paths
  static const String _imagesPath = 'assets/images';

  // Onboarding images
  static const String onboarding1 = '$_imagesPath/onboarding_01.webp';
  static const String onboarding2 = '$_imagesPath/onboarding_02.webp';
  static const String onboarding3 = '$_imagesPath/onboarding_03.webp';
}
