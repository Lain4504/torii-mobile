import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../constants/app_design_system.dart';
import '../../features/auth/providers/auth_providers.dart';
import '../../features/auth/models/auth_state.dart';
import '../localization/l10n/app_localizations.dart';

/// App Shell - Main Layout Wrapper
/// 
/// Contains the curved bottom navigation with centered FAB (Home).
/// Adapts navigation items based on authentication state.
class AppShell extends ConsumerWidget {
  final StatefulNavigationShell navigationShell;
  final GoRouterState state;

  const AppShell({super.key, required this.navigationShell, required this.state});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncAuth = ref.watch(authStateProvider);
    final isAuthenticated = asyncAuth.asData?.value.status == AuthStatus.authenticated;

    final activeIndex = navigationShell.currentIndex;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      extendBody: true, // Important for the notch transparency/blur to work if needed
      body: navigationShell,
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
        onTap: (path) => _onItemTapped(context, path),
        isDark: isDark,
        context: context,
        isAuthenticated: isAuthenticated,
      ),
    );
  }

  void _onItemTapped(BuildContext context, String path) {
    // We continue to use context.go(path) to support the dynamic auth logic.
    // GoRouter will automatically map the path to the correct branch.
    context.go(path);
  }
}

class _BottomNavBar extends StatelessWidget {
  final int activeIndex;
  final Function(String) onTap;
  final bool isDark;
  final BuildContext context;
  final bool isAuthenticated;

  const _BottomNavBar({
    required this.activeIndex,
    required this.onTap,
    required this.isDark,
    required this.context,
    required this.isAuthenticated,
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
              children: isAuthenticated 
                ? [
                    _NavBarItem(
                      icon: Icons.auto_stories_outlined,
                      activeIcon: Icons.auto_stories_rounded,
                      label: 'Learning',
                      isSelected: activeIndex == 0,
                      onTap: () => onTap('/my-learning'),
                      isDark: isDark,
                    ),
                    _NavBarItem(
                      icon: Icons.video_call_outlined,
                      activeIcon: Icons.video_call_rounded,
                      label: 'Live',
                      isSelected: activeIndex == 1,
                      onTap: () => onTap('/live-schedule'),
                      isDark: isDark,
                    ),
                  ]
                : [
                    _NavBarItem(
                      icon: Icons.school_outlined,
                      activeIcon: Icons.school_rounded,
                      label: AppLocalizations.of(context)?.courses ?? 'Courses',
                      isSelected: activeIndex == 0,
                      onTap: () => onTap('/courses'),
                      isDark: isDark,
                    ),
                    _NavBarItem(
                      icon: Icons.forum_outlined,
                      activeIcon: Icons.forum_rounded,
                      label: 'Community',
                      isSelected: activeIndex == 1,
                      onTap: () => onTap('/community'),
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
              children: isAuthenticated
                ? [
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
                      label: 'Meet',
                      isSelected: activeIndex == 5,
                      onTap: () => onTap('/meet'),
                      isDark: isDark,
                    ),
                    _NavBarItem(
                      icon: Icons.person_outline_rounded,
                      activeIcon: Icons.person_rounded,
                      label: 'Profile',
                      isSelected: activeIndex == 4,
                      onTap: () => onTap('/settings'),
                      isDark: isDark,
                    ),
                  ]
                : [
                    _NavBarItem(
                      icon: Icons.quiz_outlined,
                      activeIcon: Icons.quiz_rounded,
                      label: 'Exams',
                      isSelected: activeIndex == 3,
                      onTap: () => onTap('/exams'),
                      isDark: isDark,
                    ),
                    _NavBarItem(
                      icon: Icons.auto_awesome_motion_rounded,
                      activeIcon: Icons.auto_awesome_motion_rounded,
                      label: 'Học thử',
                      icon: Icons.video_call_outlined,
                      activeIcon: Icons.video_call_rounded,
                      label: 'Meet',
                      isSelected: activeIndex == 5,
                      onTap: () => onTap('/meet'),
                      isDark: isDark,
                    ),
                    _NavBarItem(
                      icon: Icons.person_outline_rounded,
                      activeIcon: Icons.person_rounded,
                      label: AppLocalizations.of(context)?.live ?? 'Live',
                      isSelected: activeIndex == 4,
                      onTap: () => onTap('/flashcards-preview'),
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
