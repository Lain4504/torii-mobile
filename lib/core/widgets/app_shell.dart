import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../features/meet/providers/session_provider.dart';

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
    
    // Hide bottom bar during active meeting
    final isMeetStartup = ref.watch(sessionProvider.select((s) => s.isStartup));
    final isMeetingActive = !isMeetStartup;

    final activeIndex = navigationShell.currentIndex;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      // No extendBody as we want a solid bottom bar for block aesthetic
      body: navigationShell,
      bottomNavigationBar: isMeetingActive 
        ? null 
        : _BottomNavBar(
            activeIndex: activeIndex,
            onTap: (index) => navigationShell.goBranch(index),
            isDark: isDark,
            isAuthenticated: isAuthenticated,
          ),
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  final int activeIndex;
  final Function(int) onTap;
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
    final theme = Theme.of(context);
    final items = isAuthenticated ? _authenticatedItems : _guestItems;

    return Container(
      decoration: BoxDecoration(
        color: theme.navigationBarTheme.backgroundColor,
        border: Border(
          top: BorderSide(
            color: theme.colorScheme.outline,
            width: 1,
          ),
        ),
      ),
      child: SafeArea(
        child: Container(
          height: 64, // Refined height
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(items.length, (index) {
              final item = items[index];
              final isSelected = activeIndex == index;
              
              return Expanded(
                child: _NavBarItem(
                  icon: item.icon,
                  activeIcon: item.activeIcon,
                  label: item.label,
                  isSelected: isSelected,
                  onTap: () => onTap(index),
                  isDark: isDark,
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  static const _authenticatedItems = [
    _NavItem(Icons.home_outlined, Icons.home_rounded, 'Trang chủ'),
    _NavItem(Icons.auto_stories_outlined, Icons.auto_stories_rounded, 'Học tập'),
    _NavItem(Icons.video_call_outlined, Icons.video_call_rounded, 'Trực tiếp'),
    _NavItem(Icons.style_outlined, Icons.style_rounded, 'Thẻ thẻ'),
    _NavItem(Icons.person_outline_rounded, Icons.person_rounded, 'Cá nhân'),
  ];

  static const _guestItems = [
    _NavItem(Icons.home_outlined, Icons.home_rounded, 'Khám phá'),
    _NavItem(Icons.school_outlined, Icons.school_rounded, 'Khóa học'),
    _NavItem(Icons.forum_outlined, Icons.forum_rounded, 'Cộng đồng'),
    _NavItem(Icons.quiz_outlined, Icons.quiz_rounded, 'Bài thi'),
    _NavItem(Icons.person_outline_rounded, Icons.person_rounded, 'Tài khoản'),
  ];
}

class _NavItem {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  const _NavItem(this.icon, this.activeIcon, this.label);
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
    final theme = Theme.of(context);
    final navTheme = theme.navigationBarTheme;
    
    final color = isSelected
        ? theme.colorScheme.primary
        : theme.textTheme.bodyMedium?.color ?? Colors.grey;

    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            decoration: BoxDecoration(
              color: isSelected 
                  ? theme.colorScheme.primary.withValues(alpha: 0.1) 
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              isSelected ? activeIcon : icon,
              color: color,
              size: 24,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 10,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.medium,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
