import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../core/widgets/widgets.dart';

class InstructorProfilePage extends StatelessWidget {
  final String instructorId;

  const InstructorProfilePage({super.key, required this.instructorId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: ZenBackground(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            _buildAppBar(context),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
                child: Column(
                  children: [
                    _buildProfileHeader(),
                    const SizedBox(height: AppSpacing.xxl),
                    _buildStatsGrid(),
                    const SizedBox(height: AppSpacing.xxl),
                    _buildBioSection(),
                    const SizedBox(height: AppSpacing.xxl),
                    _buildCoursesHeader(),
                    const SizedBox(height: AppSpacing.md),
                  ],
                ),
              ),
            ),
            _buildCoursesList(),
            const SliverToBoxAdapter(child: SizedBox(height: 40)),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      floating: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20, color: AppColors.textPrimary),
        onPressed: () => context.pop(),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.share_rounded, size: 20, color: AppColors.textPrimary),
          onPressed: () {},
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.primary.withOpacity(0.2), width: 2),
          ),
          child: const CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage('https://i.pravatar.cc/300?img=12'), // Mock image
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Sarah Chen',
          style: TextStyle(
            fontFamily: AppTypography.fontFamilySerif,
            fontSize: 28,
            fontWeight: AppTypography.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(AppRadius.full),
          ),
          child: const Text(
            'SENIOR INSTRUCTOR',
            style: TextStyle(
              fontSize: 10,
              fontWeight: AppTypography.black,
              letterSpacing: 1.5,
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatsGrid() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildStatItem('12', 'COURSES'),
        Container(width: 1, height: 30, color: AppColors.borderLight),
        _buildStatItem('4.9', 'RATING', icon: Icons.star_rounded, iconColor: AppColors.accent),
        Container(width: 1, height: 30, color: AppColors.borderLight),
        _buildStatItem('25k', 'STUDENTS'),
      ],
    );
  }

  Widget _buildStatItem(String value, String label, {IconData? icon, Color? iconColor}) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 18, color: iconColor),
              const SizedBox(width: 4),
            ],
            Text(
              value,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: AppTypography.black,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 9,
            fontWeight: AppTypography.bold,
            letterSpacing: 1.0,
            color: AppColors.textTertiary,
          ),
        ),
      ],
    );
  }

  Widget _buildBioSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'ABOUT ME',
          style: TextStyle(
            fontSize: 10,
            fontWeight: AppTypography.black,
            letterSpacing: 2.0,
            color: AppColors.textTertiary,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Passionate software engineer and educator with over 10 years of experience in mobile development. Specialized in Flutter and Dart architecture. I love simplifying complex concepts for my students.',
          style: TextStyle(
            fontSize: 14,
            height: 1.6,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildCoursesHeader() {
    return Row(
      children: [
        const Text(
          'MY COURSES',
          style: TextStyle(
            fontSize: 10,
            fontWeight: AppTypography.black,
            letterSpacing: 2.0,
            color: AppColors.textTertiary,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(child: Container(height: 1, color: AppColors.borderLight)),
      ],
    );
  }

  Widget _buildCoursesList() {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return EntryAnimation(
              index: index + 5,
              child: Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.md),
                child: _InstructorCourseCard(index: index),
              ),
            );
          },
          childCount: 3,
        ),
      ),
    );
  }
}

class _InstructorCourseCard extends StatelessWidget {
  final int index;
  const _InstructorCourseCard({required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(AppRadius.xl),
        border: Border.all(color: AppColors.borderLight.withOpacity(0.5)),
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 60,
            decoration: BoxDecoration(
              color: AppColors.grey200,
              borderRadius: BorderRadius.circular(AppRadius.md),
            ),
            child: const Icon(Icons.image_not_supported_rounded, color: Colors.white),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  index == 0 ? 'Flutter Clean Architecture' : 'Dart Advanced Patterns',
                  style: const TextStyle(fontWeight: AppTypography.bold, fontSize: 14),
                ),
                const SizedBox(height: 4),
                const Row(
                  children: [
                    Icon(Icons.star_rounded, size: 14, color: AppColors.accent),
                    Text(' 4.9', style: TextStyle(fontSize: 11, fontWeight: AppTypography.bold)),
                    SizedBox(width: 8),
                    Icon(Icons.access_time_rounded, size: 14, color: AppColors.textTertiary),
                    Text(' 12h 30m', style: TextStyle(fontSize: 11, color: AppColors.textTertiary)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
