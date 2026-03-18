import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../constants/app_design_system.dart';
import '../../features/auth/providers/auth_providers.dart';
import '../../features/auth/models/auth_state.dart';

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
    
    // Hide bottom bar only when user is inside an active meeting room (not on shell routes)
    final currentPath = state.uri.path;
    final isOnMeetRoute = currentPath.startsWith('/meet') || currentPath.startsWith('/meeting');
    // Lesson: full-screen learning experience, hide bottom nav
    final isOnLessonRoute = currentPath.startsWith('/lesson');

    // Sensei: keep bottom bar only on dashboard (/sensei). Hide on sub-pages.
    final isSenseiRoute = currentPath.startsWith('/sensei');
    final isSenseiDashboard = currentPath == '/sensei';
    final hideBottomNavForSensei = isSenseiRoute && !isSenseiDashboard;

    final activeIndex = navigationShell.currentIndex;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    // Hide bottom bar for Meet routes, Sensei sub-pages and full-screen lesson
    final shouldHideBottomNav = isOnMeetRoute || hideBottomNavForSensei || isOnLessonRoute;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      extendBody: true,
      body: navigationShell,
      bottomNavigationBar: shouldHideBottomNav
        ? null 
        : _BottomNavBar(
            navigationShell: navigationShell,
            activeIndex: activeIndex,
            onTap: (path) => context.go(path),
            isDark: isDark,
            isAuthenticated: isAuthenticated,
          ),
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  final int activeIndex;
  final Function(String) onTap;
  final bool isDark;
  final bool isAuthenticated;

  const _BottomNavBar({
    required this.navigationShell,
    required this.activeIndex,
    required this.onTap,
    required this.isDark,
    required this.isAuthenticated,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : AppColors.surface,
        border: Border(
          top: BorderSide(
            color: isDark ? AppColors.textPrimaryDark.withOpacity(0.05) : AppColors.textPrimary.withOpacity(0.05),
            width: 1,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.textPrimary.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: SizedBox(
          height: 64,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: isAuthenticated
                ? [
                    _NavBarItem(
                      icon: Icons.home_outlined,
                      activeIcon: Icons.home_rounded,
                      label: 'Home',
                      isSelected: activeIndex == 0,
                      onTap: () => onTap('/'),
                      isDark: isDark,
                    ),
                    _NavBarItem(
                      icon: Icons.explore_outlined,
                      activeIcon: Icons.explore_rounded,
                      label: 'Discovery',
                      isSelected: activeIndex == 1,
                      onTap: () => onTap('/discovery'),
                      isDark: isDark,
                    ),
                    _NavBarItem(
                      icon: Icons.auto_awesome_outlined,
                      activeIcon: Icons.auto_awesome_rounded,
                      label: 'AI Sensei',
                      isSelected: activeIndex == 2,
                      onTap: () => onTap('/sensei'),
                      isDark: isDark,
                    ),
                    _NavBarItem(
                      icon: Icons.menu_book_outlined,
                      activeIcon: Icons.menu_book_rounded,
                      label: 'My courses',
                      isSelected: activeIndex == 3,
                      onTap: () => onTap('/my-courses'),
                      isDark: isDark,
                    ),
                    _NavBarItem(
                      icon: Icons.schedule_outlined,
                      activeIcon: Icons.schedule_rounded,
                      label: 'Live',
                      isSelected: activeIndex == 4,
                      onTap: () => onTap('/live-schedule'),
                      isDark: isDark,
                    ),
                    _NavBarItem(
                      icon: Icons.school_outlined,
                      activeIcon: Icons.school_rounded,
                      label: 'Luyện tập',
                      isSelected: activeIndex == 5,
                      onTap: () => onTap('/practice'),
                      isDark: isDark,
                    ),
                  ]
                : [
                    _NavBarItem(
                      icon: Icons.home_outlined,
                      activeIcon: Icons.home_rounded,
                      label: 'Home',
                      isSelected: activeIndex == 0,
                      onTap: () => onTap('/'),
                      isDark: isDark,
                    ),
                    _NavBarItem(
                      icon: Icons.explore_outlined,
                      activeIcon: Icons.explore_rounded,
                      label: 'Discovery',
                      isSelected: activeIndex == 1,
                      onTap: () => onTap('/discovery'),
                      isDark: isDark,
                    ),
                    _NavBarItem(
                      icon: Icons.auto_awesome_outlined,
                      activeIcon: Icons.auto_awesome_rounded,
                      label: 'AI Sensei',
                      isSelected: activeIndex == 2,
                      onTap: () => onTap('/sensei'),
                      isDark: isDark,
                    ),
                    _NavBarItem(
                      icon: Icons.article_outlined,
                      activeIcon: Icons.article_rounded,
                      label: 'Blog',
                      isSelected: activeIndex == 3,
                      onTap: () => onTap('/blog'),
                      isDark: isDark,
                    ),
                  ],
          ),
        ),
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
