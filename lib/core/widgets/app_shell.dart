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

    final activeIndex = navigationShell.currentIndex;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      extendBody: true,
      body: navigationShell,
      bottomNavigationBar: _BottomNavBar(
        activeIndex: activeIndex,
        onTap: (path) => context.go(path),
        isDark: isDark,
        isAuthenticated: isAuthenticated,
      ),
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  final int activeIndex;
  final Function(String) onTap;
  final bool isDark;
  final bool isAuthenticated;

  const _BottomNavBar({
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
            color: isDark ? Colors.white.withOpacity(0.05) : Colors.black.withOpacity(0.05),
            width: 1,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: isAuthenticated
                ? [
                    _NavBarItem(
                      icon: Icons.home_outlined,
                      activeIcon: Icons.home_rounded,
                      label: 'Trang chủ',
                      isSelected: activeIndex == 2,
                      onTap: () => onTap('/'),
                      isDark: isDark,
                    ),
                    _NavBarItem(
                      icon: Icons.auto_stories_outlined,
                      activeIcon: Icons.auto_stories_rounded,
                      label: 'Học tập',
                      isSelected: activeIndex == 0,
                      onTap: () => onTap('/my-learning'),
                      isDark: isDark,
                    ),
                    _NavBarItem(
                      icon: Icons.video_call_outlined,
                      activeIcon: Icons.video_call_rounded,
                      label: 'Trực tiếp',
                      isSelected: activeIndex == 1,
                      onTap: () => onTap('/live-schedule'),
                      isDark: isDark,
                    ),
                    _NavBarItem(
                      icon: Icons.style_outlined,
                      activeIcon: Icons.style_rounded,
                      label: 'Thẻ',
                      isSelected: activeIndex == 3,
                      onTap: () => onTap('/flashcards'),
                      isDark: isDark,
                    ),
                    _NavBarItem(
                      icon: Icons.video_chat_outlined,
                      activeIcon: Icons.video_chat_rounded,
                      label: 'Meet',
                      isSelected: activeIndex == 5,
                      onTap: () => onTap('/meet'),
                      isDark: isDark,
                    ),
                    _NavBarItem(
                      icon: Icons.person_outline_rounded,
                      activeIcon: Icons.person_rounded,
                      label: 'Cá nhân',
                      isSelected: activeIndex == 4,
                      onTap: () => onTap('/settings'),
                      isDark: isDark,
                    ),
                  ]
                : [
                    _NavBarItem(
                      icon: Icons.home_outlined,
                      activeIcon: Icons.home_rounded,
                      label: 'Trang chủ',
                      isSelected: activeIndex == 2,
                      onTap: () => onTap('/'),
                      isDark: isDark,
                    ),
                    _NavBarItem(
                      icon: Icons.school_outlined,
                      activeIcon: Icons.school_rounded,
                      label: 'Khóa học',
                      isSelected: activeIndex == 0,
                      onTap: () => onTap('/courses'),
                      isDark: isDark,
                    ),
                    _NavBarItem(
                      icon: Icons.forum_outlined,
                      activeIcon: Icons.forum_rounded,
                      label: 'Cộng đồng',
                      isSelected: activeIndex == 1,
                      onTap: () => onTap('/community'),
                      isDark: isDark,
                    ),
                    _NavBarItem(
                      icon: Icons.quiz_outlined,
                      activeIcon: Icons.quiz_rounded,
                      label: 'Bài thi',
                      isSelected: activeIndex == 3,
                      onTap: () => onTap('/exams'),
                      isDark: isDark,
                    ),
                    _NavBarItem(
                      icon: Icons.video_chat_outlined,
                      activeIcon: Icons.video_chat_rounded,
                      label: 'Meet',
                      isSelected: activeIndex == 5,
                      onTap: () => onTap('/meet'),
                      isDark: isDark,
                    ),
                    _NavBarItem(
                      icon: Icons.person_outline_rounded,
                      activeIcon: Icons.person_rounded,
                      label: 'Tài khoản',
                      isSelected: activeIndex == 4,
                      onTap: () => onTap('/flashcards-preview'),
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
