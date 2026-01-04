import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/views/widgets/verification_banner.dart';
import '../constants/app_design_system.dart';

class AppShell extends StatelessWidget {
  final Widget child;
  final GoRouterState state;

  const AppShell({super.key, required this.child, required this.state});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const VerificationBanner(),
          Expanded(child: child),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    // Determine the current index based on the route
    int currentIndex = 0;
    final location = state.matchedLocation;
    
    if (location.startsWith('/courses')) {
      currentIndex = 1;
    } else if (location.startsWith('/exams')) {
      currentIndex = 2;
    } else if (location.startsWith('/flashcards')) {
      currentIndex = 3;
    } else if (location.startsWith('/live-classes')) {
      currentIndex = 4;
    } else if (location == '/') {
      currentIndex = 0;
    }

    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: isDark ? Colors.black.withValues(alpha: 0.3) : Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          switch (index) {
            case 0:
              context.go('/');
              break;
            case 1:
              context.go('/courses');
              break;
            case 2:
              context.go('/exams');
              break;
            case 3:
              context.go('/flashcards');
              break;
            case 4:
              context.go('/live-classes');
              break;
          }
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.school_outlined),
            selectedIcon: Icon(Icons.school),
            label: 'Courses',
          ),
          NavigationDestination(
            icon: Icon(Icons.quiz_outlined),
            selectedIcon: Icon(Icons.quiz),
            label: 'Exams',
          ),
          NavigationDestination(
            icon: Icon(Icons.style_outlined),
            selectedIcon: Icon(Icons.style),
            label: 'Cards',
          ),
          NavigationDestination(
            icon: Icon(Icons.live_tv_outlined),
            selectedIcon: Icon(Icons.live_tv),
            label: 'Live',
          ),
        ],
      ),
    );
  }
}
