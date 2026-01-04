# Torii Mobile - UI/UX Rebuild Quick Start Guide

## What Changed

Your Torii Mobile app has been completely redesigned with a premium, modern UI optimized for Japanese language learners. The new design features:

- ✨ **Premium Visual Design**: Vibrant gradients, glass morphism effects, smooth animations
- 🎨 **Enhanced Color System**: Education-focused palette with Japanese aesthetic influences
- 📱 **Modern Components**: Reusable, accessible UI components throughout
- 🌓 **Beautiful Dark Mode**: Premium dark theme with proper contrast
- 🎯 **Gamification**: Learning stats, progress tracking, daily goals
- 📚 **Improved Navigation**: Enhanced bottom navigation with better visual feedback

## Running the App

### Prerequisites
- Flutter SDK 3.10.4 or higher
- Dart SDK 3.10.4 or higher
- Android Studio / Xcode (for emulators)
- VS Code with Flutter extension (recommended)

### Installation

1. **Install Dependencies**
```bash
flutter pub get
```

2. **Check for Issues**
```bash
flutter analyze
```

3. **Run the App**
```bash
# For Android emulator/device
flutter run

# For iOS simulator (macOS only)
flutter run -d ios

# For web
flutter run -d chrome
```

## Key Files to Explore

### Design System
- `lib/core/constants/app_design_system.dart` - All design tokens (colors, spacing, typography)
- `lib/core/theme/app_theme.dart` - Light and dark theme configurations
- `lib/core/widgets/ui_components.dart` - Reusable UI components

### Main Pages
- `lib/features/dashboard/views/pages/home_page.dart` - Redesigned home screen
- `lib/features/course/views/widgets/course_card.dart` - Enhanced course card
- `lib/core/widgets/app_shell.dart` - Bottom navigation wrapper

## Using the Design System

### Colors

```dart
// Primary colors
AppColors.primary          // Vermilion red
AppColors.secondary        // Ocean blue
AppColors.accent           // Warm gold

// Semantic colors
AppColors.success          // Green
AppColors.error            // Red
AppColors.warning          // Orange
AppColors.info             // Blue

// Gradients
AppColors.primaryGradient  // Red to orange
AppColors.secondaryGradient // Blue to navy
AppColors.accentGradient   // Gold to orange
```

### Typography

```dart
// In your widgets
Text(
  'Heading',
  style: theme.textTheme.headlineMedium,
)

Text(
  'Body text',
  style: theme.textTheme.bodyLarge,
)

// Direct styling
TextStyle(
  fontSize: AppTypography.fontSizeLg,
  fontWeight: AppTypography.bold,
  letterSpacing: AppTypography.letterSpacingTight,
)
```

### Spacing

```dart
// Padding and margins
Padding(
  padding: EdgeInsets.all(AppSpacing.md), // 16px
  child: child,
)

SizedBox(height: AppSpacing.lg) // 24px
SizedBox(width: AppSpacing.xl)  // 32px
```

### Reusable Components

```dart
// Glass card
GlassCard(
  child: Text('Content'),
  padding: EdgeInsets.all(AppSpacing.md),
  onTap: () => {},
)

// Gradient card
GradientCard(
  gradient: AppColors.primaryGradient,
  child: Text('CTA Content'),
)

// Badge
AppBadge(
  label: 'N5',
  color: AppColors.primary,
  textColor: AppColors.white,
)

// Stat card
StatCard(
  label: 'Day Streak',
  value: '7',
  icon: Icons.local_fire_department,
  iconColor: AppColors.warning,
)

// Progress bar
ProgressBar(
  progress: 0.7, // 0.0 to 1.0
  progressColor: AppColors.primary,
)
```

## Testing Dark Mode

The app automatically supports dark mode:

```dart
// Toggle theme programmatically
ref.read(themeModeProvider.notifier).toggleTheme();

// Check current brightness
final isDark = Theme.of(context).brightness == Brightness.dark;
```

## Customization

### Adding New Colors

Edit `lib/core/constants/app_design_system.dart`:

```dart
class AppColors {
  // Add your new color
  static const Color custom = Color(0xFF123456);
}
```

### Creating New Components

Add to `lib/core/widgets/ui_components.dart`:

```dart
class MyCustomCard extends StatelessWidget {
  final Widget child;
  
  const MyCustomCard({super.key, required this.child});
  
  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: child,
      // Your custom styling
    );
  }
}
```

### Modifying Typography

Edit `lib/core/constants/app_design_system.dart`:

```dart
class AppTypography {
  // Adjust font sizes
  static const double fontSizeMd = 16.0; // Change as needed
}
```

## Build & Deploy

### Android APK
```bash
flutter build apk --release
```

### iOS IPA (macOS only)
```bash
flutter build ios --release
```

### Web
```bash
flutter build web --release
```

## Troubleshooting

### Common Issues

**Issue**: Colors not updating
- **Solution**: Hot restart the app (not hot reload) - press `Shift + R` in terminal

**Issue**: Widgets overflow in small screens
- **Solution**: Wrap content in `SingleChildScrollView` or use `Flexible/Expanded`

**Issue**: Dark mode colors look wrong
- **Solution**: Use `Theme.of(context).brightness` checks and theme colors instead of hardcoded colors

**Issue**: Fonts not displaying correctly
- **Solution**: Ensure fonts are defined in `pubspec.yaml` and loaded

## Performance Tips

1. **Use const constructors** wherever possible
2. **Avoid rebuilding entire screens** - use `ConsumerWidget` for granular updates
3. **Optimize images** - use `cached_network_image` for remote images
4. **Lazy load lists** - use `ListView.builder` instead of `ListView`

## Next Steps

1. **Test on Real Devices**: Run on physical Android/iOS devices
2. **Add Localization**: Implement Japanese language support
3. **Add Animations**: Implement Hero transitions between pages
4. **Enhance Accessibility**: Add screen reader support
5. **Add Haptics**: Implement tactile feedback

## Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Material 3 Guidelines](https://m3.material.io/)
- [Riverpod Documentation](https://riverpod.dev/)
- [Go Router Documentation](https://pub.dev/packages/go_router)

## Support

For issues or questions:
1. Check `UI_UX_REBUILD_SUMMARY.md` for detailed documentation
2. Review the design system files in `lib/core/`
3. Look at existing component implementations in `lib/core/widgets/`

---

**Happy Coding! 頑張って！(Ganbatte!)** 🚀
