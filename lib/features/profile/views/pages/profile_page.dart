import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:torii_app/features/auth/providers/auth_providers.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../core/widgets/widgets.dart';

/// Redesigned Profile Page for Torii Nihongo
/// Features a tabbed layout for Statistics, My Courses, and Change Password.
class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  // Password Form Controllers
  final _passwordFormKey = GlobalKey<FormState>();
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  
  bool _isPasswordLoading = false;
  bool _obscureOld = true;
  bool _obscureNew = true;
  bool _obscureConfirm = true;

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _handleChangePassword() async {
    if (!_passwordFormKey.currentState!.validate()) return;

    setState(() => _isPasswordLoading = true);
    
    final success = await ref.read(authNotifierProvider.notifier).changePassword(
      _oldPasswordController.text,
      _newPasswordController.text,
    );

    setState(() => _isPasswordLoading = false);

    if (success && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Mật khẩu đã được thay đổi thành công'),
          backgroundColor: AppColors.success,
        ),
      );
      _oldPasswordController.clear();
      _newPasswordController.clear();
      _confirmPasswordController.clear();
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Thay đổi mật khẩu thất bại. Vui lòng kiểm tra lại mật khẩu hiện tại.'),
          backgroundColor: AppColors.error,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authStateProvider).value?.user;
    
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              // Custom Header Sliver
              SliverToBoxAdapter(
                child: _buildProfileHeader(user),
              ),
              // Sticky TabBar
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverAppBarDelegate(
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        bottom: BorderSide(color: Color(0xFFE2E8F0), width: 1),
                      ),
                    ),
                    child: const TabBar(
                      indicatorColor: Color(0xFF1F3E72),
                      indicatorWeight: 3,
                      labelColor: Color(0xFF1F3E72),
                      unselectedLabelColor: Color(0xFF64748B),
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 11,
                        fontFamily: 'Lexend',
                      ),
                      tabs: [
                        Tab(text: 'STATISTICS'),
                        Tab(text: 'MY COURSES'),
                        Tab(text: 'PASSWORD'),
                      ],
                    ),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            physics: const BouncingScrollPhysics(),
            children: [
              _buildStatisticsTab(),
              _buildMyCoursesTab(context),
              _buildChangePasswordTab(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader(dynamic user) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 60, 24, 32),
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: NetworkImage("https://www.transparenttextures.com/patterns/pinstripe-light.png"),
          opacity: 0.03,
          repeat: ImageRepeat.repeat,
        ),
      ),
      child: Column(
        children: [
          // Avatar
          Stack(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFF1F3E72), width: 3),
                  image: DecorationImage(
                    image: user?.avatarUrl != null 
                      ? NetworkImage(user!.avatarUrl!) 
                      : const NetworkImage('https://i.pravatar.cc/300'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () => context.push('/profile/edit'),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Color(0xFF1F3E72),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.edit_rounded, color: Colors.white, size: 16),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Name & Email
          Text(
            user?.displayName ?? 'Kenji Sato',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: Color(0xFF1F3E72),
              fontFamily: 'Lexend',
            ),
          ),
          Text(
            user?.email ?? 'kenji.sato@email.com',
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF64748B),
              fontWeight: FontWeight.w500,
              fontFamily: 'Lexend',
            ),
          ),
          const SizedBox(height: 24),
          // Basic Stats Row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildHeaderStat('5', 'Courses'),
              Container(height: 24, width: 1, color: const Color(0xFFE2E8F0), margin: const EdgeInsets.symmetric(horizontal: 24)),
              _buildHeaderStat('12', 'Day Streak'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderStat(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: Color(0xFF1F3E72),
            fontFamily: 'Lexend',
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF5E82BB),
            fontWeight: FontWeight.w600,
            fontFamily: 'Lexend',
          ),
        ),
      ],
    );
  }

  Widget _buildStatisticsTab() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 2x2 Stats Grid
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 1.4,
            children: [
              _buildStatCard('Courses Enrolled', '5', Icons.school_rounded, const Color(0xFF1F3E72)),
              _buildStatCard('Completed', '2', Icons.verified_rounded, const Color(0xFF10B981)),
              _buildStatCard('Hours Studied', '124h', Icons.timer_rounded, const Color(0xFFF59E0B)),
              _buildStatCard('Learning Streak', '12', Icons.local_fire_department_rounded, const Color(0xFFEF4444)),
            ],
          ),
          const SizedBox(height: 24),
          
          // Progress Overview Card
          _buildCard(
            title: 'Progress Overview',
            child: Row(
              children: [
                SizedBox(
                  width: 84,
                  height: 84,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      CircularProgressIndicator(
                        value: 0.65,
                        strokeWidth: 9,
                        backgroundColor: const Color(0xFFF1F5F9),
                        valueColor: const AlwaysStoppedAnimation(Color(0xFF5E82BB)),
                      ),
                      const Center(
                        child: Text(
                          '65%',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF1F3E72),
                            fontFamily: 'Lexend',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildProgressDetail('Speaking', 0.8),
                      const SizedBox(height: 8),
                      _buildProgressDetail('Grammar', 0.45),
                      const SizedBox(height: 8),
                      _buildProgressDetail('Kanji', 0.6),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 24),
          
          // Weekly Activity
          _buildCard(
            title: 'Weekly Learning Activity',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _buildBar('M', 0.4),
                _buildBar('T', 0.7),
                _buildBar('W', 0.5),
                _buildBar('T', 0.9, isToday: true),
                _buildBar('F', 0.3),
                _buildBar('S', 0.1),
                _buildBar('S', 0.0),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String label, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon, color: color, size: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF1F3E72),
                  fontFamily: 'Lexend',
                ),
              ),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 10,
                  color: Color(0xFF64748B),
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Lexend',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCard({required String title, required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1F3E72),
              fontFamily: 'Lexend',
            ),
          ),
          const SizedBox(height: 20),
          child,
        ],
      ),
    );
  }

  Widget _buildProgressDetail(String label, double progress) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFF64748B))),
            Text('${(progress * 100).toInt()}%', style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: Color(0xFF1F3E72))),
          ],
        ),
        const SizedBox(height: 4),
        ClipRRect(
          borderRadius: BorderRadius.circular(2),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 4,
            backgroundColor: const Color(0xFFF1F5F9),
            valueColor: const AlwaysStoppedAnimation(Color(0xFF5E82BB)),
          ),
        ),
      ],
    );
  }

  Widget _buildBar(String day, double heightFactor, {bool isToday = false}) {
    return Column(
      children: [
        Container(
          height: 100 * heightFactor + 10,
          width: 30,
          decoration: BoxDecoration(
            color: isToday ? const Color(0xFF1F3E72) : const Color(0xFFE2E8F0),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          day,
          style: TextStyle(
            fontSize: 10,
            fontWeight: isToday ? FontWeight.w800 : FontWeight.w600,
            color: isToday ? const Color(0xFF1F3E72) : const Color(0xFF94A3B8),
          ),
        ),
      ],
    );
  }

  Widget _buildMyCoursesTab(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(24),
      children: [
        _buildEnrolledCourseCard(
          context,
          title: 'JLPT N5 Grammar Mastery',
          instructor: 'Yuki Tanaka',
          progress: 0.6,
          lessonsCompleted: 12,
          totalLessons: 20,
          imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuCakAi0uaOlj1M8Avg9OqykxZYM5wzdnp9ailjzFQrRKvuq5d8sw0rrI_FWJ_D1kTBNwwsT-dTfVdK90RnJN2QOKYyX0NFyeOTZDZDcy24enMHDnTJUwWh2RkBm8OEWIWMj3KUDRpQQvbzAGY79cIa_VsL_EAuZWYcqCRT0TlMy8DmjuVgPhGSsTIDg2N_pI6qb1UMrQL-ImcNI0CYMwZq9wzMAstUxU-rbtbtIzObw4FPSUf8g3lX4qBJehcP9ByGlYwjFkhzy-QA",
        ),
        const SizedBox(height: 16),
        _buildEnrolledCourseCard(
          context,
          title: 'Japanese for Business',
          instructor: 'Hiroshi Sato',
          progress: 0.15,
          lessonsCompleted: 8,
          totalLessons: 50,
          imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuDFY3O1YkEMG2SvLKMkINiGp-D0iqaMxNzX5SKGEOyqQo2LUueBNR3qbJtkgd6ZLpZRGWw60edavmUrnVyP2Gum-js_HgtC0oNwrmdGps_I_OWwGY6VRmGLf6PzyPka58MX10srHkr5YQIFCWWmvKgS7YeWfUR6oAGgQKy9DVg6F7a5-Q3AHJKSF-u9mpd3wRsCJ3OQ6od5QIBgS_oj9YM6LftRwy2cG4vcKXLJC9wKDSCIBfo21JpboSwCCl5hlB6_SdAA-2BjZyY",
        ),
      ],
    );
  }

  Widget _buildEnrolledCourseCard(
    BuildContext context, {
    required String title,
    required String instructor,
    required double progress,
    required int lessonsCompleted,
    required int totalLessons,
    required String imageUrl,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(imageUrl, width: 80, height: 80, fit: BoxFit.cover),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Color(0xFF1F3E72), fontFamily: 'Lexend'),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        'Instructor: $instructor',
                        style: const TextStyle(fontSize: 12, color: Color(0xFF64748B), fontFamily: 'Lexend'),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${(progress * 100).toInt()}%', style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: Color(0xFF1F3E72))),
                          Text('$lessonsCompleted/$totalLessons Lessons', style: const TextStyle(fontSize: 10, color: Color(0xFF94A3B8))),
                        ],
                      ),
                      const SizedBox(height: 4),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(2),
                        child: LinearProgressIndicator(
                          value: progress,
                          minHeight: 4,
                          backgroundColor: const Color(0xFFF1F5F9),
                          valueColor: const AlwaysStoppedAnimation(Color(0xFF5E82BB)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: SizedBox(
              width: double.infinity,
              height: 44,
              child: ElevatedButton(
                onPressed: () => context.push('/learning/1'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1F3E72),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 0,
                ),
                child: const Text('CONTINUE LEARNING', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800, letterSpacing: 0.5)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChangePasswordTab() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(24),
      child: Form(
        key: _passwordFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Change Password',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Color(0xFF1F3E72), fontFamily: 'Lexend'),
            ),
            const Text(
              'Update your password to keep your learning account secure.',
              style: TextStyle(fontSize: 13, color: Color(0xFF64748B), fontFamily: 'Lexend'),
            ),
            const SizedBox(height: 32),
            
            _buildFieldLabel('Current Password'),
            const SizedBox(height: 8),
            _buildPasswordField(_oldPasswordController, 'Enter current password', _obscureOld, () {
              setState(() => _obscureOld = !_obscureOld);
            }),
            
            const SizedBox(height: 24),
            _buildFieldLabel('New Password'),
            const SizedBox(height: 8),
            _buildPasswordField(_newPasswordController, 'Enter new password', _obscureNew, () {
              setState(() => _obscureNew = !_obscureNew);
            }),
            const SizedBox(height: 8),
            // Strength Indicator
            Row(
              children: [
                _buildStrengthSegment(true, const Color(0xFF10B981)),
                _buildStrengthSegment(true, const Color(0xFF10B981)),
                _buildStrengthSegment(true, const Color(0xFF10B981)),
                _buildStrengthSegment(false, const Color(0xFFE2E8F0)),
              ],
            ),
            const SizedBox(height: 4),
            const Text('Password strength: Strong', style: TextStyle(fontSize: 11, color: Color(0xFF10B981), fontWeight: FontWeight.w600)),

            const SizedBox(height: 24),
            _buildFieldLabel('Confirm Password'),
            const SizedBox(height: 8),
            _buildPasswordField(_confirmPasswordController, 'Confirm new password', _obscureConfirm, () {
              setState(() => _obscureConfirm = !_obscureConfirm);
            }, isLast: true),
            
            const SizedBox(height: 40),
            
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: _isPasswordLoading ? null : _handleChangePassword,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1F3E72),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  elevation: 0,
                ),
                child: _isPasswordLoading
                    ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                    : const Text('UPDATE PASSWORD', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800, letterSpacing: 1.0)),
              ),
            ),

            const SizedBox(height: 48),
            _buildMenuItem('Logout', Icons.logout_rounded, () async {
              await ref.read(authStateProvider.notifier).logout();
              if (context.mounted) context.go('/');
            }, isDestructive: true),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildFieldLabel(String label) {
    return Text(
      label.toUpperCase(),
      style: const TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w800,
        color: Color(0xFF1F3E72),
        letterSpacing: 1.0,
      ),
    );
  }

  Widget _buildPasswordField(TextEditingController controller, String hint, bool obscure, VoidCallback onToggle, {bool isLast = false}) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      textInputAction: isLast ? TextInputAction.done : TextInputAction.next,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Color(0xFF94A3B8), fontSize: 14),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        suffixIcon: IconButton(
          icon: Icon(obscure ? Icons.visibility_off_rounded : Icons.visibility_rounded, color: const Color(0xFF94A3B8), size: 18),
          onPressed: onToggle,
        ),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFFE2E8F0))),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFF1F3E72), width: 1.5)),
        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Colors.redAccent)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) return 'Cannot be empty';
        if (hint.contains('new') && value.length < 8) return 'Min 8 characters';
        if (hint.contains('Confirm') && value != _newPasswordController.text) return 'Passwords mismatch';
        return null;
      },
    );
  }

  Widget _buildStrengthSegment(bool active, Color color) {
    return Expanded(
      child: Container(
        height: 4,
        margin: const EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(color: active ? color : const Color(0xFFE2E8F0), borderRadius: BorderRadius.circular(2)),
      ),
    );
  }

  Widget _buildMenuItem(String title, IconData icon, VoidCallback onTap, {bool isDestructive = false}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Icon(icon, color: isDestructive ? Colors.redAccent : const Color(0xFF1F3E72), size: 20),
            const SizedBox(width: 16),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: isDestructive ? Colors.redAccent : const Color(0xFF1F3E72),
              ),
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios_rounded, color: Color(0xFFCBD5E1), size: 14),
          ],
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this.child);
  final Widget child;

  @override double get minExtent => 49.0;
  @override double get maxExtent => 49.0;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) => child;

  @override bool shouldRebuild(_SliverAppBarDelegate oldDelegate) => false;
}
