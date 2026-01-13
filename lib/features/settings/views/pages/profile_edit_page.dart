import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../auth/providers/auth_providers.dart';
import '../../../auth/models/auth_state_sealed.dart';
import '../../../../core/widgets/zen_background.dart';

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
    final user = (ref.read(authStateProvider) as AuthAuthenticated).user;
    _nameController = TextEditingController(text: user.displayName);
    _emailController = TextEditingController(text: user.email);
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
          'IDENTITY_CONFIG',
          style: TextStyle(fontFamily: AppTypography.fontFamilySerif, fontWeight: AppTypography.black, fontStyle: FontStyle.italic),
        ),
      ),
      body: ZenBackground(
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
                        child: Icon(Icons.person_rounded, size: 50, color: AppColors.primary),
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

              // Form fields
              _buildFieldLabel('IDENTITY_NAME'),
              const SizedBox(height: 8),
              _buildTextField(_nameController, 'Enter your name'),
              const SizedBox(height: 24),

              _buildFieldLabel('COMM_CHANNEL_EMAIL'),
              const SizedBox(height: 8),
              _buildTextField(_emailController, 'Enter your email', enabled: false),
              const SizedBox(height: 48),

              ZenButton(
                text: 'SAVE CONFIGURATION',
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
                  'DISCARD_CHANGES',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: AppTypography.black,
                    color: AppColors.textTertiary,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFieldLabel(String label) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        label,
        style: TextStyle(
          fontSize: 9,
          fontWeight: AppTypography.black,
          letterSpacing: 2.0,
          color: AppColors.primary.withOpacity(0.7),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint, {bool enabled = true}) {
    return Container(
      decoration: BoxDecoration(
        color: enabled ? Colors.white : AppColors.grey100,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: AppColors.grey200.withOpacity(0.5)),
      ),
      child: TextField(
        controller: controller,
        enabled: enabled,
        style: const TextStyle(fontWeight: AppTypography.bold),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(16),
          hintText: hint,
          border: InputBorder.none,
          hintStyle: TextStyle(color: AppColors.grey400, fontWeight: AppTypography.medium),
        ),
      ),
    );
  }
}
