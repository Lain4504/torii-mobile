import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../core/providers/locale_provider.dart';
import '../../../../core/localization/l10n/app_localizations.dart';
import '../../../../core/widgets/cards/minimal_card.dart';
import '../../../auth/providers/auth_providers.dart';
import '../../../auth/models/auth_state_sealed.dart';

/// Settings Page - Language and App Preferences
/// 
/// A clean settings page for managing app preferences including language selection.
class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final currentLocale = ref.watch(localeProvider);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'ZEN_PREFERENCES',
          style: TextStyle(
            fontFamily: AppTypography.fontFamilySerif,
            fontWeight: AppTypography.black,
            fontSize: 18,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.xl,
            vertical: AppSpacing.lg,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Section
              _buildProfileSection(context, ref),
              const SizedBox(height: AppSpacing.xxxl),

              // Security Section
              _buildSecuritySection(context, ref),
              const SizedBox(height: AppSpacing.xxxl),
              
              // Language Section
              _buildLanguageSection(context, ref, currentLocale, l10n, theme),
              const SizedBox(height: AppSpacing.xxxl),

              // Danger Zone
              _buildDangerZone(context, ref),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSecuritySection(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'SECURITY_MATRIX',
          style: TextStyle(fontSize: 10, fontWeight: AppTypography.black, letterSpacing: 2.0, color: AppColors.textTertiary),
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AppRadius.xxl),
            border: Border.all(color: AppColors.grey200.withOpacity(0.5)),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => context.push('/settings/security'),
              borderRadius: BorderRadius.circular(AppRadius.xxl),
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.security_rounded, color: AppColors.primary, size: 20),
                    ),
                    const SizedBox(width: 16),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Two-Factor Authentication', style: TextStyle(fontSize: 16, fontWeight: AppTypography.bold)),
                          Text('Secure your account with TOTP', style: TextStyle(fontSize: 12, color: AppColors.textTertiary)),
                        ],
                      ),
                    ),
                    Icon(Icons.chevron_right_rounded, color: AppColors.textTertiary.withOpacity(0.5)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProfileSection(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);
    if (authState is! AuthAuthenticated) return const SizedBox.shrink();
    final user = authState.user;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'IDENTITY_CORE',
          style: TextStyle(fontSize: 10, fontWeight: AppTypography.black, letterSpacing: 2.0, color: AppColors.textTertiary),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(AppSpacing.lg),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AppRadius.xxl),
            border: Border.all(color: AppColors.grey200.withOpacity(0.5)),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: AppColors.primarySurface,
                child: Text(
                  user.displayName.isNotEmpty ? user.displayName[0].toUpperCase() : 'U',
                  style: const TextStyle(color: AppColors.primary, fontWeight: AppTypography.black, fontSize: 24),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(user.displayName, style: const TextStyle(fontSize: 18, fontWeight: AppTypography.extraBold)),
                    Text(user.email, style: TextStyle(fontSize: 12, color: AppColors.textTertiary)),
                  ],
                ),
              ),
              IconButton(
                onPressed: () => context.push('/settings/profile/edit'),
                icon: const Icon(Icons.edit_note_rounded, color: AppColors.primary),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDangerZone(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'TERMINATION_PROTOCOL',
          style: TextStyle(fontSize: 10, fontWeight: AppTypography.black, letterSpacing: 2.0, color: Color(0xFFE63946)),
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFFE63946).withOpacity(0.05),
            borderRadius: BorderRadius.circular(AppRadius.xxl),
            border: Border.all(color: const Color(0xFFE63946).withOpacity(0.2)),
          ),
          child: TextButton(
            onPressed: () => ref.read(authStateProvider.notifier).logout(),
            child: const Text(
              'SIGNOUT_OF_MATRIX',
              style: TextStyle(color: Color(0xFFE63946), fontWeight: AppTypography.black, fontSize: 11, letterSpacing: 1.0),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLanguageSection(
    BuildContext context,
    WidgetRef ref,
    Locale currentLocale,
    AppLocalizations l10n,
    ThemeData theme,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.language,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: AppTypography.semiBold,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        MinimalCard(
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              _LanguageOption(
                locale: const Locale('en'),
                label: l10n.english,
                currentLocale: currentLocale,
                onTap: () {
                  ref.read(localeProvider.notifier).setLocale(const Locale('en'));
                },
              ),
              const Divider(height: 1),
              _LanguageOption(
                locale: const Locale('vi'),
                label: l10n.vietnamese,
                currentLocale: currentLocale,
                onTap: () {
                  ref.read(localeProvider.notifier).setLocale(const Locale('vi'));
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _LanguageOption extends StatelessWidget {
  final Locale locale;
  final String label;
  final Locale currentLocale;
  final VoidCallback onTap;

  const _LanguageOption({
    required this.locale,
    required this.label,
    required this.currentLocale,
    required this.onTap,
  });

  bool get isSelected => locale.languageCode == currentLocale.languageCode;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.md,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  label,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: isSelected
                        ? AppTypography.semiBold
                        : AppTypography.regular,
                  ),
                ),
              ),
              if (isSelected)
                Icon(
                  Icons.check_circle_rounded,
                  color: AppColors.primary,
                  size: AppIconSize.md,
                )
              else
                Icon(
                  Icons.radio_button_unchecked,
                  color: AppColors.textTertiary,
                  size: AppIconSize.md,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
