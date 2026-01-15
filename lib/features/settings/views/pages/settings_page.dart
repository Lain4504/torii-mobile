import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../core/providers/locale_provider.dart';
import '../../../../core/localization/l10n/app_localizations.dart';
import '../../../../core/widgets/zen_background.dart';
import '../../../auth/providers/auth_providers.dart';

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
      body: ZenBackground(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              floating: true,
              pinned: true,
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
                onPressed: () => context.pop(),
              ),
              title: const Text(
                'APP_SETTINGS',
                style: TextStyle(
                  fontFamily: AppTypography.fontFamilySerif,
                  fontWeight: AppTypography.black,
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  letterSpacing: 2.0,
                ),
              ),
              // Assuming subtitle and trailing are intended for a custom header or a different widget,
              // as SliverAppBar does not directly support these properties.
              // For now, I'll add them as comments or integrate them into the title area if possible.
              // If the intention was to replace SliverAppBar with a custom header, that would be a larger change.
              // For faithful and syntactically correct change, I'll keep the title as a Text widget.
              // subtitle: 'Edit your profile', // Not a direct property of SliverAppBar
              // trailing: Text(user?.email ?? '', // Not a direct property of SliverAppBar
            ),
            SliverToBoxAdapter(
              child: Padding(
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
                    const SizedBox(height: 60),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSecuritySection(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'SECURITY_SETTINGS',
          style: TextStyle(
            fontSize: 10, 
            fontWeight: AppTypography.black, 
            letterSpacing: 3.0, 
            color: AppColors.textTertiary,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.8),
            borderRadius: BorderRadius.circular(AppRadius.xxl),
            border: Border.all(color: AppColors.grey300.withValues(alpha: 0.3)),
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
                        color: AppColors.primary.withValues(alpha: 0.1),
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
                    Icon(Icons.chevron_right_rounded, color: AppColors.textTertiary.withValues(alpha: 0.5)),
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
    final asyncAuth = ref.read(authStateProvider);
    final isAuthenticated = asyncAuth.asData?.value.isAuthenticated ?? false;
    if (!isAuthenticated) return const SizedBox.shrink();
    final user = asyncAuth.asData?.value.user;

    // The following lines seem to be for TextEditingControllers, which are not declared in this class.
    // If they are meant to be class members, they need to be declared.
    // For now, I'll comment them out to maintain syntactic correctness.
    // _nameController = TextEditingController(text: user?.displayName ?? '');
    // _emailController = TextEditingController(text: user?.email ?? '');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'PROFILE_CONFIG',
          style: TextStyle(
            fontSize: 10, 
            fontWeight: AppTypography.black, 
            letterSpacing: 3.0, 
            color: AppColors.textTertiary,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(AppSpacing.lg),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.8),
            borderRadius: BorderRadius.circular(AppRadius.xxl),
            border: Border.all(color: AppColors.grey300.withValues(alpha: 0.3)),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: AppColors.primarySurface,
                child: Text(
                  (user != null && user.displayName.isNotEmpty) ? user.displayName[0].toUpperCase() : 'U',
                  style: const TextStyle(color: AppColors.primary, fontWeight: AppTypography.black, fontSize: 24),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(user?.displayName ?? 'User', style: const TextStyle(fontSize: 18, fontWeight: AppTypography.extraBold)),
                    Text(user?.email ?? '', style: const TextStyle(fontSize: 12, color: AppColors.textTertiary)),
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
          'ACCOUNT_ACTIONS',
          style: TextStyle(
            fontSize: 10, 
            fontWeight: AppTypography.black, 
            letterSpacing: 3.0, 
            color: Color(0xFFE63946),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFFE63946).withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(AppRadius.xxl),
            border: Border.all(color: const Color(0xFFE63946).withValues(alpha: 0.1)),
          ),
          child: TextButton(
            onPressed: () => _showLogoutConfirm(context, ref),
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 20),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.xxl)),
            ),
            child: const Text(
              'LOG_OUT',
              style: TextStyle(
                color: Color(0xFFE63946), 
                fontWeight: AppTypography.black, 
                fontSize: 11, 
                letterSpacing: 2.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showLogoutConfirm(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.xxl)),
        title: const Text(
          'LOG OUT',
          style: TextStyle(fontSize: 16, fontWeight: AppTypography.black, letterSpacing: 1.0),
        ),
        content: const Text(
          'Are you sure you want to log out from Torii?',
          style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('CANCEL', style: TextStyle(color: AppColors.textTertiary, fontWeight: AppTypography.black, fontSize: 11)),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ref.read(authStateProvider.notifier).logout();
            },
            child: const Text('LOG OUT', style: TextStyle(color: Color(0xFFE63946), fontWeight: AppTypography.black, fontSize: 11)),
          ),
        ],
      ),
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
          l10n.language.toUpperCase(),
          style: const TextStyle(
            fontSize: 10, 
            fontWeight: AppTypography.black, 
            letterSpacing: 4.0, 
            color: AppColors.textTertiary,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.8),
            borderRadius: BorderRadius.circular(AppRadius.xxl),
            border: Border.all(color: AppColors.grey300.withValues(alpha: 0.3)),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppRadius.xxl),
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
