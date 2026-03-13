import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:torii_app/features/auth/providers/auth_providers.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../core/widgets/widgets.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authStateProvider).value?.user;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: AppBackground(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverAppBar(
              floating: true,
              pinned: true,
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Text(
                'PROFILE',
                style: TextStyle(
                  fontWeight: AppTypography.black,
                  fontSize: 16,
                  letterSpacing: 2.0,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
            
            // User Header
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: AppSpacing.xl),
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: AppColors.primarySurface,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(AppRadius.sm),
                        border: Border.all(color: AppColors.primary, width: 3),
                        image: user?.avatarUrl != null 
                          ? DecorationImage(
                              image: NetworkImage(user!.avatarUrl!),
                              fit: BoxFit.cover,
                            )
                          : const DecorationImage(
                              image: NetworkImage('https://i.pravatar.cc/300'),
                              fit: BoxFit.cover,
                            ),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    Text(
                      user?.displayName ?? 'User Name',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: AppTypography.black,
                        letterSpacing: -1.0,
                      ),
                    ),
                    Text(
                      user?.email ?? 'user@example.com',
                      style: const TextStyle(
                        color: AppColors.textTertiary,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    SizedBox(
                      height: 36,
                      child: OutlinedButton.icon(
                        onPressed: () => context.push('/profile/edit'),
                        icon: const Icon(Icons.edit_rounded, size: 16),
                        label: const Text(
                          'EDIT PROFILE',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: AppTypography.bold,
                            letterSpacing: 1.0,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.primary,
                          side: const BorderSide(color: AppColors.primary),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppRadius.sm),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Stats Row
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                child: Container(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(AppRadius.xs),
                    border: Border.all(color: AppColors.borderLight),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildProfileStat('8', 'COURSES'),
                      _buildProfileStat('124', 'LESSONS'),
                      _buildProfileStat('42h', 'TIME'),
                    ],
                  ),
                ),
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.xl)),

            // Menu List
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  _buildMenuItem('My Courses', Icons.auto_stories_rounded, () => context.push('/my-courses')),
                  _buildMenuItem('Achievements', Icons.military_tech_rounded, () => context.push('/achievements')),
                  _buildMenuItem('Certificates', Icons.workspace_premium_rounded, () => {}),
                  _buildMenuItem('Payment History', Icons.receipt_long_rounded, () => context.push('/payment/history')),
                  _buildMenuItem('Change Password', Icons.lock_outline_rounded, () => context.push('/profile/change-password')),
                  _buildMenuItem('Settings', Icons.settings_rounded, () => context.push('/profile/settings')),
                  const SizedBox(height: AppSpacing.lg),
                  _buildMenuItem(
                    'Logout',
                    Icons.logout_rounded,
                    () async {
                      await ref.read(authStateProvider.notifier).logout();
                      if (context.mounted) {
                        context.go('/');
                      }
                    },
                    isDestructive: true,
                  ),
                ]),
              ),
            ),
            
            const SliverToBoxAdapter(child: SizedBox(height: 40)),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileStat(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: AppTypography.black,
            color: AppColors.primary,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 9,
            fontWeight: AppTypography.bold,
            color: AppColors.textTertiary,
            letterSpacing: 1.0,
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem(String title, IconData icon, VoidCallback onTap, {bool isDestructive = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Material(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppRadius.xs),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.md),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.borderLight),
              borderRadius: BorderRadius.circular(AppRadius.xs),
            ),
            child: Row(
              children: [
                Icon(icon, color: isDestructive ? AppColors.error : AppColors.primary, size: 20),
                const SizedBox(width: AppSpacing.md),
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: AppTypography.bold,
                    fontSize: 14,
                    color: isDestructive ? AppColors.error : AppColors.textPrimary,
                  ),
                ),
                const Spacer(),
                Icon(Icons.chevron_right_rounded, color: isDestructive ? AppColors.error.withValues(alpha: 0.3) : AppColors.textTertiary, size: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
