import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constants/app_design_system.dart';

/// App Shell - Main Layout Wrapper
/// 
/// Contains the curved bottom navigation with centered FAB (Home).
class AppShell extends StatelessWidget {
  final Widget child;
  final GoRouterState state;

  const AppShell({super.key, required this.child, required this.state});

  @override
  Widget build(BuildContext context) {
    final activeIndex = _calculateIndex(state.matchedLocation);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      extendBody: true, // Important for the notch transparency/blur to work if needed
      body: child,
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/'),
        shape: const CircleBorder(),
        backgroundColor: activeIndex == 2 // Home index
            ? AppColors.primary 
            : (isDark ? AppColors.surfaceVariantDark : AppColors.surface),
        elevation: 4,
        child: Icon(
          Icons.home_rounded,
          color: activeIndex == 2 
             ? Colors.white 
             : (isDark ? Colors.white : AppColors.textSecondary),
          size: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _BottomNavBar(
        activeIndex: activeIndex,
        onTap: (path) => context.go(path),
        isDark: isDark,
      ),
    );
  }

  // 0: Courses, 1: Exams, 2: Home, 3: Flashcards, 4: Live
  int _calculateIndex(String location) {
    if (location.startsWith('/courses')) return 0;
    if (location.startsWith('/exams')) return 1;
    if (location.startsWith('/flashcards')) return 3;
    if (location.startsWith('/live-schedule')) return 4;
    return 2; // Default to Home
  }
}

class _BottomNavBar extends StatelessWidget {
  final int activeIndex;
  final Function(String) onTap;
  final bool isDark;

  const _BottomNavBar({
    required this.activeIndex,
    required this.onTap,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 10.0,
      color: isDark ? AppColors.surfaceDark : AppColors.surface,
      surfaceTintColor: Colors.transparent,
      elevation: 20,
      shadowColor: Colors.black.withValues(alpha: 0.1),
      padding: EdgeInsets.zero,
      height: 70, // Fixed height for consistency
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Left Group
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _NavBarItem(
                  icon: Icons.school_outlined,
                  activeIcon: Icons.school_rounded,
                  label: 'Courses',
                  isSelected: activeIndex == 0,
                  onTap: () => onTap('/courses'),
                  isDark: isDark,
                ),
                _NavBarItem(
                  icon: Icons.quiz_outlined,
                  activeIcon: Icons.quiz_rounded,
                  label: 'Exams',
                  isSelected: activeIndex == 1,
                  onTap: () => onTap('/exams'),
                  isDark: isDark,
                ),
              ],
            ),
          ),
          
          // Spacer for FAB
          const SizedBox(width: 60),

          // Right Group
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _NavBarItem(
                  icon: Icons.style_outlined,
                  activeIcon: Icons.style_rounded,
                  label: 'Cards',
                  isSelected: activeIndex == 3,
                  onTap: () => onTap('/flashcards'),
                  isDark: isDark,
                ),
                _NavBarItem(
                  icon: Icons.video_call_outlined,
                  activeIcon: Icons.video_call_rounded,
                  label: 'Live',
                  isSelected: activeIndex == 4,
                  onTap: () => onTap('/live-schedule'),
                  isDark: isDark,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isDark;

  const _NavBarItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.isSelected,
    required this.onTap,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final color = isSelected
        ? AppColors.primary
        : (isDark ? AppColors.textTertiary : AppColors.textSecondary);

    return InkWell(
      onTap: onTap,
      customBorder: const CircleBorder(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isSelected ? activeIcon : icon,
              color: color,
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 10,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
