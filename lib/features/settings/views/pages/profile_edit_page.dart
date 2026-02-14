import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../auth/providers/auth_providers.dart';

class ProfileEditPage extends ConsumerStatefulWidget {
  const ProfileEditPage({super.key});

  @override
  ConsumerState<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends ConsumerState<ProfileEditPage> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    final asyncAuth = ref.read(authStateProvider);
    final user = asyncAuth.asData?.value.user;
    _nameController = TextEditingController(text: user?.displayName ?? '');
    _emailController = TextEditingController(text: user?.email ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'EDIT_PROFILE',
          style: TextStyle(
            fontFamily: AppTypography.fontFamilySerif,
            fontWeight: AppTypography.black,
            fontStyle: FontStyle.italic,
            letterSpacing: 2.0,
          ),
        ),
      ),
      body: AppBackground(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Column(
            children: [
              // Avatar Section
              Center(
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.primary, width: 2),
                      ),
                      child: const CircleAvatar(
                        radius: 50,
                        backgroundColor: AppColors.primarySurface,
                        backgroundImage: NetworkImage('https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?auto=format&fit=crop&q=80&w=200&h=200'),
                        child: null,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.camera_alt_rounded, color: Colors.white, size: 18),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 48),

              _buildAppTextField(
                label: 'FULL_NAME',
                hint: 'Your name',
                controller: _nameController,
                icon: Icons.person_outline_rounded,
              ),
              const SizedBox(height: AppSpacing.lg),
              _buildAppTextField(
                label: 'EMAIL_ADDRESS',
                hint: 'Your email',
                controller: _emailController,
                icon: Icons.alternate_email_rounded,
                readOnly: true,
              ),
              const SizedBox(height: 48),

              AppButton(
                text: 'SAVE CHANGES',
                onPressed: () {
                  // TODO: Implement save logic
                  Navigator.pop(context);
                },
                isFullWidth: true,
              ),
              
              const SizedBox(height: 16),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'CANCEL',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: AppTypography.black,
                    color: AppColors.textTertiary,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppTextField({
    required String label,
    required String hint,
    required TextEditingController controller,
    required IconData icon,
    bool readOnly = false,
  }) {
    return AppTextField(
      label: label,
      hintText: hint,
      controller: controller,
      icon: icon,
      readOnly: readOnly,
      enabled: !readOnly,
    );
  }
}
// Note: AppTextField currently doesn't have an 'enabled' prop. I should check if I need to update it or just use it as is.
// Actually, let's just use regular decoration for consistent look if AppTextField is too rigid.
