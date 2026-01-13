import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:torii_mobile/core/constants/app_design_system.dart';
import 'package:torii_mobile/core/widgets/widgets.dart';
import 'package:torii_mobile/core/widgets/zen_background.dart';
import 'package:torii_mobile/core/widgets/animations/entry_animation.dart';
import 'package:torii_mobile/features/auth/providers/auth_providers.dart';
import 'package:torii_mobile/features/auth/providers/two_factor_provider.dart';

class SecuritySettingsPage extends ConsumerStatefulWidget {
  const SecuritySettingsPage({super.key});

  @override
  ConsumerState<SecuritySettingsPage> createState() => _SecuritySettingsPageState();
}

class _SecuritySettingsPageState extends ConsumerState<SecuritySettingsPage> {
  final _otpController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(twoFactorProvider.notifier).fetchStatus();
    });
  }

  @override
  void dispose() {
    _otpController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(twoFactorProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'SECURITY_CORE',
          style: TextStyle(
            fontFamily: AppTypography.fontFamilySerif,
            fontWeight: AppTypography.black,
            fontSize: 18,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      body: ZenBackground(
        child: state.isLoading && state.status == null
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                padding: const EdgeInsets.all(AppSpacing.xl),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildStatusCard(state),
                    const SizedBox(height: 32),
                    if (state.status?.isEnabled == true) ...[
                       _buildBackupCodesSection(state),
                       const SizedBox(height: 32),
                       _buildDisableSection(state),
                    ] else ...[
                       _buildSetupSection(state),
                    ],
                  ],
                ),
              ),
      ),
    );
  }

  Widget _buildStatusCard(TwoFactorState state) {
    final isEnabled = state.status?.isEnabled ?? false;
    return EntryAnimation(
      index: 0,
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.lg),
        decoration: BoxDecoration(
          color: isEnabled ? AppColors.primary.withOpacity(0.05) : AppColors.grey100,
          borderRadius: BorderRadius.circular(AppRadius.xxl),
          border: Border.all(color: isEnabled ? AppColors.primary.withOpacity(0.2) : AppColors.grey300),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isEnabled ? AppColors.primary : AppColors.grey400,
                shape: BoxShape.circle,
              ),
              child: Icon(
                isEnabled ? Icons.verified_user_rounded : Icons.gpp_maybe_rounded,
                color: Colors.white,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isEnabled ? '2FA_PROTECTED' : '2FA_NOT_ENABLED',
                    style: const TextStyle(fontWeight: AppTypography.black, fontSize: 14, letterSpacing: 0.5),
                  ),
                  Text(
                    isEnabled 
                      ? 'Your account is secured with secondary verification.' 
                      : 'Add an extra layer of security to your account.',
                    style: TextStyle(fontSize: 12, color: AppColors.textTertiary),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSetupSection(TwoFactorState state) {
    return EntryAnimation(
      index: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'ENROLLMENT_PROTOCOL',
            style: TextStyle(fontSize: 10, fontWeight: AppTypography.black, letterSpacing: 2.0, color: AppColors.textTertiary),
          ),
          const SizedBox(height: 16),
          if (state.setupData == null)
            ZenButton(
              text: 'START_2FA_SETUP',
              onPressed: () => ref.read(twoFactorProvider.notifier).startSetup(),
              isLoading: state.isLoading,
              isFullWidth: true,
            )
          else
            _buildSetupFlow(state),
        ],
      ),
    );
  }

  Widget _buildSetupFlow(TwoFactorState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(AppSpacing.lg),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AppRadius.xxl),
            border: Border.all(color: AppColors.grey200),
          ),
          child: Column(
            children: [
              const Text(
                '1. SCAN_QR_CODE',
                style: TextStyle(fontWeight: AppTypography.bold, fontSize: 12),
              ),
              const SizedBox(height: 16),
              QrImageView(
                data: state.setupData!.otpauthUrl,
                version: QrVersions.auto,
                size: 200.0,
                eyeStyle: const QrEyeStyle(eyeShape: QrEyeShape.square, color: AppColors.primary),
                dataModuleStyle: const QrDataModuleStyle(dataModuleShape: QrDataModuleShape.square, color: AppColors.primary),
              ),
              const SizedBox(height: 16),
              const Text(
                'OR_ENTER_MANUALLY',
                style: TextStyle(fontSize: 10, fontWeight: AppTypography.extraBold, color: AppColors.textTertiary),
              ),
              const SizedBox(height: 8),
              SelectableText(
                state.setupData!.secret,
                style: const TextStyle(fontFamily: 'Courier', fontWeight: AppTypography.bold, fontSize: 16),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          '2. VERIFY_AUTHENTICATOR_CODE',
          style: TextStyle(fontWeight: AppTypography.bold, fontSize: 12),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: _otpController,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: '000000',
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(AppRadius.lg)),
          ),
          onChanged: (val) {
             if (val.length == 6) {
                ref.read(twoFactorProvider.notifier).enable(_otpController.text);
             }
          },
        ),
        const SizedBox(height: 24),
        ZenButton(
          text: 'ACTIVATE_2FA',
          onPressed: () => ref.read(twoFactorProvider.notifier).enable(_otpController.text),
          isLoading: state.isLoading,
          isFullWidth: true,
        ),
        if (state.error != null) ...[
          const SizedBox(height: 12),
          Text(state.error!, style: const TextStyle(color: Colors.red, fontSize: 12)),
        ],
      ],
    );
  }

  Widget _buildBackupCodesSection(TwoFactorState state) {
    return EntryAnimation(
      index: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'RECOVERY_CODES',
            style: TextStyle(fontSize: 10, fontWeight: AppTypography.black, letterSpacing: 2.0, color: AppColors.textTertiary),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(AppSpacing.lg),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(AppRadius.xxl),
              border: Border.all(color: AppColors.grey200),
            ),
            child: Column(
              children: [
                const Text(
                    'Keep these codes secure. They are your only way to regain access if you lose your device.',
                    style: TextStyle(fontSize: 12, height: 1.5),
                ),
                const SizedBox(height: 16),
                ZenButton(
                  text: 'REGENERATE_BACKUP_CODES',
                  onPressed: () => _showRegenerateDialog(state),
                  isPrimary: false,
                  isFullWidth: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDisableSection(TwoFactorState state) {
    return EntryAnimation(
      index: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'TERMINATION_PROTOCOL',
            style: TextStyle(fontSize: 10, fontWeight: AppTypography.black, letterSpacing: 2.0, color: Color(0xFFE63946)),
          ),
          const SizedBox(height: 16),
          ZenButton(
            text: 'DISABLE_TWO_FACTOR',
            onPressed: () => _showDisableDialog(),
            isPrimary: false,
            isFullWidth: true,
          ),
        ],
      ),
    );
  }

  void _showDisableDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Deactivation'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Enter your password to disable 2FA security.'),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(hintText: 'Password'),
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          TextButton(
            onPressed: () {
              ref.read(twoFactorProvider.notifier).disable(_passwordController.text);
              Navigator.pop(context);
            },
            child: const Text('Disable', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _showRegenerateDialog(TwoFactorState state) {
     showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Backup Codes'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('New backup codes have been generated. SAVE THEM NOW.'),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: (state.backupCodes ?? []).map((code) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(color: AppColors.grey100, borderRadius: BorderRadius.circular(8)),
                child: Text(code, style: const TextStyle(fontFamily: 'Courier', fontWeight: AppTypography.bold)),
              )).toList(),
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Done')),
        ],
      ),
    );
  }
}
